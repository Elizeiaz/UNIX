make
cd target 2> /dev/null || mkdir target && cd target 2> /dev/null
echo "" > lock_file 
rm lock_file.lck 2> /dev/null
for f in stats_*; do
    if [[ -f "$f" ]]; then
        rm $f
    fi
done

pids=()

echo "starting program, wait 5 minutes"

function lockfile {
    success=0
    failed=0
    while true;
do
    ../main.out -s 1 lock_file > /dev/null
    if [ $? = 0 ]; then
        (( success = success + 1 ))
    else
        (( failed = failed + 1 ))
    fi
    echo "T-${1} S-${success} F-${failed}" > stats_${1}
done
}
for j in {1..10}; do
    lockfile $j &
    pids+=($!)
done
sleep 300
for jj in ${pids[@]}; do
    kill $jj
done

for f in stats_*; do
    if [[ -f "$f" ]]; then
        cat $f >> stats
        rm $f
    fi
    
done
