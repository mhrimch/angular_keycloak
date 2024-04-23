#STEP 1 compile and build angular codebase
FROM node:latest as build

# create working dir
WORKDIR /usr/local/app

# add the source code (all dir's) from Dockerfile working directory  to /app
COPY ./ /usr/local/app/

# install all dependencies  (reading  package.json and adding to node_modules)
RUN npm install

# generate the build (dist folder) of the application  (build is an script into package.json)
RUN npm run build

# STEP 2 serve app with nginx server

# from nginx as web server
FROM nginx:latest
# copy the build output to replace the default nginx index.html
COPY --from=build /usr/local/app/dist/dashboard/browser /usr/share/nginx/html
EXPOSE 80