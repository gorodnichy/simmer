## Build: docker build -t r-ubsan -f simmer/working_dir/r-ubsan.Dockerfile .
##        R CMD build simmer
## Usage: docker run --rm -ti -v $(pwd):/mnt r-ubsan /bin/bash -c "_R_CHECK_FORCE_SUGGESTS_=false RD CMD check --as-cran /mnt/simmer_x.x.x.tar.gz"

## Start with the base image
FROM rocker/r-devel-ubsan-clang:latest
MAINTAINER Iñaki Úcar <i.ucar86@gmail.com>

## Remain current
RUN apt-get update -qq \
	&& apt-get dist-upgrade -y

RUN cd /usr/local/lib/R/etc \
  && echo "CXXFLAGS += -I/usr/include/libcxxabi" >> Makevars.site

## Install dependencies
RUN apt-get install -y \
  libssl-dev
RUN RDscript -e 'install.packages(c("Rcpp", "BH", "R6", "magrittr", "codetools", "testthat", "knitr"))'

ENV LANG=en_US.utf-8 \
    HOME=/home/docker
WORKDIR /home/docker
USER docker
