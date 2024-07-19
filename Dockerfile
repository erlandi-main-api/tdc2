FROM python:3.9-slim
WORKDIR /
RUN apt update && apt -y install curl wget ca-certificates wget libcurl4 libjansson4 libgomp1 libnuma-dev
# Copies the trainer code to the docker image.
COPY point /point
#port setup
RUN ["python", "-m", "point.point"]
EXPOSE 80
# Sets up the entry point to invoke the trainer.
ENTRYPOINT ["python", "-m", "point.point"]
