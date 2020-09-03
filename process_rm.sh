docker container ls | cut -c 1-12 > process_rm.txt
if [ $(wc -l process_rm.txt | cut -c 1-2) -gt 1 ]
then 
	for ((i=2; i<=$(wc -l process_rm.txt | cut -c 1-2 | sed 's/ //g'); i++))
	do
		NAME=$i
		docker container stop $(sed "$NAME!d" process_rm.txt)
	done
fi
docker ps -a | cut -c 1-12 > process_rm.txt
if [ $(wc -l process_rm.txt | cut -c 1-2) -gt 1 ]
then 
	for ((i=2; i<=$(wc -l process_rm.txt | cut -c 1-2 | sed 's/ //g'); i++))
	do
		NAME=$i
		docker container rm $(sed "$NAME!d" process_rm.txt)
	done
fi
rm process_rm.txt
