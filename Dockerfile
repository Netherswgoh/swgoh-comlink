# Use a lightweight Node.js base image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy package definition files *first* to leverage Docker caching
COPY package.json package-lock.json* ./

# Install all dependencies
RUN npm install

# Copy the rest of the app code
COPY . .

# Optional: Build step (only runs if build script exists)
RUN npm run build || echo "No build step defined"

# Expose the port used by Comlink
EXPOSE 3000

# Start the server
CMD ["npm", "start"]
