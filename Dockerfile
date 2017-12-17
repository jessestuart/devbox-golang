# Re-use the phusion baseimage which runs an SSH server etc
FROM phusion/baseimage

# Some definitions
ENV SUDOFILE /etc/sudoers
ENV SSHKEYFILE vagrantssh.key

# Do what?
RUN rm -f /etc/service/sshd/down

# Import the newly generated public key into the docker image
ADD keys/${SSHKEYFILE}.pub /tmp/${SSHKEYFILE}.pub

RUN \
  # Install the public key for root user
  cat /tmp/${SSHKEYFILE}.pub >> /root/.ssh/authorized_keys && \
  # Create vagrant user
  useradd \
    --shell /bin/bash \
    --create-home \
    --base-dir /home \
    --user-group \
    --groups sudo,ssh \
    --password '' \
    vagrant && \
  # Install the public key for vagrant user
  mkdir -p /home/vagrant/.ssh && \
  cat /tmp/${SSHKEYFILE}.pub >> /home/vagrant/.ssh/authorized_keys && \
  chown -R vagrant:vagrant /home/vagrant/.ssh && \
  # Remove the temporary location for the key
  rm -f /tmp/${SSHKEYFILE}.pub && \
  # Update apt-cache, so that stuff can be installed
  apt-get -y update && \
  # Install python (otherwise ansible will not work)
  # Install aptitude, since ansible needs it (only apt-get is installed)
  apt-get -y install aptitude python sudo && \
  # Enable password-less sudo for all user (including the 'vagrant' user)
  test -e ${SUDOFILE} || touch ${SUDOFILE} && \
  chmod u+w ${SUDOFILE} && \
  echo '%sudo   ALL=(ALL:ALL) NOPASSWD: ALL' >> ${SUDOFILE} && \
  chmod u-w ${SUDOFILE}
