FROM nginx:stable-alpine

# 作業ディレクトリは静的ファイルを置く場所
WORKDIR /usr/share/nginx/html

# デフォルトのnginx設定ファイルを削除し、カスタム設定ファイルをコピー
# まず、コンテナ内のデフォルト設定ファイルを削除 (またはバックアップ)
RUN rm /etc/nginx/conf.d/default.conf
# カスタムのnginx.confファイルをコンテナの適切な場所にコピー
COPY nginx.conf /etc/nginx/conf.d/default.conf

# アプリケーションの静的ファイルをNginxの公開ディレクトリにコピー
COPY . /usr/share/nginx/html

# ポートの公開（Nginxがこのポートでリッスンすると示す）
EXPOSE 8080
# ここを8080に合わせる

# コンテナ起動コマンド（Nginxのデフォルトで問題なし）
CMD ["nginx", "-g", "daemon off;"]
