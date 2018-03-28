<?php
$fp = fopen('file1',"r") or die('no file opened');
$res = array();
while(!feof($fp))
{
        $str = fgets($fp);
        $str= str_replace(PHP_EOL, '', $str);
        $arr = explode(',', $str);
        if(count($arr)>1){
                $arr =  array(
                                'id' => $arr[0],
                                'name' => $arr[1],
                                'url' => $arr[2],
                                );
                $res[] = $arr;
        }
}
fclose($fp);
echo json_encode($res);
echo "\n";
