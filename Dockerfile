FROM node:10.17.0 AS build-env
ADD . /app
WORKDIR /app


# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

FROM gcr.io/distroless/nodejs
COPY --from=build-env /app /app
WORKDIR /app

EXPOSE 5000:8090
CMD [ "node", "index.js" ]
