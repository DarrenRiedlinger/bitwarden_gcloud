# Use the latest 2.x builder
FROM caddy:2-builder AS builder

# Build with plugins
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare 

# Overlay on the latest 2.x base image
FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
