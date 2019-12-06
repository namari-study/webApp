# ///////////////////////////////////
# go の設定
# ///////////////////////////////////

FROM golang:1.13

# 作業ディレクトリを指定
WORKDIR /go/src/webApp

# ローカルのディレクトリをイメージのディレクトリにコピー
# (ここではWORKDIRで指定した/go/src/webApp)
COPY . .

# $go env の設定
ENV GO111MODULE=on

# ///////////////////////////////////
# イメージのビルド時に実行するコマンド
# ///////////////////////////////////

# [echo]のインストール
RUN go get -u github.com/labstack/echo/...

# [realize]のインストール
RUN go get gopkg.in/urfave/cli.v2@master && \
go get github.com/oxequa/realize

# ホットリロードの実行
CMD ["realize","start"]