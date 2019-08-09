FROM python:3.7-alpine

RUN apk add g++ cython linux-headers
RUN pip install jupyter

CMD ["jupyter", "notebook"]
