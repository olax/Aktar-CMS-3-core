

@CLASS
d2s

@auto[]
$ws[
		$.0[]
		$.1[����]
		$.2[���]
		$.3[���]
		$.4[������]
		$.5[����]
		$.6[�����]
		$.7[����]
		$.8[������]
		$.9[������]
		$.10[������]

		$.11[�����������]
		$.12[����������]
		$.13[����������]
		$.14[������������]
		$.15[����������]
		$.16[�����������]
		$.17[����������]
		$.18[������������]
		$.19[������������]
	$.20[	
		$.2[��������]
		$.3[��������]
		$.4[�����]
		$.5[���������]
		$.6[����������]
		$.7[���������]
		$.8[�����������]
		$.9[���������]
	]
	$.100[	
		$.1[���]
		$.2[������]
		$.3[������]
		$.4[���������]
		$.5[�������]
		$.6[��������]
		$.7[�������]
		$.8[���������]
		$.9[���������]
	]
	$.f[
		$.1[���� ������]
		$.2[��� ������]
		$.3[��� ������]
		$.4[������ ������]
		$.5[�����]
	]	
]

@ru[d;m]

$y[^str2[$d;$m]]
$y[^y.match[\n|	][ig]{ }]
$y[^y.match[ +][ig]{ }]
$result[$y]

@str2[d;m][dec]
$d[^d.format[%.2f]]
$d[^d.split[.;lh]]
^str3[$d.0]^if(def $m){ ���. $dec[${d.1}00]^dec.left(2) ���.}

@str3[d]
#1000-999999
^if(^d.length[] > 3){
^str4[^d.left(^d.length[] - 3);f]
}
#0-999
$a[^d.right(3)]
^str4[$a]

@str4[d;f]
^if(^d.length[] == 3){
	$ws.100.[^d.left(1)] 
}
$d[^d.right(2)]
^if($d > 19){
	$ws.20.[^d.left(1)]
	$d[^d.right(1)]
}
$d(^d.int[])$d[$d]
^if(def $f){
	^if($d > 1 && $d < 5){
		$ws.f.$d
	}{
		^if($d == 1){$ws.f.1}{$ws.$d $ws.f.5}
	}
}{
	$ws.$d 
}