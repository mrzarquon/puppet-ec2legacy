###ec2legacy facts module

This is a module that returns the flattened facts that were removed from facter in the 3.X release.

##Behavior:
This fact only does anything for Facter 3.x users (and is restricted to do so, in case you have mixed versions in your environment). It takes the ec2\_metadata structured fact and runs it through the previous flatten facts function (also backported in this module) to generate the old fact information. This should be a temporary "until you can get around to updating your tests / manifests to use the structured fact" fix, but in theory this should keep working as is for a long time (this is full self contained and just requires the ec2\_metadata and facterversion facts to continue working).

##Example: In facter 3 we get ec2\_metadata such as:
~~~ javascript
facter -p ec2_metadata
{
  ami-id => "ami-4dbf9e7d",
  ami-launch-index => "0",
...
}
~~~

This fact adds the following:
~~~
ec2_ami_id => ami-4dbf9e7d
ec2_ami_launch_index => 0
~~~

##Compatibility:

This is a ruby fact that is just processing an existing fact (ec2\_metadata) that has been present since the Facter 2.x series. This should in theory work for any version of facter since 2.x and on any platform. It has only been tested on PE 2015.2.0, but should work consistently for anyone who is using the AIO puppet 4 packages since they are shared between PE and Opensource Puppet releases now.
