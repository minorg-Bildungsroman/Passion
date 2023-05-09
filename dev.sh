#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`
export PROJECTS_DIR_PATH=$PWD/..

#COLLECTION=Passion
COLLECTION=Thinker-Doer

COLLECTION_DIR_PATH=$PROJECTS_DIR_PATH/Bildungsroman/$COLLECTION

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/directory-etl-action/action.py \
  --cache-directory-path $COLLECTION_DIR_PATH/.paradicms/cache \
  --input-directory-path $COLLECTION_DIR_PATH \
  --loaded-data-directory-path $COLLECTION_DIR_PATH/.paradicms/loaded \
  --pipeline-id $COLLECTION \
  "$@"

poetry run $PROJECTS_DIR_PATH/ssg-action/action.py \
  --cache-directory-path $COLLECTION_DIR_PATH/.paradicms/cache \
  --data-path $COLLECTION_DIR_PATH/.paradicms/loaded \
  --dev \
  --pipeline-id $COLLECTION
