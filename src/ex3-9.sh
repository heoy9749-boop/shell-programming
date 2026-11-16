#!/bin/bash
DB="DB.txt"

if [ $# -ne 1 ]; then
    echo "사용법: bash ex3-9.sh 검색어"
    exit 1
fi

# DB.txt가 있는지 확인
if [ ! -f "$DB" ]; then
    echo "DB.txt가 없습니다. ex3-8.sh로 먼저 기록하세요."
    exit 1
fi

# 검색 (대소문자 구분 없음, 제목줄 제외)
result=$(grep -i "$1" "$DB" | grep -v "^--")

if [ -z "$result" ]; then
    echo "'$1'에 대한 검색 결과가 없습니다."
else
    echo "[검색 결과: $1]"
    echo "$result"
fi
