FROM python:3.7-slim AS compile-image

WORKDIR /app

COPY requirements.txt .

ENV PATH=/root/.local/bin:$PATH

RUN pip3 install --user -r requirements.txt

COPY . .


CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

#stage 2

# FROM python:3.7-slim AS build-image

# WORKDIR /app

# COPY --from=compile-image /root/.local /root/.local

# Make sure scripts in .local are usable:
# ENV PATH=/root/.local/bin:$PATH

#CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]


