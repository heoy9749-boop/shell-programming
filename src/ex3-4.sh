#!/bin/bash
names=()    # 과목 이름 목록
scores=()   # 점수 목록

# 평균 계산 함수
get_avg() {
    local sum=0
    for s in "${scores[@]}"; do
        sum=$((sum + s))
    done
    avg=$(echo "scale=2; $sum / ${#scores[@]}" | bc)
}

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "==================="
    echo -n "메뉴 선택: "
    read menu

    case $menu in
        1)
            echo -n "과목 이름: "
            read name
            echo -n "점수 (0~100): "
            read score
            if [[ "$score" =~ ^[0-9]+$ ]] && [ "$score" -le 100 ]; then
                names+=("$name")
                scores+=("$score")
                echo "-> $name ${score}점 추가 완료"
            else
                echo "-> 0~100 사이 정수를 입력하세요."
            fi
            ;;
        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "-> 입력된 성적이 없습니다."
            else
                for ((i=0; i<${#scores[@]}; i++)); do
                    echo "  ${names[$i]}: ${scores[$i]}점"
                done
            fi
            ;;
        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "-> 입력된 성적이 없습니다."
            else
                get_avg
                echo "-> 평균 점수: ${avg}점"
            fi
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "-> 입력된 성적이 없습니다."
            else
                get_avg
                int=${avg%.*}      # 소수점 아래 버리기
                int=${int:-0}
                if   [ $int -ge 95 ]; then g="A+"; p="4.5"
                elif [ $int -ge 90 ]; then g="A0"; p="4.0"
                elif [ $int -ge 85 ]; then g="B+"; p="3.5"
                elif [ $int -ge 80 ]; then g="B0"; p="3.0"
                elif [ $int -ge 75 ]; then g="C+"; p="2.5"
                elif [ $int -ge 70 ]; then g="C0"; p="2.0"
                elif [ $int -ge 65 ]; then g="D+"; p="1.5"
                elif [ $int -ge 60 ]; then g="D0"; p="1.0"
                else                       g="F";  p="0.0"
                fi
                echo "-> 평균 ${avg}점 = $g (GPA $p / 4.5)"
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "-> 1~5 중에서 선택하세요."
            ;;
    esac
done
