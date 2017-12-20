#!/usr/bin/perl
use Encode;
use utf8;

#binmode(STDOUT,":encoding(utf-8)");

for($i=0; $i<5; $i++){
	$j=0;
	$inputfile="C:/Users/sayak/work/datashape/data/test" . $i . ".txt";
	
	open(IN,$inputfile) || die "$!";
	#binmode(IN,":encoding(euc-jp)");
	
	while(<IN>){
		chomp;
		@list = split(/\t/);
		
		if($list[1] =~ /NN|VV|JJ|NP/){
			$words[$i][$j] = "$list[2]\n";
			print $words[$i][$j];
			$j++;
		}
	}
	
	close(IN);
}

for($i=0; $i<5; $i++){
	print $i;
	print "file------------------\n";
	foreach (@words[$i]){
		print "@$_\n";
	}
}
#$text = $meisi[int(rand($i))] . "は" . $meisi[int(rand($i))] . "の上に" . $meisi[int(rand($i))] . "を作らず";


#end
