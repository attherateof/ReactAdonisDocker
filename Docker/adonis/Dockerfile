# Use the official Node.js image with the latest LTS version
FROM node:20.13.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Install AdonisJS CLI globally
RUN npm install -g @adonisjs/cli

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Create a user with the same UID and GID as the host user
ARG USER_ID
ARG GROUP_ID

# Create a group and user with the specified IDs, handling the case where the group already exists
RUN if ! getent group $GROUP_ID > /dev/null 2>&1; then \
        addgroup -g $GROUP_ID appgroup; \
    fi && \
    if ! getent passwd $USER_ID > /dev/null 2>&1; then \
        adduser -D -u $USER_ID -G $(getent group $GROUP_ID | cut -d: -f1) appuser; \
    fi

# Switch to the new user
USER $USER_ID

# Expose the port the app runs on
EXPOSE 3333

# Command to run the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
