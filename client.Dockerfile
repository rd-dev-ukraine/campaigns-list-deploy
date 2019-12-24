# build environment
FROM node as builder

ARG API_URL

ENV API_URL $API_URL

# COPY package-lock.json /tmp/package-lock.json
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /usr/app && cp -a /tmp/node_modules /usr/app/

WORKDIR /usr/app
COPY . /usr/app/

RUN ls -al
RUN npm run build
# production environment
FROM nginx:1.13.9-alpine
COPY --from=builder /usr/app/dist/public /usr/share/nginx/html
RUN rm -rf /etc/nginx/conf.d
COPY configs /etc/nginx
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]