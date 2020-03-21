# 概要
Serverless FW公式ガイドを参考に、S3にホストされたパッケージをデプロイするためのサンプルです

# 背景と目的
自分の勉強用です

# 前提事項
* aws-java-gradleのテンプレートをベースにしています
* `serverless deploy` コマンド実行時に、 `aws-profile` を指定するとS3からオブジェクトを取得する処理でエラーになりますので、同オプションを指定しないでデプロイを行う必要があります
* 「エラー: メイン・クラスorg.gradle.wrapper.GradleWrapperMainが見つからなかったかロードできませんでした」が表示される場合には `gradle wrapper` コマンドでgradle-wrapper.jarを再生成してください

# 説明
* 01_from-artifact：artifactを指定するとS3にアップしたパッケージを使ってデプロイ出来ることが確認できます
* 02_from-artifact-oneside:artifactの設定を指定のfunctionだけに適用できることが確認できます
* 02_01_from-artifact-oneside_1:indivisuallyの設定はartifactの設定に関係ないことが確認できます1/4
* 02_02_from-artifact-oneside_2:indivisuallyの設定はartifactの設定に関係ないことが確認できます2/4
* 02_03_from-artifact-oneside_3:indivisuallyの設定はartifactの設定に関係ないことが確認できます3/4
* 02_04_from-artifact-oneside_4:indivisuallyの設定はartifactの設定に関係ないことが確認できます4/4
* 03_from-artifact-not：indivisuallyの設定を使って、デプロイパッケージをfunction毎に作成できることが確認できます

# 参考
* Serverless Framework Guide - AWS Lambda Guide - Packaging https://serverless.com/framework/docs/providers/aws/guide/packaging/#artifacts-hosted-on-s3# try-sls-deploy-from-artifact
