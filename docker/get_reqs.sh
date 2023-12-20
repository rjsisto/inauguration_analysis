#!/bin/bash
#this script is called by the makefile and writes all of the packages versions and R/python versions to a specified file

#$1 = file name, $2 = jupyter container name, $3 = rstudio container name
Log()
{
echo "---" >> $1
date >> $1
echo >> $1
echo "Jupyter Docker Container" >> $1
docker exec -t $2 python3 --version >> $1
docker exec -t $2 pip freeze >> $1
echo >> $1
echo "R-Studio Docker Container" >> $1
docker exec -t $3 R --version | head -n 1 >> $1
docker exec -t $3 Rscript -e "installed.packages()" >> $1
}
Log $1 $2 $3