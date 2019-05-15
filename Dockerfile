# To install the built distribution into other runtimes
# pass a build argument, e.g.:
#
#   docker build --build-arg IMAGE=openjdk:9 ...
#

# Similarly, the BUILD_IMAGE argument can be overwritten
# but this is generally not needed.
ARG BUILD_IMAGE=gradle:5.4.1-jdk8

#
# Build phase: Use the gradle image for building.
#
FROM ${BUILD_IMAGE} as build

USER root

RUN apt-get update && apt-get install -y zeroc-ice-all-dev
RUN useradd --system --gid gradle --uid 1001 --shell /bin/bash --create-home dev

USER dev

# Make a source folder
RUN mkdir /home/dev/src

# Initialize submodules
WORKDIR /home/dev/src/project
COPY --chown=dev:gradle . /home/dev/src/project

# Build all
COPY --chown=1000:1000 build.sh /src/build.sh
RUN ./build.sh
