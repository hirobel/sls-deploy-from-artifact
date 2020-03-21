VERSION=$1
S3_BUCKET="hirobel-sandbox"
S3_KEY="sls-deploy-from-artifact/hello_${VERSION}.zip"
PACKAGE_FILE_PATH='./build/distributions/hello.zip'

if [ $# -ne  1 ]; then
  echo "実行するには1個の引数が必要です。" 1>&2
  echo "$0 [VERSIONNAME]"
  exit 1
fi

echo "gradleによるビルドを行います"
./gradlew build
if [ $? -ne 0 ]; then
    echo "gradleによるビルドに失敗したため、処理を終了します"
    exit 1
fi

echo "S3にアップロードします"
aws s3 cp ${PACKAGE_FILE_PATH} s3://${S3_BUCKET}/${S3_KEY}
if [ $? -ne 0 ]; then
    echo "s3へのアップロードに失敗したため、処理を終了します"
    exit 1
fi

echo "アップロードするjarのハッシュ値を取得します"
HASHVALUE=$(openssl dgst -binary -sha256 < ${PACKAGE_FILE_PATH} | base64)
if [ $? -ne 0 ]; then
    echo "アップロードするjarのハッシュ値取得に失敗したため、処理を終了します"
    exit 1
fi

echo "タグ付けを行います"
aws s3api put-object-tagging \
    --bucket ${S3_BUCKET} \
    --key ${S3_KEY} \
    --tagging "TagSet=[{Key=version,Value=${VERSION}},{Key=hashvalue,Value=${HASHVALUE}}]"
if [ $? -ne 0 ]; then
    echo "タグ付けに失敗したため、処理を終了します"
    exit 1
fi