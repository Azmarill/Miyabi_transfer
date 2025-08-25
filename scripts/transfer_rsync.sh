#!/bin/bash

# Miyabi用のローカルディレクトリを設定
LOCAL_DIR_1="/mnt/c/miyabi_data/push/"
LOCAL_DIR_2="/mnt/c/miyabi_data/pull/"
mkdir -p "$LOCAL_DIR_1"
mkdir -p "$LOCAL_DIR_2"

# 引数のチェック（ユーザー名とモード）
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "スクリプトの後にユーザー名とモードを入力してください: $0 <ユーザー名> [push|pull]"
  exit 1
fi

# SSH設定で 'Host miyabi' を使用するため、ホスト名は 'miyabi' とする
REMOTE_HOST="miyabi"
# リモートのパスを決定するために引数からユーザー名を取得
REMOTE_USER="$1"
# リモートのディレクトリパス
REMOTE_DIR="/home/${REMOTE_USER}/data/"
# モード（push or pull）
MODE="$2"

if [ "$MODE" = "push" ]; then
  echo "ユーザ ${REMOTE_USER} のディレクトリへ ${REMOTE_HOST} にデータを転送します~"
  # SSH設定がUserを解決するため、rsync側でユーザ名を指定する必要はない
  rsync -avzh --progress "$LOCAL_DIR_1" "${REMOTE_HOST}:${REMOTE_DIR}"

elif [ "$MODE" = "pull" ]; then
  echo "ユーザ ${REMOTE_USER} のディレクトリから ${REMOTE_HOST} よりデータを取得します~"
  # SSH設定がUserを解決するため、rsync側でユーザ名を指定する必要はない
  rsync -avzh --progress "${REMOTE_HOST}:${REMOTE_DIR}" "$LOCAL_DIR_2"

else
  echo "モードが設定されていません。pushもしくはpullを指定してください。"
  exit 1
fi
