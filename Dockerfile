FROM dynverse/dynwrap:py3.6

RUN pip install pymatcher

LABEL version 0.1.2

ADD . /code

ENTRYPOINT python /code/run.py
