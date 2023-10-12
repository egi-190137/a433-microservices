# Menggunakan base image node versi 14
FROM node:14
# Mengatur working directory
WORKDIR /app
# Menyalin semua file ke dalam working directory
COPY . .
# Mengatur environment variable
ENV NODE_ENV=production DB_HOST=item-db
# Menjalankan perintah untuk install library dan build
RUN npm install --production --unsafe-perm && npm run build
# mengatur port aplikasi
EXPOSE 8080
# Perintah yang dijalankan ketika container di-start
CMD ["npm", "start"]