# ベースイメージとして軽量なNginxを使用
FROM nginx:stable-alpine

# 作業ディレクトリはNginxのデフォルトの静的ファイル格納場所
WORKDIR /usr/share/nginx/html

# 既存のデフォルト設定ファイルを削除
RUN rm /etc/nginx/conf.d/default.conf

# カスタムのnginx.confをコンテナの設定ディレクトリにコピー
COPY nginx.conf /etc/nginx/conf.d/default.conf

# プロジェクトの静的ファイル（index.htmlなど）を公開ディレクトリにコピー
COPY . /usr/share/nginx/html

# Cloud Runが期待するポート8080を公開することを宣言
EXPOSE 8080

# コンテナ起動コマンド：起動前に設定ファイル構文チェックを実行
# 設定に問題なければNginxをフォアグラウンドで起動
CMD ["/bin/sh", "-c", "nginx -t && nginx -g 'daemon off;'"]
