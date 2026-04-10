#!/bin/bash
# K.I.T.T. Status Line for Claude Code
# ナイト2000のスキャナーライトをステータスラインで表現（トゥルーカラー版）

RESET='\033[0m'

# stdinからセッションデータを読み取り
DATA=$(cat)

# コンテキスト使用率を取得
CONTEXT_PCT=$(echo "$DATA" | jq -r '.context_window.used_percentage // 0' 2>/dev/null)
CONTEXT_INT=${CONTEXT_PCT%.*}

# コンテキスト使用率に基づいてライト位置を決定（0-14）
WIDTH=15
POS=$(( CONTEXT_INT * WIDTH / 100 ))
if [ "$POS" -ge "$WIDTH" ]; then
    POS=$((WIDTH - 1))
fi

# 24ビットトゥルーカラーでスキャナーバーを描画
BAR=""
for ((i = 0; i < WIDTH; i++)); do
    DIST=$((POS - i))
    if [ $DIST -lt 0 ]; then
        DIST=$((-DIST))
    fi

    if [ $DIST -eq 0 ]; then
        # 中央: 明るい赤 + 白寄りのハイライト
        BAR+="\033[38;2;255;60;60m█${RESET}"
    elif [ $DIST -eq 1 ]; then
        # 1段階: 鮮やかな赤
        BAR+="\033[38;2;220;20;20m▓${RESET}"
    elif [ $DIST -eq 2 ]; then
        # 2段階: やや暗い赤
        BAR+="\033[38;2;150;10;10m▒${RESET}"
    elif [ $DIST -eq 3 ]; then
        # 3段階: 暗い赤
        BAR+="\033[38;2;80;5;5m░${RESET}"
    elif [ $DIST -eq 4 ]; then
        # 4段階: かすかな赤
        BAR+="\033[38;2;40;2;2m·${RESET}"
    else
        BAR+="╌"
    fi
done

# モデル名を取得
MODEL=$(echo "$DATA" | jq -r '.model.display_name // "unknown"' 2>/dev/null)

# ブランチ名を取得
BRANCH=$(git branch --show-current 2>/dev/null || echo "-")

DIM='\033[2m'

echo -e "${BAR} ${CONTEXT_INT}%"
echo -e "${DIM}🌿 ${BRANCH} · ${MODEL}${RESET}"

