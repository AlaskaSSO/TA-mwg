TA-mwg
Mcafee Web Gateway Technology Adapter
provided by:
Myron Davis
State of Alaska


CHANGELOG:
Version 1.9.3
First public release

I have released several versions of these for inclusion into the very nice Mcafee Webgateway App written by Pavel Prostine <splunk@compek.net>, initially basing everything off of his very fine work.



These are a set of MWG extractions that are CIM compliant.  The current release of these rules are more efficient/faster/better space savings than previous versions of the log format.  But you *MUST* install the latest XML files.

This set of extractions additionally works with *ALL* versions of MWG log file formats.  If you have a log format that is slightly different and is not supported; please notify me and I will patch it.

Current release current provides 3 models with the following tags:
#tags = web proxy
#tags = attack malware
#tags = performance memory cpu network


Because I've gone through many different iterations in fine-tuning the log entries generated by MWG I had to support all versions.  If you notice something strange in the props.conf or transforms.conf that doesn't correspond to the current log formats that are generated it is likely due to trying to have backwards compatibility with all previous versions of the MWGaccess3 log format.

If you have a sourcetype already in your system which does not have the name MWGaccess3;  in order for this TA to support it just add into your local props.conf the following:

[custommwgsourcetype]
rename=MWGaccess3


TA-mwg should be installed index side and if run through a syslog server on index side to take advantage of the date clipper.

Please feel free to submit logs or things that don't work and I'll fix them.

A total of *4* XML files need to be imported into various parts of MWG.

TA-mwg-1.9.3-ErrorHandlerUpdateVersions.xml
This file needs to be imported into the TOP of the ErrorHandler portion of MWG.
Policy -> Error Handler
Click Default
Add Ruleset from Library -> Import from File
Choose TA-mwg-1.9.3-ErrorHandlerUpdateVersions.xml
Then ADD

TA-mwg-1.9.3-ErrorHandler.xml
This file needs to be imported into the BOTTOM but BEFORE any "Block all errors" rules in the ErrorHandler portion of MWG.
Policy -> Error Handler
Click Default
Add Ruleset from Library -> Import from File
Then ADD

TA-mwg-1.9.3-Fill_URL_Destination_IP.xml
This file needs to be imported into the TOP of your rulesets portion of MWG
Policy -> Rulesets
Add Ruleset from Library -> Import from file
choose TA-mwg-1.9.3-Fill_URL_Destination_IP.xml
Then ADD

TA-mwg-1.9.3-LogHandler.xml
This file needs to be imported into your Log Handler portion of MWG
Policy -> Loghandler
Add LogHandler
Name MWGaccess (press OK)
then click on it and add Ruleset from Library
choose TA-mwg-1.9.3-LogHandler.xml
Then ADD


-Myron
myron.davis@alaska.gov
907-465-5794
