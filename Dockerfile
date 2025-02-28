# Use Node.js base image
FROM node:18-alpine

# Set the working directory
WORKDIR /weather-application

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the React app in development mode
CMD ["npm", "start"]