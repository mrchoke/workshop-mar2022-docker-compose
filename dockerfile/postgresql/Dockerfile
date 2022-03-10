FROM postgres:14
ENV TZ=Asia/Bangkok

RUN apt update && apt install -y locales \
        && sed -i 's/^# *\(th_TH.UTF-8\)/\1/' /etc/locale.gen \
        && sed -i 's/^# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
        && locale-gen \
        && localedef -i th_TH -c -f UTF-8 -A /usr/share/locale/locale.alias th_TH.UTF-8 \
        && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
        && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV LANG th_TH.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL th_TH.UTF-8

RUN usermod -u 1000 postgres
RUN groupmod -g 1000 postgres

COPY install-extensions.sql /docker-entrypoint-initdb.d
