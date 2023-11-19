# menggunkaan node:14-alpine sebagai base image
FROM node:14-alpine
# mengatur working directory
WORKDIR /src
# menyalin package.json dan package-lock.json
COPY package*.json .

# install bash
RUN apk add --no-cache bash
# download script untuk menunggu rabbit-mq
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# menambahkan executable permission
RUN chmod +x /bin/wait-for-it.sh
# Mengatur environment variable
ENV NODE_ENV=production
# install dependency
RUN npm ci
# copy seluruh file
COPY . .
# expose port aplikasi
EXPOSE 3000
# menjalankan aplikasi
CMD ["npm", "run", "start"]