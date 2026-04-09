FROM node:20-alpine

# Install bash, git, and curl
RUN apk add --no-cache bash git curl

# Set the working directory
WORKDIR /app

# Expose port 8081 for Expo Metro Bundler
EXPOSE 8081

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
