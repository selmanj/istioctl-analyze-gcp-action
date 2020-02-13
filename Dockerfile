FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      jq curl ca-certificates python

RUN curl -Ls https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-280.0.0-linux-x86_64.tar.gz \
      -o gcloud.tar.gz && tar -zxf gcloud.tar.gz && rm gcloud.tar.gz

# Istioctl alpha of 1.5 built feb 13th
run curl -Ls https://storage.googleapis.com/istio-build/dev/1.5-alpha.869925a916629b188a8baf9f745d0cf6c2053571/istioctl-1.5-alpha.869925a916629b188a8baf9f745d0cf6c2053571-linux.tar.gz -o istioctl.tar.gz && tar -zxf istioctl.tar.gz && rm istioctl.tar.gz

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
