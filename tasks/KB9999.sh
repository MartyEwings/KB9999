#!/bin/bash


xmx="300"
xms="300"

echo " -KB#100 Task started $(date +%s)    --"  >> /var/log/puppetlabs/KbTask.log

if [ -e "/etc/sysconfig/pe-puppetdb" ]
then
 echo "PuppetDb node detected "   >> /var/log/puppetlabs/KbTask.log #Log Line to StdOut for the Console
 echo "PuppetDb node detected "   >> /var/log/puppetlabs/KbTask.log
 puppet resource service puppet ensure=stopped >> /var/log/puppetlabs/KbTask.log
 $(/usr/bin/which sed) -i 's/\(JAVA_ARGS="-Xmx\).*\(m -Xms.*\)/\1'$xmx'\2/g' /etc/sysconfig/pe-puppetdb
 $(/usr/bin/which sed) -i 's/\(-Xms\).*\(m -XX.*\)/\1'$xms'\2/g' /etc/sysconfig/pe-puppetdb
 puppet resource service pe-puppetdb ensure=stopped >> /var/log/puppetlabs/KbTask.log
 puppet resource service pe-puppetdb ensure=running >> /var/log/puppetlabs/KbTask.log

else
  echo  "Not a PuppetDb node exiting "  >> /var/log/puppetlabs/KbTask.log 

fi

echo " -KB#100 Task ended   $(date +%s)    --"  >> /var/log/puppetlabs/KbTask.log
