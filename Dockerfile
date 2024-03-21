FROM ubuntu

RUN apt-get update

RUN apt-get install git -y

RUN git clone https://github.com/ManojaD2004/macha-lang.git

RUN cd macha-lang

RUN apt-get install 