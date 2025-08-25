miyabi_transfer

このリポジトリは、東京大学のスパコン Miyabi とローカルのWindows/Mac PC（WSL環境）間で、ファイルを効率よく双方向（push/pull）に転送するためのスクリプトを提供します。

利用方法

スクリプトを使用するには、以下のコマンドをWSL上で実行します。

データをローカルからMiyabiへ送信（push）する場合
./scripts/transfer_rsync.sh <ユーザー名> push

データをMiyabiからローカルへ取得（pull）する場合
./scripts/transfer_rsync.sh <ユーザー名> pull

例

ユーザー名がm12345の場合：

# データをMiyabiへ送信する場合
./scripts/transfer_rsync.sh m12345 push

# データをMiyabiから受信する場合
./scripts/transfer_rsync.sh m12345 pull

初期設定方法

事前に以下の設定を済ませておく必要があります。

1. WSLの導入

Windows/MacにWSLを導入します。

WSLインストールガイド（公式）

2. SSH鍵の作成・設定

Miyabiへの鍵登録が済んでいない方は、公式のドキュメントに従って登録を行ってください。

Miyabi利用支援ポータル

GitHubに公開鍵の登録を行ってください。

GitHub Docs

3. ローカルのデータディレクトリ準備

以下のディレクトリを作成しておきます。

Windows/Macの場所:

C:\miyabi_data\push
C:\miyabi_data\pull


WSLからのアクセスパス:

/mnt/c/miyabi_data/push
/mnt/c/miyabi_data/pull


転送したいファイルをpushディレクトリに置きます。

注意点

毎回パスワード入力が求められるため少々面倒ですが、Miyabiはパスフレーズありの公開鍵登録を推奨しています。

スクリプトの実行時に、転送方向（push/pull）を必ず指定してください。

ライセンス

このプロジェクトはMITライセンスで提供されています。詳細はLICENSE
を参照してください。
