#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`
export PROJECTS_DIRECTORY_PATH=$PWD/..

export PYTHONPATH=$PROJECTS_DIRECTORY_PATH/paradicms/etl:$PROJECTS_DIRECTORY_PATH/paradicms/ssg

#COLLECTION=Passion
COLLECTION=Thinker-Doer
#OUTPUT_DATA=Bildungsroman.ttl
#OUTPUT_FORMAT=ttl-rdf
OUTPUT_DATA=$PROJECTS_DIRECTORY_PATH/Bildungsroman-gui
OUTPUT_FORMAT=single-page-exhibition

cd $PROJECTS_DIRECTORY_PATH/paradicms/ssg
poetry run python3 $PROJECTS_DIRECTORY_PATH/paradicms-action/action.py \
    --debug 1 --dev \
    --base-url-path /$COLLECTION \
    --configuration-file-path $PROJECTS_DIRECTORY_PATH/Bildungsroman/configuration.ttl \
    --id Bildungsroman \
    --input-data $PROJECTS_DIRECTORY_PATH/Bildungsroman/$COLLECTION \
    --input-format markdown \
    --output-data $OUTPUT_DATA --output-format $OUTPUT_FORMAT
