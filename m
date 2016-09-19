Return-Path: <william.bjlinan@hotmail.com>
X-Greylist: delayed 313 seconds by postgrey-1.36 at bilbo;
 Mon, 19 Sep 2016 18:54:44 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b=nU6A44yM; 
 dkim-atps=neutral
Received: from COL004-OMC1S12.hotmail.com (col004-omc1s12.hotmail.com
 [65.55.34.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sd07m120xzDsdP
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 18:54:43 +1000 (AEST)
Received: from JPN01-OS2-obe.outbound.protection.outlook.com ([65.55.34.8]) by
 COL004-OMC1S12.hotmail.com over TLS secured channel with Microsoft
 SMTPSVC(7.5.7601.23008); Mon, 19 Sep 2016 01:49:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JTC2pEIZzg/wWjTntV4ImJUjPqT4Gob8lyIURqguyw8=;
 b=nU6A44yMj4MfB/HLycVatUSXXOqDZTjyAGoNyuT3d9ck2IRoLtqxb1k1WzZinvkw0QaTc9B5H5Wawh4Xs+kkJH2/mMXCsaZAzeNDWXqdiYz4Jw51PrRAeqAJp7RBlqrevSBgJPuYI7ZribwMOR0lCaOJ+lDjDNonlwXjZHu/8PJNyoNgm5kSclZN6WJNynKCfTo2oE5HX7xTjzS1ybiQide0TRQ7wjxYPaiw1JaNy3lCxS9H1Uok1RtPzY18FhPfPPG+W2Pfsaaor+lM4Zw2yL+JkNq5pHhIctL7uOJXtQtN4dVx1IsfsbUtwq0gOrAtOML73iDk9YdInSDNi+pMVw==
Received: from TY1JPN01FT006.eop-JPN01.prod.protection.outlook.com
 (10.152.186.55) by TY1JPN01HT005.eop-JPN01.prod.protection.outlook.com
 (10.152.187.46) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.629.5; Mon, 19 Sep
 2016 08:49:23 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com (10.152.186.54) by
 TY1JPN01FT006.mail.protection.outlook.com (10.152.187.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.619.6 via Frontend Transport; Mon, 19 Sep 2016 08:49:22 +0000
Received: from TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) by
 TY1PR06MB0863.apcprd06.prod.outlook.com ([10.164.99.139]) with mapi id
 15.01.0629.006; Mon, 19 Sep 2016 08:49:22 +0000
From: Li Nan <william.bjlinan@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Need some advice on IPMI "Get Chassi Capabilities" command
Thread-Topic: Need some advice on IPMI "Get Chassi Capabilities" command
Thread-Index: AQHSElFj8rc12Q89GEi+zroBpwdNEQ==
Date: Mon, 19 Sep 2016 08:49:22 +0000
Message-ID: <TY1PR06MB0863DE14D131468C806F67D6F6F40@TY1PR06MB0863.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=softfail (sender IP is 10.152.186.54)
 smtp.mailfrom=hotmail.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=none
 header.from=hotmail.com;
received-spf: SoftFail (protection.outlook.com: domain of transitioning
 hotmail.com discourages use of 10.152.186.54 as permitted sender)
x-tmn: [4c/ysCnegEFgxhPElULfzOZyLmlcw9mc]
x-eopattributedmessage: 0
x-microsoft-exchange-diagnostics: 1; TY1JPN01HT005;
 6:X/Oe2yEs7cR2GmvzDeEXlaW2lsadzxIhIMdrLZ2gZBSUQJTScw54JLuMq8X0cuxpn71cmU0mHr8yjCzbOa6xml6xYkGP15DbQCCiXiYjaxnO2HKzk2kVa8aUPHvKMzr/1hU0hUREYUVKGMzQHag7Ttsmaap0NcJ0vuqnH88qvC9VjesRAsvbcAQQd2U1YQ//l0Ga9s6IVIK9042s9Qm15ssuO6MlWl3O1cCeXgue80i2E0CC3cUlQBwIeMGjqm4M+mIMhlXrqWK9VABff30xOn+97dG7llTyNj/HnmU/Cdo=;
 5:PH17Z7dyIewKboL3ol06vy7Zk2wljrfGDAvqiiwuAZZKOttaTYXETRsdYw5id7XG/X/iCToHHq3b35/I3UR4wm4+BN+2TsagKdyzgdn8+0Tbw3zaUWnEOoXUQp6GJbizFLukxNrj2DVRokwfjZQFYA==;
 24:ZetdYtff3AkoiuHd6g65UjHj+UZwjsZHgCregWDV8YDA491fD7Tlc9Qq+H85xgQmnFfioFyzs0Hqrzw9/C/agi6nBZTMqfeYyaBLeUOjTaQ=;
 7:UX4hsjDbZNpR0V20Zk9KljLZLp/4J3GU67yTBCZDDm9KxcL9N7BWn5oql1VglMqkoNZk4fQjQwvC/8SywdJ5uYZ9HSBSoXQ/asbO7fthHj/QgwGSVSbDyH0YUQbH2Uxeqxy/VX9RDxy0SyFk1wrDGggVwwyoAxhZrY3bvKEZaUG6NPaJRqvjMEXH3GYLbWvMrHZ22Ach6mOgMCAO3vIycr66EUtrn4ugT2eIqRkf8C2p77APIvCPKbjETvSQoOCYkcJlzX4i5uhDFKmxUtq+6Bf+u037eU6Hb7P8crlAVK2cL1UIb6rIeWNSsZ8RGv6P
x-forefront-antispam-report: EFV:NLI; SFV:NSPM; SFS:(10019020)(98900003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:TY1JPN01HT005;
 H:TY1PR06MB0863.apcprd06.prod.outlook.com; FPR:; SPF:None; LANG:en; 
x-ms-office365-filtering-correlation-id: fced447e-2eee-4a2a-6d8c-08d3e069da1c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(1601124038)(1603103081)(1601125047); SRVR:TY1JPN01HT005; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(432015012)(82015046);
 SRVR:TY1JPN01HT005; BCL:0; PCL:0; RULEID:; SRVR:TY1JPN01HT005; 
x-forefront-prvs: 0070A8666B
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_TY1PR06MB0863DE14D131468C806F67D6F6F40TY1PR06MB0863apcp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2016 08:49:22.3354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1JPN01HT005
X-OriginalArrivalTime: 19 Sep 2016 08:49:28.0699 (UTC)
 FILETIME=[BB5984B0:01D21252]
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2016 08:54:46 -0000

--_000_TY1PR06MB0863DE14D131468C806F67D6F6F40TY1PR06MB0863apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgdGVhbSwNCg0KSSdtIHdvcmtpbmcgb24gdGhlIElQTUkgIkdldCBDaGFzc2lzIENhcGFiaWxp
dGllcyIgY29tbWFuZC4NCmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvaXNzdWVz
LzQzOA0KDQpJIHN1bW1hcml6ZSBzb21lIGZpZWxkcyBvZiBzZXR0aW5ncywgYW5kIHdhbnQgdG8g
Y29uZmlybSB0aGVtOg0KQnl0ZQ0KDQpDb250ZW50DQoNCk5vdGUNCg0KMg0KDQpDYXBhYmlsaXRp
ZXMgRmxhZ3M6DQpbNzo0XSCoQyByZXNlcnZlZA0KWzNdIKhDIDFiID0gcHJvdmlkZXMgcG93ZXIg
aW50ZXJsb2NrICAoSVBNIDEuNSkNClsyXSCoQyAxYiA9IHByb3ZpZGVzIERpYWdub3N0aWMgSW50
ZXJydXB0IChGUCBOTUkpDQpbMV0gqEMgMWIgPSBwcm92aWRlcyChsEZyb250IFBhbmVsIExvY2tv
dXShsSAoaW5kaWNhdGVzIHRoYXQgdGhlIGNoYXNzaXMgaGFzIGNhcGFiaWxpdGllcyB0byBsb2Nr
IG91dCBleHRlcm5hbCBwb3dlciBjb250cm9sIGFuZCByZXNldCBidXR0b24gb3IgZnJvbnQgcGFu
ZWwgaW50ZXJmYWNlcyBhbmQvb3IgZGV0ZWN0IHRhbXBlcmluZyB3aXRoIHRob3NlIGludGVyZmFj
ZXMpLg0KWzBdIC0xYiA9IENoYXNzaXMgcHJvdmlkZXMgaW50cnVzaW9uIChwaHlzaWNhbCBzZWN1
cml0eSkgc2Vuc29yLg0KDQpOb3Qgc3VwcG9ydC4gKFNlYXJjaCBjb2RlcywgYW5kIGZpbmQgbm8g
aW5mbyBhYm91dCB0aGlzKS4NCg0KUGVyIFRvbQ0KZnNwIHN1cHBvcnQgZGlhZ25vc3RpYyBpbnRl
cnJ1cHQsIHNvIHNldCB0byAweDQuDQoNCjMNCg0KQ2hhc3NpcyBGUlUgaW5mbyBEZXZpY2UgQWRk
cmVzcw0KTm90ZTogYWxsIElQTUIgYWRkcmVzcyB1c2VkIGluIHRoaXMgY29tbWFuZCBhcmUgaGF2
ZSB0aGUgNy1iaXQgaTJjIHNsYXZlIGFkZHJlc3MgYXMgdGhlIG1vc3Qtc2lnbmlmaWNhbnQgNy1i
aXRzIGFuZCB0aGUgbGVhc3Qgc2lnbmlmaWNhbnQgYml0IHNldCB0byAwYi4NCiAwMGggPSB1bnNw
ZWNpZmllZC4NCg0KTm90IHN1cHBvcnQuIChTZWFyY2ggY29kZXMsIGFuZCBmaW5kIG5vIGluZm8g
YWJvdXQgdGhpcykNCg0KU28gc2V0IHRvIDB4MjAuDQoNCjQNCg0KQ2hhc3NpcyBTRFIgRGV2aWNl
IEFkZHJlc3MNCg0KTm90IHN1cHBvcnQuIChTZWFyY2ggY29kZXMsIGFuZCBmaW5kIG5vIGluZm8g
YWJvdXQgdGhpcykNCg0KU28gc2V0IHRvIDB4MjAuDQoNCjUNCg0KQ2hhc3NpcyBTRUwgRGV2aWNl
IEFkZHJlc3MNCg0KTm90IHN1cHBvcnQuIChTZWFyY2ggY29kZXMsIGFuZCBmaW5kIG5vIGluZm8g
YWJvdXQgdGhpcykNCg0KU28gc2V0IHRvIDB4MjAuDQoNCjYNCg0KQ2hhc3NpcyBTeXN0ZW0gTWFu
YWdlbWVudCBEZXZpY2UgQWRkcmVzcw0KDQpOb3Qgc3VwcG9ydC4gKFNlYXJjaCBjb2RlcywgYW5k
IGZpbmQgbm8gaW5mbyBhYm91dCB0aGlzKQ0KDQpTbyBzZXQgdG8gMHgyMC4NCg0KKDcpDQoNCkNo
YXNzaXMgQnJpZGdlIERldmljZSBBZGRyZXNzLiBSZXBvcnQgbG9jYXRpb24gb3QgdGhlIElDTUIg
YnJpZGdlIGZ1bmN0aW9uLiBJZiB0aGlzIGZpZWxkIGlzIG5vdCBwcm92aWRlZCwgdGhlIGFkZHJl
c3MgaXMgYXNzdW1lZCB0byBiZSB0aGUgQk1DIGFkZHJlc3MgKDIwaCkuIEltcGxlbWVudGluZyB0
aGlzIGZpZWxkIGlzIHJlcXVpcmVkIHdoZW4gdGhlIEdldCBDaGFzc2lzIENhcGFiaWxpdGllcyBj
b21tYW5kIGlzIGltcGxlbWVudGVkIGJ5IGEgQk1DLCBhbmQgd2hhdGV2ZXIgdGhlIENoYXNzaXMg
QnJpZGdlIGZ1bmN0aW9uIGlzIGltcGxlbWVudCBhdCBhbiBhZGRyZXNzIG90aGVyIHRoYW4gMjBo
Lg0KDQpOb3Qgc3VwcG9ydC4gKFNlYXJjaCBjb2RlcywgYW5kIGZpbmQgbm8gaW5mbyBhYm91dCB0
aGlzKQ0KU28gc2V0IHRvIDB4MjAuDQoNCg0KDQoNCg0KDQoNCg0KSSB0aGluayB0aG9zZSBzZXR0
aW5ncyBzaG91bGQgYmUgcmVhZCBmcm9tIE1SVy4gRG8gd2UgaGF2ZSBhbiBpbnRlcmZhY2UgdG8g
ZG8gaXQ/DQoNCg0KVGhhbmtzIQ0KDQoNCk5hbiBMaQ0K

--_000_TY1PR06MB0863DE14D131468C806F67D6F6F40TY1PR06MB0863apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;back=
ground-color:#FFFFFF;font-family:Calibri,Arial,Helvetica,sans-serif;">
<p>Hi team,</p>
<p></p>
<div>I'm working on the IPMI &quot;Get Chassis Capabilities&quot; command.<=
br>
https://github.com/openbmc/openbmc/issues/438<br>
<br>
I summarize some fields of settings, and want to confirm them:</div>
<p></p>
<p></p>
<div>
<table class=3D"MsoTableGrid " style=3D"border-collapse: collapse; border: =
medium none; table-layout: fixed;" cellpadding=3D"0" cellspacing=3D"0" bord=
er=3D"1">
<tbody>
<tr class=3D"" style=3D"mso-yfti-irow:0;mso-yfti-firstrow:yes;height:14.25p=
t">
<td class=3D"" style=3D"width: 72px; border: 1pt solid windowtext; padding:=
 0in 5.4pt; height: 14.25pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Byte</p>
</td>
<td class=3D"" style=3D"width: 303px; border-width: 1pt 1pt 1pt medium; bor=
der-style: solid solid solid none; border-color: windowtext windowtext wind=
owtext -moz-use-text-color; -moz-border-top-colors: none; -moz-border-right=
-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: no=
ne; border-image: none; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"top=
">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Content</p>
</td>
<td class=3D"" style=3D"width: 88px; border-width: 1pt 1pt 1pt medium; bord=
er-style: solid solid solid none; border-color: windowtext windowtext windo=
wtext -moz-use-text-color; -moz-border-top-colors: none; -moz-border-right-=
colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: non=
e; border-image: none; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"top"=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Note</p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:1;height:14.25pt">
<td class=3D"" style=3D"border-width: medium 1pt 1pt; border-style: none so=
lid solid; border-color: -moz-use-text-color windowtext windowtext; -moz-bo=
rder-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-c=
olors: none; -moz-border-left-colors: none; border-image: none; padding: 0i=
n 5.4pt; height: 14.25pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
2</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Capabilities Flags:</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[7:4] =A8C reserved</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[3] =A8C 1b =3D provides power interlock<span style=3D"mso-spacerun:yes">&n=
bsp; </span>(IPM 1.5)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[2] =A8C 1b =3D provides Diagnostic Interrupt (FP NMI)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[1] =A8C 1b =3D provides =A1=B0Front Panel Lockout=A1=B1 (indicates that th=
e chassis has capabilities to lock out external power control and reset but=
ton or front panel interfaces and/or detect tampering with those interfaces=
).</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
[0] -1b =3D Chassis provides intrusion (physical security) sensor.</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Not support. (Search codes, and find no info about this).</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
&nbsp;</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Per Tom</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
fsp support diagnostic interrupt, so set to 0x4.</p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:2;height:14.9pt">
<td class=3D"" style=3D"border-width: medium 1pt 1pt; border-style: none so=
lid solid; border-color: -moz-use-text-color windowtext windowtext; -moz-bo=
rder-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-c=
olors: none; -moz-border-left-colors: none; border-image: none; padding: 0i=
n 5.4pt; height: 14.9pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
3</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.9pt;" valign=3D"top=
">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Chassis FRU info Device Address</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Note: all IPMB address used in this command are have the 7-bit i2c slave ad=
dress as the most-significant 7-bits and the least significant bit set to 0=
b.</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span style=3D"mso-spacerun:yes">&nbsp;</span>00h =3D unspecified.</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.9pt;" valign=3D"top=
">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Not support. (Search codes, and find no info about this)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<br>
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
So set to 0x20.<br>
</p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:3;height:14.25pt">
<td class=3D"" style=3D"border-width: medium 1pt 1pt; border-style: none so=
lid solid; border-color: -moz-use-text-color windowtext windowtext; -moz-bo=
rder-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-c=
olors: none; -moz-border-left-colors: none; border-image: none; padding: 0i=
n 5.4pt; height: 14.25pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
4</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Chassis SDR Device Address</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Not support. (Search codes, and find no info about this)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
</p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<br>
</p>
So set to 0x20.</div>
<p></p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:4;height:14.25pt">
<td class=3D"" style=3D"border-width: medium 1pt 1pt; border-style: none so=
lid solid; border-color: -moz-use-text-color windowtext windowtext; -moz-bo=
rder-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-c=
olors: none; -moz-border-left-colors: none; border-image: none; padding: 0i=
n 5.4pt; height: 14.25pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
5</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Chassis SEL Device Address</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Not support. (Search codes, and find no info about this)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
</p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<br>
</p>
So set to 0x20.</div>
<p></p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:5;height:14.25pt">
<td class=3D"" style=3D"border-width: medium 1pt 1pt; border-style: none so=
lid solid; border-color: -moz-use-text-color windowtext windowtext; -moz-bo=
rder-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-c=
olors: none; -moz-border-left-colors: none; border-image: none; padding: 0i=
n 5.4pt; height: 14.25pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
6</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Chassis System Management Device Address</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.25pt;" valign=3D"to=
p">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Not support. (Search codes, and find no info about this)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
</p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<br>
</p>
So set to 0x20.</div>
<p></p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:6;mso-yfti-lastrow:yes;height:14.9pt"=
>
<td class=3D"" style=3D"border-width: medium 1pt 1pt; border-style: none so=
lid solid; border-color: -moz-use-text-color windowtext windowtext; -moz-bo=
rder-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-c=
olors: none; -moz-border-left-colors: none; border-image: none; padding: 0i=
n 5.4pt; height: 14.9pt;" valign=3D"top">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
(7)</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.9pt;" valign=3D"top=
">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Chassis Bridge Device Address. Report location ot the ICMB bridge function.=
 If this field is not provided, the address is assumed to be the BMC addres=
s (20h). Implementing this field is required when the Get Chassis Capabilit=
ies command is implemented by a
 BMC, and whatever the Chassis Bridge function is implement at an address o=
ther than 20h.</p>
</td>
<td class=3D"" style=3D"border-width: medium 1pt 1pt medium; border-style: =
none solid solid none; border-color: -moz-use-text-color windowtext windowt=
ext -moz-use-text-color; padding: 0in 5.4pt; height: 14.9pt;" valign=3D"top=
">
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
Not support. (Search codes, and find no info about this)</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:0in;margin-bottom:.0001pt;lin=
e-height:=0A=
  normal">
<span>So set to 0x20.</span></p>
</td>
</tr>
<tr class=3D"" style=3D"mso-yfti-irow:6;mso-yfti-lastrow:yes;height:14.9pt"=
>
<td class=3D"" rowspan=3D"1" style=3D"border-width: medium 1pt 1pt; border-=
style: none solid solid; border-color: -moz-use-text-color windowtext windo=
wtext; -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-b=
order-bottom-colors: none; -moz-border-left-colors: none; border-image: non=
e; padding: 0in 5.4pt; height: 14.9pt;" valign=3D"top">
<br>
</td>
<td class=3D"" rowspan=3D"1" style=3D"border-width: medium 1pt 1pt medium; =
border-style: none solid solid none; border-color: -moz-use-text-color wind=
owtext windowtext -moz-use-text-color; padding: 0in 5.4pt; height: 14.9pt;"=
 valign=3D"top">
<br>
</td>
<td class=3D"" rowspan=3D"1" style=3D"border-width: medium 1pt 1pt medium; =
border-style: none solid solid none; border-color: -moz-use-text-color wind=
owtext windowtext -moz-use-text-color; padding: 0in 5.4pt; height: 14.9pt;"=
 valign=3D"top">
<br>
</td>
</tr>
</tbody>
</table>
</div>
<p></p>
<p><br>
</p>
<p><br>
</p>
<p>I think those settings should be read from MRW. Do we have an interface =
to do it?</p>
<p><br>
</p>
<p>Thanks!</p>
<p><br>
</p>
<p>Nan Li<br>
</p>
</div>
</body>
</html>

--_000_TY1PR06MB0863DE14D131468C806F67D6F6F40TY1PR06MB0863apcp_--
