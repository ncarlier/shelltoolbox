# My shell toolbox.
#
# VERSION 0.0.1

FROM ncarlier/nodejs

MAINTAINER Nicolas Carlier <https://ncarlier.github.io>

# Add files
ADD . /opt/shelltoolbox
WORKDIR /opt/shelltoolbox
RUN chown node.node -R /opt/shelltoolbox

# Def. user
USER node
ENV HOME /home/node

# Install App
RUN npm install

# Main port
EXPOSE 3000

ENTRYPOINT ["/usr/bin/npm"]

CMD ["start"]
