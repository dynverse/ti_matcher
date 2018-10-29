FROM dynverse/dynwrap:py3.6

RUN pip install pymatcher

LABEL version 0.1.4

ADD . /code

ENTRYPOINT python /code/run.py
