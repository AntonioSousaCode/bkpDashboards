SET TOKEN=d387hdwejcihjweihd
SET DTHOST=abc12345.live.dynatrace.com

FOR /F "TOKENS=1 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET dd=%%A
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2,3 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET yyyy=%%C
SET DATETODAY=%yyyy%%mm%%dd%

mkdir %DATETODAY%
curl -X GET "https://%DTHOST%/api/config/v1/dashboards" -H  "accept: application/json; charset=utf-8" -H  "Authorization: Api-Token %TOKEN%" > %DATETODAY%\lista_dashboards.tmp

jq -r " .[] |.[]|[.id,.name,.owner] |@tsv " %DATETODAY%\lista_dashboards.tmp > %DATETODAY%\lista_dashboards.csv
del %DATETODAY%\lista_dashboards.tmp

gawk -v token=%TOKEN%  -v dthost=%DTHOST% -v directoriadata=%DATETODAY% -f dashboardsSaaS.awk %DATETODAY%\lista_dashboards.csv