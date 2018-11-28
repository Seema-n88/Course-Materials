#!/bin/bash
source teachnet.path

java -jar $tn_path \
--cp . \
--config echo-config.txt \
--compile

#javac -cp ../teachnet.jar Flooding.java
#java -cp .:../teachnet.jar teachnet/view/TeachnetFrame

# Windows Users use
# java -cp .;..\teachnet.jar teachnet/view/TeachnetFrame
