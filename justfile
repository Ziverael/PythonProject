@default:
    just help

help:
    #!/usr/bin/env sh
    {{sh_init}}
    echo_title "General recipes:"
    echo_default "help                 Show this message."
    echo_default "setup_repo_name      Set project name. Run at the beginning."
    echo_default "init                 Initialize the project. Run after \`set_name\`."
    echo_default "up                   Start all services."
    echo_default "down                 Stop all services."
    echo_default "update_dotenv        Recreate the .env file from the .env.template file."
    echo_default "build                Builds <project_name> image."
    echo_default "format               Format <project_name> code with ruff. Example usage:"
    echo_highlight "                         just format"
    echo_default "                       format specific file:"
    echo_highlight "                         just format <FilePathRelativeToProjectRoot>"
    echo_default "check                Verify the application code compliance against ruff, and mypy checks."
    echo_default "test                 Run the test suite. Example usage:"
    echo_default "all                  format + check + test."
    echo_default "                       run all tests:"
    echo_highlight "                         just test"
    echo_default "                       run specific test or tests:"
    echo_highlight "                         just test ./tests"
    echo_highlight "                         just test ./tests/test_something.py"
    echo_highlight "                         just test ./tests/test_something.py::test_it"
    echo_default "bash                 Start bash session inside the <project_name>-helper container."
    echo_default "python               Start ipython session inside the <project_name>-helper container."
    echo_title "Other recipes:"
    echo_default "meow                 Make Yourself the owner of the project folder and its contents."
    echo_default "coverage_report      Open coverage report with default browser."

setup_repo_name:
    #!/usr/bin/env sh
    {{sh_init}}
    setup_repo_name

init:
    #!/usr/bin/env sh
    {{sh_init}}
    init_project

default_target := './'
default_ignore := ''
format target=default_target ignore=default_ignore:
    #!/usr/bin/env sh
    {{sh_init}}
    format_code {{target}} {{ignore}}

check:
    #!/usr/bin/env sh
    {{sh_init}}
    check_code


# Just global variables

set dotenv-load

alias f     := format
alias c     := check

TITLE       := '\033[94m\033[1m'
HIGHLIGHT   := '\033[93m\033[1m'
WARNING     := '\033[91m\033[1m'
DEFAULT     := '\033[0m'

sh_init := "set -e && PROJECT_DIR=$(pwd) && . $PROJECT_DIR/justscripts/main.sh"