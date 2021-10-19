FROM ubuntu

RUN pwd

RUN echo "Hello world"

RUN apt-get -y update

RUN apt-get install -y git

ENV NODE_VERSION=14.15.0
RUN apt-get update && \
       apt-get install wget curl ca-certificates rsync git -y
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

RUN apt install python3 -y
RUN apt install python3-pip -y

RUN echo "hello6"
RUN git clone https://github.com/ratan99/language-server.git
RUN cd language-server/jsonrpc && npm install &&  npm run prepare

RUN git clone https://github.com/Navjot-Sharma/python-language-server.git
RUN pip3 install python-language-server

RUN cd python-language-server && npm install

RUN cp /language-server/jsonrpc/src/servers.yml /language-server/jsonrpc/dist/servers.yml

WORKDIR /language-server
CMD ["node", "jsonrpc/dist/server.js --languageServers ./../servers.yml"]
# CMD ["node", "jsonrpc/dist/server.js"]

EXPOSE 3000

