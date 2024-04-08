FROM alpine:3.14

RUN apk add weasyprint
RUN apk --update --upgrade --no-cache add fontconfig ttf-freefont ttf-dejavu font-noto font-noto-cjk font-noto-extra terminus-font font-inconsolata-nerd \ 
     && fc-cache -f \ 
     && fc-list | sort 

CMD [ "weasyprint" ]