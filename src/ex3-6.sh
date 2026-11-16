#!/bin/bash
# 폴더 이름 인자 확인
if [ $# -ne 1 ]; then
    echo "사용법: bash ex3-6.sh 폴더이름"
    exit 1
fi

dir=$1

# 1) 폴더가 있는지 확인, 없으면 생성
if [ -d "$dir" ]; then
    echo "'$dir' 폴더가 이미 있습니다."
else
    mkdir "$dir"
    echo "'$dir' 폴더를 생성했습니다."
fi

cd "$dir"

# 2) 파일 5개 만들기
for i in 0 1 2 3 4; do
    echo "This is file$i" > file$i.txt
done
echo "[생성된 파일]"
ls

# 3) 압축
echo "[압축: $dir.tar]"
tar -cvf "$dir.tar" file*.txt

# 4) 새 폴더 만들고 압축 해제
mkdir -p "${dir}_unzip"
echo "[압축 해제 -> ${dir}_unzip 폴더]"
tar -xvf "$dir.tar" -C "${dir}_unzip"

echo "[최종 $dir 폴더 내용]"
ls
echo "[${dir}_unzip 폴더 내용]"
ls "${dir}_unzip"
