# The site is static HTML, so the image is a web server and the pages.
# Caddy rather than nginx because it reads $PORT from the environment without
# a template step, which is how Railway hands a container its port.
FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY *.html /srv/

EXPOSE 80
