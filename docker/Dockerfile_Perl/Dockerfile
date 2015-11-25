# Base image
FROM ubuntu:14.04.3

# Update package lists
RUN apt-get update --fix-missing

# SSH
RUN apt-get install -y openssh-server 
RUN mkdir /var/run/sshd &&\
    chmod 755 /var/run/sshd &&\
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config &&\
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config &&\
    start ssh

# Nano
RUN apt-get install -y nano

# Timezone
RUN echo America/Argentina/Buenos_Aires > /etc/timezone &&\
    dpkg-reconfigure -f noninteractive tzdata &&\
    locale-gen en_US en_US.UTF-8 es_AR.UTF-8 &&\
    dpkg-reconfigure locales

# Apache2
RUN apt-get install -y apache2 libapache2-mod-perl2

# Perl Padwalker Debug
RUN apt-get install libpadwalker-perl

# Perl Cpan
RUN apt-get install -y cpanminus make apt-utils

# Install Gcc
RUN apt-get install -y gcc

# Perl-doc
RUN apt-get install -y perl-doc

# Nmap
RUN apt-get install -y nmap

# Perl Cpan Modules
# RUN cpanm Log::Log4perl
RUN cpanm PadWalker
RUN cpanm Apache::DB
RUN mkdir /usr/include/apache2 && cpanm Apache2::Reload
RUN cpanm ExtUtils::Depends
RUN apt-get install -y pkg-config && cpanm ExtUtils::PkgConfig
RUN apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
RUN cpanm Cairo
RUN cpanm Data::Dumper
RUN cpanm Data::Dumper::HTML
RUN cpanm Data::Printer
RUN cpanm Data::TreeDumper::Renderer::DHTML
RUN cpanm Data::TreeDumper
RUN cpanm Switch
RUN cpanm CGI
RUN cpanm Data::TreeDumper::OO
RUN cpanm HTML::TextToHTML
RUN cpanm DBI

# MySQL Client And Perl Driver
RUN apt-get install -y mysql-client
RUN apt-get install -y libdbd-mysql-perl

# Add Apache Perl Conf
ADD ./perl.conf /etc/apache2/conf-available/serve-cgi-bin.conf 
 
# Entrypoint
ADD ./init.sh /root/run.sh 
RUN chmod +x /root/run.sh
ENTRYPOINT ["/root/run.sh"]

# Ports SSL Apache Perl-Debug
EXPOSE 22 80 5000
