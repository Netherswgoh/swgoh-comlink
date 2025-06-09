# Use a lightweight Node.js base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package definition files first (for better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy rest of the app source
COPY . .

# Expose the default port (change if necessary)
EXPOSE 3000

# Start the Comlink server
CMD ["npm", "start"]
