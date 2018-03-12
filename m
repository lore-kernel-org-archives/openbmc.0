Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.90; helo=esa1.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="K/AKj07r"; 
 dkim-atps=neutral
Received: from esa1.dell-outbound.iphmx.com (esa1.dell-outbound.iphmx.com
 [68.232.153.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 400KSn5R4mzDrST
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 01:03:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1520863284; x=1552399284;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=KM8q98sgHsOoj0cFwY6TuukzbSWg5yofsQ9VVbvUcpk=;
 b=K/AKj07rPGqF6cgOqqyafjNHDzyuyCsIJYJQ3rCyS6WVSoASLxxId+j6
 fBMuk3SuCeXL+q1VcuZ41F1gEpDANAZv97MBGwP78htgfJEbQIq6qaDjR
 mfirUqfCIT9NFo/zGKzuuU2KxinNeJQ2QQVqbSh0pB3qxO5WOLueRnfAe Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EkAADZh6Zah8mZ6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCWgGBSxBvKAqDRmeJOI1xgxqNGYcZgVNCBwMYAQqFAhyDASE?=
 =?us-ascii?q?0GAECAQEBAQEBAgECEAEBAQoLCQgoLoI4IhFLJwMDAQEBAQEBAQEBIwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBGAINQwIbBAEiBAIEOQIGCxIBAjIWAgQmLgIBAQMBDQ2ELGQ?=
 =?us-ascii?q?PrA6BbCsPhAsBAYRRggsKBYU1gi6DPIZQDAIBAQEYgQw7JgomgkGCYgSIBXyFL?=
 =?us-ascii?q?YwoCQmGOoV7hBuOa4l5h0+BLB6CC3BPDQiCLgmCOYE7EwE2dwGLPASBLYEYAQE?=
 =?us-ascii?q?B?=
X-IPAS-Result: =?us-ascii?q?A2EkAADZh6Zah8mZ6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CWgGBSxBvKAqDRmeJOI1xgxqNGYcZgVNCBwMYAQqFAhyDASE0GAECAQEBAQEBA?=
 =?us-ascii?q?gECEAEBAQoLCQgoLoI4IhFLJwMDAQEBAQEBAQEBIwEBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BGAINQwIbBAEiBAIEOQIGCxIBAjIWAgQmLgIBAQMBDQ2ELGQPrA6BbCsPhAsBA?=
 =?us-ascii?q?YRRggsKBYU1gi6DPIZQDAIBAQEYgQw7JgomgkGCYgSIBXyFLYwoCQmGOoV7hBu?=
 =?us-ascii?q?Oa4l5h0+BLB6CC3BPDQiCLgmCOYE7EwE2dwGLPASBLYEYAQEB?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa1.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2018 09:01:20 -0500
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausxippc106.us.dell.com ([143.166.85.156])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2018 20:01:19 +0600
X-LoopCount0: from 10.166.132.72
X-IronPort-AV: E=Sophos;i="5.47,461,1515477600"; 
 d="scan'208,217";a="226503146"
X-DLP: DLP_GlobalPCIDSS
CC: <Krishna.Kolakaluri@deltaww.com>
Subject: Canceled: OpenBMC Redfish working group working call
Thread-Topic: OpenBMC Redfish working group working call
Thread-Index: AdOvVmar7fl1B0WTTsGf2vp1X5Ow6wKspL4A
Importance: high
X-Priority: 1
Date: Mon, 12 Mar 2018 14:02:58 +0000
Message-ID: <141f38e57da746fda1edce31cae1655c@ausx13mps338.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: multipart/alternative;
 boundary="_000_141f38e57da746fda1edce31cae1655causx13mps338AMERDELLCOM_"
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
X-List-Received-Date: Mon, 12 Mar 2018 14:03:07 -0000

--_000_141f38e57da746fda1edce31cae1655causx13mps338AMERDELLCOM_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Cancelling my invite for today, as I am not likely to be able to participat=
e. Ed Tanous may be able to send out an invite for today to continue the di=
scussion.
--
Michael


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



--_000_141f38e57da746fda1edce31cae1655causx13mps338AMERDELLCOM_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Cancelling my invite for today, as I am not likely to be able to parti=
cipate. Ed Tanous may be able to send out an invite for today to continue t=
he discussion.</div>
<div>--</div>
<div>Michael</div>
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
.html"><font color=3D"#0563C1"><u>https://lists.ozlabs.org/pipermail/openbm=
c/2018-February/010955.html</u></font></a></div>
<div>&nbsp;</div>
<div><font size=3D"1" color=3D"#404040"><span style=3D"font-size:8pt;">....=
...........................................................................=
..........................................................</span></font></d=
iv>
<a name=3D"OutJoinLink"></a>
<div><font size=3D"4" color=3D"#0066CC"><span style=3D"font-size:14pt;"><fo=
nt face=3D"Wingdings">=E0</font> <a href=3D"https://meet.dell.com/michael_e=
_brown/JFFHZN1F"><font size=3D"4"><span style=3D"font-size:16pt;"><u>Join S=
kype Meeting</u></span></font></a><font color=3D"black">&nbsp;
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

--_000_141f38e57da746fda1edce31cae1655causx13mps338AMERDELLCOM_
Content-Type: text/calendar; charset="utf-8"; method=CANCEL
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6Q0FOQ0VMDQpQUk9ESUQ6TWljcm9zb2Z0IEV4Y2hhbmdl
IFNlcnZlciAyMDEwDQpWRVJTSU9OOjIuMA0KQkVHSU46VlRJTUVaT05FDQpUWklEOkNlbnRyYWwg
U3RhbmRhcmQgVGltZQ0KQkVHSU46U1RBTkRBUkQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpU
Wk9GRlNFVEZST006LTA1MDANClRaT0ZGU0VUVE86LTA2MDANClJSVUxFOkZSRVE9WUVBUkxZO0lO
VEVSVkFMPTE7QllEQVk9MVNVO0JZTU9OVEg9MTENCkVORDpTVEFOREFSRA0KQkVHSU46REFZTElH
SFQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpUWk9GRlNFVEZST006LTA2MDANClRaT0ZGU0VU
VE86LTA1MDANClJSVUxFOkZSRVE9WUVBUkxZO0lOVEVSVkFMPTE7QllEQVk9MlNVO0JZTU9OVEg9
Mw0KRU5EOkRBWUxJR0hUDQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCk9SR0FOSVpFUjpN
QUlMVE86TWljaGFlbF9FX0Jyb3duQERlbGwuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJ
UEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86b3BlbmINCiBtY0Bs
aXN0cy5vemxhYnMub3JnDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1O
RUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86UGF1bF8NCiBWYW5jaWxARGVsbC5jb20NCkFU
VEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPUZB
TFNFOk1BSUxUTzpocmFtYQ0KIHN1YkBpbi5pYm0uY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJU
SUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86QmFsYWoNCiBp
X0JfUmFvQGRlbGwuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1O
RUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86YnJhZGwNCiBleWJAZnV6emllc3F1aXJyZWwu
Y29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047
UlNWUD1GQUxTRTpNQUlMVE86andjYXINCiBtYW5AdXMuaWJtLmNvbQ0KQVRURU5ERUU7Uk9MRT1S
RVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOnBy
YWRlDQogZXAua3VtYXIzNkB0Y3MuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQ
QVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86cm9sZmINCiBAdXMuaWJtLmNv
bQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JT
VlA9RkFMU0U6TUFJTFRPOkNocmlzDQogLk9uZ0BtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtST0xF
PVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86
YWxpcmgNCiBhc0BtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQ
QVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlMVE86ZWQudGENCiBub3VzQGludGVs
LmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9RkFMU0U6TUFJTFRPOnl1cGFsDQogYW5pQG1pY3Jvc29mdC5jb20NCkFUVEVOREVFO1JP
TEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPUZBTFNFOk1BSUxU
TzpLcmlzaA0KIG5hLktvbGFrYWx1cmlAZGVsdGF3dy5jb20NCkRFU0NSSVBUSU9OO0xBTkdVQUdF
PWVuLVVTOkNhbmNlbGxpbmcgbXkgaW52aXRlIGZvciB0b2RheVwsIGFzIEkgYW0gbm90IGxpaw0K
IGVseSB0byBiZSBhYmxlIHRvIHBhcnRpY2lwYXRlLiBFZCBUYW5vdXMgbWF5IGJlIGFibGUgdG8g
c2VuZCBvdXQgYW4gaW52aXRlDQogIGZvciB0b2RheSB0byBjb250aW51ZSB0aGUgZGlzY3Vzc2lv
bi5cbi0tXG5NaWNoYWVsXG5cblxuUGVyIG1lZXRpbmcgZGVjaXMNCiBpb25cLCB0aGlzIG1lZXRp
bmcgaW52aXRlIGlzIGZvciB0aGUg4oCcT3BlbkJNQyBSZWRmaXNoIHdvcmtpbmcgZ3JvdXDigJ0u
IA0KIFRoaXMgd29ya2luZyBncm91cCB3aWxsIG1lZXQgZXZlcnkgTW9uZGF5IGF0IDRwbSBDU1Qg
YW5kIHB1Ymxpc2ggbWVldGluZyBtDQogaW51dGVzIHRvIHRoZSBtYWlsaW5nIGxpc3QuIFRoZSB3
b3JraW5nIGdyb3VwIGlzIG9wZW4gdG8gYW55Ym9keSB3aG8gd291bGQNCiAgbGlrZSB0byBwYXJ0
aWNpcGF0ZSBpbiBkZXZlbG9wbWVudCBvZiBSZWRmaXNoIG9uIE9wZW5CTUMuXG5cblVwY29taW5n
IE1lZQ0KIHRpbmcgQWdlbmRhXG4gICAgICAgIDIwMTgtMDMtMDU6IEVkIFRhbm91cyAoSW50ZWwp
IHRvIGdvIG92ZXIg4oCYYm1jd2Vi4oCZDQogIHJlcXVpcmVtZW50cyBhbmQgaW1wbGVtZW50YXRp
b24uIERlcGVuZGluZyBvbiB0aW1lXCwgTWljaGFlbCBCcm93biAoRGVsbCkNCiAgdG8gc3RhcnQg
Z29pbmcgb3ZlciBnby1yZWRmaXNoIHJlcXVpcmVtZW50cyBhbmQgaW1wbGVtZW50YXRpb24uXG4g
ICAgICAgIA0KIDIwMTgtMDMtMTI6IE1pY2hhZWwgQnJvd24gKERlbGwpIG9uIHZhY2F0aW9uLiAo
TWF5IG5lZWQgc29tZSBhbHRlcm5hdGl2ZSBoDQogb3N0IGZvciB0aGlzIG1lZXRpbmcgZGVwZW5k
aW5nIG9uIGlmIEkgY2FuIGRpYWwgaW4gZnJvbSBJY2VsYW5kKS5cbiAgICAgICANCiAgMjAxOC0w
My0xOTogUGF1bCBWYW5jaWwgdG8gZGlzY3VzcyBweXRob24gaW1wbGVtZW50YXRpb25cbiAgICAg
ICAgMjAxOC0wMw0KIC0yNjogb3BlblxuXG5QYXN0IG1lZXRpbmdzOlxuICAgICAgICBNZWV0aW5n
IE1pbnV0ZXMgMjAxOC0wMi0yNjogaHR0cHM6Ly9sDQogaXN0cy5vemxhYnMub3JnL3BpcGVybWFp
bC9vcGVuYm1jLzIwMTgtRmVicnVhcnkvMDEwOTU1Lmh0bWxcblxuLi4uLi4uLi4uLi4NCiAuLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLg0KIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi5cbi0tPiBKb2luIFNreXBlIE1lZXRpDQogbmc8aHR0cHM6Ly9tZWV0LmRlbGwu
Y29tL21pY2hhZWxfZV9icm93bi9KRkZIWk4xRj5cbiAgVHJvdWJsZSBKb2luaW5nPyBUcnkNCiAg
U2t5cGUgV2ViIEFwcDxodHRwczovL21lZXQuZGVsbC5jb20vbWljaGFlbF9lX2Jyb3duL0pGRkha
TjFGP3NsPTE+XG5Kb2luIA0KIGJ5IHBob25lXG5JbnRlcm5hbDo3MjQtMjY2Mzx0ZWw6SW50ZXJu
YWw6NzI0LTI2NjM+IChHbG9iYWwpICAgICAgICAgICAgICAgDQogRW5nbGlzaCAoVW5pdGVkIFN0
YXRlcylcblVuaXRlZCBTdGF0ZXNcLCBBdXN0aW46ICsxLTUxMi03MjQtMjY2Mzx0ZWw6VW5pdGUN
CiBkJTIwU3RhdGVzXCwlMjBBdXN0aW46JTIwKzEtNTEyLTcyNC0yNjYzPiAoR2xvYmFsKSAgICAg
ICAgICAgICAgIEVuZ2xpc2ggKA0KIFVuaXRlZCBTdGF0ZXMpXG5Vbml0ZWQgU3RhdGVzXCwgVG9s
bCBGcmVlOiArMS04NzctNDkxLTk3Mzg8dGVsOlVuaXRlZCUyMFN0DQogYXRlc1wsJTIwVG9sbCUy
MEZyZWU6JTIwKzEtODc3LTQ5MS05NzM4PiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xpc2gg
KFUNCiBuaXRlZCBTdGF0ZXMpXG5JbmRpYVwsIFJlbGlhbmNlOjE4MDAtMzAtMTA5MDQ1PHRlbDpJ
bmRpYVwsJTIwUmVsaWFuY2U6MTgwMA0KIC0zMC0xMDkwNDU+IChHbG9iYWwpICAgICAgICAgICBF
bmdsaXNoIChVbml0ZWQgU3RhdGVzKVxuSW5kaWFcLCBCU05MOjE4MDAtDQogNDI1LTUxMDE8dGVs
OkluZGlhXCwlMjBCU05MOjE4MDAtNDI1LTUxMDE+IChHbG9iYWwpICAgICAgICAgICAgIEVuZ2xp
c2ggKFUNCiBuaXRlZCBTdGF0ZXMpXG5JcmVsYW5kXCwgRHVibGluOiArMzUzLTEtMjc5NDA2Mjx0
ZWw6SXJlbGFuZFwsJTIwRHVibGluOiUyMA0KICszNTMtMS0yNzk0MDYyPiAoR2xvYmFsKSAgICAg
ICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9tKVxuRW5nbGFuZFwsDQogIEJyYWNrbmVs
bDogKzQ0LTEzNDQtMzcyMDQwPHRlbDpFbmdsYW5kXCwlMjBCcmFja25lbGw6JTIwKzQ0LTEzNDQt
MzcyMDQwPiANCiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9t
KVxuTWFsYXlzaWFcLCBQZW5hbmc6ICs2MC00LQ0KIDYzMzY2NjY8dGVsOk1hbGF5c2lhXCwlMjBQ
ZW5hbmc6JTIwKzYwLTQtNjMzNjY2Nj4gKEdsb2JhbCkgICAgICAgICAgICAgICBFDQogbmdsaXNo
IChVbml0ZWQgU3RhdGVzKVxuQnJhemlsOjMwMDMtMzM1NTx0ZWw6QnJhemlsOjMwMDMtMzM1NT4g
KEdsb2JhbCkgICANCiAgICAgICAgICAgICAgIFBvcnR1Z3Vlc2UgKEJyYXppbClcbkNoaW5hXCwg
VG9sbCBGcmVlOjgwMC04NTgtMDc1Njx0ZWw6Q2hpbg0KIGFcLCUyMFRvbGwlMjBGcmVlOjgwMC04
NTgtMDc1Nj4gKEdsb2JhbCkgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpDQogXG5K
YXBhblwsIEthd2FzYWtpOiArODEtNDQtNTIwNjg3Nzx0ZWw6SmFwYW5cLCUyMEthd2FzYWtpOiUy
MCs4MS00NC01MjA2ODcNCiA3PiAoR2xvYmFsKSAgICAgICAgICAgICAgIEphcGFuZXNlIChKYXBh
bilcbkNhbmFkYVwsIFRvcm9udG86ICsxLTQxNi03NTgyMw0KIDI5PHRlbDpDYW5hZGFcLCUyMFRv
cm9udG86JTIwKzEtNDE2LTc1ODIzMjk+IChHbG9iYWwpICAgICAgICAgICAgICAgRW5nbGlzDQog
aCAoVW5pdGVkIFN0YXRlcylcbkZpbmQgYSBsb2NhbCBudW1iZXI8aHR0cHM6Ly9kaWFsaW4uZGVs
bC5jb20+XG5cbkNvbmZlcmUNCiBuY2UgSUQ6IDIyNjA3OTA3XG4gRm9yZ290IHlvdXIgZGlhbC1p
biBQSU4/PGh0dHBzOi8vZGlhbGluLmRlbGwuY29tPiB8SGVscA0KIDxodHRwczovL2RpYWxpbi5k
ZWxsLmNvbS9EZWxsSGVscC8+XG5cblshT0MoWzEwMzNdKSFdXG4uLi4uLi4uLi4uLi4uLi4uLi4u
DQogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4NCiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLlxuXG5cbg0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpDYW5jZWxlZDogT3BlbkJN
QyBSZWRmaXNoIHdvcmtpbmcgZ3JvdXAgd29ya2luZyBjYWxsDQpEVFNUQVJUO1RaSUQ9Q2VudHJh
bCBTdGFuZGFyZCBUaW1lOjIwMTgwMzEyVDE2MDAwMA0KRFRFTkQ7VFpJRD1DZW50cmFsIFN0YW5k
YXJkIFRpbWU6MjAxODAzMTJUMTcwMDAwDQpVSUQ6MDQwMDAwMDA4MjAwRTAwMDc0QzVCNzEwMUE4
MkUwMDgwMDAwMDAwMEQwRTYzMERDMTZBRkQzMDEwMDAwMDAwMDAwMDAwMDANCiAwMTAwMDAwMDA4
QzhBOEJCNkU4MjA3NDRBOTExRUExMEJFNDg4OUQ5OA0KUkVDVVJSRU5DRS1JRDtUWklEPUNlbnRy
YWwgU3RhbmRhcmQgVGltZToyMDE4MDMxMlQxNjAwMDANCkNMQVNTOlBVQkxJQw0KUFJJT1JJVFk6
MQ0KRFRTVEFNUDoyMDE4MDMxMlQxMzQ5NDRaDQpUUkFOU1A6T1BBUVVFDQpTVEFUVVM6Q0FOQ0VM
TEVEDQpTRVFVRU5DRTozDQpMT0NBVElPTjtMQU5HVUFHRT1lbi1VUzpTa3lwZSBNZWV0aW5nDQpY
LU1JQ1JPU09GVC1DRE8tQVBQVC1TRVFVRU5DRTozDQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBU
SUQ6LTU5MTAzMjYyDQpYLU1JQ1JPU09GVC1DRE8tQlVTWVNUQVRVUzpGUkVFDQpYLU1JQ1JPU09G
VC1DRE8tSU5URU5ERURTVEFUVVM6RlJFRQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZB
TFNFDQpYLU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToyDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZ
UEU6Mw0KWC1NSUNST1NPRlQtRElTQUxMT1ctQ09VTlRFUjpUUlVFDQpFTkQ6VkVWRU5UDQpFTkQ6
VkNBTEVOREFSDQo=

--_000_141f38e57da746fda1edce31cae1655causx13mps338AMERDELLCOM_--
