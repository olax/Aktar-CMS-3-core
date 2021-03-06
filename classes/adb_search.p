
@CLASS
adbsearch


@auto[]
$indexes[^table::load[/my/config/indexes.txt]]

@defquery[query;tab;inst]
$index[^indexes.select($indexes.tab eq $tab)] 
	$mainTable[^try{$MAIN:seti.table}{$exception.handled(1)}]
$qry[
	SELECT ^sr_out_name[$tab], ^if($tab eq users){CONCAT('?action=show&id=',id) AS} path,
	MATCH ($index.com) AGAINST ('$query') AS score
	FROM ^dtp[$tab] WHERE moderated = 'yes' AND MATCH ($index.com) AGAINST ('$query')
	^if($tab eq $mainTable){AND id != '^form:id.int(0)'}
	ORDER BY score DESC LIMIT 6
]

^if(def $indexes.tab){
	^try{
		$result[^table::sql{
			$qry
		}]
	}{^blad[]$result[^table::create{}]}
	}{$result[^table::create{}]}

#^die[MATCH ($index.com) AGAINST ('$query') ^result.count[]]
