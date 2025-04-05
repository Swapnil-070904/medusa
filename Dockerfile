FROM node:20.19.0-bullseye

WORKDIR /app

COPY package*.json ./

COPY . .
RUN chmod +x script.sh
RUN npm install --silent

EXPOSE 9000

CMD ["./script.sh"]
