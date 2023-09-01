From node:19.5.0-alpine as builder
Workdir /app
Copy package.json .
Run npm install
COPY . .
Run npm run build

From nginx
Expose 80
COPY --from=builder /app/build /usr/share/nginx/html
