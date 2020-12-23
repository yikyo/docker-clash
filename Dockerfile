FROM node:14-alpine AS dist

RUN apk update && apk add git

RUN git clone --depth=1 https://github.com/Dreamacro/clash-dashboard.git

RUN cd clash-dashboard && yarn install && yarn build 


FROM dreamacro/clash-premium:2020.11.20

COPY --from=dist /clash-dashboard/dist /ui