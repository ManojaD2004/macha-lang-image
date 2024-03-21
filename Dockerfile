FROM ubuntu

WORKDIR /home

RUN apt-get update

RUN apt-get install git -y

RUN git clone https://github.com/ManojaD2004/macha-lang.git

RUN apt-get install curl -y

RUN apt-get install ca-certificates -y

# we wil need to tell bash to load .bashrc manually
# ENV BASH_ENV ~/.bashrc
# needed by volta() function
ENV VOLTA_HOME /root/.volta
# make sure packages managed by volta will be in PATH
ENV PATH $VOLTA_HOME/bin:$PATH

RUN curl https://get.volta.sh | bash 

RUN volta install node

WORKDIR /home/macha-lang/client

RUN npm i

RUN npm run build

WORKDIR /home/macha-lang/server

RUN mkdir build

RUN mkdir logs

RUN npm i

RUN npm i -g rollup

RUN npm i -g nodemon

COPY ./.env.local /home/macha-lang/client/

COPY ./start.sh /home/macha-lang

WORKDIR /home/macha-lang

CMD ["./start.sh"]
