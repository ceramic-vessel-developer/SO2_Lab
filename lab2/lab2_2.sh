#!/bin/bash -eu

SOURCE_DIR=${1}

if [[ $# -lt 1 ]]; then
  echo "Brak argumentu" >&2
  exit 2
fi

if [[ ! -d ${SOURCE_DIR} ]]; then
  echo "Ścieżki są niepoprawne" >&2
  exit 3
fi

# shellcheck disable=SC2045
for FILE in $(ls ${SOURCE_DIR}); do
    FILENAME="${FILE%.*}"
    FILE_EXTENSION=".${FILE##*.}"

    if [[ ".${FILENAME}" == "${FILE_EXTENSION}" ]]; then
        FILE_EXTENSION=''
    fi


#    if [[ -L ${SOURCE_DIR_1}/${FILE} ]]; then
#        echo "${FILE} to symlink"
    if [[ -d ${SOURCE_DIR}/${FILE} ]]; then
      if [[ ".bak" == "${FILE_EXTENSION}"  ]]; then
          chmod u-x,g-x,o+x "${SOURCE_DIR}/${FILE}"
      elif [[ ".tmp" == "${FILE_EXTENSION}"  ]]; then
          chmod +t "${SOURCE_DIR}/${FILE}"
      fi

    elif [[ -f ${SOURCE_DIR}/${FILE} ]]; then
      if [[ ".bak" == "${FILE_EXTENSION}"  ]]; then
          chmod u-w,o-w "${SOURCE_DIR}/${FILE}"
      elif [[ ".txt" == "${FILE_EXTENSION}"  ]]; then
          chmod 421 "${SOURCE_DIR}/${FILE}"
      elif [[ ".exe" == "${FILE_EXTENSION}"  ]]; then
          chmod u+xs,g+x,o+x "${SOURCE_DIR}/${FILE}"
      fi
    fi
done