make
cd target || mkdir target && cd target 2> /dev/null
echo "start generating sparse file (~5sec)"
../sparse_creator.out
../main.out fileA fileB
gzip -kf fileA fileB
gzip -ckfd fileB.gz | ../main.out fileC
../main.out -b 100 fileA fileD
stat fileA fileA.gz fileB fileB.gz fileC fileD
