# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /build_files

# Base Image
FROM ghcr.io/zirconium-dev/zirconium:latest

RUN chmod +x /build_files/20-kernel.sh \
    chmod +x /build_files/30-initramfs.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/10-build.sh \
    /ctx/build_files/20-kernel.sh \
    /ctx/build_files/30-initramfs.sh
    
### LINTING
## Verify final image and contents are correct.
RUN bootc container lint
