FROM python:3.6
WORKDIR /customer_service_chatbot
COPY . ./
RUN pip install -r requirements.txt 
RUN python3 -m spacy download en
EXPOSE 5000
ENTRYPONIT ["gunicorn"]
#CMD exec gunicorn --bind :$PORT --workers 1 --worker-class uvicorn.workers.UvicornWorker  --threads 8 app:app
CMD ["app:app"]
