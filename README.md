ec2legacy facts module

This is a module that returns the flattened facts that were deprecated from code facter in the 3.X release.

Behavior:
This fact only does anything for Facter 3.x users (and is restricted to do so, in case you have mixed versions in your environment). It takes the ec2\_metadata structured fact and runs it through the previous flatten facts function (also backported in this module) to generate the old fact information. This should be a temporary "until you can get around to updating your tests / manifests to use the structured fact" fix, but in theory this should keep working as is for a long time (this is full self contained and just requires the ec2\_metadata and facterversion facts to continue working).

Example: In facter 3 we get ec2\_metadata such as:
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
