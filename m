Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="vLOumzlJ"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwjSZ2DKNzF1XS
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 03:50:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1520355016; x=1551891016;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Cxg7zaA/9BM1D2Z6EYCdU9HIO1HFDOtik4XT+sovCJ8=;
 b=vLOumzlJJxjj5eiK0Wug1ziy/VjIQK1YOYd0geGd/Iu5sG4OPwAXhOVA
 QT5Qfsk5y0rHxpnDbDFiS/Dyf9ZV51n3zenQFJKvErZgbgKc8G8Yzw4fx
 VX7MRwUpZ6GUzr4/+hW45SSGpprHqCwn3mOuNCUPUezOoD8cS1q2sv+O2 I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FVAABWxZ5ah8qZ6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCWgGBSxBwKAqNbo15gxiNGIccgVNCChgBCoUNgwUhNBgBAgE?=
 =?us-ascii?q?BAQEBAQIBAhABAQEIDQkIKC6COCIRSycDAwEBAQEBAQEBASMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBARgCDUMCGAEBAQUmBjkCBgsSARkEAQEVQicHAgEBAwENBQgThBxkEKp?=
 =?us-ascii?q?gOoQLAQGEWYIhBYUxgi6DPYR0gVsMAgEBARiBRzAmhSYEiAx9kV4JCYZLhX+EI?=
 =?us-ascii?q?o8CiX2HWYEuHoILcE8NCIIuCYI4gTwUATZ3AYsMgRgBAQE?=
X-IPAS-Result: =?us-ascii?q?A2FVAABWxZ5ah8qZ6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CWgGBSxBwKAqNbo15gxiNGIccgVNCChgBCoUNgwUhNBgBAgEBAQEBAQIBAhABA?=
 =?us-ascii?q?QEIDQkIKC6COCIRSycDAwEBAQEBAQEBASMBAQEBAQEBAQEBAQEBAQEBARgCDUM?=
 =?us-ascii?q?CGAEBAQUmBjkCBgsSARkEAQEVQicHAgEBAwENBQgThBxkEKpgOoQLAQGEWYIhB?=
 =?us-ascii?q?YUxgi6DPYR0gVsMAgEBARiBRzAmhSYEiAx9kV4JCYZLhX+EIo8CiX2HWYEuHoI?=
 =?us-ascii?q?LcE8NCIIuCYI4gTwUATZ3AYsMgRgBAQE?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2018 10:50:11 -0600
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Mar 2018 22:49:30 +0600
X-LoopCount0: from 10.166.135.96
X-IronPort-AV: E=Sophos;i="5.47,432,1515477600"; 
 d="scan'208,217";a="1112267464"
X-DLP: DLP_GlobalPCIDSS
CC: <Krishna.Kolakaluri@deltaww.com>
Subject: Meeting Minutes 2018-03-05: OpenBMC Redfish working group working call
Thread-Topic: Meeting Minutes 2018-03-05: OpenBMC Redfish working group
 working call
Thread-Index: AdO0+Twyez0Kak9ARcyoOsP1ovWieg==
Date: Tue, 6 Mar 2018 16:50:14 +0000
Message-ID: <066c20c5825e4a75b4255500da392d14@ausx13mps338.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_066c20c5825e4a75b4255500da392d14ausx13mps338AMERDELLCOM_"
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
X-List-Received-Date: Tue, 06 Mar 2018 16:50:24 -0000

--_000_066c20c5825e4a75b4255500da392d14ausx13mps338AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Meeting Minutes:
-       AMI joined forum: Welcome!
-       Ed code walkthrough for bmcweb
o       Intel's opinion is that openbmc cannot ship a "production" web stac=
k running python. Web services need to be running with a compiled language.
o       Intel has systems targeting 1000 sensors. Feeling is that python ca=
nnot be scaled this high with performance on the targeted OBMC hardware
o       Overview:
*       Basically not going to go over everything Ed presented in his overv=
iew, but I will note some highlights
*       Bmcweb is mostly meant to be single-threaded, but easily scales up =
to other threads
*       Currently most data is fetched on request, set up will support doin=
g async background fetches, but that's just not how it currently runs.
-       Side notes:
o       AMI has a LUA (luajit) implementation for redfish
o       AMI would like to present their solution
o

Attendees:
Pawel Rapkeiwicz, Chris Ong, Yugi Mani - Microsoft
        Ed Tanous - Intel
        Chandrasekhar - AMI
Balaji Rao, Paul Vancil,  Michael Brown - Dell Inc
Jay Carman - IBM
Rolf Brudeseth - IBM

-----Original Appointment-----
From: Brown, Michael E
Sent: Monday, February 26, 2018 3:31 PM
To: Brown, Michael E; openbmc@lists.ozlabs.org; Vancil, Paul; hramasub@in.i=
bm.com; Rao, Balaji B; bradleyb@fuzziesquirrel.com; jwcarman@us.ibm.com; pr=
adeep.kumar36@tcs.com; rolfb@us.ibm.com; Chris Ong; Ali Larijani; Tanous, E=
d; Yugi Mani
Cc: Krishna Kolakaluri
Subject: OpenBMC Redfish working group working call
When: Monday, March 5, 2018 4:00 PM-5:00 PM (UTC-06:00) Central Time (US & =
Canada).
Where: Skype Meeting


Per meeting decision, this meeting invite is for the "OpenBMC Redfish worki=
ng group". This working group will meet every Monday at 4pm CST and publish=
 meeting minutes to the mailing list. The working group is open to anybody =
who would like to participate in development of Redfish on OpenBMC.

Upcoming Meeting Agenda
        2018-03-05: Ed Tanous (Intel) to go over 'bmcweb' requirements and =
implementation. Depending on time, Michael Brown (Dell) to start going over=
 go-redfish requirements and implementation.
        2018-03-12: Michael Brown (Dell) on vacation. (May need some altern=
ative host for this meeting depending on if I can dial in from Iceland).
        2018-03-19: Paul Vancil to discuss python implementation
        2018-03-26: open

Past meetings:
        Meeting Minutes 2018-02-26: https://lists.ozlabs.org/pipermail/open=
bmc/2018-February/010955.html

...........................................................................=
..............................................................
--> Join Skype Meeting<https://meet.dell.com/michael_e_brown/JFFHZN1F>
  Trouble Joining? Try Skype Web App<https://meet.dell.com/michael_e_brown/=
JFFHZN1F?sl=3D1>
Join by phone
Internal:724-2663<tel:Internal:724-2663> (Global)               English (Un=
ited States)
United States, Austin: +1-512-724-2663<tel:United%20States,%20Austin:%20+1-=
512-724-2663> (Global)               English (United States)
United States, Toll Free: +1-877-491-9738<tel:United%20States,%20Toll%20Fre=
e:%20+1-877-491-9738> (Global)               English (United States)
India, Reliance:1800-30-109045<tel:India,%20Reliance:1800-30-109045> (Globa=
l)           English (United States)
India, BSNL:1800-425-5101<tel:India,%20BSNL:1800-425-5101> (Global)        =
     English (United States)
Ireland, Dublin: +353-1-2794062<tel:Ireland,%20Dublin:%20+353-1-2794062> (G=
lobal)               English (United Kingdom)
England, Bracknell: +44-1344-372040<tel:England,%20Bracknell:%20+44-1344-37=
2040> (Global)               English (United Kingdom)
Malaysia, Penang: +60-4-6336666<tel:Malaysia,%20Penang:%20+60-4-6336666> (G=
lobal)               English (United States)
Brazil:3003-3355<tel:Brazil:3003-3355> (Global)                 Portuguese =
(Brazil)
China, Toll Free:800-858-0756<tel:China,%20Toll%20Free:800-858-0756> (Globa=
l)           English (United States)
Japan, Kawasaki: +81-44-5206877<tel:Japan,%20Kawasaki:%20+81-44-5206877> (G=
lobal)               Japanese (Japan)
Canada, Toronto: +1-416-7582329<tel:Canada,%20Toronto:%20+1-416-7582329> (G=
lobal)               English (United States)
Find a local number<https://dialin.dell.com>

Conference ID: 22607907
 Forgot your dial-in PIN?<https://dialin.dell.com> |Help<https://dialin.del=
l.com/DellHelp/>

[!OC([1033])!]
...........................................................................=
..............................................................



--_000_066c20c5825e4a75b4255500da392d14ausx13mps338AMERDELLCOM_
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
<div><font color=3D"#1F497D">Meeting Minutes:</font></div>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>AMI joined forum: Welcome!</li><li>Ed code walkthrough for bmcweb</li><=
/font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>Intel&#8217;s opinion is that openbmc cannot ship a &#8220;production&#=
8221; web stack running python. Web services need to be running with a comp=
iled language.</li><li>Intel has systems targeting 1000 sensors. Feeling is=
 that python cannot be scaled this high with performance on the targeted OB=
MC hardware</li><li>Overview:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:126pt;">
<font color=3D"#1F497D">
<li>Basically not going to go over everything Ed presented in his overview,=
 but I will note some highlights</li><li>Bmcweb is mostly meant to be singl=
e-threaded, but easily scales up to other threads</li><li>Currently most da=
ta is fetched on request, set up will support doing async background fetche=
s, but that&#8217;s just not how it currently runs.</li></font>
</ul>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Side notes:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>AMI has a LUA (luajit) implementation for redfish</li><li>AMI would lik=
e to present their solution</li><li>&nbsp;</li></font>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">Attendees:</font></div>
<div style=3D"text-indent:36pt;"><font color=3D"#1F497D">Pawel Rapkeiwicz, =
Chris Ong, Yugi Mani &#8211; Microsoft</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ed =
Tanous &#8211; Intel</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cha=
ndrasekhar - AMI</font></div>
<div style=3D"text-indent:36pt;"><font color=3D"#1F497D">Balaji Rao, Paul V=
ancil,&nbsp; Michael Brown - Dell Inc</font></div>
<div style=3D"text-indent:36pt;"><font color=3D"#1F497D">Jay Carman - IBM</=
font></div>
<div style=3D"text-indent:36pt;"><font color=3D"#1F497D">Rolf Brudeseth - I=
BM</font></div>
<a name=3D"_MailEndCompose"></a>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div>-----Original Appointment-----<br>

<b>From:</b> Brown, Michael E <br>

<b>Sent:</b> Monday, February 26, 2018 3:31 PM<br>

<b>To:</b> Brown, Michael E; openbmc@lists.ozlabs.org; Vancil, Paul; hramas=
ub@in.ibm.com; Rao, Balaji B; bradleyb@fuzziesquirrel.com; jwcarman@us.ibm.=
com; pradeep.kumar36@tcs.com; rolfb@us.ibm.com; Chris Ong; Ali Larijani; Ta=
nous, Ed; Yugi Mani<br>

<b>Cc:</b> Krishna Kolakaluri<br>

<b>Subject:</b> OpenBMC Redfish working group working call<br>

<b>When:</b> Monday, March 5, 2018 4:00 PM-5:00 PM (UTC-06:00) Central Time=
 (US &amp; Canada).<br>

<b>Where:</b> Skype Meeting</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Per meeting decision, this meeting invite is for the &#8220;OpenBMC Re=
dfish working group&#8221;. This working group will meet every Monday at 4p=
m CST and publish meeting minutes to the mailing list. The working group is=
 open to anybody who would like to participate
in development of Redfish on OpenBMC.</div>
<div>&nbsp;</div>
<div>Upcoming Meeting Agenda</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018-03-05: Ed Tanous (Inte=
l) to go over &#8216;bmcweb&#8217; requirements and implementation. Dependi=
ng on time, Michael Brown (Dell) to start going over go-redfish requirement=
s and implementation.</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018-03-12: Michael Brown (=
Dell) on vacation. (May need some alternative host for this meeting dependi=
ng on if I can dial in from Iceland).</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018-03-19: Paul Vancil to =
discuss python implementation</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018-03-26: open</div>
<div>&nbsp;</div>
<div>Past meetings:</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Meeting Minutes 2018-02-26:=
 <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2018-February/010955=
.html">
https://lists.ozlabs.org/pipermail/openbmc/2018-February/010955.html</a></d=
iv>
<div>&nbsp;</div>
<div><font size=3D"1" color=3D"#404040"><span style=3D"font-size:8pt;">....=
...........................................................................=
..........................................................</span></font></d=
iv>
<a name=3D"OutJoinLink"></a>
<div><font size=3D"4" color=3D"#0066CC"><span style=3D"font-size:14pt;"><fo=
nt face=3D"Wingdings">&agrave;</font> <a href=3D"https://meet.dell.com/mich=
ael_e_brown/JFFHZN1F"><font size=3D"4"><span style=3D"font-size:16pt;"><u>J=
oin Skype Meeting</u></span></font></a><font color=3D"black">&nbsp;
</font><a name=3D"OutSharedNoteBorder"></a>&nbsp;&nbsp; <a name=3D"OutShare=
dNoteLink"></a> </span></font></div>
<div style=3D"margin-top:3pt;margin-bottom:12pt;padding-left:16pt;"><font s=
ize=3D"2"><span style=3D"font-size:10pt;">Trouble Joining? <a href=3D"https=
://meet.dell.com/michael_e_brown/JFFHZN1F?sl=3D1"><font color=3D"#0066CC"><=
u>Try Skype Web App</u></font></a><u> </u></span></font></div>
<div><font size=3D"3"><span style=3D"font-size:13pt;">Join by phone</span><=
/font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:Internal:724-2663"><font s=
ize=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Internal:724=
-2663</u></span></font></a><font size=3D"2"><span style=3D"font-size:10pt;"=
> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; English (United States)
</span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:United States, Austin: &#4=
3;1-512-724-2663"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-si=
ze:10pt;"><u>United States, Austin: &#43;1-512-724-2663</u></span></font></=
a><font size=3D"2"><span style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
English (United States) </span></font><font size=3D"1"><span style=3D"font-=
size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:United States, Toll Free: =
&#43;1-877-491-9738"><font size=3D"2" color=3D"#0066CC"><span style=3D"font=
-size:10pt;"><u>United States, Toll Free: &#43;1-877-491-9738</u></span></f=
ont></a><font size=3D"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; English (United States) </span></font><font size=3D"1"><s=
pan style=3D"font-size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:India, Reliance:1800-30-10=
9045"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u=
>India, Reliance:1800-30-109045</u></span></font></a><font size=3D"2"><span=
 style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
English (United States) </span></font><font size=3D"1"><span style=3D"font-=
size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:India, BSNL:1800-425-5101"=
><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Indi=
a, BSNL:1800-425-5101</u></span></font></a><font size=3D"2"><span style=3D"=
font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English
(United States) </span></font><font size=3D"1"><span style=3D"font-size:3pt=
;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:Ireland, Dublin: &#43;353-=
1-2794062"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt=
;"><u>Ireland, Dublin: &#43;353-1-2794062</u></span></font></a><font size=
=3D"2"><span style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
English (United Kingdom) </span></font><font size=3D"1"><span style=3D"font=
-size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:England, Bracknell: &#43;4=
4-1344-372040"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:=
10pt;"><u>England, Bracknell: &#43;44-1344-372040</u></span></font></a><fon=
t size=3D"2"><span style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
English (United Kingdom) </span></font><font size=3D"1"><span style=3D"font=
-size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:Malaysia, Penang: &#43;60-=
4-6336666"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt=
;"><u>Malaysia, Penang: &#43;60-4-6336666</u></span></font></a><font size=
=3D"2"><span style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
English (United States) </span></font><font size=3D"1"><span style=3D"font-=
size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:Brazil:3003-3355"><font si=
ze=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Brazil:3003-3=
355</u></span></font></a><font size=3D"2"><span style=3D"font-size:10pt;"> =
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Portuguese (Brazil) </span></font><font size=3D"1">=
<span style=3D"font-size:3pt;">
</span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:China, Toll Free:800-858-0=
756"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>=
China, Toll Free:800-858-0756</u></span></font></a><font size=3D"2"><span s=
tyle=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; English
(United States) </span></font><font size=3D"1"><span style=3D"font-size:3pt=
;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:Japan, Kawasaki: &#43;81-4=
4-5206877"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt=
;"><u>Japan, Kawasaki: &#43;81-44-5206877</u></span></font></a><font size=
=3D"2"><span style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Japanese (Japan) </span></font><font size=3D"1"><span style=3D"font-size:3p=
t;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"tel:Canada, Toronto: &#43;1-41=
6-7582329"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt=
;"><u>Canada, Toronto: &#43;1-416-7582329</u></span></font></a><font size=
=3D"2"><span style=3D"font-size:10pt;"> (Global)&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
English (United States) </span></font><font size=3D"1"><span style=3D"font-=
size:3pt;"> </span></font></div>
<div style=3D"margin-bottom:2pt;"><a href=3D"https://dialin.dell.com"><font=
 size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Find a loc=
al number</u></span></font></a> </div>
<div style=3D"margin-bottom:2pt;">&nbsp;</div>
<div style=3D"margin-bottom:2pt;"><font size=3D"2"><span style=3D"font-size=
:10pt;">Conference ID: 22607907</span></font></div>
<div><font size=3D"1"><span style=3D"font-size:3pt;"> <a href=3D"https://di=
alin.dell.com"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:=
10pt;"><u>Forgot your dial-in PIN?</u></span></font></a> <font size=3D"2"><=
span style=3D"font-size:11pt;">|</span></font><a href=3D"https://dialin.del=
l.com/DellHelp/"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-siz=
e:10pt;"><u>Help</u></span></font></a>&nbsp;&nbsp;&nbsp;&nbsp;
</span></font></div>
<div>&nbsp;</div>
<div><font size=3D"1" color=3D"#CFCFCF"><span style=3D"font-size:1pt;"><fon=
t size=3D"1"><span style=3D"font-size:0.65pt;"><sub>[!OC([1033])!]</sub></s=
pan></font></span></font></div>
<div style=3D"margin-bottom:10pt;"><font size=3D"1" color=3D"#404040"><span=
 style=3D"font-size:8pt;">.................................................=
...........................................................................=
.............</span></font></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_066c20c5825e4a75b4255500da392d14ausx13mps338AMERDELLCOM_--
