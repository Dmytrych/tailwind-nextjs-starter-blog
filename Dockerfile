FROM node:20-alpine

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./
RUN yarn install

COPY . .

ENV EXPORT=1
ENV UNOPTIMIZED=1

RUN echo "$(ls)"

RUN yarn build

RUN yarn global add serve

EXPOSE 3000

CMD ["npx", "serve", "out"]