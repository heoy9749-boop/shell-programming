#!/bin/bash
echo "=== 성적 등급 변환기 ==="
echo -n "과목 수를 입력하세요 (2개 이상): "
read n

# 과목 수 확인
if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -lt 2 ]; then
    echo "2 이상의 숫자를 입력하세요."
    exit 1
fi

sum=0
for ((i=1; i<=n; i++)); do
    # 0~100 사이 정수가 들어올 때까지 다시 입력받기
    while true; do
        echo -n "${i}번째 과목 점수 (0~100): "
        read score
        if [[ "$score" =~ ^[0-9]+$ ]] && [ "$score" -le 100 ]; then
            break
        fi
        echo "  0~100 사이 정수로 다시 입력하세요."
    done

    # 등급 판정
    if [ "$score" -ge 90 ]; then
        grade="A"
    else
        grade="B"
    fi
    echo "  -> ${i}번째 과목: ${score}점, 등급 $grade"
    sum=$((sum + score))
done

# 평균 계산 (소수점 2자리)
avg=$(echo "scale=2; $sum / $n" | bc)
if [ $(echo "$avg >= 90" | bc) -eq 1 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "------------------------"
echo "평균: ${avg}점, 평균 등급: $avg_grade"
