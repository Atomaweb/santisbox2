
FROM node:16 AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM nginx:alpine
COPY --from=builder /app/website /usr/share/nginx/html
EXPOSE 80
