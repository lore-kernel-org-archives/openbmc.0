Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="QntOLzme"; 
 dkim-atps=neutral
X-Greylist: delayed 766 seconds by postgrey-1.36 at bilbo;
 Wed, 16 May 2018 01:48:34 AEST
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lhmy3PgqzF1gW
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 01:48:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1526399314; x=1557935314;
 h=from:to:subject:date:message-id:mime-version;
 bh=sJXTVelig8UKOJ8OYhFqMvALRD9cwyhju9al48uX0ac=;
 b=QntOLzmeJeLRUnthurlse9LIRTOi8rWBYuNCNbgK1C0DGzwijoM2j4tl
 2Y0Xoym/385sxpSF2mnbzK2LrtSua0UkM8VKKXqFvxH/mL572KFVK99A3
 aYHnLwhtaw0FfIo0K5TRjZi2PSbSXkYbwnx1NiGF4tiwiXTX1yT3Edj70 Y=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FbAADV/fpah2Ka6ERZAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCTQFGgQIOfCgKi26Mc4MIjESGbhSBKTsLJQmEPgKDGSE0GAE?=
 =?us-ascii?q?CAQEBAQEBAgEBAhABAQEKCwkIKCMMgjUiDQRLIQgBAjABAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBBwINNhMCGAEBIgoGOQIGGQQBGQQBARYSIis?=
 =?us-ascii?q?JCQEEARIIgxsCgRtkD60SM4N4AQGET4IiBQWIIIITgQ+GHAQBF4EBZhUJCIUNA?=
 =?us-ascii?q?ogkkBUHAgmFXohjjHmJV4cOgSUcggtwUIJDCYIXDgmDRYUMhRABNW8BjQMEA4E?=
 =?us-ascii?q?ngRgBAQ?=
X-IPAS-Result: =?us-ascii?q?A2FbAADV/fpah2Ka6ERZAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CTQFGgQIOfCgKi26Mc4MIjESGbhSBKTsLJQmEPgKDGSE0GAECAQEBAQEBAgEBA?=
 =?us-ascii?q?hABAQEKCwkIKCMMgjUiDQRLIQgBAjABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBBwINNhMCGAEBIgoGOQIGGQQBGQQBARYSIisJCQEEARIIgxsCg?=
 =?us-ascii?q?RtkD60SM4N4AQGET4IiBQWIIIITgQ+GHAQBF4EBZhUJCIUNAogkkBUHAgmFXoh?=
 =?us-ascii?q?jjHmJV4cOgSUcggtwUIJDCYIXDgmDRYUMhRABNW8BjQMEA4EngRgBAQ?=
Received: from esa4.dell-outbound2.iphmx.com ([68.232.154.98])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2018 10:35:25 -0500
From: <Michael.E.Brown@dell.com>
To: <ed.tanous@intel.com>, <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, 
 <hramasub@in.ibm.com>, <Balaji.B.Rao@dell.com>,
 <bradleyb@fuzziesquirrel.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>, 
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <yupalani@microsoft.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa4.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2018 21:35:14 +0600
X-LoopCount0: from 10.166.132.72
X-IronPort-AV: E=Sophos;i="5.49,403,1520917200"; 
 d="scan'208,217";a="1251476652"
X-DLP: DLP_GlobalPCIDSS
Subject: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group working call
Thread-Topic: Meeting Minutes 5/14 -- RE: OpenBMC Redfish working group
 working call
Thread-Index: AdPsYkRv1Xl4DXIGTxCVOcJsabY0fQ==
Date: Tue, 15 May 2018 15:35:02 +0000
Message-ID: <0af13b580c2e4930a98204349822a82b@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_0af13b580c2e4930a98204349822a82bausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Tue, 15 May 2018 15:48:36 -0000

--_000_0af13b580c2e4930a98204349822a82bausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Meeting minutes for 5/14
-       Pavel presented POC for implementing custom Redfish endpoints and a=
ttributes/properties
o       DBUS based approach where individual processes put custom Redfish i=
nterfaces on dbus and bmcweb notices them and adds them to the tree.

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
When: Monday, May 14, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time (US & C=
anada).
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

--_000_0af13b580c2e4930a98204349822a82bausx13mps334AMERDELLCOM_
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
<div><font color=3D"#1F497D">Meeting minutes for 5/14</font></div>
<ul style=3D"margin:0;padding-left:20.4pt;">
<font color=3D"#1F497D">
<li>Pavel presented POC for implementing custom Redfish endpoints and attri=
butes/properties</li></font>
</ul>
<ul style=3D"margin:0;padding-left:56.4pt;">
<font color=3D"#1F497D">
<li>DBUS based approach where individual processes put custom Redfish inter=
faces on dbus and bmcweb notices them and adds them to the tree.</li></font=
>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">--</font></div>
<div><font color=3D"#1F497D">Michael</font></div>
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

<b>When:</b> Monday, May 14, 2018 2:00 PM-3:00 PM (UTC-08:00) Pacific Time =
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

--_000_0af13b580c2e4930a98204349822a82bausx13mps334AMERDELLCOM_--
