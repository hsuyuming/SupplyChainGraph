MATCH p=(i:ItemLocation)-[:CONTAINS*1..]->(j:ItemLocation) 
with p, j, i
MATCH (i)-[f:HAS_FORECAST_IN]->(m:Month) 
with p, j, i, m, reduce (forecast = toInteger(f.forecast), r in relationships(p) | toInteger(forecast) * toInteger(r.quantity) * toInteger(r.suppliersplitpercent))  as forecast
merge (j)-[r:HAS_FORECAST_IN]->(m)
set r.forecast = forecast
return j.locationId, j.itemNumber, m.monthKey, r.forecast
