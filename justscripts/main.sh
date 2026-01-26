#!/usr/bin/env sh
# shellcheck disable=SC2015
# shellcheck disable=SC2120
. justscripts/shell.sh
. justscripts/setup.sh

init_project(){
    check_if_name_set "verbose"
    create_default_directories_and_files
    create_or_udpate_env_file
}


clean_pycached () {
    echo_title "Removing all __pycache__ directories and *.py[cod] files"
    find . -type f -name "*.py[cod]" -delete -or -type d -name "__pycached__" -delete
    echo_default "Done"
}

init_local_venv(){
    echo_title "Initializing local venv..."
    uv sync
    echo_default "Initializing pre-commit..."
    uv run --no-sync pre-commit install
}

sync_local_venv(){
    echo_title "Synchronizing local venv..."
    uv sync
}