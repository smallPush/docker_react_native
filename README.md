# Docker React Native Expo Environment

This project provides a Dockerized development environment for building React Native applications using Expo. It uses a lightweight Node.js Alpine container and mapping a local `src` directory to the container to ensure a consistent development setup without requiring Node.js or Expo CLI to be installed directly on your host machine.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Quick Start

1. **Build the Docker image:**
   ```bash
   make build
   ```

2. **Start the environment:**
   ```bash
   make up
   ```

3. **Initialize a new Expo project (if starting from scratch):**
   ```bash
   make init
   ```
   *(This will create a new Expo app in the `./src` directory, which is mapped to `/app` inside the container.)*

4. **Start the Expo Metro Bundler:**
   ```bash
   make start
   ```

## Makefile Commands

A `Makefile` is provided to simplify common tasks:

- `make build`: Builds the Docker image (`expo`) as defined in the `docker-compose.yml`.
- `make up`: Starts the Docker container in detached mode.
- `make down`: Stops and removes the Docker container.
- `make shell`: Opens an interactive bash shell inside the running `expo` container. Useful for running package managers (e.g., `npm install`, `yarn add`).
- `make init`: Runs `npx create-expo-app@latest .` inside the container to initialize a new project in the mapped directory.
- `make start`: Runs `npx expo start` inside the container to start the development server.

## Project Structure

- `Dockerfile`: Defines the Node.js Alpine-based image, installs necessary tools (bash, git, curl), sets the working directory to `/app`, and exposes port 8081.
- `docker-compose.yml`: Defines the `expo` service, maps the local `./src` directory to the container's `/app` directory, maps port 8081, and sets necessary environment variables for Expo.
- `Makefile`: Contains aliases for common Docker Compose commands.

## Development

The `./src` directory on your host machine is mounted as a volume to `/app` inside the container. Any changes you make to the files in the `./src` directory will be immediately reflected in the container, and the Expo Metro Bundler will automatically reload your application.
