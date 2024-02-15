LOAD CSV with headers FROM 'https://raw.githubusercontent.com/guruvittal/SupplyChainGraph/main/itemLocation.csv' AS line
match (x:Location {locationKey: line.locationId + ':' + line.locationType})
match (y:Item {itemKey: line.itemGovSystem + ':' + line.itemNumber + ':' + line.itemIndicator + ':' + line.itemChangeLevel})
CREATE (x)-[:MAKES]->(y)
return count(*);
