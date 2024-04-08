#!/bin/bash
SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if  [[ ! -d "$TARGET_DIR" ]]; then
    mkdir "$TARGET_DIR"
fi

RM_FILES=$(cat "$RM_LIST")
echo "$RM_FILES"

for FILE in ${RM_FILES}; do
    echo "${FILE}  a"
    rm -rf "${SOURCE_DIR}/${FILE}"
done


# shellcheck disable=SC2045
for FILE in $(ls ${SOURCE_DIR}); do
    echo "oj"
    if [[ -d ${SOURCE_DIR}/${FILE} ]]; then
        cp -r ${SOURCE_DIR}/${FILE} $TARGET_DIR
    fi

    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
        mv ${SOURCE_DIR}/${FILE} $TARGET_DIR
    fi
done

ITER=0

# shellcheck disable=SC2045
for FILE in $(ls ${SOURCE_DIR}); do
    echo "${ITER}"
    ITER=$((ITER + 1))
done


if [[ ${ITER} -eq 0 ]]; then
    echo "ale tu nikogo nie ma"
elif [[ ${ITER} -gt 2 ]]; then
    echo "zostały conajmniej dwa pliki"
fi

if [[ ${ITER} -gt 2 && ${ITER} -lt 4 ]]; then
    echo "zostały 3 pliki"
elif [[ ${ITER} -gt 4 ]]; then
    echo "zostały conajmniej 4 pliki"
fi

zip -r backup_$(date +"%Y-%m-%d").zip ${TARGET_DIR}

