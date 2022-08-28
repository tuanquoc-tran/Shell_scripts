#!/bin/csh -f
#Note: This program run on Linux
#Function: Get log and generate report
#How_to_run: Gen_Report_CSV.csh 
#Location: Put the same log directory after run test case
#Author: QuocTuan
#Version: 0.1 First created

#=================Input_seting===============#
setenv current_dir `pwd`

#=================Clear===============#
set user_name = `whoami`

# Remove old file, direction
echo "============Delete old results============"
rm -rfv list_module
rm -rfv result

# Add direction
mkdir result
ls | egrep log_K-BSP.... > list_module

# Start 
echo "============Start generating reports============"

foreach dir (`cat list_module | egrep -v "^#"`)
	set module = `echo $dir | sed -e 's/log_K-BSP//g' -e 's/_v.*//g' -e 's/.*_//g'`
	echo "Count","Test name", "Result",>> result/${module}.csv
	
	set i = 0
	set total_line = `cat $dir | wc -l`
	foreach line (`cat $dir | sed -e 's/\[//'` )
		set testname = `echo $line| egrep '^K-BSP*'`
		set result = `echo $line| egrep '^test_result:' | awk -F':' '{print $2}' | awk -F']' '{print $1}'`
		set end = `echo $line| egrep '^test_exit' | awk -F']' '{print $1}'`
		
		#echo $testname
		if ("$end" == "test_exit") then
			set i = `expr $i + 1`
			echo "$i","$tmp1","$tmp2" >> result/${module}.csv
		else
			if ("$testname" =~ "K-BSP"*) then
				set tmp1 = $testname
			endif
			if ("$result" == "OK" | "$result" == "NG") then
				set tmp2 = $result
			endif
		endif
	end
	echo "============Done for ${module}============"
end

# Remove tmp
rm -rfv list_module
