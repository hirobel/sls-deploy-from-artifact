# 概要
Serverless FW公式ガイドを参考に、S3にホストされたパッケージをデプロイするためのサンプルです

# 背景と目的
自分の勉強用です

# 前提事項
`serverless deploy` コマンド実行時に、 `aws-profile` を指定するとS3からオブジェクトを取得する処理でエラーになりますので、同オプションを指定しないでデプロイを行う必要があります

# 参考
* Serverless Framework Guide - AWS Lambda Guide - Packaging https://serverless.com/framework/docs/providers/aws/guide/packaging/#artifacts-hosted-on-s3# try-sls-deploy-from-artifact
