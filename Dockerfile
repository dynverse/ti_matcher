FROM dynverse/dynwrap:py3.6

LABEL version 0.1.1

RUN pip install pymatcher

ADD . /code

ENTRYPOINT python /code/run.py
