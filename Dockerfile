FROM python:3.8

WORKDIR /usr/src/App

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . .


EXPOSE 5000

CMD ["python", "./App.py"]