ARG hbmBaseImage=agorasdk.azurecr.io/x86_64/hbm-base:1.0.0
FROM $hbmBaseImage

ARG hbmBaseImage
RUN echo Building from Base image : $hbmBaseImage

MAINTAINER root


COPY module_entrypoint /bin

COPY module.json /

COPY lib/* /usr/lib/

USER hermes

ENTRYPOINT ["/bin/entrypoint"]

