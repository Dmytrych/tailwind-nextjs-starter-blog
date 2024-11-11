FROM node:20

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

ENV EXPORT=1
ENV UNOPTIMIZED=1

RUN yarn build

EXPOSE 3000

CMD ["npx", "serve", "out"]