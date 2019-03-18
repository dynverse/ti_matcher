FROM dynverse/dynwrappy:v0.1.0

ARG GITHUB_PAT

RUN pip install git+https://github.com/SheffieldML/GPy.git
RUN pip install pymatcher

COPY definition.yml run.py example.sh /code/

ENTRYPOINT ["/code/run.py"]
