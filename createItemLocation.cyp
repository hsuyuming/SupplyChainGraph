
LOAD CSV with headers FROM 'https://raw.githubusercontent.com/guruvittal/SupplyChainGraph/main/itemLocation.csv' AS line
CREATE (:ItemLocation {itemLocationKey:line.locationId + ':' + line.locationType + ':' + line.itemGovSystem + ':' + line.itemNumber + ':' + line.itemIndicator + ':' + line.itemChangeLevel, locationId: line.locationId, locationType: line.locationType, itemLocationDescription: line.itemLocationDescription, itemGovSystem:line.itemGovSystem, itemNumber: line.itemNumber, itemIndicator: line.itemIndicator, itemChangeLevel:line.itemChangeLevel})
