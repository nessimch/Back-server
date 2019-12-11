FROM node:10.17.0 AS build-env
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app
EXPOSE 5000:8090
CMD [ "node", "server.js" ]
