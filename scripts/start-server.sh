#!/bin/bash
echo "---Setting umask to ${UMASK}---"
umask ${UMASK}

#echo "---Sleep zZz---"
#sleep infinity

echo "cd to xlink kai data dir: ${DATA_DIR}."
cd ${DATA_DIR}
echo "WGet XLink Kai archive: ${DL_URI}"
wget -q -nc --show-progress --progress=bar:force:noscroll "${DL_URI}."

echo "Decompress XLink Kai Archive."
tar -xvf kaiEngine*
rm -R kaiEngine*.tar.gz

echo "cd to xlink kai engine dir."
cd kaiEngine*
echo "Move XLink Kai files back to xlink kai data dir."
mv * ${DATA_DIR}
echo "cd to xlink kai data dir: ${DATA_DIR}."
cd ${DATA_DIR}

echo "Remove unused folder kaiEngine-*."
rm -R kaiEngine-*

echo "Run dumb auto retry XLink Kai Script."
./runforever.sh
