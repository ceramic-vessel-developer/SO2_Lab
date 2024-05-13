#!/bin/bash
cat access_log | grep -E -o '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}'|tail -n 10

cat access_log | grep -E '[^[:space:]]denied[^[:space:]]'
