# pull official base image
FROM node:lts-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY ./app/package.json ./
COPY ./app/package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@5.0.0 -g --silent

# add app
COPY ./app/public ./public
COPY ./app/src ./src

# start app
CMD ["npm", "start"]
