FROM node:20-slim as builder
WORKDIR /workspace
COPY . .
RUN npm install

FROM node:20-alpine
WORKDIR /workspace
COPY --from=builder /workspace .
COPY .env .env
RUN apk --update add git
CMD npm start
EXPOSE 3002
