function modify_HandlerGoodByeDotJava() {
    echo "書き換えます"
    TARGETFILE="src/main/java/com/serverless/HandlerGoodBye.java"
    BEFORE="Response responseBody = new Response(\"GoodBye\", input);"
    AFTER="Response responseBody = new Response(\"GoodBye2\", input);"
    sed -i '' -e "s/${BEFORE}/${AFTER}/g" ${TARGETFILE}
}

sh gradle_build_and_upload_to_s3.sh v0.0.1
modify_HandlerGoodByeDotJava
sh gradle_build_and_upload_to_s3.sh v0.0.2