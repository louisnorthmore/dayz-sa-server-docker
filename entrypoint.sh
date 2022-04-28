#!/bin/bash


function updateGame() {
    steamcmd \
        +force_install_dir ${SERVER_DIR} \
        +login ${STEAM_CMD_USER} ${STEAM_CMD_PASSWORD} \        
        +app_update ${APP_ID} \
        ${EXTRA_UPDATE_ARGS} \
        +quit
}

function startGame() {
    cd ${SERVER_DIR}
    ./DayZServer \
        -config="serverDZ.cfg" \
        ${EXTRA_START_ARGS}
}

case "$1" in
    start)
        updateGame
        startGame
    ;;
    update)
        updateGame
    ;;
    *)
        exec "$@"
    ;;
esac
