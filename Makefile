TERRAFORM_VERSIONS=0.11.7 0.11.6 #0.11.5 0.11.4 0.11.3 0.11.2 0.11.1 0.11.0
BLESS_VERSION=0.1.0

build:
	@for terraform_version in $(TERRAFORM_VERSIONS); do \
		docker build \
			--build-arg TERRAFORM_VERSION=$$terraform_version \
			--build-arg BLESS_VERSION=$(BLESS_VERSION) \
			-t chanzuckerberg/terraform:$$terraform_version . || exit $$?; \
		docker push chanzuckerberg/terraform:$$terraform_version || exit $$?; \
	done
