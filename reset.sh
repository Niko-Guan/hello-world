# 安装依赖
install_dependices () {
    echo "cnpm i" # >> $FILE
    output=`cnpm i`
    echo "${output}" # >> $FILE
}

# 打包
build () {
    echo "cnpm run build" # >> $FILE
    output=`cnpm run build`
    echo "${output}" # >> $FILE
}

# 更新博客程序
update_src () {
    # 删除
    echo "rm -rf ${deployPath}/index.html" # >> $FILE
    output=`rm -rf ${deployPath}/index.html`
    echo "${output}" # >> $FILE

    # 删除
    echo "rm -rf ${deployPath}/static" # >> $FILE
    output=`rm -rf ${deployPath}/static`
    echo "${output}" # >> $FILE

    # 更新
    echo "cp -r ./dist/* ${deployPath}/" # >> $FILE
    output=`cp -r ./dist/* ${deployPath}/`
    echo "${output}" # >> $FILE
}
echo_start () {
    echo "---------------    DEPLOY START @$datetime   --------------------------------------" # >> $FILE
    export PATH=$PATH:/opt/nodejs/bin/
    echo $PATH
    echo "Deploying..."
}

echo_end () {
    echo "Deploy Done, everythings is OK!"
    datetime=$(date '+%Y-%m-%d %H:%M:%S')
    echo "---------------    DEPLOY DONE @${datetime}   ----------------------------------------" # >> $FILE
}
# 提升权限
update_authorization () {
    echo "chown -R www:www ./ && chmod -R 777 ./" # >> $FILE
    chown -R www:www ./ && chmod -R 777 ./
}

echo_start && update_authorization && install_dependices && build && update_src
