FROM ghcr.io/diesdasdigital/morpheme:v1.0.0

COPY replacements.json .
COPY config.json .
COPY transitions/ transitions/

