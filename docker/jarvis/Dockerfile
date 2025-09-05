FROM node:22-alpine

RUN apk add --no-cache git

RUN git clone https://github.com/twin-pick/jarvis /jarvis

WORKDIR /jarvis

RUN npm install

EXPOSE 8081

CMD ["npm", "run", "web"]