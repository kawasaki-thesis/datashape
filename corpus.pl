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

for($i=0; $i<$fnum; $i++){
	for($j=0; $j<=$#{$words[$i]}; $j++){
		$flag=0;
		foreach(@corpus){
			if(@{$_}[0] eq $words[$i][$j]){
				$flag=1;
				$corpus[@{$_}[i]][($i+1)]++;
				break;
			}
		}
		if($flag==0){
			#$str='\'' . $words[$i][$j] . '\'';
			$str=$words[$i][$j];
			push(@corpus, [$str,0,0,0,0,0,0,0,0,0,0]);
			$corpus[$#corpus][($i+1)]++;
		}
	}
}

foreach (@corpus){
	print "(" . join(", ", @{$_}) . ")\n";
	#jをカンマで横に並べてi行表示
}

#end
