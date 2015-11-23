$ENV{PERLDB_OPTS}="RemotePort=172.17.0.1:5000 DumpReused ReadLine=0 PrintRet=0";
if( ! -d "/usr/lib/cgi-bin" ) {die("Target directory does not exist!")};
chdir("/usr/lib/cgi-bin/phase_1");
system("perl -d  -I \"/usr/lib/cgi-bin\" /usr/lib/cgi-bin/phase_1/ex_html_1.pl");