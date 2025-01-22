FROM node:16

WORKDIR /app

COPY package*.json ./

RUN apt update -y &&  npm install

COPY . ./

WORKDIR /app/src/client
RUN npm install && npm run build

WORKDIR /app
RUN mkdir -p src/server/static && if [ -d "src/client/build" ]; then cp -r src/client/build/* src/server/static/; fi


EXPOSE 3000

WORKDIR /app/src/server

CMD ["node", "app.js"]
