#!/bin/bash

if [ "x$(ls)" != "x" ]; then
	echo "${PWD} not empty, please clear and try again"
	exit 1
fi

git clone https://github.com/pkemb/oneindex.git
if [ $? != 0 ]; then
	echo "clone fail, please try again"
	rm -rf oneindex
	exit 1
fi

mv oneindex/* .
mkdir -p config cache
rm -rf oneindex create_oneindex_site.sh .git

user=$(ls -ld . | awk '{print $3}')
group=$(ls -ld . | awk '{print $4}')
chown $user:$group config cache * -R
echo "oneindex source code is deployed"
