FROM python:3.7-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add g++ cython linux-headers openblas gfortran \
      libxml2-dev libxslt-dev lapack-dev \
      freetype-dev

RUN mkdir ~/.pip
RUN echo " [global]" > ~/.pip/pip.conf
RUN echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf

RUN pip install jupyter numpy matplotlib keras

CMD ["jupyter", "notebook"]
