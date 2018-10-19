FROM buildpack-deps

ADD https://openresty.org/download/openresty-1.13.6.2.tar.gz /openresty/

RUN cd /openresty \
    && tar xf openresty-1.13.6.2.tar.gz \
    && cd openresty-1.13.6.2 \
    && ./configure \
        --with-http_geoip_module \
        --with-http_gzip_static_module \
        --with-http_v2_module \
        --with-http_postgres_module \
        --with-http_auth_request_module \
        --with-http_stub_status_module \
        -j8 \
    && make -j8 \
    && make install \
    && rm -rf /openresty

RUN mkdir /experimental \
    && cd /experimental \
    && git clone --single-branch --depth 1 https://github.com/knyar/nginx-lua-prometheus

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
