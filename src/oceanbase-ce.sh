##!/bin/bash

# Function to display help message
display_help() {
    echo "Usage: $0 [OPTION] [COMMAND]"
    echo
    echo "Options:"
    echo "  -h, --help    Display this help message and exit."
    echo "  -v, --version Display version information and exit."
    echo
    echo "Commands:"
    echo "  start        Start oceanbase-ce."
    echo "  stop         Stop oceanbase-ce."
    echo "  restart      Restart oceanbase-ce."
    echo "  status       Check the status of oceanbase-ce."
    echo "  dashboard    Open dashboard."
}

# Function to display version information
display_version() {
    echo "0.0.1"
}

# Function to start the program
start_run() {
    if docker ps -a --format '{{.Names}}' | grep -q '^oceanbase-ce$'; then
        echo "Container oceanbase-ce already exists."
        if docker ps --format '{{.Names}}' | grep -q '^oceanbase-ce$'; then
            echo "Container oceanbase-ce is already running."
        else
            echo "Starting existing container oceanbase-ce..."
            docker start oceanbase-ce
        fi
    else
        echo "Creating and starting new container oceanbase-ce..."
        mkdir -p ~/.oceanbase-ce/data/ob
        mkdir -p ~/.oceanbase-ce/data/.obd/obcluster
        docker run -p 2881:2881 -p 2886:2886 --name oceanbase-ce -e OB_SERVER_IP=127.0.0.1 -e OB_CLUSTER_NAME='OBCE_DESKTOP' -v ~/.oceanbase-ce/data/ob:/root/ob -v ~/.oceanbase-ce/data/.obd/cluster:/root/.obd/cluster -d quay.io/oceanbase/oceanbase-ce
    fi
    echo "Container started, you can check the start process with command 'docker logs oceanbase-ce'"
}

# Function to stop the program
stop_run() {
    if docker ps --format '{{.Names}}' | grep -q '^oceanbase-ce$'; then
        docker stop oceanbase-ce
        echo "Container oceanbase-ce stopped."
    else
        echo "Container oceanbase-ce is not running."
    fi
}

# Function to restart the program
restart_run() {
    if docker ps -a --format '{{.Names}}' | grep -q '^oceanbase-ce$'; then
        docker restart oceanbase-ce
        echo "Container oceanbase-ce restarted."
    else
        echo "Container oceanbase-ce does not exist."
    fi
}

# Function to check the status of the program
status_run() {
    if docker ps --format '{{.Names}}' | grep -q '^oceanbase-ce$'; then
        echo "Container oceanbase-ce is running."
    else
        if docker ps -a --format '{{.Names}}' | grep -q '^oceanbase-ce$'; then
            echo "Container oceanbase-ce is stopped."
        else
            echo "Container oceanbase-ce does not exist."
        fi
    fi
}

# Function to open the dashboard
dashboard_run() {
    open "http://127.0.0.1:2886"
}

# Main script logic
if [ $# -eq 0 ]; then
    display_help
    exit 1
fi

case "$1" in
    -h|--help)
        display_help
        ;;
    -v|--version)
        display_version
        ;;
    start)
        start_run
        ;;
    stop)
        stop_run
        ;;
    restart)
        restart_run
        ;;
    status)
        status_run
        ;;
    dashboard)
        dashboard_run
        ;;
    *)
        echo "Unknown option: $1"
        display_help
        exit 1
        ;;
esac
