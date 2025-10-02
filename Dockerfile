# ベースイメージの指定
# Nginxの最新の安定版で、非常に軽量なAlpine Linuxベースのものを使用します。
FROM nginx:stable-alpine

# 作業ディレクトリの設定（オプションですが慣習として）
WORKDIR /usr/share/nginx/html

# ファイルのコピー
# GitHubリポジトリの現在のディレクトリ（ビルドコンテキスト）にある
# すべてのファイル（index.html, CSSなど）を、Nginxのデフォルトの公開ディレクトリにコピーします。
COPY . /usr/share/nginx/html

# ポートの公開
# Nginxはデフォルトでポート80でリッスンします。
EXPOSE 80

# コンテナ起動コマンド
# Nginxがフォアグラウンドで起動し続けるためのデフォルトコマンドです。
# ベースイメージに既に設定されているため、通常は省略可能です。
CMD ["nginx", "-g", "daemon off;"]
