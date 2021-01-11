FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
copy --from=builder /app/build /usr/share/nginx/html
