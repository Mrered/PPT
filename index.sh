#!/bin/zsh

# 遍历工作目录下的每个子文件夹
for dir in */; do
    # 进入子文件夹
    cd "$dir"

    # 检查是否存在 local.md 文件
    if [ -f "local.md" ]; then
        # 创建 index.md 文件
        sed -e 's,../public_assets,https://cdn1.mre.red/public_assets,g' -e 's,./assets,https://cdn1.mre.red/'"${dir%/}"'/assets,g' local.md > index.md
    fi

    # 返回上级目录
    cd ..
done