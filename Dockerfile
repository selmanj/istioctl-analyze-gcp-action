FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
      jq curl ca-certificates python

RUN curl -Ls https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-280.0.0-linux-x86_64.tar.gz \
      -o gcloud.tar.gz && mkdir -p /gcloud && tar -zxf gcloud.tar.gz -C /gcloud && rm gcloud.tar.gz

# Istioctl master built feb 14th
run curl -Ls https://storage.googleapis.com/istio-build/dev/1.6-alpha.10ba91244e262700c85df779354eca42f5c2bc4e/istioctl-1.6-alpha.10ba91244e262700c85df779354eca42f5c2bc4e-linux.tar.gz -o istioctl.tar.gz && mkdir /istioctl && tar -zxf istioctl.tar.gz -C /istioctl && rm istioctl.tar.gz

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
