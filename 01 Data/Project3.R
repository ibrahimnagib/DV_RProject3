require("jsonlite")
require("RCurl")

# Change the USER and PASS below to be your UTEid
YL <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from youthlit"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_in2422', PASS='orcl_in2422', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

str(YL)
summary(YL)
head(YL)

PG <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from percentGDP"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_in2422', PASS='orcl_in2422', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

str(PG)
summary(PG)
head(PG)

