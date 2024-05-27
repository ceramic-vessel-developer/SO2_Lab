 cut -d ',' -f 2,7 yolo.csv|grep -E '\$(2.99|5.99|9.99)' 1>&2

cut -d ',' -f 6 yolo.csv|grep -E -o '[[:digit:]]{1}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1}' 1>&2
