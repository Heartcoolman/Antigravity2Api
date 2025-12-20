# syntax=docker/dockerfile:1

FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev --no-audit --no-fund

COPY src ./src
COPY README*.md ./

RUN mkdir -p /app/auths /app/log

ENV NODE_ENV=production

EXPOSE 3000

CMD ["node", "src/server.js"]
