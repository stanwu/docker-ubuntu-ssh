# Docker Ubuntu SSH

This project sets up an Ubuntu 14.04 to 24.04 container with SSH access and various development tools pre-installed. (checkout branch to switch)

## Prerequisites

- Docker
- Docker Compose

## Getting Started

1. Clone the repository:

    ```sh
    git clone https://github.com/yourusername/docker-ubuntu-ssh.git
    cd docker-ubuntu-ssh
    ```

2. Build and start the container using Docker Compose:

    ```sh
    docker-compose up -d
    ```

3. Connect to the SSH server:

    ```sh
    ssh user@localhost -p 2222
    ```

    The default password for the `user` account is `d2tqfp`.

## Project Structure

- [Dockerfile](http://_vscodecontentref_/0): Defines the Docker image, including the installation of necessary tools and configuration.
- [docker-compose.yml](http://_vscodecontentref_/1): Defines the Docker Compose configuration for the project.
- [LICENSE](http://_vscodecontentref_/2): Contains the MIT License for the project.

## Installed Tools

The container includes the following tools:

- OpenSSH Server
- sudo
- curl
- wget
- software-properties-common
- Node.js
- npm
- Python 3
- pip
- vim
- neovim
- git
- bash-completion
- locales
- xz-utils
- libx11-xcb1
- libfuse2

## Configuration Details

- The timezone is set to `Asia/Taipei`.
- The locale is set to `en_US.UTF-8`.
- The `user` account is created with sudo privileges and does not require a password for sudo commands.
- SSH is configured to run on port 22 inside the container and is mapped to port 2222 on the host machine.

## Volumes

- `ssh_data`: Mounted to `/home/user/ssh_data` inside the container.
- `/home/user/workspace`: Mounted to `/home/user/workspace` inside the container.

## License

This project is licensed under the MIT License. See the [LICENSE](http://_vscodecontentref_/3) file for details.