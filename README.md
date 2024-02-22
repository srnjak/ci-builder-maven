# CI Builder Maven
(ci-builder-maven)

This Dockerfile creates a Docker image based on maven:3.9.6 and includes ssh. 
The primary purpose of this image is to serve as a builder in Continuous Integration (CI) pipelines where Maven and SSH functionalities are required. 
It provisions a Maven environment for building Java projects, while SSH meets the needs of secure communication in CI tasks such as accessing private repositories or servers.
