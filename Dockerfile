# builder block: temporary for building
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# use for serving static content in production
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
