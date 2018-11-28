#!/bin/bash
source teachnet.path

java -jar $tn_path \
--cp . \
--config election-config.txt \
--compile

#javac -cp ../teachnet.jar Election.java
#java -cp .:../teachnet.jar teachnet/view/TeachnetFrame

# Windows Users use
# java -cp .;..\teachnet.jar teachnet/view/TeachnetFrame
