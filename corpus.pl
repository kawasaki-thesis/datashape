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

$wordnum=0;
for($i=0; $i<$fnum; $i++){
	for($j=0; $j<=$#{$words[$i]}; $j++){
		$corpus[$wordnum][0]= '\'' . $words[$i][$j] . '\'';
		for($k=1; $k<=$fnum; $k++){
			$corpus[$wordnum][$k]=0;
		}
		$corpus[$wordnum][($i+1)]++;
		$wordnum++;
	}
}

foreach (@corpus){
	print "(" . join(", ", @{$_}) . ")\n";
	#jをカンマで横に並べてi行表示
}

#end
