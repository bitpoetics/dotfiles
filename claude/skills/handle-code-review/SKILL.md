---
name: handle-code-review
description: PRのコードレビュー結果について対処します。
allowed-tools: Read, Grep, Glob, Edit, Bash(git:*), Bash(gh:*), mcp__github__pull_request_read
argument-hint: "[PR番号 or URL] [auto]"
---

## 引数

すべて任意です。

- 数値（`#123` や `123`）: PRのIDとして扱います
- URL: URLの種類に応じて自動判別します
  - PRのURL → 対象PRの特定に使用
  - コメントのURL → 対象コメントの特定に使用
- `auto`: 自律モード。ユーザーに実施判断を仰がず、AIが自律的にすべて対処します

引数がない場合は、現在の会話のコンテキストからPRを特定します。

## 対象コメントの決定

- コメントのURLが指定された場合: そのコメントのみを対象にします
- 上記以外: PR内の未解決コメントすべてを対象にします

未解決コメント（未解決のレビュースレッド）は以下のGraphQLクエリで取得し、`isResolved: false` のスレッドのみを対象にします。

```shell
gh api graphql -f query='
query($owner: String!, $repo: String!, $pr: Int!) {
  repository(owner: $owner, name: $repo) {
    pullRequest(number: $pr) {
      reviewThreads(first: 100) {
        nodes {
          isResolved
          comments(first: 20) {
            nodes { databaseId author { login } body path line url }
          }
        }
      }
    }
  }
}' -F owner={owner} -F repo={repo} -F pr={PR番号}
```

## 手順

### 通常モード

1. 対象コメントの内容を注意深く確認し、対処の要否を判断します
2. 対処の要否およびその根拠をユーザーに示します
3. 対処が必要な場合はその内容・計画を具体的に示して、ユーザーに実施判断を仰ぎます
4. ユーザーが望む場合は対処を実施します
5. 対処を実施した場合は変更内容をコミットし、リモートにプッシュします
6. 対処の有無にかかわらず、すべての対象コメントに個別にスレッド形式で返信します。対処した場合はその内容を、対処不要と判断した場合はその理由を記載します

### 自律モード（`auto`）

1. 対象コメントの内容を注意深く確認し、対処の要否を判断します
2. 対処が必要なコメントについて対処を実施します
3. 変更内容をコミットし、リモートにプッシュします
4. 対処の有無にかかわらず、すべての対象コメントに個別にスレッド形式で返信します。対処した場合はその内容を、対処不要と判断した場合はその理由を記載します

## スレッドへの返信方法

レビュースレッドへの返信は以下のREST APIで行います。`{comment_id}` にはスレッド先頭コメントの `databaseId` を指定します。

```shell
gh api repos/{owner}/{repo}/pulls/{PR番号}/comments/{comment_id}/replies -f body='返信内容'
```

## 安全ガード（両モード共通）

- プッシュ先は必ずPRのheadブランチとし、push前に現在のブランチがそれと一致することを確認します
- `main` などのデフォルトブランチへの直接プッシュは行いません
- force push は行いません
