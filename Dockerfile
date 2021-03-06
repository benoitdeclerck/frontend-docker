# Build Phase

FROM node:alpine

WORKDIR /app

COPY package-lock.json package.json ./

RUN npm install

COPY . .

RUN npm run build


# Run Phase

FROM nginx

EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html

# Default command for nginx image will start up the container
# So no command necessary here

