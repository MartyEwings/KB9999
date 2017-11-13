
# kb9999



#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with kb9999](#setup)
    * [Beginning with kb9999](#beginning-with-kb9999)
3. [Usage - Configuration options and additional functionality](#usage)

## Description

The task in this module solves the issue described in KB#9999 

Resolve a 'PuppetDB: Connection refused' error in Puppet Enterprise 2015.2 to 2017.3.x
You are getting an error in the console because PuppetDB is out of memory. To resolve the error, allocate more Java heap to PuppetDB so that the pe-puppetdbservice has enough memory. Complete the following steps on the PuppetDB node (the master in a monolithic installation).



## Setup


### Beginning with kb9999  

Install this module on the Puppet Master to which the failing puppetdb node reports into, directly, or include it in the control repositry

## Usage


- Run this Task Via the  PE-Console or with Bolt
- The Task takes 2 mandatory parameters Xmx and Xms, they should be whole integers representing memory allocated to heap in mb, under normal circumstances they should be set to the same value
- Run this Task only against Puppetdb Nodes, please note the task will exit and notify you should you run it on any other node type.
- This Task will indicate the status of the execution in both STD out, and will log to /var/log/puppetlabs/KBtask.log

