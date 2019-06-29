FROM node:10.15.0-alpine
EXPOSE 3000

WORKDIR /home/app

RUN mkdir src

COPY package.json /home/app/
COPY package-lock.json /home/app/
COPY .babelrc /home/app
COPY .env /home/app

COPY src /home/app/src

RUN npm install && npm install --only=dev && npm update && export NODE_ENV=development

CMD ["npm", "start"] 
