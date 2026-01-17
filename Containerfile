# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build /build

# Base Image
FROM ghcr.io/zirconium-dev/zirconium:latest

# RUN rm /opt && mkdir /opt

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    chmod +x /ctx/build/20-kernel.sh
    chmod +x /ctx/build/30-initramfs.sh
    /ctx/build/10-build.sh
    /ctx/build/20-kernel.sh
    /ctx/build/30-initramfs.sh
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
