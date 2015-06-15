#!/usr/bin/perl -w
use strict;
#usage perl rm_fwd_if_2d.pl input_2d.fa input_fwd.fa
my $input1 = shift @ARGV;
my $input2 = shift @ARGV;
my $output = "unique_".$input2;

open INPUT2D, "<$input1";
open INPUTFWD, "<$input2";
open OUTPUT, ">$output";
my @fasta1; my @fasta2;	# input data
while (<INPUT2D>) {
if (m/^>/) {
@_ = split (/_/);
push (@fasta1, $_[0]);
}
}
my $counter = 0;
my $filename = $fasta1[$counter];
while (<INPUTFWD>) {
$fasta2[0] = $_ ; $fasta2[1] = (<INPUTFWD>);
if (index($fasta2[0], $filename) == -1) {
print OUTPUT "$fasta2[0]$fasta2[1]";
}
if (index($fasta2[0], $filename) != -1) {
$counter ++;
$filename = $fasta1[$counter]; #get next from @fasta1
}
}
close INPUT2D;
close INPUTFWD;
close OUTPUT;
exit;
