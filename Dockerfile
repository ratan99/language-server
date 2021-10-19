FROM node:alpine

RUN pwd

RUN echo "Hello world"

# ENV NODE_VERSION=14.15.0
# RUN apt-get update && \
#        apt-get install wget curl ca-certificates rsync git -y
# RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
# ENV NVM_DIR=/root/.nvm
# RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
# RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
# RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
# ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
# RUN node --version
# RUN npm --version

# RUN node -v
# RUN npm -v

# RUN git clone https://github.com/Navjot-Sharma/python-language-server.git
# RUN pip3 install python-language-server

RUN apt install python3 -y
RUN apt install python3-pip -y
RUN python3 --version
RUN pip3 --version

RUN git clone https://github.com/Navjot-Sharma/python-language-server.git
RUN pip3 install python-language-server

RUN cd python-language-server && npm install


EXPOSE 3000

WORKDIR /python-language-server
