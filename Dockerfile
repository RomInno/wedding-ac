FROM node:18-slim as node
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm i
COPY . .
RUN NODE_OPTIONS="--max-old-space-size=4096" npm run build --prod
FROM nginx:alpine
COPY --from=node /app/dist/wedding-ac /usr/share/nginx/html

















