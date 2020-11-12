BEGIN {FS="\t"}

	{ 
	  system("md "directoriadata"\\"$3);
	  system("curl -X GET \"https://"dthost"/api/config/v1/dashboards/"$1"\" -H  \"accept: application/json; charset=utf-8\" -H  \"Authorization: Api-Token "token"\" > "directoriadata"/"$3"/"$1".json");

	}