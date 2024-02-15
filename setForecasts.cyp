LOAD CSV with headers FROM 'https://raw.githubusercontent.com/guruvittal/SupplyChainGraph/main/forecasts.csv' AS line
match (productLocation:ItemLocation {itemLocationKey: line.locationId + ':' + line.locationType + ':' + line.itemGovSystem + ':' + line.itemNumber + ':' + line.itemIndicator + ':' + line.itemChangeLevel})
merge (m:Month{monthKey:line.month})
merge (productLocation)-[r:HAS_FORECAST_IN]->(m)
set r.forecast = line.forecast
return count(*);
