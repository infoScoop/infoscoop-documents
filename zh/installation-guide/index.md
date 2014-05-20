This document may contain untranslated or unedited parts.  
[Your cooperation](../../README.md) would be greatly appreciated!

# Installation Guide

To install infoScoop OpenSource, there are two ways; one is installing by
QuickStart, another is installing in normal way.

## Installation Using QuickStart

QuickStart is a module in which Tomcat is bundled with infoScoop OpenSource so
that users can quickly start using. It customized specifically for MySQL and the dump file is available, which
enables a database to be easily created. Basically, using QuickStart is recommended to install infoScoop OpenSource.

  * [QuickStart Setup]
This document explains how to install infoScoop OpenSource using QuickStart.

## Basic Installation

Unlike QuickStart above, the normal installation module choose neither a
specific web application server nor a database.

This way is for those who prefer to use the other web application servers and
databases except for Tomcat and MySQL.
Installation guides for Ubuntu and CentOS provides detailed steps in tutorial
approach.
These documents will also be a help when installing on the other environments
like Windows. Please Refer to them when needed.

  * [安装概要][Installation Summary]
这个文档解说关于安装infoScoop OpenSource的概要。 


  * [Installation Guide for Ubuntu]
This document explains how to install infoScoop OpenSource in Ubuntu.  


  * [Installation Guide for CentOS]
This document explains how to install infoScoop OpenSource in CentOS  


  * [Web应用程序模块的自定义][Customizing Web Application Module]
infoScoop OpenSource 的服务器模块作为 J2EE Web应用服务器上运行的Web应用程序被提供。
这里，下载的压缩里面包含的infoscoop.war部署到Web应用服务器上前，包含和根据环境设定的Web应用程序模块的再创建手续进行一下说明。


[QuickStart Setup]: quickstart-setup.md
[Installation Summary]: installation-summary.md "安装概要"
[Installation Guide for Ubuntu]: installation-guide-for-ubuntu.md
[Installation Guide for CentOS]: installation-guide-for-centos.md
[Customizing Web Application Module]: customizing-web-application-module.md "Web应用程序模块的自定义"
