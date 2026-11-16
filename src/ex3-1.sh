#!/bin/bash
# 인자가 2개가 아니면 사용법 안내 후 종료
if [ $# -ne 2 ]; then
    echo "사용법: bash ex3-1.sh 숫자1 숫자2"
    exit 1
fi

a=$1
b=$2

echo "입력값: a=$a, b=$b"
echo "$a + $b = $((a + b))"
echo "$a - $b = $((a - b))"
echo "$a * $b = $((a * b))"

# 0으로 나누기 방지
if [ $b -eq 0 ]; then
    echo "$a / $b = 0으로 나눌 수 없습니다."
else
    echo "$a / $b = $((a / b)) (나머지 $((a % b)))"
fi
