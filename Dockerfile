# -- Build Stage --
FROM node:13.3.0 AS angular

## Copy Angular project to image
ADD . /var/tmp

## Change working directory
WORKDIR /var/tmp

## Build angular project
RUN npm install
RUN npm run build -- --prod

# -- Serve Stage --
FROM nginx:stable

## Copy built Angular files to static file location
COPY --from=angular /var/tmp/dist/docker-angular /usr/share/nginx/html

## Expose port 80
EXPOSE 80