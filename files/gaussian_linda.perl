#!/usr/bin/perl
# Modify the Gaussian Inputfile for Linda Parallel Jobs (PPK 10/30/09)
# Modified for UCL Legion March 2012
use strict;

my $numArgs = $#ARGV + 1;
#print "Number of arguments are $numArgs \n";
if ( @ARGV < 3 ) {
     print "This script expects three arguments input jobid 
and pe_hostfile file names \n"
}

my $input    = shift(@ARGV);
my $output     = shift(@ARGV);
my $pe_hostfile = shift(@ARGV);

my %hosts;
my $host;
my $lindahosts;

$output="job".$output."\.com";

open (FH, $pe_hostfile) ||
         die ("Can't open $pe_hostfile for reading\n");

while (<FH>)  {
    $host = $_;
    chop ($host);
    if (defined $hosts{$host})
    {
    	$hosts{$host} = $hosts{$host} + 1;
    }
    else
    {
    	$hosts{$host} = 1;
    }
}
    
foreach $host ( keys %hosts )
{    
    if ( $hosts{$host} eq 1 )
    {
    	$lindahosts=$lindahosts.$host.",";
    }
    else
    {
    	$lindahosts=$lindahosts.$host.":".$hosts{$host}.",";
    }
}
chop ($lindahosts);

close (FH);
print "\nLinda hosts: $lindahosts \n";
open (INFILE, $input) ||
         die ("Can't open $input for reading\n");
open (OUTFILE, ">$output") ||
         die ("Can't open $output for writing\n");

print OUTFILE "%LindaWorkers=$lindahosts\n";
while (<INFILE>) {
                if (/^--Link1--/){
                   print OUTFILE "$_";
                   print OUTFILE "%LindaWorkers=$lindahosts\n";
                }
                else{
                  next if (/%NProcShared/);
                  next if (/%LindaWorkers/);
                  print OUTFILE "$_";
                }
}
close (INFILE);
close (OUTFILE);
