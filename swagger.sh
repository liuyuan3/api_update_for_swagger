#cat swagger.sh
# !/bin/bash
echo "update begin"
git pull origin master
echo "git pull Done"

function getdir(){
    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
            getdir $dir_or_file
        else
			file=$dir_or_file
			if [ "${file##*.}"x = "json"x ]
			then
				echo $dir_or_file
				$(cp $dir_or_file /swagger/public)
			fi
		fi
    done
}

rm -rf /swagger/public/*.json


root_dir="/usr/local/code/engine-public-apis"
getdir $root_dir