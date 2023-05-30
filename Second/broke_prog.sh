make
cd target 2> /dev/null || mkdir target && cd target 2> /dev/null
echo 123 > lock_file 
sleep 1 && rm lock_file.lck &
../main.out -s 5 lock_file 
