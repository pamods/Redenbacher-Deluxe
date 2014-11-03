#!/bin/sh
# needs json_reformat command provided by yajl ("brew install yajl")
find . | while read file; do
  if [[ ${file: -9} != "temp.json" ]] ; then 
    if [ ${file: -5} == ".json" ] ; then
      echo "${file}"
      cat $file | json_reformat > temp.json && \
      rm "${file}" && \
      mv temp.json "${file}"
    fi
  fi
done
