# Use an official Node.js runtime
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy package files first
COPY package.json ./

# Install Dependencies (if any)
RUN npm install --production || true

# Copy application code
COPY . .

# Expose the app port
EXPOSE 3000

# Start the Node.js app
CMD ["npm", "start"]

