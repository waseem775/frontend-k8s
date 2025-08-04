# Use Node to build
FROM node:18 as build
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Use Nginx to serve static files
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

