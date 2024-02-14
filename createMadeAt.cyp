
LOAD CSV with headers FROM 'https://raw.githubusercontent.com/guruvittal/SupplyChainGraph/main/itemLocation.csv' AS line
match (x:ItemLocation {itemLocationKey: line.locationId + ':' + line.locationType + ':' + line.itemGovSystem + ':' + line.itemNumber + ':' + line.itemIndicator + ':' + line.itemChangeLevel})
match (y:Location {locationKey: line.locationId + ':' + line.locationType })
CREATE (x)-[:MADE_AT]->(y)
return count(*);
