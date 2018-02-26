Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="y5bZgxeA"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqw6j08hfzF17h
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 08:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519680684; x=1551216684;
 h=from:to:subject:date:message-id:mime-version;
 bh=jYY0UvK2nZ6V/AfIjFmWWDtUrqtkI5PhjXpVu1hMtJo=;
 b=y5bZgxeA44nJdMZBKsMfIwpq6MlbAXC/POHc9HIgtIPml3sY518+zx7Q
 wbw1Vyb//BYeG4anoqEtaCw+Rbvg41tAh85dM86fIZX+q5EFcrAOrnLGn
 Ga269iCAvfNFD5MEuHQ3wVTF35/pSqBXzmXY2WmQpltt9eMXE0D2hz9YW E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EwAACpfJRamMmZ6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCWgGBShBwKAqDSmuJN41+gxiOH4dmgVNDBwMjhSyCK1QYAQI?=
 =?us-ascii?q?BAQEBAQECAQIQAQEBAQEICwsGKC+COCINBEsnAy8BAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBARUCDUMCHyMEBjkCIwE0FgIEVAIBAQMBGoQkZBCsK4FtOoQNAQGEYoIUAQE?=
 =?us-ascii?q?IAQEBARUKBYdCgz2CfQEvgyIMAgIBGIEMO1aCRoJlBYoTgReGTo9pCQqBdIU7j?=
 =?us-ascii?q?F6SaYxRiSSBLx6CCnCDEgmCSoE8FAE2d4s/gRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2EwAACpfJRamMmZ6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CWgGBShBwKAqDSmuJN41+gxiOH4dmgVNDBwMjhSyCK1QYAQIBAQEBAQECAQIQA?=
 =?us-ascii?q?QEBAQEICwsGKC+COCINBEsnAy8BAQEBAQEBAQEBAQEBAQEBAQEBARUCDUMCHyM?=
 =?us-ascii?q?EBjkCIwE0FgIEVAIBAQMBGoQkZBCsK4FtOoQNAQGEYoIUAQEIAQEBARUKBYdCg?=
 =?us-ascii?q?z2CfQEvgyIMAgIBGIEMO1aCRoJlBYoTgReGTo9pCQqBdIU7jF6SaYxRiSSBLx6?=
 =?us-ascii?q?CCnCDEgmCSoE8FAE2d4s/gRcBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2018 15:31:22 -0600
From: <Michael.E.Brown@dell.com>
To: <openbmc@lists.ozlabs.org>, <Paul.Vancil@dell.com>, <hramasub@in.ibm.com>, 
 <Balaji.B.Rao@dell.com>, <bradleyb@fuzziesquirrel.com>,
 <jwcarman@us.ibm.com>, <pradeep.kumar36@tcs.com>, <rolfb@us.ibm.com>,
 <Chris.Ong@microsoft.com>, <alirhas@microsoft.com>, <ed.tanous@intel.com>,
 <yupalani@microsoft.com>
Received: from ausc60ps301.us.dell.com ([143.166.148.206])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 03:27:10 +0600
X-LoopCount0: from 10.166.135.98
X-IronPort-AV: E=Sophos;i="5.47,398,1515477600"; 
 d="scan'208,217";a="1107128739"
X-DLP: DLP_GlobalPCIDSS
Subject: Redfish call
Thread-Topic: Redfish call
Thread-Index: AdOvSMs+wSKC/fh+RNqIUbMPGEEx8wAAJsIQ
Date: Mon, 26 Feb 2018 21:33:12 +0000
Message-ID: <adc068b15f1f43e4852be535a66ae67b@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_adc068b15f1f43e4852be535a66ae67bausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 26 Feb 2018 21:33:18 -0000

--_000_adc068b15f1f43e4852be535a66ae67bausx13mps334AMERDELLCOM_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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



--_000_adc068b15f1f43e4852be535a66ae67bausx13mps334AMERDELLCOM_
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
<font face=3D"Times New Roman" size=3D"3"><span style=3D"font-size:12pt;"><=
a name=3D"_InsertRtfSavedPosition"></a>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Cert=
ainly a little bit later sending out this call than I anticipated, but it s=
ounds like everybody thought today was a good time to kick everything off.<=
/span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Stea=
ling Ed&#8217;s Initial agenda proposal:</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Init=
ial introductions</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">Over=
view of existing implementations and work</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bmcweb implementation by Intel &#821=
1; Ed Tanous</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Go-redfish implementation by Dell &#=
8211; Michael Brown</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Redfish implementation by Microsoft =
&#8211; Ali Larijani/Yugi Mani/Bryan Kelly</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Others?</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"1" color=3D"#404040"><span style=3D"fon=
t-size:8pt;">..............................................................=
...........................................................................=
</span></font></div>
<a name=3D"OutJoinLink"></a>
<div><font face=3D"Calibri" size=3D"4" color=3D"#0066CC"><span style=3D"fon=
t-size:14pt;"><font face=3D"Wingdings">=E0</font> <a href=3D"https://meet.d=
ell.com/michael_e_brown/JFFHZN1F"><font size=3D"4"><span style=3D"font-size=
:16pt;"><u>Join Skype Meeting</u></span></font></a><font color=3D"black">&n=
bsp;
</font><a name=3D"OutSharedNoteBorder"></a>&nbsp;&nbsp; <a name=3D"OutShare=
dNoteLink"></a> </span></font></div>
<div style=3D"margin-top:3pt;margin-bottom:12pt;padding-left:16pt;"><font f=
ace=3D"Calibri" size=3D"2"><span style=3D"font-size:10pt;">Trouble Joining?=
 <a href=3D"https://meet.dell.com/michael_e_brown/JFFHZN1F?sl=3D1"><font co=
lor=3D"#0066CC"><u>Try Skype Web App</u></font></a><u>
</u></span></font></div>
<div><font face=3D"Calibri" size=3D"3"><span style=3D"font-size:13pt;">Join=
 by phone</span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:Internal:724-2663"><font size=3D"2"=
 color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Internal:724-2663</u>=
</span></font></a><font size=3D"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; English (United States) </span></font></span></font></div=
>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:United States, Austin: &#43;1-512-7=
24-2663"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"=
><u>United States, Austin: &#43;1-512-724-2663</u></span></font></a><font s=
ize=3D"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English (Uni=
ted States) </span></font><font size=3D"1"><span style=3D"font-size:3pt;"> =
</span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:United States, Toll Free: &#43;1-87=
7-491-9738"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10p=
t;"><u>United States, Toll Free: &#43;1-877-491-9738</u></span></font></a><=
font size=3D"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; English (United States) </span></font><font size=3D"1"><s=
pan style=3D"font-size:3pt;"> </span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:India, Reliance:1800-30-109045"><fo=
nt size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>India, R=
eliance:1800-30-109045</u></span></font></a><font size=3D"2"><span style=3D=
"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English (Uni=
ted States) </span></font><font size=3D"1"><span style=3D"font-size:3pt;"> =
</span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:India, BSNL:1800-425-5101"><font si=
ze=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>India, BSNL:1=
800-425-5101</u></span></font></a><font size=3D"2"><span style=3D"font-size=
:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; English (United States) </span></font><font size=3D"1"><s=
pan style=3D"font-size:3pt;"> </span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:Ireland, Dublin: &#43;353-1-2794062=
"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Ire=
land, Dublin: &#43;353-1-2794062</u></span></font></a><font size=3D"2"><spa=
n style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English (United Kingdom) </span></font><font =
size=3D"1"><span style=3D"font-size:3pt;"> </span></font></span></font></di=
v>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:England, Bracknell: &#43;44-1344-37=
2040"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u=
>England, Bracknell: &#43;44-1344-372040</u></span></font></a><font size=3D=
"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; English (United Kingdom) </span></font><font size=3D"1"><span style=
=3D"font-size:3pt;"> </span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:Malaysia, Penang: &#43;60-4-6336666=
"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Mal=
aysia, Penang: &#43;60-4-6336666</u></span></font></a><font size=3D"2"><spa=
n style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English (United States) </span></font><font s=
ize=3D"1"><span style=3D"font-size:3pt;"> </span></font></span></font></div=
>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:Brazil:3003-3355"><font size=3D"2" =
color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Brazil:3003-3355</u></=
span></font></a><font size=3D"2"><span style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Portuguese (Brazil) </span></font><font size=3D"1">=
<span style=3D"font-size:3pt;"> </span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:China, Toll Free:800-858-0756"><fon=
t size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>China, To=
ll Free:800-858-0756</u></span></font></a><font size=3D"2"><span style=3D"f=
ont-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Englis=
h (United States) </span></font><font size=3D"1"><span style=3D"font-size:3=
pt;"> </span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:Japan, Kawasaki: &#43;81-44-5206877=
"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Jap=
an, Kawasaki: &#43;81-44-5206877</u></span></font></a><font size=3D"2"><spa=
n style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Japanese (Japan) </span></font><font size=3D"=
1"><span style=3D"font-size:3pt;"> </span></font></span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"tel:Canada, Toronto: &#43;1-416-7582329=
"><font size=3D"2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Can=
ada, Toronto: &#43;1-416-7582329</u></span></font></a><font size=3D"2"><spa=
n style=3D"font-size:10pt;">
(Global)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English (United States) </span></font><font s=
ize=3D"1"><span style=3D"font-size:3pt;"> </span></font></span></font></div=
>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;"><a href=3D"https://dialin.dell.com"><font size=3D"=
2" color=3D"#0066CC"><span style=3D"font-size:10pt;"><u>Find a local number=
</u></span></font></a> </span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:11pt;">&nbsp;</span></font></div>
<div style=3D"margin-bottom:2pt;"><font face=3D"Calibri" size=3D"2"><span s=
tyle=3D"font-size:10pt;">Conference ID: 22607907</span></font></div>
<div><font face=3D"Calibri" size=3D"1"><span style=3D"font-size:3pt;"> <a h=
ref=3D"https://dialin.dell.com"><font size=3D"2" color=3D"#0066CC"><span st=
yle=3D"font-size:10pt;"><u>Forgot your dial-in PIN?</u></span></font></a> <=
font size=3D"2"><span style=3D"font-size:11pt;">|</span></font><a href=3D"h=
ttps://dialin.dell.com/DellHelp/"><font size=3D"2" color=3D"#0066CC"><span =
style=3D"font-size:10pt;"><u>Help</u></span></font></a>&nbsp;&nbsp;&nbsp;&n=
bsp;
</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"1" color=3D"#CFCFCF"><span style=3D"fon=
t-size:1pt;"><font size=3D"1"><span style=3D"font-size:0.65pt;"><sub>[!OC([=
1033])!]</sub></span></font></span></font></div>
<div style=3D"margin-bottom:10pt;"><font face=3D"Calibri" size=3D"1" color=
=3D"#404040"><span style=3D"font-size:8pt;">...............................=
...........................................................................=
...............................</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
<div><font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">&nbs=
p;</span></font></div>
</span></font>
</body>
</html>

--_000_adc068b15f1f43e4852be535a66ae67bausx13mps334AMERDELLCOM_
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
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTpNQUlMVE86b3BlbmJtDQogY0Bs
aXN0cy5vemxhYnMub3JnDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1O
RUVEUy1BQ1RJT047UlNWUD1UUlVFOk1BSUxUTzpQYXVsX1YNCiBhbmNpbEBEZWxsLmNvbQ0KQVRU
RU5ERUU7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJV
RTpNQUlMVE86aHJhbWFzDQogdWJAaW4uaWJtLmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFSVElD
SVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTpNQUlMVE86QmFsYWppDQogX0Jf
UmFvQGRlbGwuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVE
Uy1BQ1RJT047UlNWUD1UUlVFOk1BSUxUTzpicmFkbGUNCiB5YkBmdXp6aWVzcXVpcnJlbC5jb20N
CkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PVRSVUU6TUFJTFRPOmp3Y2FybQ0KIGFuQHVzLmlibS5jb20NCkFUVEVOREVFO1JPTEU9UkVRLVBB
UlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU6TUFJTFRPOnByYWRlZQ0K
IHAua3VtYXIzNkB0Y3MuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RB
VD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFOk1BSUxUTzpyb2xmYkANCiB1cy5pYm0uY29tDQpBVFRF
TkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVF
Ok1BSUxUTzpDaHJpcy4NCiBPbmdAbWljcm9zb2Z0LmNvbQ0KQVRURU5ERUU7Uk9MRT1SRVEtUEFS
VElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTpNQUlMVE86YWxpcmhhDQog
c0BtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1O
RUVEUy1BQ1RJT047UlNWUD1UUlVFOk1BSUxUTzplZC50YW4NCiBvdXNAaW50ZWwuY29tDQpBVFRF
TkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVF
Ok1BSUxUTzp5dXBhbGENCiBuaUBtaWNyb3NvZnQuY29tDQpERVNDUklQVElPTjtMQU5HVUFHRT1l
bi1VUzpDZXJ0YWlubHkgYSBsaXR0bGUgYml0IGxhdGVyIHNlbmRpbmcgb3V0IHRoaXMgY2ENCiBs
bCB0aGFuIEkgYW50aWNpcGF0ZWRcLCBidXQgaXQgc291bmRzIGxpa2UgZXZlcnlib2R5IHRob3Vn
aHQgdG9kYXkgd2FzIGEgZw0KIG9vZCB0aW1lIHRvIGtpY2sgZXZlcnl0aGluZyBvZmYuXG5cblN0
ZWFsaW5nIEVk4oCZcyBJbml0aWFsIGFnZW5kYSBwcm9wb3NhDQogbDpcblxuSW5pdGlhbCBpbnRy
b2R1Y3Rpb25zXG5PdmVydmlldyBvZiBleGlzdGluZyBpbXBsZW1lbnRhdGlvbnMgYW5kIHdvcmsN
CiBcbiAgICAgICAgQm1jd2ViIGltcGxlbWVudGF0aW9uIGJ5IEludGVsIOKAkyBFZCBUYW5vdXNc
biAgICAgICAgR28tcmVkZmlzaA0KICBpbXBsZW1lbnRhdGlvbiBieSBEZWxsIOKAkyBNaWNoYWVs
IEJyb3duXG4gICAgICAgIFJlZGZpc2ggaW1wbGVtZW50YXRpb24gDQogYnkgTWljcm9zb2Z0IOKA
kyBBbGkgTGFyaWphbmkvWXVnaSBNYW5pL0JyeWFuIEtlbGx5XG4gICAgICAgIE90aGVycz9cblxu
Li4NCiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLg0KIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi5cbi0tPiBKb2luIFNrDQogeXBlIE1lZXRpbmc8
aHR0cHM6Ly9tZWV0LmRlbGwuY29tL21pY2hhZWxfZV9icm93bi9KRkZIWk4xRj5cbiAgVHJvdWJs
ZSBKb2kNCiBuaW5nPyBUcnkgU2t5cGUgV2ViIEFwcDxodHRwczovL21lZXQuZGVsbC5jb20vbWlj
aGFlbF9lX2Jyb3duL0pGRkhaTjFGP3NsPQ0KIDE+XG5Kb2luIGJ5IHBob25lXG5JbnRlcm5hbDo3
MjQtMjY2Mzx0ZWw6SW50ZXJuYWw6NzI0LTI2NjM+IChHbG9iYWwpICAgICAgDQogICAgICAgICAg
RW5nbGlzaCAoVW5pdGVkIFN0YXRlcylcblVuaXRlZCBTdGF0ZXNcLCBBdXN0aW46ICsxLTUxMi03
MjQtMjY2MzwNCiB0ZWw6VW5pdGVkJTIwU3RhdGVzXCwlMjBBdXN0aW46JTIwKzEtNTEyLTcyNC0y
NjYzPiAoR2xvYmFsKSAgICAgICAgICAgICAgIA0KIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5V
bml0ZWQgU3RhdGVzXCwgVG9sbCBGcmVlOiArMS04NzctNDkxLTk3Mzg8dGVsOlVuDQogaXRlZCUy
MFN0YXRlc1wsJTIwVG9sbCUyMEZyZWU6JTIwKzEtODc3LTQ5MS05NzM4PiAoR2xvYmFsKSAgICAg
ICAgICAgICAgIEUNCiBuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5JbmRpYVwsIFJlbGlhbmNlOjE4
MDAtMzAtMTA5MDQ1PHRlbDpJbmRpYVwsJTIwUmVsaQ0KIGFuY2U6MTgwMC0zMC0xMDkwNDU+IChH
bG9iYWwpICAgICAgICAgICBFbmdsaXNoIChVbml0ZWQgU3RhdGVzKVxuSW5kaWFcLCBCDQogU05M
OjE4MDAtNDI1LTUxMDE8dGVsOkluZGlhXCwlMjBCU05MOjE4MDAtNDI1LTUxMDE+IChHbG9iYWwp
ICAgICAgICAgICAgIEUNCiBuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5JcmVsYW5kXCwgRHVibGlu
OiArMzUzLTEtMjc5NDA2Mjx0ZWw6SXJlbGFuZFwsJTIwRA0KIHVibGluOiUyMCszNTMtMS0yNzk0
MDYyPiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9tKVxuDQog
RW5nbGFuZFwsIEJyYWNrbmVsbDogKzQ0LTEzNDQtMzcyMDQwPHRlbDpFbmdsYW5kXCwlMjBCcmFj
a25lbGw6JTIwKzQ0LTEzNDQNCiAtMzcyMDQwPiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xp
c2ggKFVuaXRlZCBLaW5nZG9tKVxuTWFsYXlzaWFcLCBQZW5hbg0KIGc6ICs2MC00LTYzMzY2NjY8
dGVsOk1hbGF5c2lhXCwlMjBQZW5hbmc6JTIwKzYwLTQtNjMzNjY2Nj4gKEdsb2JhbCkgICAgICAg
DQogICAgICAgICBFbmdsaXNoIChVbml0ZWQgU3RhdGVzKVxuQnJhemlsOjMwMDMtMzM1NTx0ZWw6
QnJhemlsOjMwMDMtMzM1NT4gKEcNCiBsb2JhbCkgICAgICAgICAgICAgICAgIFBvcnR1Z3Vlc2Ug
KEJyYXppbClcbkNoaW5hXCwgVG9sbCBGcmVlOjgwMC04NTgtMDc1Ng0KIDx0ZWw6Q2hpbmFcLCUy
MFRvbGwlMjBGcmVlOjgwMC04NTgtMDc1Nj4gKEdsb2JhbCkgICAgICAgICAgIEVuZ2xpc2ggKFVu
aXRlDQogZCBTdGF0ZXMpXG5KYXBhblwsIEthd2FzYWtpOiArODEtNDQtNTIwNjg3Nzx0ZWw6SmFw
YW5cLCUyMEthd2FzYWtpOiUyMCs4MS0NCiA0NC01MjA2ODc3PiAoR2xvYmFsKSAgICAgICAgICAg
ICAgIEphcGFuZXNlIChKYXBhbilcbkNhbmFkYVwsIFRvcm9udG86ICsxLQ0KIDQxNi03NTgyMzI5
PHRlbDpDYW5hZGFcLCUyMFRvcm9udG86JTIwKzEtNDE2LTc1ODIzMjk+IChHbG9iYWwpICAgICAg
ICAgICAgDQogICAgRW5nbGlzaCAoVW5pdGVkIFN0YXRlcylcbkZpbmQgYSBsb2NhbCBudW1iZXI8
aHR0cHM6Ly9kaWFsaW4uZGVsbC5jb20+XG4NCiBcbkNvbmZlcmVuY2UgSUQ6IDIyNjA3OTA3XG4g
Rm9yZ290IHlvdXIgZGlhbC1pbiBQSU4/PGh0dHBzOi8vZGlhbGluLmRlbGwuYw0KIG9tPiB8SGVs
cDxodHRwczovL2RpYWxpbi5kZWxsLmNvbS9EZWxsSGVscC8+XG5cblshT0MoWzEwMzNdKSFdXG4u
Li4uLi4uLi4uDQogLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLlxuXG5cbg0KU1VNTUFSWTtMQU5HVUFHRT1lbi1V
UzpSZWRmaXNoIGNhbGwNCkRUU1RBUlQ7VFpJRD1DZW50cmFsIFN0YW5kYXJkIFRpbWU6MjAxODAy
MjZUMTYwMDAwDQpEVEVORDtUWklEPUNlbnRyYWwgU3RhbmRhcmQgVGltZToyMDE4MDIyNlQxNzAw
MDANClVJRDowNDAwMDAwMDgyMDBFMDAwNzRDNUI3MTAxQTgyRTAwODAwMDAwMDAwRDBFNjMwREMx
NkFGRDMwMTAwMDAwMDAwMDAwMDAwMA0KIDAxMDAwMDAwMDhDOEE4QkI2RTgyMDc0NEE5MTFFQTEw
QkU0ODg5RDk4DQpDTEFTUzpQVUJMSUMNClBSSU9SSVRZOjUNCkRUU1RBTVA6MjAxODAyMjZUMjEz
MzEwWg0KVFJBTlNQOk9QQVFVRQ0KU1RBVFVTOkNPTkZJUk1FRA0KU0VRVUVOQ0U6MQ0KTE9DQVRJ
T047TEFOR1VBR0U9ZW4tVVM6U2t5cGUgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VR
VUVOQ0U6MQ0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOi01OTEwMzI2Mg0KWC1NSUNST1NP
RlQtQ0RPLUJVU1lTVEFUVVM6VEVOVEFUSVZFDQpYLU1JQ1JPU09GVC1DRE8tSU5URU5ERURTVEFU
VVM6QlVTWQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNFDQpYLU1JQ1JPU09GVC1D
RE8tSU1QT1JUQU5DRToxDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6MA0KWC1NSUNST1NPRlQt
RElTQUxMT1ctQ09VTlRFUjpGQUxTRQ0KQkVHSU46VkFMQVJNDQpERVNDUklQVElPTjpSRU1JTkRF
Ug0KVFJJR0dFUjtSRUxBVEVEPVNUQVJUOi1QVDE1TQ0KQUNUSU9OOkRJU1BMQVkNCkVORDpWQUxB
Uk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_000_adc068b15f1f43e4852be535a66ae67bausx13mps334AMERDELLCOM_--
