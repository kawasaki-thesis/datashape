#!/usr/bin/perl
use Encode;
use utf8;

#binmode(STDOUT,":encoding(utf-8)");


open(IN,"himejijo_an.txt") || die "$!";
#binmode(IN,":encoding(euc-jp)");

while(<IN>){
	chomp;
	@list = split(/\t/);
	
	if(@list[1] =^ /NN|VV|JJ|NP/){
		print $list[2] . "\n";
		$meisi[$i] = $list[0];
		$i++;
	}
}

close(IN);

#$text = $meisi[int(rand($i))] . "は" . $meisi[int(rand($i))] . "の上に" . $meisi[int(rand($i))] . "を作らず";


#end
