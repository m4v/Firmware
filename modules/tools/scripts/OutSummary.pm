#!/usr/bin/perl

package OutSummary;
use Html;

use strict;
use warnings;

sub new {
   my $class = shift;
   my $self = {
      _outdir => shift,
      _mods => shift
   };
   bless $self, $class;
   return $self;
}

sub genReport
{
   my $self = shift;
   open FILE, ">", $self->{_outdir} . "/index.html";

   print FILE "<html>";
   print FILE "<title>CIAA Firmware Quality Report</title>";
   print FILE "<body>";

   print FILE "<table border='1'>";

   print FILE "<tr><th>Module</th><th>Tested Files</th><th>Test Cases</th><th>Function Coverage</th><th>Line Coverage</th><th>Branch coverage</th></tr>";

   foreach my $mod ($self->{_mods})
   {
      printf FILE "<tr><td>" . $mod->getName() . "</td>" . "</tr>";
   }

   print FILE "</table>";
   print FILE "</body></html>";

   close FILE;

}

1;
