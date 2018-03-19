Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="fnwYBdt0"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 404pFB6rmlzF0xX
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 07:53:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1521492781; x=1553028781;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=gve/KIHsmrxWgwggU3XadhqVm8/ozv/vcyrnCB115wA=;
 b=fnwYBdt0btUMvqmxhuvku5GgXBryfHZYQJhvtlGH3BOxxaDq7HruUTbN
 L7ar13+RDXq3FfXH2lNxtBOvmu0Ot+vr+ubfG6IFwC79MaZdAOVc8IcVO
 7CGPLypZ7AkkqBxL6ezMV5Yy4NJXtl9gpIj1dYJG89pgrtn19L6WdgVfH Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EkAABMIrBah8qZ6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCWgGBSxByKAqDU2WJN418gxmMfYcDgVBCCAMYAQqEbRyDJiE?=
 =?us-ascii?q?0GAECAQEBAQEBAgECEAEBAQoLCQgoIwyCOCIRSykDAwEBAQEBAQEBASMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBARgCDUMCGwQBIgQCBDkCBgsSAQIyFgIEJi4CAQEDAQ0NhCx?=
 =?us-ascii?q?kD6k0gWwrD4QKAQGETYF/CgWFM4IVgymGMgwCAQEBGIEBOyYKJoJBgmEDhyUBA?=
 =?us-ascii?q?4EChEV0ilIJCoV9hSKBXYIhgVeDfIdkiTCHBYEqHoILcE8NCIIuCYI4gTmCH4U?=
 =?us-ascii?q?ThQgBNnQBjg0EgS2BGAEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2EkAABMIrBah8qZ6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CWgGBSxByKAqDU2WJN418gxmMfYcDgVBCCAMYAQqEbRyDJiE0GAECAQEBAQEBA?=
 =?us-ascii?q?gECEAEBAQoLCQgoIwyCOCIRSykDAwEBAQEBAQEBASMBAQEBAQEBAQEBAQEBAQE?=
 =?us-ascii?q?BARgCDUMCGwQBIgQCBDkCBgsSAQIyFgIEJi4CAQEDAQ0NhCxkD6k0gWwrD4QKA?=
 =?us-ascii?q?QGETYF/CgWFM4IVgymGMgwCAQEBGIEBOyYKJoJBgmEDhyUBA4EChEV0ilIJCoV?=
 =?us-ascii?q?9hSKBXYIhgVeDfIdkiTCHBYEqHoILcE8NCIIuCYI4gTmCH4UThQgBNnQBjg0Eg?=
 =?us-ascii?q?S2BGAEBAQ?=
Received: from esa2.dell-outbound2.iphmx.com ([68.232.153.202])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Mar 2018 15:52:57 -0500
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2018 02:52:16 +0600
X-LoopCount0: from 10.166.132.56
X-IronPort-AV: E=Sophos;i="5.48,332,1517896800"; 
 d="scan'208,217";a="1230696040"
X-DLP: DLP_GlobalPCIDSS
CC: <Krishna.Kolakaluri@deltaww.com>
Subject: Canceled: (non-cancellation) OpenBMC Redfish working group working
 call
Thread-Topic: (non-cancellation) OpenBMC Redfish working group working call
Thread-Index: AdOvVmar7fl1B0WTTsGf2vp1X5Ow6wQbepAQ
Importance: high
X-Priority: 1
Date: Mon, 19 Mar 2018 20:53:28 +0000
Message-ID: <9f3dabdd00224279a55bb0276f22b0fb@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_9f3dabdd00224279a55bb0276f22b0fbausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 19 Mar 2018 20:53:36 -0000

--_000_9f3dabdd00224279a55bb0276f22b0fbausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

THIS MEETING IS NOT CANCELLED: because Ed has a recurring meeting scheduled=
 with a different dialin, I am removing today's instance so that people are=
 not confused about which dial-in to use. Please use Ed's.
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



--_000_9f3dabdd00224279a55bb0276f22b0fbausx13mps334AMERDELLCOM_
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
<div>THIS MEETING IS NOT CANCELLED: because Ed has a recurring meeting sche=
duled with a different dialin, I am removing today&#8217;s instance so that=
 people are not confused about which dial-in to use. Please use Ed&#8217;s.=
</div>
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

--_000_9f3dabdd00224279a55bb0276f22b0fbausx13mps334AMERDELLCOM_
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
PWVuLVVTOlRISVMgTUVFVElORyBJUyBOT1QgQ0FOQ0VMTEVEOiBiZWNhdXNlIEVkIGhhcyBhIA0K
IHJlY3VycmluZyBtZWV0aW5nIHNjaGVkdWxlZCB3aXRoIGEgZGlmZmVyZW50IGRpYWxpblwsIEkg
YW0gcmVtb3ZpbmcgdG9kYXkNCiDigJlzIGluc3RhbmNlIHNvIHRoYXQgcGVvcGxlIGFyZSBub3Qg
Y29uZnVzZWQgYWJvdXQgd2hpY2ggZGlhbC1pbiB0byB1c2UuIA0KIFBsZWFzZSB1c2UgRWTigJlz
LlxuLS1cbk1pY2hhZWxcblxuUGVyIG1lZXRpbmcgZGVjaXNpb25cLCB0aGlzIG1lZXRpbmcgaW52
DQogaXRlIGlzIGZvciB0aGUg4oCcT3BlbkJNQyBSZWRmaXNoIHdvcmtpbmcgZ3JvdXDigJ0uIFRo
aXMgd29ya2luZyBncm91cCB3aWwNCiBsIG1lZXQgZXZlcnkgTW9uZGF5IGF0IDRwbSBDU1QgYW5k
IHB1Ymxpc2ggbWVldGluZyBtaW51dGVzIHRvIHRoZSBtYWlsaW5nIA0KIGxpc3QuIFRoZSB3b3Jr
aW5nIGdyb3VwIGlzIG9wZW4gdG8gYW55Ym9keSB3aG8gd291bGQgbGlrZSB0byBwYXJ0aWNpcGF0
ZSBpDQogbiBkZXZlbG9wbWVudCBvZiBSZWRmaXNoIG9uIE9wZW5CTUMuXG5cblVwY29taW5nIE1l
ZXRpbmcgQWdlbmRhXG4gICAgICAgIDINCiAwMTgtMDMtMDU6IEVkIFRhbm91cyAoSW50ZWwpIHRv
IGdvIG92ZXIg4oCYYm1jd2Vi4oCZIHJlcXVpcmVtZW50cyBhbmQgaW1wbA0KIGVtZW50YXRpb24u
IERlcGVuZGluZyBvbiB0aW1lXCwgTWljaGFlbCBCcm93biAoRGVsbCkgdG8gc3RhcnQgZ29pbmcg
b3ZlciBnDQogby1yZWRmaXNoIHJlcXVpcmVtZW50cyBhbmQgaW1wbGVtZW50YXRpb24uXG4gICAg
ICAgIDIwMTgtMDMtMTI6IE1pY2hhZWwgQnINCiBvd24gKERlbGwpIG9uIHZhY2F0aW9uLiAoTWF5
IG5lZWQgc29tZSBhbHRlcm5hdGl2ZSBob3N0IGZvciB0aGlzIG1lZXRpbmcgZA0KIGVwZW5kaW5n
IG9uIGlmIEkgY2FuIGRpYWwgaW4gZnJvbSBJY2VsYW5kKS5cbiAgICAgICAgMjAxOC0wMy0xOTog
UGF1bCBWYW5jDQogaWwgdG8gZGlzY3VzcyBweXRob24gaW1wbGVtZW50YXRpb25cbiAgICAgICAg
MjAxOC0wMy0yNjogb3BlblxuXG5QYXN0IG1lZXQNCiBpbmdzOlxuICAgICAgICBNZWV0aW5nIE1p
bnV0ZXMgMjAxOC0wMi0yNjogaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybQ0KIGFpbC9v
cGVuYm1jLzIwMTgtRmVicnVhcnkvMDEwOTU1Lmh0bWxcblxuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uDQogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi5cbi0tPiBKb2luIFNreXBlIE1lZXRpbmc8aHR0cHM6Ly9tZWV0LmRlbGwuYw0KIG9t
L21pY2hhZWxfZV9icm93bi9KRkZIWk4xRj5cbiAgVHJvdWJsZSBKb2luaW5nPyBUcnkgU2t5cGUg
V2ViIEFwcDxodHRwczovDQogL21lZXQuZGVsbC5jb20vbWljaGFlbF9lX2Jyb3duL0pGRkhaTjFG
P3NsPTE+XG5Kb2luIGJ5IHBob25lXG5JbnRlcm5hbDo3MjQNCiAtMjY2Mzx0ZWw6SW50ZXJuYWw6
NzI0LTI2NjM+IChHbG9iYWwpICAgICAgICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRlcw0K
IClcblVuaXRlZCBTdGF0ZXNcLCBBdXN0aW46ICsxLTUxMi03MjQtMjY2Mzx0ZWw6VW5pdGVkJTIw
U3RhdGVzXCwlMjBBdXN0aW46DQogJTIwKzEtNTEyLTcyNC0yNjYzPiAoR2xvYmFsKSAgICAgICAg
ICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5Vbml0ZWQNCiAgU3RhdGVzXCwgVG9sbCBG
cmVlOiArMS04NzctNDkxLTk3Mzg8dGVsOlVuaXRlZCUyMFN0YXRlc1wsJTIwVG9sbCUyMEZyZWU6
JQ0KIDIwKzEtODc3LTQ5MS05NzM4PiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xpc2ggKFVu
aXRlZCBTdGF0ZXMpXG5JbmRpYVwsDQogIFJlbGlhbmNlOjE4MDAtMzAtMTA5MDQ1PHRlbDpJbmRp
YVwsJTIwUmVsaWFuY2U6MTgwMC0zMC0xMDkwNDU+IChHbG9iYWwpICANCiAgICAgICAgICBFbmds
aXNoIChVbml0ZWQgU3RhdGVzKVxuSW5kaWFcLCBCU05MOjE4MDAtNDI1LTUxMDE8dGVsOkluZGlh
XCwlMg0KIDBCU05MOjE4MDAtNDI1LTUxMDE+IChHbG9iYWwpICAgICAgICAgICAgIEVuZ2xpc2gg
KFVuaXRlZCBTdGF0ZXMpXG5JcmVsYW5kDQogXCwgRHVibGluOiArMzUzLTEtMjc5NDA2Mjx0ZWw6
SXJlbGFuZFwsJTIwRHVibGluOiUyMCszNTMtMS0yNzk0MDYyPiAoR2xvYmENCiBsKSAgICAgICAg
ICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9tKVxuRW5nbGFuZFwsIEJyYWNrbmVsbDogKzQ0
LTEzNDQtMw0KIDcyMDQwPHRlbDpFbmdsYW5kXCwlMjBCcmFja25lbGw6JTIwKzQ0LTEzNDQtMzcy
MDQwPiAoR2xvYmFsKSAgICAgICAgICAgICAgDQogIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9tKVxu
TWFsYXlzaWFcLCBQZW5hbmc6ICs2MC00LTYzMzY2NjY8dGVsOk1hbGF5c2lhXCwNCiAlMjBQZW5h
bmc6JTIwKzYwLTQtNjMzNjY2Nj4gKEdsb2JhbCkgICAgICAgICAgICAgICBFbmdsaXNoIChVbml0
ZWQgU3RhdGVzKQ0KIFxuQnJhemlsOjMwMDMtMzM1NTx0ZWw6QnJhemlsOjMwMDMtMzM1NT4gKEds
b2JhbCkgICAgICAgICAgICAgICAgIFBvcnR1Z3VlDQogc2UgKEJyYXppbClcbkNoaW5hXCwgVG9s
bCBGcmVlOjgwMC04NTgtMDc1Njx0ZWw6Q2hpbmFcLCUyMFRvbGwlMjBGcmVlOjgwMC0NCiA4NTgt
MDc1Nj4gKEdsb2JhbCkgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5KYXBhblws
IEthd2FzYWtpOiArOA0KIDEtNDQtNTIwNjg3Nzx0ZWw6SmFwYW5cLCUyMEthd2FzYWtpOiUyMCs4
MS00NC01MjA2ODc3PiAoR2xvYmFsKSAgICAgICAgICAgDQogICAgIEphcGFuZXNlIChKYXBhbilc
bkNhbmFkYVwsIFRvcm9udG86ICsxLTQxNi03NTgyMzI5PHRlbDpDYW5hZGFcLCUyMFRvcm8NCiBu
dG86JTIwKzEtNDE2LTc1ODIzMjk+IChHbG9iYWwpICAgICAgICAgICAgICAgRW5nbGlzaCAoVW5p
dGVkIFN0YXRlcylcbkZpbg0KIGQgYSBsb2NhbCBudW1iZXI8aHR0cHM6Ly9kaWFsaW4uZGVsbC5j
b20+XG5cbkNvbmZlcmVuY2UgSUQ6IDIyNjA3OTA3XG4gRm9yDQogZ290IHlvdXIgZGlhbC1pbiBQ
SU4/PGh0dHBzOi8vZGlhbGluLmRlbGwuY29tPiB8SGVscDxodHRwczovL2RpYWxpbi5kZWxsLmMN
CiBvbS9EZWxsSGVscC8+XG5cblshT0MoWzEwMzNdKSFdXG4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLg0KIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQogLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLlxuXG5cbg0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpDYW5jZWxlZDogKG5vbi1jYW5j
ZWxsYXRpb24pIE9wZW5CTUMgUmVkZmlzaCB3b3JraW5nDQogIGdyb3VwIHdvcmtpbmcgY2FsbA0K
RFRTVEFSVDtUWklEPUNlbnRyYWwgU3RhbmRhcmQgVGltZToyMDE4MDMxOVQxNjAwMDANCkRURU5E
O1RaSUQ9Q2VudHJhbCBTdGFuZGFyZCBUaW1lOjIwMTgwMzE5VDE3MDAwMA0KVUlEOjA0MDAwMDAw
ODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDBEMEU2MzBEQzE2QUZEMzAxMDAwMDAwMDAw
MDAwMDAwDQogMDEwMDAwMDAwOEM4QThCQjZFODIwNzQ0QTkxMUVBMTBCRTQ4ODlEOTgNClJFQ1VS
UkVOQ0UtSUQ7VFpJRD1DZW50cmFsIFN0YW5kYXJkIFRpbWU6MjAxODAzMTlUMTYwMDAwDQpDTEFT
UzpQVUJMSUMNClBSSU9SSVRZOjENCkRUU1RBTVA6MjAxODAzMTlUMjA1MzIyWg0KVFJBTlNQOk9Q
QVFVRQ0KU1RBVFVTOkNBTkNFTExFRA0KU0VRVUVOQ0U6NA0KTE9DQVRJT047TEFOR1VBR0U9ZW4t
VVM6U2t5cGUgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6NA0KWC1NSUNS
T1NPRlQtQ0RPLU9XTkVSQVBQVElEOi01OTEwMzI2Mg0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFU
VVM6RlJFRQ0KWC1NSUNST1NPRlQtQ0RPLUlOVEVOREVEU1RBVFVTOkZSRUUNClgtTUlDUk9TT0ZU
LUNETy1BTExEQVlFVkVOVDpGQUxTRQ0KWC1NSUNST1NPRlQtQ0RPLUlNUE9SVEFOQ0U6Mg0KWC1N
SUNST1NPRlQtQ0RPLUlOU1RUWVBFOjMNClgtTUlDUk9TT0ZULURJU0FMTE9XLUNPVU5URVI6VFJV
RQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_9f3dabdd00224279a55bb0276f22b0fbausx13mps334AMERDELLCOM_--
