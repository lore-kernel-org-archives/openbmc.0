Return-Path: <shays@mellanox.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
 (mail-am1on0068.outbound.protection.outlook.com [157.56.112.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rKVm665RZzDqZ8
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2016 22:58:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=aoPHtVT6; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=is/m9VrwCOb3x25fOGX6IBvUEoY43+MgRE7gzzyZBcw=;
 b=aoPHtVT6TJ2hzIehIaBfdx5rpvB5Pb7krkG+9CNMmZaCc09TE7CWFntDz5MKt+3T1EsRByhxnJzIYtwN56WVNBANKo8cCSdkWiNNFu10y/bnuNYQUt6dlox+iSlZeJl1IWJTKm1SXCilzhVpcjgeCQVf5dSBMdLmwIYG3KKA7AM=
Received: from AM3PR05MB0934.eurprd05.prod.outlook.com
 (2a01:111:e400:884e::23) by AM3PR05MB0933.eurprd05.prod.outlook.com
 (2a01:111:e400:884e::22) with Microsoft SMTP Server (TLS) id 15.1.506.9; Wed,
 1 Jun 2016 12:58:20 +0000
Received: from AM3PR05MB0934.eurprd05.prod.outlook.com
 ([fe80::61e2:a015:6b2f:fe8f]) by AM3PR05MB0934.eurprd05.prod.outlook.com
 ([fe80::61e2:a015:6b2f:fe8f%18]) with mapi id 15.01.0506.013; Wed, 1 Jun 2016
 12:58:20 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: NC-SI support
Thread-Topic: NC-SI support
Thread-Index: AdG8BKUCQId+Fd6kT5icrdrQxnOJTQ==
Date: Wed, 1 Jun 2016 12:58:20 +0000
Message-ID: <AM3PR05MB093469618BEB77BB50C8C2AED5470@AM3PR05MB0934.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=mellanox.com;
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 0c4474a8-2de4-4210-de22-08d38a1c68a0
x-microsoft-exchange-diagnostics: 1; AM3PR05MB0933;
 5:s10N9g0accJamw5b6kjPihCyye0FRlZuuq+T0hIkvyohcdZDNWQqDME8ZdPaF/dbOlM9Dqjxu0lHad1L9O8DjruT+H1gIpRjaWlXRy8EYQih6jaHV76anBBt1Hp3fK5NcpPMzOXoJwVbRZJ5b8zVzg==;
 24:eQQUd9/ajvE44fY1gB3l2TZtozjUTcFWn1zeU+0AqNdu6+mpdMjjivuVQyrp+TCHMLdmXh+CuUGEzHGPMxsqjKmjgWywSmMdjEpV+CNEprg=;
 7:Y+ZF6O6f7ILZwqFEDXbJjDcjC4IxpyJyZGgr/3175As8r5wLFko9n9Ay9GtpotiTz7524KaFeJpySmw3mAOKZ8nclCYI8RYj+oilClDcdxcwxB1g7oUKTz5K0oF6MAx5rSkJNoUI/C0RRy0v9R+F5FhlZuUvcp5WrJh1X3cARj132vSEGJgMX8VfufezRMQW
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR05MB0933;
x-microsoft-antispam-prvs: <AM3PR05MB0933AD1C2A4BDB22606E5538D5470@AM3PR05MB0933.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
 SRVR:AM3PR05MB0933; BCL:0; PCL:0; RULEID:; SRVR:AM3PR05MB0933; 
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(3660700001)(19300405004)(33656002)(8936002)(3480700004)(11100500001)(110136002)(9686002)(76576001)(87936001)(107886002)(9326002)(19580395003)(8676002)(2906002)(15975445007)(54356999)(1730700003)(6116002)(16236675004)(790700001)(102836003)(50986999)(3846002)(586003)(2900100001)(5250100002)(81166006)(3280700002)(450100001)(74316001)(2501003)(2351001)(5002640100001)(189998001)(5003600100002)(5008740100001)(92566002)(86362001)(66066001)(229853001)(5004730100002)(19625215002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR05MB0933;
 H:AM3PR05MB0934.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM3PR05MB093469618BEB77BB50C8C2AED5470AM3PR05MB0934eurp_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2016 12:58:20.6431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR05MB0933
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2016 12:58:48 -0000

--_000_AM3PR05MB093469618BEB77BB50C8C2AED5470AM3PR05MB0934eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

The NC-SI interface is based on the RMII interface with some modifications =
for multiple network controllers to a single BMC. This modification contain=
s support for eight signals, which is extension of standard RMII.
We found NC-SI support for ASPEED SoC in u-boot code.

We don't see NC-SI support in kernel.

How is it supposed to work at kernel level?
Is it just configured in hardware by u-boot and it will work transparently =
in the kernel?

Thank you,
Shay

--_000_AM3PR05MB093469618BEB77BB50C8C2AED5470AM3PR05MB0934eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The NC-SI interface is based on the RMII interface w=
ith some modifications for multiple network controllers to a single BMC. Th=
is modification contains support for eight signals, which is extension of s=
tandard RMII.<o:p></o:p></p>
<p class=3D"MsoNormal">We found NC-SI support for ASPEED SoC in u-boot code=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We don&#8217;t see NC-SI support in kernel.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How is it supposed to work at kernel level?<o:p></o:=
p></p>
<p class=3D"MsoNormal">Is it just configured in hardware by u-boot and it w=
ill work transparently in the kernel?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you,<o:p></o:p></p>
<p class=3D"MsoNormal">Shay<o:p></o:p></p>
</div>
</body>
</html>

--_000_AM3PR05MB093469618BEB77BB50C8C2AED5470AM3PR05MB0934eurp_--
