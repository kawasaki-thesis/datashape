#!/usr/bin/perl
use Encode;
use utf8;

#binmode(STDOUT,":encoding(utf-8)");

$fnum=5;
for($i=0; $i<$fnum; $i++){
	$j=0;
	$inputfile="C:/Users/sayak/work/datashape/data/test" . $i . ".txt";
	
	open(IN,$inputfile) || die "$!";
	#binmode(IN,":encoding(euc-jp)");
	
	while(<IN>){
		chomp;
		@list = split(/\t/);
		
		if($list[1] =~ /NN|VV|JJ|NP/){
			$words[$i][$j] = $list[2];
			$j++;
		}
	}
	
	close(IN);
}



foreach (@words){
	print "(" . join(",", @{$_}) . ")\n";
	#jをカンマで横に並べてi行表示
}

#end
