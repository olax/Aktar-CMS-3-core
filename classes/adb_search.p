
@CLASS
adbsearch


@auto[]
$indexes[^table::load[/my/config/indexes.txt]]

@defquery[query;tab;inst]
$index[^indexes.select($indexes.tab eq $tab)] 
	$anc[^db_fld2showinlist[$tab]]
	$mainTable[^try{$MAIN:seti.table}{$exception.handled(1)}]
$qry[
	SELECT ^sr_out[$tab;$anc] AS name, path, 
	MATCH ($index.com) AGAINST ('$query') AS score
	FROM ^dtp[$tab] WHERE moderated = 'yes' AND MATCH ($index.com) AGAINST ('$query')
	^if($tab eq $mainTable){AND id != '^form:id.int(0)'}
	ORDER BY score DESC LIMIT 6
]
^if(def $indexes.tab){
	$result[^table::sql{
		$qry
	}]
	}{$result[^table::create{}]}
