#!/bin/bash
./fakaping.sh 2>&1 | grep -i "permission denied" | sort --unique | tee denied.log

./fakaping.sh 2>&1 | sort --unique | tee all.log