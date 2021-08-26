# Author: David Bennett
# Email: david.b.bennett@floridadep.gov

FROM centos:8.3.2011
RUN yum update -y
RUN yum install epel-release -y
RUN yum install python3-pip -y
RUN yum install python3-setuptools
RUN yum install git -y
RUN yum install wget -y
RUN python3 -m pip install --upgrade pip
RUN pip3 install 'ansible[azure]'
RUN ansible-galaxy collection install azure.azcollection
RUN wget https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt
RUN pip3 install -r requirements-azure.txt
RUN useradd azure_user
RUN echo 'azure_user:password1' | chpasswd
RUN mkdir /home/azure_user/.azure
#CMD ["ansible", "git", "-g", "daemon off";"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
#STOPSIGNAL SIGQUIT
