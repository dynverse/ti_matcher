FROM dynverse/dynwrappy:v0.1.0

RUN pip install git+https://github.com/SheffieldML/GPy.git
RUN pip install pymatcher

COPY definition.yml run.R example.sh /code/

ENTRYPOINT ["/code/run.py"]
