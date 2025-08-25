miyabi_transfer

このリポジトリは、共同計算基盤センター (JCahpc) のスーパーコンピュータ Miyabi とローカルの Windows / Mac（WSL 環境）間で、ファイルを効率よく双方向（push / pull）に転送するためのスクリプトを提供します。

目次

利用方法

push（ローカル → Miyabi）

pull（Miyabi → ローカル）

例

初期設定方法

1. WSL の導入（Windows） / ターミナル（Mac）

2. SSH 鍵の作成・設定

① SSH 鍵の作成

② 公開鍵の登録

③ SSH コンフィグファイルの設定

3. ローカルのデータディレクトリ準備

注意点

スクリプト詳細

ライセンス

利用方法

スクリプトは WSL（Windows）または macOS のターミナル上で実行します。スクリプトの位置は ./scripts/transfer_miyabi.sh を想定しています。

push（ローカル → Miyabi）
./scripts/transfer_miyabi.sh <ユーザー名> push

pull（Miyabi → ローカル）
./scripts/transfer_miyabi.sh <ユーザー名> pull

例

ユーザー名が n46001 の場合：

# データをMiyabiへ送信する場合
./scripts/transfer_miyabi.sh n46001 push

# データをMiyabiから受信する場合
./scripts/transfer_miyabi.sh n46001 pull

初期設定方法

スクリプトを使う前に、以下の設定を行ってください。

1. WSL の導入（Windows） / ターミナル（Mac）

Windows の場合は WSL を導入してください（公式ガイドに従ってインストール）。

macOS の場合は標準のターミナルを使用してください。

（※ WSL インストールに関する詳細は公式ドキュメントを参照してください。）

2. SSH 鍵の作成・設定
① SSH 鍵の作成

まだ SSH 鍵ペアを作成していない場合、WSL のターミナルで以下を実行して作成します：

ssh-keygen -t ed25519 -C "your_email@example.com"


途中でパスフレーズの設定を求められます。パスフレーズを設定するとセキュリティが向上します。

② 公開鍵の登録

作成した公開鍵（~/.ssh/id_ed25519.pub の内容）を Miyabi の利用者ポータルから登録してください。詳細手順は JCahpc の利用者ポータル（ログイン後のドキュメント）を参照してください。

③ SSH コンフィグファイルの設定

WSL の ~/.ssh/config に以下を追記すると、ssh miyabi のような簡単な接続が可能になります（User はご自身の Miyabi アカウント名に変更してください）：

3. ローカルのデータディレクトリ準備

Windows エクスプローラーなどで以下のディレクトリを作成してください：

C:\miyabi_data\push
C:\miyabi_data\pull


WSL から見たパスは次のようになります：

/mnt/c/miyabi_data/push
/mnt/c/miyabi_data/pull


Miyabi に転送したいファイルは push ディレクトリに置いてください。

pull は Miyabi から取得したファイルの保存先を想定しています。

注意点

SSH 鍵にパスフレーズを設定している場合、スクリプト実行時に毎回パスフレーズの入力が求められます（セキュリティ上は推奨されます）。

スクリプトを実行する際は、必ず転送方向（push または pull）を指定してください。

~/.ssh/config の設定を変更した場合は、改行コード（Windows 編集時）やファイル権限に注意してください。

スクリプトの実行前に ./scripts/transfer_miyabi.sh に実行権限があることを確認してください：

chmod +x ./scripts/transfer_miyabi.sh

スクリプト詳細

スクリプト本体：./scripts/transfer_miyabi.sh

想定動作：

push 実行時はローカルの push ディレクトリにあるデータを Miyabi 側に送信します。

pull 実行時は Miyabi 側のデータをローカルの pull ディレクトリに取得します。

※ スクリプト内で rsync や scp を使用している場合、オプション（例: -avz, --exclude など）によって挙動が変わります。必要に応じてスクリプト本体を確認し、README にオプションの説明や除外設定の例を追記してください。

ライセンス

このプロジェクトは MIT ライセンス で提供されています。詳細はリポジトリ内の LICENSE を参照してください。
