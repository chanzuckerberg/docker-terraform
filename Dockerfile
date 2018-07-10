ARG TERRAFORM_VERSION=0.11.7

# For caching purposes
FROM alpine as providers
ARG BLESS_VERSION

RUN apk update && apk add curl tar --no-cache
RUN mkdir /providers

# Add providers here
RUN curl -L --output terraform-provider-bless.tar.gz --silent --fail -O https://github.com/chanzuckerberg/terraform-provider-bless/releases/download/v${BLESS_VERSION}/terraform-provider-bless_${BLESS_VERSION}_linux_amd64.tar.gz
RUN tar -C /providers -zxf terraform-provider-bless.tar.gz

# Add them to hashicorp/terraform image
FROM hashicorp/terraform:${TERRAFORM_VERSION}
COPY --from=providers /providers/terraform-provider-bless /bin/

