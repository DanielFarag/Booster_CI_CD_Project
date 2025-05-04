FROM python:3.6

RUN mkdir /app
 
WORKDIR /app
 
RUN pip install --upgrade pip 
 
COPY requirements.txt  /app/
 
RUN pip install -r requirements.txt

COPY . /app/

RUN python manage.py makemigrations && \
    python manage.py migrate

EXPOSE 8000
 
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]