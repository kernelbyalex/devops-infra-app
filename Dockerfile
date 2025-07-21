#Version
FROM node:18-alpine
#Dir
WORKDIR /usr/src/app

COPY package*.json ./
#Dependencies
RUN npm install --production

COPY . .

#port
EXPOSE 3000

#START
CMD ["node", "index.js"]
