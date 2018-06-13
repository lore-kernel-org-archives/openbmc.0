Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="ow2glknH"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 415GD970dszDrnp
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 15:54:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1528869274; x=1560405274;
 h=from:to:subject:date:message-id:mime-version;
 bh=CN44sr8nSr7i9SwZxPa0GcAtmVCoyH/vc7PFSS3zglk=;
 b=ow2glknHXwlhoEEV+HpQawkchiGNe/+ExQHPCzUbKN1fQMItKzKRVghP
 t1H5Rny2IflTjodwAZiDJm/dXuOwJaJrD82xxvybs2VvtsU53nuo8UaIU
 zEmRxlcpWpcqN+EfpjOdH95xxllmDC88qZKo9oJmfslnQOnFxmXZNboRn o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F9AgA0sCBbmGOa6ERZAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCTgGBSA5/KAqLc4xpgSaOR4Z4FIEpOwsnB4ECgzwCgjUhNBg?=
 =?us-ascii?q?BAgEBAQEBAQIBAQIQAQEBAQEICwsGKSMMgjUMIwRLIQgBAi8BAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQcCDSYQEwIYAQEiCgY5AgYZBAEZAQM?=
 =?us-ascii?q?BARYSIisDBgkBBAESCIMaAoEbZA+udzODeQEBhEuBYwUFiEOCE4EPhgYXAQIBA?=
 =?us-ascii?q?ReBAWYLCgkIhQ8CiDuQTAcCCYEwhDuIfo05igmENAGCfIFBgVkeDAhwUIIzAQ8?=
 =?us-ascii?q?JghgOCYNFhQyEbCQBNW8BjT4EA4EngRoBAQ?=
X-IPAS-Result: =?us-ascii?q?A2F9AgA0sCBbmGOa6ERZAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CTgGBSA5/KAqLc4xpgSaOR4Z4FIEpOwsnB4ECgzwCgjUhNBgBAgEBAQEBAQIBA?=
 =?us-ascii?q?QIQAQEBAQEICwsGKSMMgjUMIwRLIQgBAi8BAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBAQcCDSYQEwIYAQEiCgY5AgYZBAEZAQMBARYSIisDBgkBB?=
 =?us-ascii?q?AESCIMaAoEbZA+udzODeQEBhEuBYwUFiEOCE4EPhgYXAQIBAReBAWYLCgkIhQ8?=
 =?us-ascii?q?CiDuQTAcCCYEwhDuIfo05igmENAGCfIFBgVkeDAhwUIIzAQ8JghgOCYNFhQyEb?=
 =?us-ascii?q?CQBNW8BjT4EA4EngRoBAQ?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2018 00:54:28 -0500
From: <Michael.E.Brown@dell.com>
To: <ed.tanous@intel.com>, <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, 
 <hramasub@in.ibm.com>, <Balaji.B.Rao@dell.com>,
 <bradleyb@fuzziesquirrel.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>, 
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <yupalani@microsoft.com>
Received: from ausxipps306.us.dell.com ([143.166.148.156])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2018 11:54:26 +0600
X-LoopCount0: from 10.166.135.95
X-IronPort-AV: E=Sophos;i="5.51,217,1526360400"; 
 d="scan'208,217";a="210649227"
X-DLP: DLP_GlobalPCIDSS
Subject: Meeting minutes 6/11/2018 - RE: OpenBMC Redfish working group working
 call
Thread-Topic: Meeting minutes 6/11/2018 - RE: OpenBMC Redfish working group
 working call
Thread-Index: AdQBy77AXQlZXWERQ/+/fzzm02/NCQ==
Date: Wed, 13 Jun 2018 05:54:25 +0000
Message-ID: <31b1b1a26ba541b6925d79cce7229a2d@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_31b1b1a26ba541b6925d79cce7229a2dausx13mps334AMERDELLCOM_"
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jun 2018 05:54:35 -0000

--_000_31b1b1a26ba541b6925d79cce7229a2dausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bmcweb:
-       Inventing new dbus daemons with interfaces to get stuff that were n=
ot previously available (smbios info, host uuid, bmc uuid, among other thin=
gs.)
-       Smbios parser to get host bios "smbios" inventory information out o=
f the host and present using standard redfish schema
-       Smbios Daemon that attaches to dbus and hosts two interfaces:
o       Binary smbios interface that IPMI uses
o       High level objects
o       Uses "managed data region" MDR 1 & 2 - smbios
o       Targeting next rack scale design spec:  (next version of this spec:=
 https://www.intel.com/content/www/us/en/architecture-and-technology/rack-s=
cale-design/rack-scale-design-resources.html )
*       Targeting Openbmc as a node manager, pod manager, or psme (pooled s=
ystem management engine)
-       Pavel still working on out of process api for presenting redfish re=
sources: (review link: https://gerrit.openbmc-project.xyz/#/c/10813/ ) Any =
other comments would be greatly appreciated.

Go-redfish status:
-       Working with IBM to forward port the openbmc support that was prese=
nt to again work on master.

--
Michael


-----Original Appointment-----
From: Tanous, Ed [mailto:ed.tanous@intel.com]
Sent: Monday, April 16, 2018 12:40 PM
To: Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Hariharas=
ubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop; pradeep.kumar36@tcs=
.com; rolfb@us.ibm.com; Chris.Ong@microsoft.com; alirhas@microsoft.com; yup=
alani@microsoft.com
Subject: OpenBMC Redfish working group working call
When: Monday, June 11, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time (US & =
Canada).
Where: Skype Meeting



Due to the problems with Blue Jeans we had last week, and the fact that we =
don't seem to use the video conference feature, lets switch back to Skype. =
 Unfortunately, BlueJeans doesn't give an easy way to send out cancelations=
, and my account is in a state of flux,

Description:
Per meeting decision, this meeting invite is for the "OpenBMC Redfish worki=
ng group". This
working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing
list. The working group is open to anybody who would like to participate in=
 development of
Redfish on OpenBMC.


Base agenda:

Call for opens
Presentation of frameworks
Discussion of Redfish on OpenBMC




...........................................................................=
..............................................................
--> Join Skype Meeting<https://meet.intel.com/ed.tanous/SQH2DRH7>
Trouble Joining? Try Skype Web App<https://meet.intel.com/ed.tanous/SQH2DRH=
7?sl=3D1>

Join by phone
+1(916)356-2663 (or your local bridge access #) Choose bridge 5.<tel:+1(916=
)356-2663%20(or%20your%20local%20bridge%20access%20#)%20Choose%20bridge%205=
.> (Global)                English (United States)
Find a local number<https://dial.intel.com>

Conference ID: 205576574
Forgot your dial-in PIN?<https://dial.intel.com> |Help<https://o15.officere=
dir.microsoft.com/r/rlidLync15?clid=3D1033&p1=3D5&p2=3D2009>

[!OC([1033])!]
...........................................................................=
..............................................................

--_000_31b1b1a26ba541b6925d79cce7229a2dausx13mps334AMERDELLCOM_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div><font color=3D"#1F497D">Bmcweb:</font></div>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Inventing new dbus daemons with interfaces to get stuff that were not p=
reviously available (smbios info, host uuid, bmc uuid, among other things.)=
</li><li>Smbios parser to get host bios &#8220;smbios&#8221; inventory info=
rmation out of the host and present using standard redfish schema</li><li>S=
mbios Daemon that attaches to dbus and hosts two interfaces:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>Binary smbios interface that IPMI uses</li><li>High level objects</li><=
li>Uses &#8220;managed data region&#8221; MDR 1 &amp; 2 &#8211; smbios</li>=
<li style=3D"margin-top:2pt;margin-bottom:2pt;">Targeting next rack scale d=
esign spec:  (next version of this spec: <font face=3D"Segoe UI" size=3D"2"=
 color=3D"black"><span style=3D"font-size:10pt;"><a href=3D"https://www.int=
el.com/content/www/us/en/architecture-and-technology/rack-scale-design/rack=
-scale-design-resources.html">https://www.intel.com/content/www/us/en/archi=
tecture-and-technology/rack-scale-design/rack-scale-design-resources.html</=
a>
</span></font><font color=3D"black">)</font></li></font>
</ul>
<ul style=3D"margin:0;padding-left:126pt;">
<font color=3D"#1F497D">
<li style=3D"margin-top:2pt;margin-bottom:2pt;">Targeting Openbmc as a node=
 manager, pod manager, or psme (pooled system management engine)</li></font=
>
</ul>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Pavel still working on out of process api for presenting redfish resour=
ces: (review link: <font face=3D"Segoe UI" size=3D"2" color=3D"black"><span=
 style=3D"font-size:10pt;"><a href=3D"https://gerrit.openbmc-project.xyz/#/=
c/10813/">https://gerrit.openbmc-project.xyz/#/c/10813/</a>
</span></font>) Any other comments would be greatly appreciated.</li></font=
>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">Go-redfish status:</font></div>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Working with IBM to forward port the openbmc support that was present t=
o again work on master.</li></font>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">--</font></div>
<div><font color=3D"#1F497D">Michael</font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<a name=3D"_MailEndCompose"></a>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div>-----Original Appointment-----<br>

<b>From:</b> Tanous, Ed [<a href=3D"mailto:ed.tanous@intel.com">mailto:ed.t=
anous@intel.com</a>]
<br>

<b>Sent:</b> Monday, April 16, 2018 12:40 PM<br>

<b>To:</b> Tanous, Ed; OpenBMC Maillist; Brown, Michael E; Vancil, Paul; Ha=
riharasubramanian Ramasubramanian; Rao, Balaji B; Brad Bishop; pradeep.kuma=
r36@tcs.com; rolfb@us.ibm.com; Chris.Ong@microsoft.com; alirhas@microsoft.c=
om; yupalani@microsoft.com<br>

<b>Subject:</b> OpenBMC Redfish working group working call<br>

<b>When:</b> Monday, June 11, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time=
 (US &amp; Canada).<br>

<b>Where:</b> Skype Meeting</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<a name=3D"BM_BEGIN"></a><a name=3D"BM__InsertRtfSavedPosition"></a><a name=
=3D"_InsertRtfSavedPosition"></a>
<div><font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12p=
t;">&nbsp;</span></font></div>
<div>Due to the problems with Blue Jeans we had last week, and the fact tha=
t we don&#8217;t seem to use the video conference feature, lets switch back=
 to Skype.&nbsp; Unfortunately, BlueJeans doesn&#8217;t give an easy way to=
 send out cancelations, and my account is in a state
of flux, <br>

</div>
<div>Description:<br>

Per meeting decision, this meeting invite is for the &#8220;OpenBMC Redfish=
 working group&#8221;. This<br>

working group will meet every Monday at 4pm CST and publish meeting minutes=
 to the mailing<br>

list. The working group is open to anybody who would like to participate in=
 development of<br>

Redfish on OpenBMC.<br>

&nbsp;</div>
<div><br>

Base agenda:</div>
<div>&nbsp;</div>
<div>Call for opens</div>
<div>Presentation of frameworks</div>
<div>Discussion of Redfish on OpenBMC<br>

</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div><font size=3D"1" color=3D"#404040"><span style=3D"font-size:8pt;">....=
...........................................................................=
..........................................................</span></font></d=
iv>
<a name=3D"OutJoinLink"></a>
<div><font size=3D"4" color=3D"#0066CC"><span style=3D"font-size:14pt;"><fo=
nt face=3D"Wingdings">&agrave;</font> <a href=3D"https://meet.intel.com/ed.=
tanous/SQH2DRH7"><font size=3D"4" color=3D"blue"><span style=3D"font-size:1=
6pt;"><u>Join Skype Meeting</u></span></font></a><font color=3D"black">&nbs=
p;
</font><a name=3D"OutSharedNoteBorder"></a>&nbsp;&nbsp; <a name=3D"OutShare=
dNoteLink"></a></span></font></div>
<div style=3D"margin-top:3pt;"><font size=3D"2"><span style=3D"font-size:10=
pt;">Trouble Joining? <a href=3D"https://meet.intel.com/ed.tanous/SQH2DRH7?=
sl=3D1"><font color=3D"#0066CC"><u>Try Skype Web App</u></font></a><u> </u>=
</span></font></div>
<div style=3D"margin-top:12pt;"><font size=3D"3"><span style=3D"font-size:1=
3pt;">Join by phone</span></font></div>
<div><a href=3D"tel:&#43;1(916)356-2663 (or your local bridge access #) Cho=
ose bridge 5."><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:=
10pt;"><u>&#43;1(916)356-2663 (or your local bridge access #) Choose bridge=
 5.</u></span></font></a><font size=3D"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; English (United States) </span></font></div>
<div style=3D"margin-top:2pt;"><a href=3D"https://dial.intel.com"><font siz=
e=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Find a local n=
umber</u></span></font></a> </div>
<div style=3D"margin-top:2pt;">&nbsp;</div>
<div style=3D"margin-top:2pt;"><font size=3D"2"><span style=3D"font-size:10=
pt;">Conference ID: 205576574</span></font></div>
<div style=3D"margin-top:2pt;"><a href=3D"https://dial.intel.com"><font siz=
e=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Forgot your di=
al-in PIN?</u></span></font></a><font size=3D"1"><span style=3D"font-size:3=
pt;"> </span></font>|<a href=3D"https://o15.officeredir.microsoft.com/r/rli=
dLync15?clid=3D1033&amp;p1=3D5&amp;p2=3D2009"><font size=3D"2" color=3D"#00=
66CC"><span style=3D"font-size:10pt;"><u>Help</u></span></font></a><font si=
ze=3D"1"><span style=3D"font-size:3pt;">&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></div>
<div>&nbsp;</div>
<div><font size=3D"3" color=3D"#CFCFCF"><span style=3D"font-size:12pt;"><fo=
nt size=3D"1"><span style=3D"font-size:8pt;"><sub>[!OC([1033])!]</sub></spa=
n></font></span></font></div>
<div><font size=3D"1" color=3D"#404040"><span style=3D"font-size:8pt;">....=
...........................................................................=
..........................................................</span></font></d=
iv>
<div style=3D"margin-top:10pt;">&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_31b1b1a26ba541b6925d79cce7229a2dausx13mps334AMERDELLCOM_--
