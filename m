Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.214; helo=esa4.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="rBBMjWV6"; 
 dkim-atps=neutral
Received: from esa4.dell-outbound.iphmx.com (esa4.dell-outbound.iphmx.com
 [68.232.149.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4094Br73v4zF25w
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 06:36:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1522092981; x=1553628981;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=6t4zpP+x1Jgv2B46NChQ52eyI0lGSOD7MIwr55xXsRc=;
 b=rBBMjWV6n+E4k/xUrLiaBBlt/M9kmVOSNiUVfL75Y8HUDjZD2MB0xvW+
 L9CUCA6RdkYgSJtBuGLOct8SLZY+Ki6bNslcnAsC1yCAWrajeEkHARB1l
 QK8TM/kZUlJCkagWLIliaqL2cMWRxsuNFi0z2BC2CGuTsR1OJSNoc88hk k=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ETAACRSrlamD+a6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCTQGBRg5wKAqDUlmHJ40SgwWMAYZQgUk9CAMYAQoJhFkcg2M?=
 =?us-ascii?q?hNBgBAgEBAQEBAQIBAhABAQEBAQgLCwYoIwyCOCIRSykDAwEBAQEBAQEBASMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBARgCDUMCGwQBIgQCBDkCBgsSAQIyFgIEJi4CAQEDAQ0?=
 =?us-ascii?q?NhCJkD6wqgWspDIN3AQGESYIICgWFPoIaghSBDIYODAIBAQEYeTsmCiaCOoJUA?=
 =?us-ascii?q?4cKBH6EHIsXCAmFSYUFgUaCDIxBiROGY4ElHIILcE8NCIIuCYImgTGCH4UThQg?=
 =?us-ascii?q?BNW8BjT0EgSuBFwEB?=
X-IPAS-Result: =?us-ascii?q?A2ETAACRSrlamD+a6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CTQGBRg5wKAqDUlmHJ40SgwWMAYZQgUk9CAMYAQoJhFkcg2MhNBgBAgEBAQEBA?=
 =?us-ascii?q?QIBAhABAQEBAQgLCwYoIwyCOCIRSykDAwEBAQEBAQEBASMBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BAQEBARgCDUMCGwQBIgQCBDkCBgsSAQIyFgIEJi4CAQEDAQ0NhCJkD6wqgWspD?=
 =?us-ascii?q?IN3AQGESYIICgWFPoIaghSBDIYODAIBAQEYeTsmCiaCOoJUA4cKBH6EHIsXCAm?=
 =?us-ascii?q?FSYUFgUaCDIxBiROGY4ElHIILcE8NCIIuCYImgTGCH4UThQgBNW8BjT0EgSuBF?=
 =?us-ascii?q?wEB?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa4.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Mar 2018 14:36:15 -0500
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Mar 2018 01:27:15 +0600
X-LoopCount0: from 10.166.132.56
X-IronPort-AV: E=Sophos;i="5.48,365,1517896800"; 
 d="scan'208,217";a="156257578"
X-DLP: DLP_GlobalPCIDSS
CC: <Krishna.Kolakaluri@deltaww.com>
Subject: Canceled: OpenBMC Redfish working group working call
Thread-Topic: OpenBMC Redfish working group working call
Thread-Index: AdOvVmar7fl1B0WTTsGf2vp1X5Ow6wV40tRA
Importance: high
X-Priority: 1
Date: Mon, 26 Mar 2018 19:36:13 +0000
Message-ID: <823eeff634b34cca87522d3b95293a5b@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_823eeff634b34cca87522d3b95293a5bausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 26 Mar 2018 19:36:23 -0000

--_000_823eeff634b34cca87522d3b95293a5bausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Cancelling this invite in preference to Ed's meeting invite.
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



--_000_823eeff634b34cca87522d3b95293a5bausx13mps334AMERDELLCOM_
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
<div>Cancelling this invite in preference to Ed&#8217;s meeting invite.</di=
v>
<div>--</div>
<div>Michael</div>
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

--_000_823eeff634b34cca87522d3b95293a5bausx13mps334AMERDELLCOM_
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
PWVuLVVTOkNhbmNlbGxpbmcgdGhpcyBpbnZpdGUgaW4gcHJlZmVyZW5jZSB0byBFZOKAmXMgbQ0K
IGVldGluZyBpbnZpdGUuXG4tLVxuTWljaGFlbFxuXG5QZXIgbWVldGluZyBkZWNpc2lvblwsIHRo
aXMgbWVldGluZyBpbnZpdGUgDQogaXMgZm9yIHRoZSDigJxPcGVuQk1DIFJlZGZpc2ggd29ya2lu
ZyBncm91cOKAnS4gVGhpcyB3b3JraW5nIGdyb3VwIHdpbGwgbWUNCiBldCBldmVyeSBNb25kYXkg
YXQgNHBtIENTVCBhbmQgcHVibGlzaCBtZWV0aW5nIG1pbnV0ZXMgdG8gdGhlIG1haWxpbmcgbGlz
dA0KIC4gVGhlIHdvcmtpbmcgZ3JvdXAgaXMgb3BlbiB0byBhbnlib2R5IHdobyB3b3VsZCBsaWtl
IHRvIHBhcnRpY2lwYXRlIGluIGRlDQogdmVsb3BtZW50IG9mIFJlZGZpc2ggb24gT3BlbkJNQy5c
blxuVXBjb21pbmcgTWVldGluZyBBZ2VuZGFcbiAgICAgICAgMjAxOC0NCiAwMy0wNTogRWQgVGFu
b3VzIChJbnRlbCkgdG8gZ28gb3ZlciDigJhibWN3ZWLigJkgcmVxdWlyZW1lbnRzIGFuZCBpbXBs
ZW1lbg0KIHRhdGlvbi4gRGVwZW5kaW5nIG9uIHRpbWVcLCBNaWNoYWVsIEJyb3duIChEZWxsKSB0
byBzdGFydCBnb2luZyBvdmVyIGdvLXJlDQogZGZpc2ggcmVxdWlyZW1lbnRzIGFuZCBpbXBsZW1l
bnRhdGlvbi5cbiAgICAgICAgMjAxOC0wMy0xMjogTWljaGFlbCBCcm93biANCiAoRGVsbCkgb24g
dmFjYXRpb24uIChNYXkgbmVlZCBzb21lIGFsdGVybmF0aXZlIGhvc3QgZm9yIHRoaXMgbWVldGlu
ZyBkZXBlbg0KIGRpbmcgb24gaWYgSSBjYW4gZGlhbCBpbiBmcm9tIEljZWxhbmQpLlxuICAgICAg
ICAyMDE4LTAzLTE5OiBQYXVsIFZhbmNpbCB0DQogbyBkaXNjdXNzIHB5dGhvbiBpbXBsZW1lbnRh
dGlvblxuICAgICAgICAyMDE4LTAzLTI2OiBvcGVuXG5cblBhc3QgbWVldGluZ3MNCiA6XG4gICAg
ICAgIE1lZXRpbmcgTWludXRlcyAyMDE4LTAyLTI2OiBodHRwczovL2xpc3RzLm96bGFicy5vcmcv
cGlwZXJtYWlsLw0KIG9wZW5ibWMvMjAxOC1GZWJydWFyeS8wMTA5NTUuaHRtbFxuXG4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCiAuLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLlxuLS0+IEpvaW4gU2t5cGUgTWVldGluZzxodHRwczovL21l
ZXQuZGVsbC5jb20vbQ0KIGljaGFlbF9lX2Jyb3duL0pGRkhaTjFGPlxuICBUcm91YmxlIEpvaW5p
bmc/IFRyeSBTa3lwZSBXZWIgQXBwPGh0dHBzOi8vbWVlDQogdC5kZWxsLmNvbS9taWNoYWVsX2Vf
YnJvd24vSkZGSFpOMUY/c2w9MT5cbkpvaW4gYnkgcGhvbmVcbkludGVybmFsOjcyNC0yNjYNCiAz
PHRlbDpJbnRlcm5hbDo3MjQtMjY2Mz4gKEdsb2JhbCkgICAgICAgICAgICAgICBFbmdsaXNoIChV
bml0ZWQgU3RhdGVzKVxuVQ0KIG5pdGVkIFN0YXRlc1wsIEF1c3RpbjogKzEtNTEyLTcyNC0yNjYz
PHRlbDpVbml0ZWQlMjBTdGF0ZXNcLCUyMEF1c3RpbjolMjArDQogMS01MTItNzI0LTI2NjM+IChH
bG9iYWwpICAgICAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRlcylcblVuaXRlZCBTdGEN
CiB0ZXNcLCBUb2xsIEZyZWU6ICsxLTg3Ny00OTEtOTczODx0ZWw6VW5pdGVkJTIwU3RhdGVzXCwl
MjBUb2xsJTIwRnJlZTolMjArMQ0KIC04NzctNDkxLTk3Mzg+IChHbG9iYWwpICAgICAgICAgICAg
ICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRlcylcbkluZGlhXCwgUmVsDQogaWFuY2U6MTgwMC0zMC0x
MDkwNDU8dGVsOkluZGlhXCwlMjBSZWxpYW5jZToxODAwLTMwLTEwOTA0NT4gKEdsb2JhbCkgICAg
ICANCiAgICAgIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5JbmRpYVwsIEJTTkw6MTgwMC00MjUt
NTEwMTx0ZWw6SW5kaWFcLCUyMEJTTg0KIEw6MTgwMC00MjUtNTEwMT4gKEdsb2JhbCkgICAgICAg
ICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRlcylcbklyZWxhbmRcLCBEDQogdWJsaW46ICszNTMt
MS0yNzk0MDYyPHRlbDpJcmVsYW5kXCwlMjBEdWJsaW46JTIwKzM1My0xLTI3OTQwNjI+IChHbG9i
YWwpICANCiAgICAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIEtpbmdkb20pXG5FbmdsYW5kXCwg
QnJhY2tuZWxsOiArNDQtMTM0NC0zNzIwNA0KIDA8dGVsOkVuZ2xhbmRcLCUyMEJyYWNrbmVsbDol
MjArNDQtMTM0NC0zNzIwNDA+IChHbG9iYWwpICAgICAgICAgICAgICAgRW5nDQogbGlzaCAoVW5p
dGVkIEtpbmdkb20pXG5NYWxheXNpYVwsIFBlbmFuZzogKzYwLTQtNjMzNjY2Njx0ZWw6TWFsYXlz
aWFcLCUyMFANCiBlbmFuZzolMjArNjAtNC02MzM2NjY2PiAoR2xvYmFsKSAgICAgICAgICAgICAg
IEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5Ccg0KIGF6aWw6MzAwMy0zMzU1PHRlbDpCcmF6aWw6
MzAwMy0zMzU1PiAoR2xvYmFsKSAgICAgICAgICAgICAgICAgUG9ydHVndWVzZSAoDQogQnJhemls
KVxuQ2hpbmFcLCBUb2xsIEZyZWU6ODAwLTg1OC0wNzU2PHRlbDpDaGluYVwsJTIwVG9sbCUyMEZy
ZWU6ODAwLTg1OC0NCiAwNzU2PiAoR2xvYmFsKSAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0
YXRlcylcbkphcGFuXCwgS2F3YXNha2k6ICs4MS00NA0KIC01MjA2ODc3PHRlbDpKYXBhblwsJTIw
S2F3YXNha2k6JTIwKzgxLTQ0LTUyMDY4Nzc+IChHbG9iYWwpICAgICAgICAgICAgICAgDQogSmFw
YW5lc2UgKEphcGFuKVxuQ2FuYWRhXCwgVG9yb250bzogKzEtNDE2LTc1ODIzMjk8dGVsOkNhbmFk
YVwsJTIwVG9yb250bzoNCiAlMjArMS00MTYtNzU4MjMyOT4gKEdsb2JhbCkgICAgICAgICAgICAg
ICBFbmdsaXNoIChVbml0ZWQgU3RhdGVzKVxuRmluZCBhIA0KIGxvY2FsIG51bWJlcjxodHRwczov
L2RpYWxpbi5kZWxsLmNvbT5cblxuQ29uZmVyZW5jZSBJRDogMjI2MDc5MDdcbiBGb3Jnb3QgDQog
eW91ciBkaWFsLWluIFBJTj88aHR0cHM6Ly9kaWFsaW4uZGVsbC5jb20+IHxIZWxwPGh0dHBzOi8v
ZGlhbGluLmRlbGwuY29tL0QNCiBlbGxIZWxwLz5cblxuWyFPQyhbMTAzM10pIV1cbi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KIC4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
DQogLi4uLi4uLi4uLi4uLi4uLi4uXG5cblxuDQpSUlVMRTpGUkVRPVdFRUtMWTtVTlRJTD0yMDE4
MDgzMFQyMTAwMDBaO0lOVEVSVkFMPTE7QllEQVk9TU87V0tTVD1TVQ0KRVhEQVRFO1RaSUQ9Q2Vu
dHJhbCBTdGFuZGFyZCBUaW1lOjIwMTgwMzEyVDE2MDAwMCwyMDE4MDMxOVQxNjAwMDANClNVTU1B
Ulk7TEFOR1VBR0U9ZW4tVVM6Q2FuY2VsZWQ6IE9wZW5CTUMgUmVkZmlzaCB3b3JraW5nIGdyb3Vw
IHdvcmtpbmcgY2FsbA0KRFRTVEFSVDtUWklEPUNlbnRyYWwgU3RhbmRhcmQgVGltZToyMDE4MDIy
NlQxNjAwMDANCkRURU5EO1RaSUQ9Q2VudHJhbCBTdGFuZGFyZCBUaW1lOjIwMTgwMjI2VDE3MDAw
MA0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDBEMEU2MzBEQzE2
QUZEMzAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAwOEM4QThCQjZFODIwNzQ0QTkxMUVBMTBC
RTQ4ODlEOTgNCkNMQVNTOlBVQkxJQw0KUFJJT1JJVFk6MQ0KRFRTVEFNUDoyMDE4MDMyNlQxOTM2
MTFaDQpUUkFOU1A6T1BBUVVFDQpTVEFUVVM6Q0FOQ0VMTEVEDQpTRVFVRU5DRTo1DQpMT0NBVElP
TjtMQU5HVUFHRT1lbi1VUzpTa3lwZSBNZWV0aW5nDQpYLU1JQ1JPU09GVC1DRE8tQVBQVC1TRVFV
RU5DRTo1DQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBUSUQ6LTU5MTAzMjYyDQpYLU1JQ1JPU09G
VC1DRE8tQlVTWVNUQVRVUzpGUkVFDQpYLU1JQ1JPU09GVC1DRE8tSU5URU5ERURTVEFUVVM6RlJF
RQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNFDQpYLU1JQ1JPU09GVC1DRE8tSU1Q
T1JUQU5DRToyDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6MQ0KWC1NSUNST1NPRlQtRElTQUxM
T1ctQ09VTlRFUjpUUlVFDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=

--_000_823eeff634b34cca87522d3b95293a5bausx13mps334AMERDELLCOM_--
