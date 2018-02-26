Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="snLQIm8T"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zqw4g1T3LzF0qG
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 08:31:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1519680594; x=1551216594;
 h=from:to:subject:date:message-id:mime-version;
 bh=uQTmuBmGD9csEV0E661K/MY3P3t9NTJ0eUBBjGt2LWQ=;
 b=snLQIm8TG4hrggywQDVRWA0XI9NMSu/iUSzSeqTC9XBmj+q1pStqBkSj
 +iSwga2dEM/+4xOLKQ6IOeQhwaGhi+SdbfBRwBbx5x7vO4Lw1n3SoFFK0
 rgKz2O8GWeyN5NV+8eTOvT5JO+UHfjAj0Idepx3uw9eaKO22x67khdViE c=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2EwAABGe5RamMmZ6ERaAxkBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEHAQEBAQGCWgGBShBwKAqDSmuJN41+gxiOH4dmgVNDBwMjhSyCK1QYAQI?=
 =?us-ascii?q?BAQEBAQECAQIQAQEBAQEICwsGKC+COCINBEsnAy8BAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBARUCDUMCHyMEBjkCIwE0FgIEVAIBAQMbhCRkEKw1gW06iHGCFAwBFgoFh0K?=
 =?us-ascii?q?DPYJ9AS+DIgwCAgEYgQw7VoJGgmUFihOBF4ZOj2kJCoF0hTuMXpJpjFGJJIEvH?=
 =?us-ascii?q?oIKcIMSCYJKgTxLd4s/gRcBAQE?=
X-IPAS-Result: =?us-ascii?q?A2EwAABGe5RamMmZ6ERaAxkBAQEBAQEBAQEBAQEHAQEBAQG?=
 =?us-ascii?q?CWgGBShBwKAqDSmuJN41+gxiOH4dmgVNDBwMjhSyCK1QYAQIBAQEBAQECAQIQA?=
 =?us-ascii?q?QEBAQEICwsGKC+COCINBEsnAy8BAQEBAQEBAQEBAQEBAQEBAQEBARUCDUMCHyM?=
 =?us-ascii?q?EBjkCIwE0FgIEVAIBAQMbhCRkEKw1gW06iHGCFAwBFgoFh0KDPYJ9AS+DIgwCA?=
 =?us-ascii?q?gEYgQw7VoJGgmUFihOBF4ZOj2kJCoF0hTuMXpJpjFGJJIEvHoIKcIMSCYJKgTx?=
 =?us-ascii?q?Ld4s/gRcBAQE?=
Received: from esa1.dell-outbound2.iphmx.com ([68.232.153.201])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Feb 2018 15:29:51 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa1.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2018 03:25:39 +0600
X-LoopCount0: from 10.166.136.216
X-IronPort-AV: E=Sophos;i="5.47,398,1515477600"; 
 d="scan'208,217";a="1221184219"
X-DLP: DLP_GlobalPCIDSS
To: <openbmc@lists.ozlabs.org>
Subject: Redfish call
Thread-Topic: Redfish call
Thread-Index: AdOvSMs+wSKC/fh+RNqIUbMPGEEx8wAAFuOw
Date: Mon, 26 Feb 2018 21:31:26 +0000
Message-ID: <ea52ad15ab3740728c8a9caabd101d51@ausx13mps334.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: multipart/alternative;
 boundary="_000_ea52ad15ab3740728c8a9caabd101d51ausx13mps334AMERDELLCOM_"
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
X-List-Received-Date: Mon, 26 Feb 2018 21:31:33 -0000

--_000_ea52ad15ab3740728c8a9caabd101d51ausx13mps334AMERDELLCOM_
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



--_000_ea52ad15ab3740728c8a9caabd101d51ausx13mps334AMERDELLCOM_
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

--_000_ea52ad15ab3740728c8a9caabd101d51ausx13mps334AMERDELLCOM_
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
aXN0cy5vemxhYnMub3JnDQpERVNDUklQVElPTjtMQU5HVUFHRT1lbi1VUzpDZXJ0YWlubHkgYSBs
aXR0bGUgYml0IGxhdGVyIHNlbmRpbmcgb3V0IHRoaXMgY2ENCiBsbCB0aGFuIEkgYW50aWNpcGF0
ZWRcLCBidXQgaXQgc291bmRzIGxpa2UgZXZlcnlib2R5IHRob3VnaHQgdG9kYXkgd2FzIGEgZw0K
IG9vZCB0aW1lIHRvIGtpY2sgZXZlcnl0aGluZyBvZmYuXG5cblN0ZWFsaW5nIEVk4oCZcyBJbml0
aWFsIGFnZW5kYSBwcm9wb3NhDQogbDpcblxuSW5pdGlhbCBpbnRyb2R1Y3Rpb25zXG5PdmVydmll
dyBvZiBleGlzdGluZyBpbXBsZW1lbnRhdGlvbnMgYW5kIHdvcmsNCiBcbiAgICAgICAgQm1jd2Vi
IGltcGxlbWVudGF0aW9uIGJ5IEludGVsIOKAkyBFZCBUYW5vdXNcbiAgICAgICAgR28tcmVkZmlz
aA0KICBpbXBsZW1lbnRhdGlvbiBieSBEZWxsIOKAkyBNaWNoYWVsIEJyb3duXG4gICAgICAgIFJl
ZGZpc2ggaW1wbGVtZW50YXRpb24gDQogYnkgTWljcm9zb2Z0IOKAkyBBbGkgTGFyaWphbmkvWXVn
aSBNYW5pL0JyeWFuIEtlbGx5XG4gICAgICAgIE90aGVycz9cblxuLi4NCiAuLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLg0KIC4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi5cbi0tPiBKb2luIFNrDQogeXBlIE1lZXRpbmc8aHR0cHM6Ly9tZWV0LmRlbGwu
Y29tL21pY2hhZWxfZV9icm93bi9KRkZIWk4xRj5cbiAgVHJvdWJsZSBKb2kNCiBuaW5nPyBUcnkg
U2t5cGUgV2ViIEFwcDxodHRwczovL21lZXQuZGVsbC5jb20vbWljaGFlbF9lX2Jyb3duL0pGRkha
TjFGP3NsPQ0KIDE+XG5Kb2luIGJ5IHBob25lXG5JbnRlcm5hbDo3MjQtMjY2Mzx0ZWw6SW50ZXJu
YWw6NzI0LTI2NjM+IChHbG9iYWwpICAgICAgDQogICAgICAgICAgRW5nbGlzaCAoVW5pdGVkIFN0
YXRlcylcblVuaXRlZCBTdGF0ZXNcLCBBdXN0aW46ICsxLTUxMi03MjQtMjY2MzwNCiB0ZWw6VW5p
dGVkJTIwU3RhdGVzXCwlMjBBdXN0aW46JTIwKzEtNTEyLTcyNC0yNjYzPiAoR2xvYmFsKSAgICAg
ICAgICAgICAgIA0KIEVuZ2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5Vbml0ZWQgU3RhdGVzXCwgVG9s
bCBGcmVlOiArMS04NzctNDkxLTk3Mzg8dGVsOlVuDQogaXRlZCUyMFN0YXRlc1wsJTIwVG9sbCUy
MEZyZWU6JTIwKzEtODc3LTQ5MS05NzM4PiAoR2xvYmFsKSAgICAgICAgICAgICAgIEUNCiBuZ2xp
c2ggKFVuaXRlZCBTdGF0ZXMpXG5JbmRpYVwsIFJlbGlhbmNlOjE4MDAtMzAtMTA5MDQ1PHRlbDpJ
bmRpYVwsJTIwUmVsaQ0KIGFuY2U6MTgwMC0zMC0xMDkwNDU+IChHbG9iYWwpICAgICAgICAgICBF
bmdsaXNoIChVbml0ZWQgU3RhdGVzKVxuSW5kaWFcLCBCDQogU05MOjE4MDAtNDI1LTUxMDE8dGVs
OkluZGlhXCwlMjBCU05MOjE4MDAtNDI1LTUxMDE+IChHbG9iYWwpICAgICAgICAgICAgIEUNCiBu
Z2xpc2ggKFVuaXRlZCBTdGF0ZXMpXG5JcmVsYW5kXCwgRHVibGluOiArMzUzLTEtMjc5NDA2Mjx0
ZWw6SXJlbGFuZFwsJTIwRA0KIHVibGluOiUyMCszNTMtMS0yNzk0MDYyPiAoR2xvYmFsKSAgICAg
ICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9tKVxuDQogRW5nbGFuZFwsIEJyYWNrbmVs
bDogKzQ0LTEzNDQtMzcyMDQwPHRlbDpFbmdsYW5kXCwlMjBCcmFja25lbGw6JTIwKzQ0LTEzNDQN
CiAtMzcyMDQwPiAoR2xvYmFsKSAgICAgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlZCBLaW5nZG9t
KVxuTWFsYXlzaWFcLCBQZW5hbg0KIGc6ICs2MC00LTYzMzY2NjY8dGVsOk1hbGF5c2lhXCwlMjBQ
ZW5hbmc6JTIwKzYwLTQtNjMzNjY2Nj4gKEdsb2JhbCkgICAgICAgDQogICAgICAgICBFbmdsaXNo
IChVbml0ZWQgU3RhdGVzKVxuQnJhemlsOjMwMDMtMzM1NTx0ZWw6QnJhemlsOjMwMDMtMzM1NT4g
KEcNCiBsb2JhbCkgICAgICAgICAgICAgICAgIFBvcnR1Z3Vlc2UgKEJyYXppbClcbkNoaW5hXCwg
VG9sbCBGcmVlOjgwMC04NTgtMDc1Ng0KIDx0ZWw6Q2hpbmFcLCUyMFRvbGwlMjBGcmVlOjgwMC04
NTgtMDc1Nj4gKEdsb2JhbCkgICAgICAgICAgIEVuZ2xpc2ggKFVuaXRlDQogZCBTdGF0ZXMpXG5K
YXBhblwsIEthd2FzYWtpOiArODEtNDQtNTIwNjg3Nzx0ZWw6SmFwYW5cLCUyMEthd2FzYWtpOiUy
MCs4MS0NCiA0NC01MjA2ODc3PiAoR2xvYmFsKSAgICAgICAgICAgICAgIEphcGFuZXNlIChKYXBh
bilcbkNhbmFkYVwsIFRvcm9udG86ICsxLQ0KIDQxNi03NTgyMzI5PHRlbDpDYW5hZGFcLCUyMFRv
cm9udG86JTIwKzEtNDE2LTc1ODIzMjk+IChHbG9iYWwpICAgICAgICAgICAgDQogICAgRW5nbGlz
aCAoVW5pdGVkIFN0YXRlcylcbkZpbmQgYSBsb2NhbCBudW1iZXI8aHR0cHM6Ly9kaWFsaW4uZGVs
bC5jb20+XG4NCiBcbkNvbmZlcmVuY2UgSUQ6IDIyNjA3OTA3XG4gRm9yZ290IHlvdXIgZGlhbC1p
biBQSU4/PGh0dHBzOi8vZGlhbGluLmRlbGwuYw0KIG9tPiB8SGVscDxodHRwczovL2RpYWxpbi5k
ZWxsLmNvbS9EZWxsSGVscC8+XG5cblshT0MoWzEwMzNdKSFdXG4uLi4uLi4uLi4uDQogLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4NCiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLlxuXG5cbg0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpSZWRmaXNoIGNhbGwNCkRU
U1RBUlQ7VFpJRD1DZW50cmFsIFN0YW5kYXJkIFRpbWU6MjAxODAyMjZUMTYwMDAwDQpEVEVORDtU
WklEPUNlbnRyYWwgU3RhbmRhcmQgVGltZToyMDE4MDIyNlQxNzAwMDANClVJRDowNDAwMDAwMDgy
MDBFMDAwNzRDNUI3MTAxQTgyRTAwODAwMDAwMDAwRDBFNjMwREMxNkFGRDMwMTAwMDAwMDAwMDAw
MDAwMA0KIDAxMDAwMDAwMDhDOEE4QkI2RTgyMDc0NEE5MTFFQTEwQkU0ODg5RDk4DQpDTEFTUzpQ
VUJMSUMNClBSSU9SSVRZOjUNCkRUU1RBTVA6MjAxODAyMjZUMjEzMTI0Wg0KVFJBTlNQOk9QQVFV
RQ0KU1RBVFVTOkNPTkZJUk1FRA0KU0VRVUVOQ0U6MA0KTE9DQVRJT047TEFOR1VBR0U9ZW4tVVM6
U2t5cGUgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6MA0KWC1NSUNST1NP
RlQtQ0RPLU9XTkVSQVBQVElEOi01OTEwMzI2Mg0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFUVVM6
VEVOVEFUSVZFDQpYLU1JQ1JPU09GVC1DRE8tSU5URU5ERURTVEFUVVM6QlVTWQ0KWC1NSUNST1NP
RlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNFDQpYLU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToxDQpY
LU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6MA0KWC1NSUNST1NPRlQtRElTQUxMT1ctQ09VTlRFUjpG
QUxTRQ0KQkVHSU46VkFMQVJNDQpERVNDUklQVElPTjpSRU1JTkRFUg0KVFJJR0dFUjtSRUxBVEVE
PVNUQVJUOi1QVDE1TQ0KQUNUSU9OOkRJU1BMQVkNCkVORDpWQUxBUk0NCkVORDpWRVZFTlQNCkVO
RDpWQ0FMRU5EQVINCg==

--_000_ea52ad15ab3740728c8a9caabd101d51ausx13mps334AMERDELLCOM_--
