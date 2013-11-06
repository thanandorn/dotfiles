#!/usr/bin/perl

use MIME::Base64;

my $commands = $ARGV[0];

if ($commands) 
{
  printf ("%s", encode_base64(eval "\"$ARGV[0]\""));
}
