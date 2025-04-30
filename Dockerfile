FROM node:20-alpine
WORKDIR /app

# Copy package files
COPY package.json package.json
COPY package-lock.json package-lock.json

# Install dependencies
RUN npm install

# Install TypeScript globally
RUN npm install -g typescript

# Copy tsconfig.json into the container
COPY tsconfig.json tsconfig.json

# Compile TypeScript files
RUN tsc 

# Copy the remaining files (this assumes your build output is not already copied)
COPY . .

# Set environment variables (optional, ensure .env file exists)
RUN export $(cat .env | xargs)

# Run the server
CMD ["node", "dist/server"]
