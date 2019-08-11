FROM ubuntu:18.04

RUN apt-get update && apt-get install -y g++ cython \
      libxml2-dev libxslt-dev \
      python3 python3-pip

RUN mkdir ~/.pip
RUN echo " [global]" > ~/.pip/pip.conf
RUN echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ~/.pip/pip.conf

ADD requirement.txt .
RUN pip3 install -r requirement.txt
# enable extensions
RUN jupyter contrib nbextension install --user
RUN jupyter nbextensions_configurator enable --user

expose 8888
CMD ["jupyter", "notebook"]
