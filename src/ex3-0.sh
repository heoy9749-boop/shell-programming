#!/bin/bash
echo "MYENV 값: $MYENV"

if [ -z "$MYENV" ]; then
    echo "MYENV가 설정되어 있지 않습니다."
else
    echo "MYENV가 유지되고 있습니다."
fi
