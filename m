Return-Path: <YSCHU@nuvoton.com>
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.41; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=yschu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="YFMm3PRv"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310041.outbound.protection.outlook.com [40.107.131.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nGq05yZhzDqSx
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jul 2019 18:27:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idnVdgLoKLTBVx6Mi7ffELkDjwCA7BRayBjPgwnpQlvq7gRa2/nFTgVgkXKeLQQP/0MiMDZS9fT8SVHjC7B6DAxwI4z7GQ7bUeo4Px9tHmthjvIE8TSrJwRRYWlM64OpY/pAFJfIq1frIGCwg9btftS7Hfg0rOyUD7lCN5S6D31C9yRodowfmb1x1vvN4UooWetiEHahpDu4fC44P8t0DK2hnPSC5nTbJSXumUP94q+Q4g+xZXdxSXRtB5OiYt+sJ+lsogFMC9FcKlShx+cHC4IlZbGqz+5bfcO1DrKcsms5905Uq8st6fOuep35CCOsrpoA6XIVrMWYZzOURHaqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0oI76F8VrliifV1mI0snVe8tLI3Jwel9INB0EXejSU=;
 b=MGSgMsvf5rOPeFzo6W86+dZFnnAB9+7nBxAVHa1nVIGqVjRTjGeeQMDirnRGI/rBUTdkiRARbpzSoa7ZNBds0e3ZjYbvg+IpdZP3yfUzZ5E5GV1o3DWtdkxP4rkVWThXIym7EOlA0TpRkcAVwZGdbKGbblp6fZrA8uNDEAF+UpHj98SnHjppYjHL906IVtjE+nIhpJ26GBLBSpHoXTAZ99oaGBgZrzdoEmFp/4la8rQVsXSwA7yeB4YIOyp+4yrf22Z7q1IAzzcoA0wDH740O8epu2UpfYV1NhIP9G9pqE2xDscU3rWJmAo8Unq+LCiRd5c6CF9zTcSXnjzqsfQHQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nuvoton.com;dmarc=pass action=none
 header.from=nuvoton.com;dkim=pass header.d=nuvoton.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector1-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0oI76F8VrliifV1mI0snVe8tLI3Jwel9INB0EXejSU=;
 b=YFMm3PRvjx1hT1viYkBwCyAd9CXIP66sNb5QQoi6yXORijZV4XAV1zLv5J5SAzUn81rTmtyj6vNclQ+IxhDv5TInqUI8eilAPPt7gqd4HdboZnwJYsD7geoGT4sQE85mQjS8yRiQvtUzFBf++TU7FCz+7VKiEn/WfmZBCUUeHYw=
Received: from HK2PR03MB4516.apcprd03.prod.outlook.com (10.170.159.14) by
 HK2PR03MB4372.apcprd03.prod.outlook.com (10.170.157.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.9; Mon, 15 Jul 2019 08:27:01 +0000
Received: from HK2PR03MB4516.apcprd03.prod.outlook.com
 ([fe80::39c3:82c8:b8c6:817b]) by HK2PR03MB4516.apcprd03.prod.outlook.com
 ([fe80::39c3:82c8:b8c6:817b%3]) with mapi id 15.20.2094.009; Mon, 15 Jul 2019
 08:27:01 +0000
From: CS20 YSChu <YSCHU@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: bmc_booted LED group was not asserted when BMC started up
Thread-Topic: bmc_booted LED group was not asserted when BMC started up
Thread-Index: AdU65rNjoTCLcPEvQ7uDpwnoJTJjBw==
Date: Mon, 15 Jul 2019 08:27:00 +0000
Message-ID: <HK2PR03MB451678ECD01E44B509753895B6CF0@HK2PR03MB4516.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=YSCHU@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f13a4073-34a4-46ed-0b30-08d708fe35a9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:HK2PR03MB4372; 
x-ms-traffictypediagnostic: HK2PR03MB4372:|HK2PR03MB4372:
x-microsoft-antispam-prvs: <HK2PR03MB4372A20F16BC47E1EB9C314CB6CF0@HK2PR03MB4372.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39850400004)(396003)(366004)(199004)(189003)(25786009)(6506007)(102836004)(26005)(2351001)(186003)(74316002)(316002)(86362001)(99286004)(2906002)(66066001)(7736002)(68736007)(8936002)(14454004)(88996005)(2501003)(8676002)(80792005)(6116002)(790700001)(3846002)(7696005)(478600001)(256004)(53936002)(52536014)(6916009)(14444005)(6436002)(66446008)(6306002)(64756008)(66556008)(66476007)(33656002)(55016002)(54896002)(9686003)(5640700003)(476003)(486006)(81166006)(81156014)(1730700003)(66946007)(71190400001)(71200400001)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK2PR03MB4372;
 H:HK2PR03MB4516.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WfAwgHe+rju1A9+qeeyY1TonLW4MFbHY/zq9QCY/xGektDdoCkfW4dSkykr7pq3HhRCABZeYo4TKfETlPCglh3VMWNDF9TarxSKjYLwBLJwga/CV/QTg8yrHO80MsgVxMIyvnWdVvGqQdRkr8VQ1wZx7ac9wap0fJzSAWk95D9l1kH/DGrAn1bunUenf/Q8BvMwHcKCoxTjBywa1ZAsNr2XEJFe0UFAtfQDRHn4qyMEXAYcquUpI+b5h8XMblBXDNPf7A/OpUX1GemwwjTamMaWa4kUrUS0tRYxtvVHZ2oFD9wu3JQBShPgx7H7y8kEmHgtrpSZTBtQhUnLp7wQeqvphVces+oo5tyUG2N6oxCy3WjbH2vkofS0HGFmvKJMCFyRyj4b6TC/f82uhH2jucQK1tdO3xCwkj+3T9N5wOO0=
Content-Type: multipart/alternative;
 boundary="_000_HK2PR03MB451678ECD01E44B509753895B6CF0HK2PR03MB4516apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13a4073-34a4-46ed-0b30-08d708fe35a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 08:27:00.9301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSCHU@nuvoton.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR03MB4372
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Jul 2019 08:27:10 -0000

--_000_HK2PR03MB451678ECD01E44B509753895B6CF0HK2PR03MB4516apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

In normal case, we will see bmc_booted LED group been asserted when bmc sta=
rts up.

Apr 08 04:56:30 evb-npcm750 systemd[1]: Starting Wait for /xyz/openbmc_proj=
ect/led/groups/bmc_booted...
Apr 08 04:56:31 evb-npcm750 systemd[1]: Started Wait for /xyz/openbmc_proje=
ct/led/groups/bmc_booted.
Apr 08 04:56:35 evb-npcm750 systemd[1]: Starting Assert bmc_booted LED...
Apr 08 04:56:35 evb-npcm750 systemd[1]: Started Assert bmc_booted LED.

Recently, I update to newer commit (don't know what exact commit cause this=
), the wanted service was started but bmc-led-group-start service itself wa=
s not started. As a result, bmc heartbeat led was not blinked.
Can anyone please advise how to investigate such kind of issue?

Jul 11 04:54:03 runbmc-nuvoton systemd[1]: Starting Wait for /xyz/openbmc_p=
roject/led/groups/bmc_booted...
Jul 11 04:54:06 runbmc-nuvoton systemd[1]: Started Wait for /xyz/openbmc_pr=
oject/led/groups/bmc_booted.

------
Below is unit file of obmc-led-group-start@bmc_booted.service in /lib/syste=
md/system/multi-user.target.wants
[Unit]
Description=3DAssert %i LED
Wants=3Dmapper-wait@-xyz-openbmc_project-led-groups-%i.service
After=3Dmapper-wait@-xyz-openbmc_project-led-groups-%i.service
Conflicts=3Dobmc-led-group-stop@%i.service

[Service]
Type=3Doneshot
RemainAfterExit=3Dyes
Restart=3Dno
ExecStart=3D/bin/sh -c "busctl call `mapper get-service /xyz/openbmc_projec=
t/led/groups/%i` /xyz/openbmc_project/led/groups/%i org.freedesktop.DBus.Pr=
operties Set ssv xyz.openbmc_project.Led.Group Asserted b true"
SyslogIdentifier=3Dobmc-led-group-start


Thanks.
Stanley

________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK2PR03MB451678ECD01E44B509753895B6CF0HK2PR03MB4516apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In normal case, we will see bmc=
_booted LED group been asserted when bmc starts up.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:30 evb-npcm750 sys=
temd[1]: Starting Wait for /xyz/openbmc_project/led/groups/bmc_booted...<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:31 evb-npcm750 sys=
temd[1]: Started Wait for /xyz/openbmc_project/led/groups/bmc_booted.<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:35 evb-npcm750 sys=
temd[1]: Starting Assert bmc_booted LED...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Apr 08 04:56:35 evb-npcm750 sys=
temd[1]: Started Assert bmc_booted LED.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Recently, I update to newer com=
mit (don&#8217;t know what exact commit cause this), the wanted service was=
 started but bmc-led-group-start service itself was not started. As a resul=
t, bmc heartbeat led was not blinked.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Can anyone please advise how to=
 investigate such kind of issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 11 04:54:03 runbmc-nuvoton =
systemd[1]: Starting Wait for /xyz/openbmc_project/led/groups/bmc_booted...=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Jul 11 04:54:06 runbmc-nuvoton =
systemd[1]: Started Wait for /xyz/openbmc_project/led/groups/bmc_booted.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">------<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Below is unit file of obmc-led-=
group-start@bmc_booted.service in /lib/systemd/system/multi-user.target.wan=
ts<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[Unit]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Description=3DAssert %i LED<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Wants=3Dmapper-wait@-xyz-openbm=
c_project-led-groups-%i.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After=3Dmapper-wait@-xyz-openbm=
c_project-led-groups-%i.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Conflicts=3Dobmc-led-group-stop=
@%i.service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">[Service]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Type=3Doneshot<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">RemainAfterExit=3Dyes<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Restart=3Dno<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ExecStart=3D/bin/sh -c &quot;bu=
sctl call `mapper get-service /xyz/openbmc_project/led/groups/%i` /xyz/open=
bmc_project/led/groups/%i org.freedesktop.DBus.Properties Set ssv xyz.openb=
mc_project.Led.Group Asserted b true&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SyslogIdentifier=3Dobmc-led-gro=
up-start<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Stanley<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK2PR03MB451678ECD01E44B509753895B6CF0HK2PR03MB4516apcp_--
