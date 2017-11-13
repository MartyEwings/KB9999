#!/bin/bash



echo " -KB#9999 Task started $(date +%s)    --"  >> /var/log/puppetlabs/KbTask.log

if [ -e "/etc/sysconfig/pe-puppetdb" ] # Test to see if it is appropriate to run this task on this node
then
 echo "PuppetDb node detected "   >> /var/log/puppetlabs/KbTask.log #Log Line to StdOut for the Console
 echo "PuppetDb node detected "   >> /var/log/puppetlabs/KbTask.log # Log Line for persistant log fike
 puppet resource service puppet ensure=stopped >> /var/log/puppetlabs/KbTask.log
 $(/usr/bin/which sed) -i 's/\(JAVA_ARGS="-Xmx\).*\(m -Xms.*\)/\1'$PT_Xmx'\2/g' /etc/sysconfig/pe-puppetdb
 $(/usr/bin/which sed) -i 's/\(-Xms\).*\(m -XX.*\)/\1'$PT_Xms'\2/g' /etc/sysconfig/pe-puppetdb
 puppet resource service pe-puppetdb ensure=stopped >> /var/log/puppetlabs/KbTask.log
 puppet resource service pe-puppetdb ensure=running >> /var/log/puppetlabs/KbTask.log

else
  echo  "Not a PuppetDb node exiting "	
  echo  "Not a PuppetDb node exiting "  >> /var/log/puppetlabs/KbTask.log 

fi
echo " -KB#9999 Task ended   $(date +%s)    --"  
echo " -KB#9999 Task ended   $(date +%s)    --"  >> /var/log/puppetlabs/KbTask.log
