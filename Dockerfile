FROM 32bit/ubuntu:16.04
RUN apt-get update && apt-get install -y make g++ gcc libc6-dev dos2unix gcc-multilib libgdbm-dev:i386 ntp curl
RUN curl -o perl-5.28.0.tar.gz https://cpan.metacpan.org/authors/id/X/XS/XSAWYERX/perl-5.28.0.tar.gz && tar xvfz perl-5.28.0.tar.gz && cd perl-5.28.0 && ./Configure -des -Darch=i686-linux -Dprefix=/root/perl5/perlbrew/perls/perl-5.28.0 && find . -type f | xargs touch 
RUN cd perl-5.28.0 && make && make install
RUN rm -Rf perl-5.28.0.tar.gz perl-5.28.0
ADD shallow-parser-tam-3.0.fc8.tgz /shallow-parser-tam-3.0.fc8.tgz
ENV SHALLOW_PARSER_TAM=/root/app/nlp
ENV PATH=$PATH:$SHALLOW_PARSER_TAM/bin/sys/tam
RUN cd /shallow-parser-tam-3.0.fc8.tgz/shallow-parser-tam-3.0.fc8 && make install && rm -Rf /shallow-parser-tam-3.0.fc8.tgz 
ADD run.sh /run.sh
ADD entrypoint.sh /entrypoint.sh
#ENTRYPOINT /entrypoint.sh
CMD /run.sh

