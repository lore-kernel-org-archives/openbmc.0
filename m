Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.0.88; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="oSemV9Bk";
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00088.outbound.protection.outlook.com [40.107.0.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Ky820H5RzDqNG
 for <openbmc@lists.ozlabs.org>; Fri, 15 Mar 2019 05:35:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pqREdAYQbHufBXaHIuXVJorYltVJIOdjfPtVrXZZ+M=;
 b=oSemV9BkETTKhmJpTNXJ27iBR08WVVJKzDPjmKXAEUkAr/obhZnMhKilUZhCoN/7STzhbnhMzUZKlXZMcGVZgUnlhNfWi+rGuTzm7wUws0FDrGwTCRrlmzGGtgWxCz4JA4WhcLg9VExB4dwb5drmEjR+Z1hYo/UuXN3Wn4lSH/0=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB4045.eurprd05.prod.outlook.com (52.134.18.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.18; Thu, 14 Mar 2019 18:35:29 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16%3]) with mapi id 15.20.1686.021; Thu, 14 Mar 2019
 18:35:29 +0000
From: David Thompson <dthompson@mellanox.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Default root password: 2.4 vs. 2.6
Thread-Topic: Default root password: 2.4 vs. 2.6
Thread-Index: AdTalCKjrpRs5fklQweCqWufFoV6Ug==
Date: Thu, 14 Mar 2019 18:35:29 +0000
Message-ID: <VI1PR0502MB3869542E3098EFB729045C0EDD4B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: befc875f-9888-498a-c9b0-08d6a8abd599
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB4045; 
x-ms-traffictypediagnostic: VI1PR0502MB4045:
x-microsoft-exchange-diagnostics: =?us-ascii?Q?1; VI1PR0502MB4045;
 23:4FS+7MFPaOU4uVlyHgqDI++nxwwWLOn3ycApJ4r?=
 =?us-ascii?Q?6gTSm2+QBEowtJopb/NVUz4ZUhIqis4u+P3TdO7yHU9AUi7XkqsNOLED0u4c?=
 =?us-ascii?Q?JguxwjTyePYceZG3N+2Z/Yhq2uYuM39ZEB2hz9kIHejmUakU4jOMsc/NRdak?=
 =?us-ascii?Q?H6Kzmyni0OZwmQLhCmx7cuwZfrEZtzImpdK7q9Z+r0fYfiufFa0BIKSVZePI?=
 =?us-ascii?Q?Xhs8xJjeo1QCJrHSj1NhaIhsaMwQttqs2njY1tTYJwDD7hSF++VblWEfMp+p?=
 =?us-ascii?Q?QvNc0Xmh8hp+UG6z7nOOqLWhJmAR82Y6ulf5K75L2OBSRbvF6W8iB8E21Zyb?=
 =?us-ascii?Q?3HIfPnpKVj2r/4DvgkXZ3AzXZlzOd+1YEg51CcjZsGA75KkPMH8rks0VtBRK?=
 =?us-ascii?Q?OT4K1r1C/hABrmOGkHWm/LKhbvb439USaVFh/9MbMr9EiPnZ6M8wMto+9tck?=
 =?us-ascii?Q?yKi7XBGClT624sB+vW+/AXFShOI8WKjJ8uIVEX06SVWRZnxXV1ZMB309LO+S?=
 =?us-ascii?Q?43nnH9vwzDUnmvXU/pAaYtPJnsqwsghqgrKUcqZRI/O5kqD3rRd+TEg21ykB?=
 =?us-ascii?Q?GDbeFVhGdUX4YVJGgX6R7VRmMQQynCw7hfeNfhAQO8mFlL085Hri5Earhttb?=
 =?us-ascii?Q?iyrMlMGEWnlTleAhjsflkJROaGAQhtBis74IxwnVeixoq1SWce1mz9PYps2P?=
 =?us-ascii?Q?CfK9CUFGEAFLM+oDV9rDdLm41jWXOgcsyN9RL2ZgwCDQFMwNspuAGiuO4EI4?=
 =?us-ascii?Q?op1zLLtveLb0HNUkuIBlPS/+5mKGNi6HgUSWW9QiACja7Bct1G/DRDL3uAaL?=
 =?us-ascii?Q?6GWmh1UbnCSY9H0A7g7KBJUuTG2oM17aVSNRpalDA8pKNXDJaqHUQZxeaveY?=
 =?us-ascii?Q?xhBs7yP/ljiZiUX7CwqUxraW3fV1K4tuTEq+ycaEjH9cT0XhYvIIUR2M0ZpT?=
 =?us-ascii?Q?ErL8+tcc6Cc1XLipcglY08bs/bFcgINy386HRWACRHeMeXH9BXEdPHDo92N3?=
 =?us-ascii?Q?X7BvA9wkDsF+51fgrfs3JZ7G6eygWd99ZCUm99yW2ab2x9LOYSqj+U8uS0lr?=
 =?us-ascii?Q?aaRIyBPTG+5ifNrw1279HKhRHTE50jZyHwkd2W5HwX0dOpYXJfRN5L3hHumv?=
 =?us-ascii?Q?oMEGyyEWZwnh8f83QIPHOXvZ+cbJ5mlenOLT7l7cqeVutu8rUpJytqAdjWSw?=
 =?us-ascii?Q?Es9NsJjm23TrzzLq+bfZW4R/1Y9FWgCCbQrnjSGuN+LOkeVaNDpAAShpW7mZ?=
 =?us-ascii?Q?hS+Lpfn0l3ODhKt6yrVg=3D?=
x-microsoft-antispam-prvs: <VI1PR0502MB40459CD02B70739E326A10D2DD4B0@VI1PR0502MB4045.eurprd05.prod.outlook.com>
x-forefront-prvs: 09760A0505
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(6436002)(97736004)(256004)(54896002)(9686003)(14444005)(102836004)(6306002)(790700001)(86362001)(4744005)(55016002)(5660300002)(6116002)(316002)(2906002)(71190400001)(71200400001)(3846002)(476003)(53936002)(478600001)(5640700003)(25786009)(66066001)(33656002)(99286004)(8676002)(68736007)(1730700003)(81156014)(81166006)(486006)(6506007)(74316002)(8936002)(106356001)(105586002)(2351001)(26005)(6916009)(7736002)(14454004)(186003)(52536014)(7696005)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB4045;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lststzVjmeDNe6EtJSx7xIEXtymLJeFca0DhM3fFz4UzzyGEgOjvZ9Ey8JA0AB2UCY9SlhN2i5mR5ywvq0IUcBKx+eEfx1cEqYa0NpdWwMpK2c5bSb13bavzULwUlldRrKn7swgeUUC/cvU7KGbsqpJmjIyR/56m6UqjnBQDGxFcbevjh3b63A4RCaFNtHt8GwOEnJguw8mggA3+HAtI6vvp47DvgobsK50aaX1bloQG9FNBOuCiLDLlZLSm2m9VBCP6HAwiYlX2MjUvqJNPm2a4t/B8cwox2d6+UOj/4+vCX+Ug8byjSlJvLDttLBKqrlo+bmdqY4gmmn89POLizi/l9yLcwjhPqeWSyoQW2L6+1y+Mb7JCnXAP8RmAMrAtVepH9xJULOiyOuUwTPiH1vk1bIOmOJZUrW+Wo81t1Ys=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0502MB3869542E3098EFB729045C0EDD4B0VI1PR0502MB3869_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: befc875f-9888-498a-c9b0-08d6a8abd599
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2019 18:35:29.5343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB4045
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
X-List-Received-Date: Thu, 14 Mar 2019 18:35:47 -0000

--_000_VI1PR0502MB3869542E3098EFB729045C0EDD4B0VI1PR0502MB3869_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

When we transitioned our OpenBMC baseline from 2.4 to 2.6
we noticed that the default root password for our platform has
changed to "0penBmc".  This appears to come from the file:
meta-phosphor/conf/distro/include/phosphor-defaults.inc:
usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root;
And this password setting overrides the password we had chosen
in our machine's local.conf.sample.    We experimented but could not
find a way to prevent this override behavior.

Is this the intent with this change in 2.6 that all platforms by default
have root password of "0penBmc"?  Is there a way to have a platform
specific root password without changing "phosphor-defaults.inc"?

Regards,
Dave


--_000_VI1PR0502MB3869542E3098EFB729045C0EDD4B0VI1PR0502MB3869_
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
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">When we transitioned our OpenBMC baseline from 2.4 t=
o 2.6<o:p></o:p></p>
<p class=3D"MsoNormal">we noticed that the default root password for our pl=
atform has<o:p></o:p></p>
<p class=3D"MsoNormal">changed to &#8220;0penBmc&#8221;.&nbsp; This appears=
 to come from the file:<o:p></o:p></p>
<p class=3D"MsoNormal">meta-phosphor/conf/distro/include/phosphor-defaults.=
inc:&nbsp; <o:p>
</o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><i>usermod -p '\$1\$UGMqy=
qdG\$FZiylVFmRRfl9Z0Ue8G7e/' root;<o:p></o:p></i></p>
<p class=3D"MsoNormal">And this password setting overrides the password we =
had chosen<o:p></o:p></p>
<p class=3D"MsoNormal">in our machine&#8217;s local.conf.sample.&nbsp; &nbs=
p;&nbsp;We experimented but could not<o:p></o:p></p>
<p class=3D"MsoNormal">find a way to prevent this override behavior.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is this the intent with this change in 2.6 that all =
platforms by default<o:p></o:p></p>
<p class=3D"MsoNormal">have root password of &#8220;0penBmc&#8221;?&nbsp; I=
s there a way to have a platform<o:p></o:p></p>
<p class=3D"MsoNormal">specific root password without changing &#8220;phosp=
hor-defaults.inc&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Dave<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0502MB3869542E3098EFB729045C0EDD4B0VI1PR0502MB3869_--
