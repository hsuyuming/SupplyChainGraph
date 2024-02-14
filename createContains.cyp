
LOAD CSV with headers FROM 'https://raw.githubusercontent.com/guruvittal/supplychaingraph/main/bom.csv' AS line
match (parent:ItemLocation {itemLocationKey: line.parentLocationId + ':' + line.parentLocationType + ':' + line.parentItemGovSystem + ':' + line.parentItemNumber + ':' + line.parentItemIndicator + ':' + line.parentItemChangeLevel})
match (child:ItemLocation {itemLocationKey: line.childLocationId + ':' + line.childLocationType + ':' + line.childItemGovSystem + ':' + line.childItemNumber + ':' + line.childItemIndicator + ':' + line.childItemChangeLevel})
create (parent)-[r:CONTAINS]->(child)
set r.quantity = line.childQuantity, r.suppliersplitpercent = line.childLocationSplitPercent
return count(*);
