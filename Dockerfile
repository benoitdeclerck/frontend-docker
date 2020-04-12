# Build Phase

FROM node:alpine AS builder

WORKDIR /app

COPY package-lock.json package.json ./

RUN npm install

COPY . .

RUN npm run build


# Run Phase

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# Default command for nginx image will start up the container
# So no command necessary here

