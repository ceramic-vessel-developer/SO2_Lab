#!/bin/bash -eu

SOURCE_DIR_1=${1}
SOURCE_DIR_2=${2}

if [[ $# -lt 2 ]]; then
  echo "Brak argumentów lub argumentu" >&2
  exit 2
fi

if [[ ! -d ${SOURCE_DIR_1} && ! -d ${SOURCE_DIR_2} ]]; then
  echo "Ścieżki są niepoprawne" >&2
  exit 3
fi

# shellcheck disable=SC2045
for FILE in $(ls ${SOURCE_DIR_1}); do
    FILENAME="${FILE%.*}"
    FILE_EXTENSION=".${FILE##*.}"

    if [[ ".${FILENAME}" == "${FILE_EXTENSION}" ]]; then
        FILE_EXTENSION=''
    fi

    if [[ -L ${SOURCE_DIR_1}/${FILE} ]]; then
        echo "${FILE} to symlink"
    elif [[ -d ${SOURCE_DIR_1}/${FILE} ]]; then
        echo "${FILE} to katalog"
        echo "$FILE_EXTENSION"
        ln -sf "${FILE}" "${SOURCE_DIR_2}/${FILENAME^^}_ln${FILE_EXTENSION}"
    elif [[ -f ${SOURCE_DIR_1}/${FILE} ]]; then
        echo "${FILE} to plik regularny"
        echo "$FILE_EXTENSION"
        ln -sf "${FILE}" "${SOURCE_DIR_2}/${FILENAME^^}_ln${FILE_EXTENSION}"
    fi
done