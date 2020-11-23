FROM amazon/aws-cli

RUN yum update -y && yum install -y tar gzip  && yum clean all
ENV CURRENT_VERSION=2.27.1
RUN curl -L https://github.com/Versent/saml2aws/releases/download/v${CURRENT_VERSION}/saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -o saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz &&\
    tar -xzvf saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz -C /usr/bin &&\
    rm saml2aws_${CURRENT_VERSION}_linux_amd64.tar.gz
RUN chmod u+x /usr/bin/saml2aws

ENTRYPOINT ["/usr/bin/saml2aws"]