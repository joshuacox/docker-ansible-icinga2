FROM    joshuacox/docker-ansible:latest
MAINTAINER Josh Cox <josh 'at' webhosting coop>

#ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
#ENV ANSIBLE_LIBRARY /tmp/ansible/library
#ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH

# Example usage
# RUN git clone http://github.com/yourusername/yourrepo.git /tmp/example
# ADD inventory /etc/ansible/hosts
# WORKDIR /tmp/examples
# RUN ansible-playbook site.yml -c local
# EXPOSE 22 3000
# ENTRYPOINT [“/usr/bin/foo”]

RUN git clone https://github.com/Icinga/icinga2-ansible.git
ADD inventory.ini /etc/ansible/hosts
ADD site.yml /home/site.yml
WORKDIR /tmp/examples
RUN cd /home; ansible-playbook site.yml -c local
