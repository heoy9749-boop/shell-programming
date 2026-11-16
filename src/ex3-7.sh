#!/bin/bash
if [ $# -ne 1 ]; then
    echo "사용법: bash ex3-7.sh 폴더이름"
    exit 1
fi

dir=$1
mkdir -p "$dir"
cd "$dir"

for i in 0 1 2 3 4; do
    # 파일 만들기
    echo "This is file$i" > file$i.txt
    # 파일 이름대로 하위 폴더 만들기
    mkdir -p file$i
    # 하위 폴더 안에 원본 파일 링크
    ln -sf ../file$i.txt file$i/file$i.txt
done

echo "[$dir 폴더 내용]"
ls
echo "[file0 폴더 안 - 링크 확인]"
ls -l file0
echo "[링크를 통해 내용 읽기]"
cat file0/file0.txt
