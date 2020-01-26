#!/bin/bash
echo "---Setting umask to ${UMASK}---"
umask ${UMASK}

#echo "---Sleep zZz---"
#sleep infinity

echo "cd to xlink kai data dir: ${DATA_DIR}."
cd ${DATA_DIR}

echo "Move xlink kai archive from /tmp"
mv /tmp/kaiEngine*.tar.gz /xlinkkaievolution/

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

echo "Set Permission and executable bit on scripts."
chmod -R 770 kaiengine
chown -R xlinkkai kaiengine
chmod -R 770 runforever.sh
chown -R xlinkkai runforever.sh

echo "Run dumb auto retry XLink Kai Script."
sudo ./runforever.sh
