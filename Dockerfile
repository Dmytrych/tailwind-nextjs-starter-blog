FROM node:20-alpine

WORKDIR /usr/src/app

COPY package.json .
RUN yarn install

COPY . .

RUN echo "After yarn install:" && ls

RUN EXPORT=1 UNOPTIMIZED=1 yarn build

EXPOSE 3000

RUN yarn global add serve

CMD ["npx", "serve", "out"]