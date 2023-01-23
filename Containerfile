FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN datagenerator_ create-db
RUN datagenerator_ populate-db
RUN datagenerator_ add-user -u admin -p admin
EXPOSE 5000
CMD ["datagenerator_", "run"]
