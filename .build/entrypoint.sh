#!/bin/bash

PATHS="";
if [ "$CONFIG_PATH" ]
then
  PATHS="$PATHS --watch "$CONFIG_PATH"";
else
  PATHS="$PATHS --watch ./.storage/config";
fi

if [ "$SECRETS_PATH" ]
then
  PATHS="$PATHS --watch "$SECRETS_PATH"";
elif [ "$CONFIG_PATH" ]
then
  PATHS="$PATHS --watch ./.storage/config";
fi

node -e 'require("./api/src/constants")()'
exec nodemon -e yml,yaml $PATHS -q api/server.js