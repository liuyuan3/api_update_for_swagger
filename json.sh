#cat my.sh
# !/bin/bash

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
				#echo $dir_or_file
				$(cp $dir_or_file /swagger/public)
				fileName=$(echo $file |awk -F '/' '{print $NF}')
				echo "test"${count}","${fileName}",/static/"${fileName} >>/home/admin/jsonG/file1
				count=$(expr $count + 1)
			fi
		fi
    done
}

echo "update begin"
git pull origin v1.0.0
echo "git pull Done"

rm -rf /swagger/public/*.json
rm -rf /home/admin/jsonG/file1
rm -rf /swagger/public/urlData.json

count=0

root_dir="/usr/local/code/engine-public-apis"
getdir $root_dir

cd /home/admin/jsonG
php test.php file1 >>/swagger/public/urlData.json