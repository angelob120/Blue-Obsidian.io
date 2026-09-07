# The site is static HTML, so the image is a web server and the pages.
# Caddy rather than nginx because it reads $PORT from the environment without
# a template step, which is how Railway hands a container its port.
FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile

# The site has nested directories (legal/) and an assets/ folder, so this
# cannot go back to copying *.html. The build files come along with it and are
# then removed: .dockerignore cannot exclude the Caddyfile, because the COPY
# above needs it in the build context.
COPY . /srv/
RUN rm -f /srv/Dockerfile /srv/Caddyfile /srv/.dockerignore

EXPOSE 80
