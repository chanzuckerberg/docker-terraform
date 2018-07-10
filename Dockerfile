ARG TERRAFORM_VERSION=0.11.7

FROM hashicorp/terraform:${TERRAFORM_VERSION}
ARG TERRAFORM_VERSION
ARG BLESS_VERSION

# RUN curl --silent --fail -O https://github.com/chanzuckerberg/terraform-provider-bless/releases/download/v${BLESS_VERSION}/terraform-provider-bless_${BLESS_VERSION}_linux_amd64.tar.gz --output terraform-provider-bless.tar.gz
# RUN tar -zxvf terraform-provider-bless.tar.gz

COPY terraform-provider-bless /bin/
