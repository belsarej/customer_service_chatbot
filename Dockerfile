FROM python:3.6
WORKDIR /customer_service_chatbot
COPY . ./
RUN pip install -r requirements.txt 
RUN python3 -m spacy download en
EXPOSE 8080
CMD exec gunicorn --bind :$PORT --workers 1 --worker-class uvicorn.workers.UvicornWorker  --threads 8 app:app
