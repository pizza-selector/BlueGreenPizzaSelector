FROM nginx:1.25.5-alpine3.19

WORKDIR "/etc/nginx/"

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx/run.sh /etc/nginx/run.sh

## Remove default nginx index page
RUN rm -rf /etc/nginx/html/*

COPY dist/pizza-selector/browser /etc/nginx/html

EXPOSE 80

ENTRYPOINT ["sh", "run.sh"]
