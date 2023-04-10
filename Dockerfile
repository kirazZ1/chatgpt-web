FROM node:lts-alpine as builder
WORKDIR /
COPY . /
RUN npm install pnpm@6.32.6 -g && pnpm i && pnpm run build-only
FROM nginx:alpine
LABEL maintainer="KiraZz1 <1025658492@qq.com>"
COPY --from=builder /dist/ /usr/share/nginx/html
EXPOSE 80