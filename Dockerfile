ARG DOCKER_REGISTRY

FROM ${DOCKER_REGISTRY:+${DOCKER_REGISTRY}/}python:3.9-slim

RUN apt --assume-yes update \
  && apt --assume-yes install \
    git

RUN pip install --upgrade pip
RUN pip install --upgrade \
  build \
  pytest \
  twine

ARG CONTAINER_USER=default
ARG CONTAINER_USER_GROUP=default

RUN addgroup ${CONTAINER_USER_GROUP} \
  && adduser --ingroup ${CONTAINER_USER_GROUP} ${CONTAINER_USER} 

USER ${CONTAINER_USER}:${CONTAINER_USER_GROUP}

WORKDIR /var/workspace
