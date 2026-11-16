#!/bin/bash
DB="DB.txt"

# 처음부터 다시 작성: bash ex3-8.sh -r
if [ "$1" = "-r" ]; then
    echo "--my friends--" > "$DB"
    echo "DB.txt를 초기화했습니다."
    exit 0
fi

# 이름 + 정보 2개를 받아야 함
if [ $# -ne 2 ]; then
    echo "사용법: bash ex3-8.sh 이름 전화번호(또는 생일)"
    echo "초기화: bash ex3-8.sh -r"
    exit 1
fi

echo "$1 $2" >> "$DB"
echo "'$1 $2' 추가 완료"
