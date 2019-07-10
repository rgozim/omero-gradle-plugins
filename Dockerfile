# To install the built distribution into other runtimes
# pass a build argument, e.g.:
#
#   docker build --build-arg IMAGE=openjdk:9 ...
#

# Similarly, the BUILD_IMAGE argument can be overwritten
# but this is generally not needed.
ARG BUILD_IMAGE=registry.gitlab.com/rgozim/docker-registry/gradle-ice36:5.4.1-jdk8

#
# Build phase: Use the gradle image for building.
#
FROM ${BUILD_IMAGE} as build

# Copy over this project
COPY --chown=gradle:gradle . /home/gradle/project

# For running local
CMD ["/bin/bash"]

