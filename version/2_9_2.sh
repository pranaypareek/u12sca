#!/bin/bash -e

# Install Scala 2.9.2
sudo wget http://www.scala-lang.org/files/archive/scala-2.9.2.tgz
sudo tar xzf scala-2.9.2.tgz -C /usr/local && rm -f scala-2.9.2.tgz
echo 'export SCALA_HOME=/usr/local/scala-2.9.2' >> $HOME/.bashrc
echo 'export PATH=$PATH:$SCALA_HOME/bin' >> $HOME/.bashrc

# Install sbt
sudo wget https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.8/sbt-launch.jar
sudo mv sbt-launch.jar /usr/local/bin/sbt-launch.jar
sudo echo 'SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"' > /usr/local/bin/sbt
sudo echo 'java $SBT_OPTS -jar `dirname $0`/sbt-launch.jar "$@"' >> /usr/local/bin/sbt
sudo chmod +x /usr/local/bin/sbt
printf 'exit\n' | sbt
