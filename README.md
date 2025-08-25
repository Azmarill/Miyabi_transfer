# miyabi_transfer

このリポジトリは、共同計算基盤センター (JCahpc) のスーパーコンピュータ **Miyabi** とローカルのWindows/Mac PC（WSL環境）間で、ファイルを効率よく双方向（push/pull）に転送するためのスクリプトを提供します。

## 利用方法

スクリプトを使用するには、以下のコマンドをWSL (Windows Subsystem for Linux) 上で実行します。

### データをローカルからMiyabiへ送信（push）する場合

```bash
./scripts/transfer_miyabi.sh <ユーザー名> push
データをMiyabiからローカルへ取得（pull）する場合
Bash

./scripts/transfer_miyabi.sh <ユーザー名> pull
例
ユーザー名がn46001の場合：

Bash

# データをMiyabiへ送信する場合
./scripts/transfer_miyabi.sh n46001 push

# データをMiyabiから受信する場合
./scripts/transfer_miyabi.sh n46001 pull
初期設定方法
事前に以下の設定を済ませておく必要があります。

1. WSLの導入
WindowsにWSLを導入します。Macの場合は標準のターミナルを使用できます。

WSLインストールガイド（公式）

2. SSH鍵の作成・設定
MiyabiへSSH接続するための設定を行います。

① SSH鍵の作成
まだSSH鍵ペアを作成していない場合は、WSLのターミナルで以下のコマンドを実行して作成します。

Bash

ssh-keygen -t ed25519 -C "your_email@example.com"
途中でパスフレーズの設定を求められます。設定すると安全性が向上します。

② 公開鍵の登録
作成した公開鍵 (~/.ssh/id_ed25519.pub の内容) を、Miyabiの利用者ポータルから登録します。手順の詳細は公式ドキュメントを参照してください。

参考: JCahpc 利用者ポータル (ログイン後にドキュメントをご確認ください)

③ SSHコンフィグファイルの設定
WSLの ~/.ssh/config ファイルに以下の設定を追記します。これにより、ssh miyabi という簡単なコマンドで接続できるようになります。

Host miyabi
  HostName miyabi-g.jcahpc.jp
  User n46001
  IdentityFile ~/.ssh/id_ed25519
  RequestTTY yes
User: ご自身のMiyabiでのユーザー名（例: n46001）に変更してください。

IdentityFile: 使用する秘密鍵のパスを指定します。id_ed25519以外の名前で鍵を作成した場合は、そのファイル名に変更してください。

3. ローカルのデータディレクトリ準備
ローカルPCに、Miyabiと同期するためのディレクトリを作成します。

Windowsのエクスプローラー等で作成する場所:

C:\miyabi_data\push
C:\miyabi_data\pull
WSLから見た場合のパス:

/mnt/c/miyabi_data/push
/mnt/c/miyabi_data/pull
Miyabiへ転送したいファイルは、このpushディレクトリに置いてください。

注意点
SSH鍵にパスフレーズを設定した場合、スクリプト実行時に毎回パスフレーズの入力が求められます。これはセキュリティ上推奨される運用です。

スクリプトの実行時に、転送方向（pushまたはpull）を必ず指定してください。

ライセンス
このプロジェクトはMITライセンスで提供されています。詳細はLICENSEを参照してください。
