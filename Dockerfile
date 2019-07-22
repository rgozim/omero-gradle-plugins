# Gradle plugins super project
# ----------------------------
# This dockerfile can be used to build
# the gradle plugins necessary for building
# the omero-build super project. This is mostly
# used by travis to test that the plugins are
# all functioning.

# The BUILD_IMAGE argument can be overwritten
# but this is generally not needed unless you
# would like to provide an existing user maven
# directory (~/.m2) to speed up the build.
ARG BUILD_IMAGE=registry.gitlab.com/rgozim/docker-registry/gradle-ice36:5.4.1-jdk8

#
# Build phase: Use the gradle image for building.
#
FROM ${BUILD_IMAGE} as build

# Copy over this project
COPY --chown=gradle:gradle . /home/gradle/src
