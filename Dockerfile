# Use official Node.js base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install required build tools (just in case native modules are used)
RUN apk add --no-cache python3 make g++

# Copy package definition files
COPY package*.json ./

# Install ALL dependencies (production-only caused your error)
RUN npm install

# Copy the full source code
COPY . .

# Optional: build step if needed (safe to include even if unused)
RUN npm run build || echo "No build step defined"

# Expose port used by the app
EXPOSE 3000

# Start the service
CMD ["npm", "start"]
