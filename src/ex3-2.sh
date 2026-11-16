#!/bin/bash
echo "=== y = 1/2 * x^2 계산기 ==="
echo -n "x 값들을 띄어쓰기로 입력하세요 (2개 이상): "
read -a xs

# 2개 미만이면 종료
if [ ${#xs[@]} -lt 2 ]; then
    echo "2개 이상 입력해야 합니다."
    exit 1
fi

# 입력한 값 하나씩 계산
for x in "${xs[@]}"; do
    y=$(echo "scale=4; $x * $x / 2" | bc)
    printf "x = %s  ->  y = %.4f\n" "$x" "$y"
done
