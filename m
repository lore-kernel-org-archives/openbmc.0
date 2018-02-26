Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.218; helo=esa8.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="abRwAtxd"; 
 dkim-atps=neutral
Received: from esa8.dell-outbound.iphmx.com (esa8.dell-outbound.iphmx.com
 [68.232.149.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqy8G1jlPzDr14
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 10:04:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519686286; x=1551222286;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4mhSpHqdA3E4Qi0LQW0NGh6Ci1/S5pwerX8s+FfJuu8=;
 b=abRwAtxdaLDBNtmVdrorfdueVrJ9XT5ASPgu9btNJ8SPnJ6t/xGNlyF0
 mq9uaz3M72IpQlT8X7A1H3/7+8nHdqzXmLnt5tFbqTjJX+cyoGjEcV22B
 /ZQ9A7vzkHK7a0CYPHzG0utz9HM8WPruByGiHYxUNKzWnbTh/LPE1WNck k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FcAAAskZRah2Oa6ERUBwMZAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBBwEBAQEBgloBgUoQcCgKjWyNfoMYjh+HZoFTQwoYAQqBXoMyAoJFVBg?=
 =?us-ascii?q?BAgEBAQEBAQIBAhABAQEKCwkIKC+COCINBEsnAy8BAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBARUCDUMCGAEBAQUmBjkCBgsSARkEAQEVDDYnBwIBAQMBCQQFCAyEGGQQrh4?=
 =?us-ascii?q?6hA0BAYRighQBAQEBAQEBAQEBAQEBAQEBAQEBAQEYBYdCgz2GTwwCAgEYgSsVA?=
 =?us-ascii?q?gUwJoUrBYoTMmWWNwkKhy+GfIVikmmMUYkkgS8eggpwT4JDCYJKgTwUATZ3ig+?=
 =?us-ascii?q?BMIEXAQEB?=
X-IPAS-Result: =?us-ascii?q?A2FcAAAskZRah2Oa6ERUBwMZAQEBAQEBAQEBAQEBBwEBAQE?=
 =?us-ascii?q?BgloBgUoQcCgKjWyNfoMYjh+HZoFTQwoYAQqBXoMyAoJFVBgBAgEBAQEBAQIBA?=
 =?us-ascii?q?hABAQEKCwkIKC+COCINBEsnAy8BAQEBAQEBAQEBAQEBAQEBAQEBARUCDUMCGAE?=
 =?us-ascii?q?BAQUmBjkCBgsSARkEAQEVDDYnBwIBAQMBCQQFCAyEGGQQrh46hA0BAYRighQBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEYBYdCgz2GTwwCAgEYgSsVAgUwJoUrBYoTMmW?=
 =?us-ascii?q?WNwkKhy+GfIVikmmMUYkkgS8eggpwT4JDCYJKgTwUATZ3ig+BMIEXAQEB?=
Received: from esa6.dell-outbound2.iphmx.com ([68.232.154.99])
 by esa8.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2018 17:04:41 -0600
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa6.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 05:04:41 +0600
X-LoopCount0: from 10.166.132.49
X-IronPort-AV: E=Sophos;i="5.47,398,1515477600"; 
 d="scan'208,217";a="139846022"
X-DLP: DLP_GlobalPCIDSS
CC: <Krishna.Kolakaluri@deltaww.com>
Subject: Meeting Minutes 2/26/2018 - RE: Redfish call
Thread-Topic: Meeting Minutes 2/26/2018 - RE: Redfish call
Thread-Index: AdOvTaY9B7GkJWtTS7iZ0xkjLUUa8Q==
Date: Mon, 26 Feb 2018 23:04:39 +0000
Message-ID: <3123a69b616140b489ee76efa89a7e93@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_3123a69b616140b489ee76efa89a7e93ausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 26 Feb 2018 23:04:48 -0000

--_000_3123a69b616140b489ee76efa89a7e93ausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We had the inaugural meeting of the newly minted "OpenBMC Redfish Working G=
roup" today, Feb 26, 2018. Welcome to everybody who attended, and thank you=
 for your participation.

Meeting Minutes:
-       Meeting Frequency: Weekly meetings. Agenda: tours of the existing r=
edfish stacks.
o       Meetings are on Mondays at 4pm CST (2PM PST)
-       Action Item: Michael will send out updated meeting invite.
o       Ed: Strong opinion to keep the invite on the mailing list.
o       Ali: wants to run inside a(n open) "workgroup" for a while before e=
xposing to the rest of the community.
o       Michael: strong opinion to keep invite on mailing list and keep mee=
ting open to whoever wants to attend and contribute
-       Action item: creation of workgroup for Redfish
o       DONE: Michael waved his wand and we now have a "workgroup"
o       Participation in the workgroup is self-selected
o       Meetings are open to all who are interested

-       Ali (Microsoft) raised the following questions to be discussed by t=
he workgroup:
o       Frequency: weekly. Monday @4pm (CST). Ali mentioned that he saw som=
e IBM folks that had conflict for Monday. Action: Michael will send query t=
o the mailing list regarding times and see if there is another time that ca=
n be made to work.
o       Requirements:
*       Schema. Microsoft has a "storage" schema implementation in their co=
de
*       What fields do we want to support?
*       DMTF has standardized "Feature Profiles" which list which schema it=
ems must be supported
*       OCP Profile
*       OCP Base Server profile - currently open for review at DMTF
*       Microsoft has seen some gaps in DMTF schema:
o       Sensors: (what kind of gaps?)
*       Sensor connection - pcie, thermal, fans, everything currently disag=
gregated. MS wants everything in one collection.
o       FRU schema:
*       FRU collection (Ed Tanous says that FRU collection is under review =
at SPMF)
o       Event Logs:
*       No way to uniquely identify which event it is. Everything is a stri=
ng. (Message Registries might be a help here)
o       Plan/Roadmap:
o       Microsoft communicated that their expected date to transfer to LF o=
f their openbmc code is first week of March. (March 5th was communicated as=
 date)

-       Ed Tanous (Intel) started walking through the requirements document=
 that he has started putting together.

Attendees:
        Mario
        Rolf Brutus - IBM
        Ed Tanous - Team lead for Intel
        Chris Ong - 2 boxes shipping with OpenBMC. One in production inside=
 of Microsoft, one almost in production
        Dong Wei - ARM - wants to move from IPMI to Redfish
        Maciej - Intel DCG software team
        Yugi - Microsoft - works with Chris. Concerned with making DMTF sta=
ndards out of any changes we get.
        Paul Vancil - original co-chair DMTF/redfish.
        Sachit Bakshi - Likes to talk on mute. Works on Dell storage enclos=
ure stack




-----Original Appointment-----
From: Brown, Michael E
Sent: Monday, February 26, 2018 3:31 PM
To: Brown, Michael E; openbmc@lists.ozlabs.org; Vancil, Paul; hramasub@in.i=
bm.com; Rao, Balaji B; bradleyb@fuzziesquirrel.com; jwcarman@us.ibm.com; pr=
adeep.kumar36@tcs.com; rolfb@us.ibm.com; Chris Ong; Ali Larijani; Tanous, E=
d; Yugi Mani
Cc: Krishna Kolakaluri
Subject: Redfish call
When: Monday, February 26, 2018 4:00 PM-5:00 PM (UTC-06:00) Central Time (U=
S & Canada).
Where: Skype Meeting


Certainly a little bit later sending out this call than I anticipated, but =
it sounds like everybody thought today was a good time to kick everything o=
ff.

Stealing Ed's Initial agenda proposal:

Initial introductions
Overview of existing implementations and work
        Bmcweb implementation by Intel - Ed Tanous
        Go-redfish implementation by Dell - Michael Brown
        Redfish implementation by Microsoft - Ali Larijani/Yugi Mani/Bryan =
Kelly
        Paul Vancil's open python redfish
        Others?

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



--_000_3123a69b616140b489ee76efa89a7e93ausx13mps334AMERDELLCOM_
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
<div><font color=3D"#1F497D">We had the inaugural meeting of the newly mint=
ed &#8220;OpenBMC Redfish Working Group&#8221; today, Feb 26, 2018. Welcome=
 to everybody who attended, and thank you for your participation.</font></d=
iv>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">Meeting Minutes:</font></div>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Meeting Frequency: Weekly meetings. Agenda: tours of the existing redfi=
sh stacks.</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>Meetings are on Mondays at 4pm CST (2PM PST)</li></font>
</ul>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Action Item: Michael will send out updated meeting invite.</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>Ed: Strong opinion to keep the invite on the mailing list.</li><li>Ali:=
 wants to run inside a(n open) &#8220;workgroup&#8221; for a while before e=
xposing to the rest of the community. </li><li>Michael: strong opinion to k=
eep invite on mailing list and keep meeting open to whoever wants to attend=
 and contribute</li></font>
</ul>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Action item: creation of workgroup for Redfish</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>DONE: Michael waved his wand and we now have a &#8220;workgroup&#8221;<=
/li><li>Participation in the workgroup is self-selected</li><li>Meetings ar=
e open to all who are interested</li></font>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Ali (Microsoft) raised the following questions to be discussed by the w=
orkgroup:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>Frequency: weekly. Monday @4pm (CST). Ali mentioned that he saw some IB=
M folks that had conflict for Monday. Action: Michael will send query to th=
e mailing list regarding times and see if there is another time that can be=
 made to work.</li><li>Requirements:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:126pt;">
<font color=3D"#1F497D">
<li>Schema. Microsoft has a &#8220;storage&#8221; schema implementation in =
their code</li><li>What fields do we want to support?</li><li>DMTF has stan=
dardized &#8220;Feature Profiles&#8221; which list which schema items must =
be supported</li></font>
</ul>
<ul style=3D"margin:0;padding-left:162pt;">
<font color=3D"#1F497D">
<li>OCP Profile</li><li>OCP Base Server profile &#8211; currently open for =
review at DMTF</li><li>Microsoft has seen some gaps in DMTF schema:</li></f=
ont>
</ul>
<ul style=3D"margin:0;padding-left:198pt;">
<font color=3D"#1F497D">
<li>Sensors: (what kind of gaps?)</li></font>
</ul>
<ul style=3D"margin:0;padding-left:234pt;">
<font color=3D"#1F497D">
<li>Sensor connection &#8211; pcie, thermal, fans, everything currently dis=
aggregated. MS wants everything in one collection.</li></font>
</ul>
<ul style=3D"margin:0;padding-left:198pt;">
<font color=3D"#1F497D">
<li>FRU schema:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:234pt;">
<font color=3D"#1F497D">
<li>FRU collection (Ed Tanous says that FRU collection is under review at S=
PMF)</li></font>
</ul>
<ul style=3D"margin:0;padding-left:198pt;">
<font color=3D"#1F497D">
<li>Event Logs:</li></font>
</ul>
<ul style=3D"margin:0;padding-left:234pt;">
<font color=3D"#1F497D">
<li>No way to uniquely identify which event it is. Everything is a string. =
(Message Registries might be a help here)</li></font>
</ul>
<ul style=3D"margin:0;padding-left:90pt;">
<font color=3D"#1F497D">
<li>Plan/Roadmap:</li><li>Microsoft communicated that their expected date t=
o transfer to LF of their openbmc code is first week of March. (March 5<fon=
t size=3D"1"><span style=3D"font-size:7.3pt;"><sup>th</sup></span></font> w=
as communicated as date)</li></font>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<ul style=3D"margin:0;padding-left:54pt;">
<font color=3D"#1F497D">
<li>Ed Tanous (Intel) started walking through the requirements document tha=
t he has started putting together.</li></font>
</ul>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">Attendees:</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mar=
io </font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rol=
f Brutus - IBM</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ed =
Tanous &#8211; Team lead for Intel</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chr=
is Ong &#8211; 2 boxes shipping with OpenBMC. One in production inside of M=
icrosoft, one almost in production</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Don=
g Wei &#8211; ARM &#8211; wants to move from IPMI to Redfish</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mac=
iej &#8211; Intel DCG software team</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Yug=
i &#8211; Microsoft &#8211; works with Chris. Concerned with making DMTF st=
andards out of any changes we get.</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pau=
l Vancil &#8211; original co-chair DMTF/redfish.</font></div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sac=
hit Bakshi &#8211; Likes to talk on mute. Works on Dell storage enclosure s=
tack</font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
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

<b>Subject:</b> Redfish call<br>

<b>When:</b> Monday, February 26, 2018 4:00 PM-5:00 PM (UTC-06:00) Central =
Time (US &amp; Canada).<br>

<b>Where:</b> Skype Meeting</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<a name=3D"_InsertRtfSavedPosition"></a>
<div>Certainly a little bit later sending out this call than I anticipated,=
 but it sounds like everybody thought today was a good time to kick everyth=
ing off.</div>
<div>&nbsp;</div>
<div>Stealing Ed&#8217;s Initial agenda proposal:</div>
<div>&nbsp;</div>
<div>Initial introductions</div>
<div>Overview of existing implementations and work</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bmcweb implementation by In=
tel &#8211; Ed Tanous</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Go-redfish implementation b=
y Dell &#8211; Michael Brown</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Redfish implementation by M=
icrosoft &#8211; Ali Larijani/Yugi Mani/Bryan Kelly</div>
<div><font color=3D"#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pau=
l Vancil&#8217;s open python redfish</font></div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others?</div>
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

--_000_3123a69b616140b489ee76efa89a7e93ausx13mps334AMERDELLCOM_--
