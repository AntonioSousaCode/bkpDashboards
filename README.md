# bkpDashboards

bkpDashboards is a DOS program that backups the configuration of Dynatrace dashboards into a directory structure in Windows.
This might be useful for Windows users who lack access to a Linux machine.

For this to work, you need to have access to curl, jq & awk:
    curl: Needed to make API calls to Dynatrace
      https://curl.se/windows/
    jq: Needed for JSON parsing
      https://stedolan.github.io/jq/
    gawk: Generic parsing
      http://gnuwin32.sourceforge.net/packages/gawk.htm

There are two files. The first is bkpDashboards.bat, and this is all you need to configure and execute. What you need to know:
    You need to configure the API token for Dynatrace (and have the addequate permissions), and the host name of your environment
    It creates a durectory with the current date. You might have to check this in your system, as dates might be rendered different in your system. In mine, it creates a directory with name YYYYMMDD
    Calls Dynatrace to get a list of available Dashboards
    List of Dashboards is converted to a CSV file inside directory
    GAWK is invoked, processing the list, and creating a subdirectory for each user with a dashboard, with a JSON file for each dashboard inside
