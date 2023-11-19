
FROM node:14-alpine
WORKDIR /src
COPY package*.json .

RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

RUN chmod +x /bin/wait-for-it.sh
# Mengatur environment variable
ENV NODE_ENV=production
RUN npm ci
COPY . .
EXPOSE 3001
CMD ["npm", "run", "start"]