FROM node:latest

RUN mkdir app
WORKDIR /app

RUN npm init -y
RUN npm install run-rs

CMD ["node", "node_modules/run-rs"]