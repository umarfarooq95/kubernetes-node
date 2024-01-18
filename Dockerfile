# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the application dependencies
RUN npm install

# Copy the content of the local src directory to the working directory
COPY . .

# Expose a port that the app will run on
EXPOSE 3000

# Define the command to run your application
CMD ["node", "index.js"]