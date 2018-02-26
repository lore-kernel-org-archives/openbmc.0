Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.96; helo=esa7.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="UIFZ4GBZ"; 
 dkim-atps=neutral
Received: from esa7.dell-outbound.iphmx.com (esa7.dell-outbound.iphmx.com
 [68.232.153.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqyL61mT9zF0v5
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 10:13:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519686471; x=1551222471;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Svglc39pQae2MggMt1UPyK85yLhI0Ob75XlJZqwxtGo=;
 b=UIFZ4GBZJdDZBhqEDK/2xMt0/VkXelGHBGEhewk1vYMNk2k7OUwpSov0
 3WpiW5HeuVIhiPelxjMdQbysII++sKW/hlpux/tYPA4GPKvlts701EhLI
 fV9M2z8a/ePYQZ2wckDFUAg868DhAWm9dSpkH2rpMoY2k0/dYrI/PdhgC A=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GBAADJk5Rah8qZ6ERbAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCWgGBShBwKAqDSmuXNYMYjh+HZoFTQwcDGAEKhRAcgitVFwE?=
 =?us-ascii?q?CAQEBAQEBAgECEAEBAQoLCQgoL4I4Ig0ESycDAwEBAQEBAQEBASMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBARUCDUMCGwQBIgQGOQIGCxIBNBYCBCYuAgEBAwENDYQkZBC?=
 =?us-ascii?q?sMoFtOoQNAQGEY4IUAQEBAQEBAQMBAQEBAQEBEgoFh0KDPYZPDAIBAQEYgQw7V?=
 =?us-ascii?q?oJGgmUFihOBF4ZOj2kJCocvhnyFYpJpjFGJJIEvIAOCBXBPDQiCLgmCSoE8FAE?=
 =?us-ascii?q?2dwGLPoEXAQEB?=
X-IPAS-Result: =?us-ascii?q?A2GBAADJk5Rah8qZ6ERbAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CWgGBShBwKAqDSmuXNYMYjh+HZoFTQwcDGAEKhRAcgitVFwECAQEBAQEBAgECE?=
 =?us-ascii?q?AEBAQoLCQgoL4I4Ig0ESycDAwEBAQEBAQEBASMBAQEBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BARUCDUMCGwQBIgQGOQIGCxIBNBYCBCYuAgEBAwENDYQkZBCsMoFtOoQNAQGEY?=
 =?us-ascii?q?4IUAQEBAQEBAQMBAQEBAQEBEgoFh0KDPYZPDAIBAQEYgQw7VoJGgmUFihOBF4Z?=
 =?us-ascii?q?Oj2kJCocvhnyFYpJpjFGJJIEvIAOCBXBPDQiCLgmCSoE8FAE2dwGLPoEXAQEB?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa7.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2018 17:07:48 -0600
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 05:06:14 +0600
X-LoopCount0: from 10.166.132.56
X-IronPort-AV: E=Sophos;i="5.47,398,1515477600"; 
 d="scan'208,217";a="140167633"
X-DLP: DLP_GlobalPCIDSS
CC: <Krishna.Kolakaluri@deltaww.com>
Subject: OpenBMC Redfish working group working call
Thread-Topic: OpenBMC Redfish working group working call
Thread-Index: AdOvVmar7fl1B0WTTsGf2vp1X5Ow6wAAPchQ
Date: Mon, 26 Feb 2018 23:13:12 +0000
Message-ID: <9001b890eda64299819af218aada2b2d@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_9001b890eda64299819af218aada2b2dausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 26 Feb 2018 23:13:19 -0000

--_000_9001b890eda64299819af218aada2b2dausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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



--_000_9001b890eda64299819af218aada2b2dausx13mps334AMERDELLCOM_
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

--_000_9001b890eda64299819af218aada2b2dausx13mps334AMERDELLCOM_
Content-Type: text/calendar; charset="utf-8"; method=REQUEST
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6UkVRVUVTVA0KUFJPRElEOk1pY3Jvc29mdCBFeGNoYW5n
ZSBTZXJ2ZXIgMjAxMA0KVkVSU0lPTjoyLjANCkJFR0lOOlZUSU1FWk9ORQ0KVFpJRDpDZW50cmFs
IFN0YW5kYXJkIFRpbWUNCkJFR0lOOlNUQU5EQVJEDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0K
VFpPRkZTRVRGUk9NOi0wNTAwDQpUWk9GRlNFVFRPOi0wNjAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJ
TlRFUlZBTD0xO0JZREFZPTFTVTtCWU1PTlRIPTExDQpFTkQ6U1RBTkRBUkQNCkJFR0lOOkRBWUxJ
R0hUDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0KVFpPRkZTRVRGUk9NOi0wNjAwDQpUWk9GRlNF
VFRPOi0wNTAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJTlRFUlZBTD0xO0JZREFZPTJTVTtCWU1PTlRI
PTMNCkVORDpEQVlMSUdIVA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46VkVWRU5UDQpPUkdBTklaRVI6
TUFJTFRPOk1pY2hhZWxfRV9Ccm93bkBEZWxsLmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOm9wZW5iDQogbWNA
bGlzdHMub3psYWJzLm9yZw0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9
TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOlBhdWxfDQogVmFuY2lsQERlbGwuY29tDQpB
VFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1G
QUxTRTpNQUlMVE86aHJhbWENCiBzdWJAaW4uaWJtLmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFS
VElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOkJhbGFqDQog
aV9CX1Jhb0BkZWxsLmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9
TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOmJyYWRsDQogZXliQGZ1enppZXNxdWlycmVs
LmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9RkFMU0U6TUFJTFRPOmp3Y2FyDQogbWFuQHVzLmlibS5jb20NCkFUVEVOREVFO1JPTEU9
UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPUZBTFNFOk1BSUxUTzpw
cmFkZQ0KIGVwLmt1bWFyMzZAdGNzLmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOnJvbGZiDQogQHVzLmlibS5j
b20NCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtS
U1ZQPUZBTFNFOk1BSUxUTzpDaHJpcw0KIC5PbmdAbWljcm9zb2Z0LmNvbQ0KQVRURU5ERUU7Uk9M
RT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRP
OmFsaXJoDQogYXNAbWljcm9zb2Z0LmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7
UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9RkFMU0U6TUFJTFRPOmVkLnRhDQogbm91c0BpbnRl
bC5jb20NCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElP
TjtSU1ZQPUZBTFNFOk1BSUxUTzp5dXBhbA0KIGFuaUBtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtS
T0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1GQUxTRTpNQUlM
VE86S3Jpc2gNCiBuYS5Lb2xha2FsdXJpQGRlbHRhd3cuY29tDQpERVNDUklQVElPTjtMQU5HVUFH
RT1lbi1VUzpQZXIgbWVldGluZyBkZWNpc2lvblwsIHRoaXMgbWVldGluZyBpbnZpdGUgaXMgZm8N
CiByIHRoZSDigJxPcGVuQk1DIFJlZGZpc2ggd29ya2luZyBncm91cOKAnS4gVGhpcyB3b3JraW5n
IGdyb3VwIHdpbGwgbWVldCBldg0KIGVyeSBNb25kYXkgYXQgNHBtIENTVCBhbmQgcHVibGlzaCBt
ZWV0aW5nIG1pbnV0ZXMgdG8gdGhlIG1haWxpbmcgbGlzdC4gVGhlDQogIHdvcmtpbmcgZ3JvdXAg
aXMgb3BlbiB0byBhbnlib2R5IHdobyB3b3VsZCBsaWtlIHRvIHBhcnRpY2lwYXRlIGluIGRldmVs
b3ANCiBtZW50IG9mIFJlZGZpc2ggb24gT3BlbkJNQy5cblxuVXBjb21pbmcgTWVldGluZyBBZ2Vu
ZGFcbiAgICAgICAgMjAxOC0wMy0wNQ0KIDogRWQgVGFub3VzIChJbnRlbCkgdG8gZ28gb3ZlciDi
gJhibWN3ZWLigJkgcmVxdWlyZW1lbnRzIGFuZCBpbXBsZW1lbnRhdGlvDQogbi4gRGVwZW5kaW5n
IG9uIHRpbWVcLCBNaWNoYWVsIEJyb3duIChEZWxsKSB0byBzdGFydCBnb2luZyBvdmVyIGdvLXJl
ZGZpc2gNCiAgcmVxdWlyZW1lbnRzIGFuZCBpbXBsZW1lbnRhdGlvbi5cbiAgICAgICAgMjAxOC0w
My0xMjogTWljaGFlbCBCcm93biAoRGVsbA0KICkgb24gdmFjYXRpb24uIChNYXkgbmVlZCBzb21l
IGFsdGVybmF0aXZlIGhvc3QgZm9yIHRoaXMgbWVldGluZyBkZXBlbmRpbmcgDQogb24gaWYgSSBj
YW4gZGlhbCBpbiBmcm9tIEljZWxhbmQpLlxuICAgICAgICAyMDE4LTAzLTE5OiBQYXVsIFZhbmNp
bCB0byBkaXMNCiBjdXNzIHB5dGhvbiBpbXBsZW1lbnRhdGlvblxuICAgICAgICAyMDE4LTAzLTI2
OiBvcGVuXG5cblBhc3QgbWVldGluZ3M6XG4gIA0KICAgICAgIE1lZXRpbmcgTWludXRlcyAyMDE4
LTAyLTI2OiBodHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL29wZW5iDQogbWMvMjAx
OC1GZWJydWFyeS8wMTA5NTUuaHRtbFxuXG4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4NCiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KIC4uLi4uLi4uLi4uLi4uLi4uLi4uLlxu
LS0+IEpvaW4gU2t5cGUgTWVldGluZzxodHRwczovL21lZXQuZGVsbC5jb20vbWljaGFlDQogbF9l
X2Jyb3duL0pGRkhaTjFGPlxuICBUcm91YmxlIEpvaW5pbmc/IFRyeSBTa3lwZSBXZWIgQXBwPGh0
dHBzOi8vbWVldC5kZWwNCiBsLmNvbS9taWNoYWVsX2VfYnJvd24vSkZGSFpOMUY/c2w9MT5cbkpv
aW4gYnkgcGhvbmVcbkludGVybmFsOjcyNC0yNjYzPHRlbA0KIDpJbnRlcm5hbDo3MjQtMjY2Mz4g
KEdsb2JhbCkgICAgICAgICAgICAgICBFbmdsaXNoIChVbml0ZWQgU3RhdGVzKVxuVW5pdGVkDQog
IFN0YXRlc1wsIEF1c3RpbjogKzEtNTEyLTcyNC0yNjYzPHRlbDpVbml0ZWQlMjBTdGF0ZXNcLCUy
MEF1c3RpbjolMjArMS01MTINCiAtNzI0LTI2NjM+IChHbG9iYWwpICAgICAgICAgICAgICAgRW5n
bGlzaCAoVW5pdGVkIFN0YXRlcylcblVuaXRlZCBTdGF0ZXNcLA0KICBUb2xsIEZyZWU6ICsxLTg3
Ny00OTEtOTczODx0ZWw6VW5pdGVkJTIwU3RhdGVzXCwlMjBUb2xsJTIwRnJlZTolMjArMS04Nzct
DQogNDkxLTk3Mzg+IChHbG9iYWwpICAgICAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRl
cylcbkluZGlhXCwgUmVsaWFuY2UNCiA6MTgwMC0zMC0xMDkwNDU8dGVsOkluZGlhXCwlMjBSZWxp
YW5jZToxODAwLTMwLTEwOTA0NT4gKEdsb2JhbCkgICAgICAgICAgIA0KIEVuZ2xpc2ggKFVuaXRl
ZCBTdGF0ZXMpXG5JbmRpYVwsIEJTTkw6MTgwMC00MjUtNTEwMTx0ZWw6SW5kaWFcLCUyMEJTTkw6
MTgwDQogMC00MjUtNTEwMT4gKEdsb2JhbCkgICAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0
YXRlcylcbklyZWxhbmRcLCBEdWJsaW4NCiA6ICszNTMtMS0yNzk0MDYyPHRlbDpJcmVsYW5kXCwl
MjBEdWJsaW46JTIwKzM1My0xLTI3OTQwNjI+IChHbG9iYWwpICAgICAgIA0KICAgICAgICAgRW5n
bGlzaCAoVW5pdGVkIEtpbmdkb20pXG5FbmdsYW5kXCwgQnJhY2tuZWxsOiArNDQtMTM0NC0zNzIw
NDA8dGVsDQogOkVuZ2xhbmRcLCUyMEJyYWNrbmVsbDolMjArNDQtMTM0NC0zNzIwNDA+IChHbG9i
YWwpICAgICAgICAgICAgICAgRW5nbGlzaCANCiAoVW5pdGVkIEtpbmdkb20pXG5NYWxheXNpYVws
IFBlbmFuZzogKzYwLTQtNjMzNjY2Njx0ZWw6TWFsYXlzaWFcLCUyMFBlbmFuZw0KIDolMjArNjAt
NC02MzM2NjY2PiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMp
XG5CcmF6aWw6DQogMzAwMy0zMzU1PHRlbDpCcmF6aWw6MzAwMy0zMzU1PiAoR2xvYmFsKSAgICAg
ICAgICAgICAgICAgUG9ydHVndWVzZSAoQnJhemkNCiBsKVxuQ2hpbmFcLCBUb2xsIEZyZWU6ODAw
LTg1OC0wNzU2PHRlbDpDaGluYVwsJTIwVG9sbCUyMEZyZWU6ODAwLTg1OC0wNzU2Pg0KICAoR2xv
YmFsKSAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRlcylcbkphcGFuXCwgS2F3YXNha2k6
ICs4MS00NC01MjA2DQogODc3PHRlbDpKYXBhblwsJTIwS2F3YXNha2k6JTIwKzgxLTQ0LTUyMDY4
Nzc+IChHbG9iYWwpICAgICAgICAgICAgICAgSmFwYW4NCiBlc2UgKEphcGFuKVxuQ2FuYWRhXCwg
VG9yb250bzogKzEtNDE2LTc1ODIzMjk8dGVsOkNhbmFkYVwsJTIwVG9yb250bzolMjArMQ0KIC00
MTYtNzU4MjMyOT4gKEdsb2JhbCkgICAgICAgICAgICAgICBFbmdsaXNoIChVbml0ZWQgU3RhdGVz
KVxuRmluZCBhIGxvY2FsDQogIG51bWJlcjxodHRwczovL2RpYWxpbi5kZWxsLmNvbT5cblxuQ29u
ZmVyZW5jZSBJRDogMjI2MDc5MDdcbiBGb3Jnb3QgeW91ciANCiBkaWFsLWluIFBJTj88aHR0cHM6
Ly9kaWFsaW4uZGVsbC5jb20+IHxIZWxwPGh0dHBzOi8vZGlhbGluLmRlbGwuY29tL0RlbGxIZQ0K
IGxwLz5cblxuWyFPQyhbMTAzM10pIV1cbi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uDQogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCiAuLi4uLi4uLi4uLi4uXG5c
blxuDQpSUlVMRTpGUkVRPVdFRUtMWTtVTlRJTD0yMDE4MDgzMFQyMTAwMDBaO0lOVEVSVkFMPTE7
QllEQVk9TU87V0tTVD1TVQ0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpPcGVuQk1DIFJlZGZpc2gg
d29ya2luZyBncm91cCB3b3JraW5nIGNhbGwNCkRUU1RBUlQ7VFpJRD1DZW50cmFsIFN0YW5kYXJk
IFRpbWU6MjAxODAyMjZUMTYwMDAwDQpEVEVORDtUWklEPUNlbnRyYWwgU3RhbmRhcmQgVGltZToy
MDE4MDIyNlQxNzAwMDANClVJRDowNDAwMDAwMDgyMDBFMDAwNzRDNUI3MTAxQTgyRTAwODAwMDAw
MDAwRDBFNjMwREMxNkFGRDMwMTAwMDAwMDAwMDAwMDAwMA0KIDAxMDAwMDAwMDhDOEE4QkI2RTgy
MDc0NEE5MTFFQTEwQkU0ODg5RDk4DQpDTEFTUzpQVUJMSUMNClBSSU9SSVRZOjUNCkRUU1RBTVA6
MjAxODAyMjZUMjMxMzA5Wg0KVFJBTlNQOk9QQVFVRQ0KU1RBVFVTOkNPTkZJUk1FRA0KU0VRVUVO
Q0U6Mg0KTE9DQVRJT047TEFOR1VBR0U9ZW4tVVM6U2t5cGUgTWVldGluZw0KWC1NSUNST1NPRlQt
Q0RPLUFQUFQtU0VRVUVOQ0U6Mg0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOi01OTEwMzI2
Mg0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFUVVM6VEVOVEFUSVZFDQpYLU1JQ1JPU09GVC1DRE8t
SU5URU5ERURTVEFUVVM6QlVTWQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNFDQpY
LU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToxDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6MQ0K
WC1NSUNST1NPRlQtRElTQUxMT1ctQ09VTlRFUjpUUlVFDQpCRUdJTjpWQUxBUk0NCkRFU0NSSVBU
SU9OOlJFTUlOREVSDQpUUklHR0VSO1JFTEFURUQ9U1RBUlQ6LVBUMTVNDQpBQ1RJT046RElTUExB
WQ0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_9001b890eda64299819af218aada2b2dausx13mps334AMERDELLCOM_--
