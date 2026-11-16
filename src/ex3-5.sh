#!/bin/bash

# 1) 사용자 정보
user_info() {
    echo "현재 사용자: $(whoami)"
    id
    echo "[로그인 중인 사용자]"
    who
}

# 2) GPU 또는 CPU 사용률
cpu_gpu_usage() {
    if command -v nvidia-smi > /dev/null; then
        nvidia-smi
    else
        echo "GPU 없음 -> CPU 사용률 표시"
        top -bn1 | head -12
    fi
}

# 3) 메모리 사용량
memory_usage() {
    free -h
}

# 4) 디스크 사용량
disk_usage() {
    df -h /
    echo "[홈 폴더 사용량]"
    du -sh ~ 2> /dev/null
}

# 5) 입력 인자를 ls 옵션으로 전달하는 함수
run_ls() {
    echo "함수 안으로 들어왔음 (ls 옵션: $*)"
    ls "$@"
}

echo "프로그램을 시작합니다."
while true; do
    echo "==================="
    echo "1) 사용자 정보"
    echo "2) GPU/CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 파일 목록 보기 (ls)"
    echo "6) 종료"
    echo "==================="
    echo -n "메뉴 선택: "
    read menu

    case $menu in
        1) user_info ;;
        2) cpu_gpu_usage ;;
        3) memory_usage ;;
        4) disk_usage ;;
        5) run_ls "$@" ;;
        6) echo "프로그램을 종료합니다."; break ;;
        *) echo "-> 1~6 중에서 선택하세요." ;;
    esac
done
