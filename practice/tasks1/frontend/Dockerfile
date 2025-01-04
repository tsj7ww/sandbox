FROM node:16
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000

# Run in development mode
CMD ["npm", "run", "dev"]

# Prod
# RUN npm run build
# CMD ["npm", "start"]