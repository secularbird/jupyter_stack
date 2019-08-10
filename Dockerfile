FROM python:3.7-alpine

RUN apk add g++ cython linux-headers openblas gfortran \
      libxml2-dev libxslt-dev lapack-dev \
      freetype
RUN pip install jupyter numpy matplotlib keras

CMD ["jupyter", "notebook"]
