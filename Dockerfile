FROM node:20-alpine A3 build

WORKDIR/ app


COPY package*.json ./

RUN npm install

COPY . .


RUN npm run build 


FROM nginx:alpine

COPY --from-build/app/dist/usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g""doemon off;"]
