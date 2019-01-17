Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.81.138; helo=nam01-by2-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="a73ACm+l"; dkim-atps=neutral
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810138.outbound.protection.outlook.com [40.107.81.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gGV817GVzDqhs
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 18:51:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOhFQkYPEbRDDmIZhPHrO+Fba3tfLIdekQiDYxJU+ig=;
 b=a73ACm+lMux2VOgQGmn6AYdabCRnIoG3o47JlVkBW3H18aOjt8X5Vd17UDUDHVP6jmjkDNyN+QsCXKH2o7DnpOHBFqZn8ydrwtMk9xejqlfbjuGuUTqHngpOjSGr7MGFBsU0YFaRhH+rCeMysY4MAC3U8gURwivJ7e3HdOXqfP8=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB4400.namprd02.prod.outlook.com (52.135.119.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Thu, 17 Jan 2019 07:51:06 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f%4]) with mapi id 15.20.1537.018; Thu, 17 Jan 2019
 07:51:06 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: couple questions for OpenBMC 
Thread-Topic: couple questions for OpenBMC 
Thread-Index: AdSuOGDDOCeJ0FTHQom6IskZCJGACA==
Date: Thu, 17 Jan 2019 07:51:06 +0000
Message-ID: <SN6PR02MB5693D3A8387A48C7453FEC0796830@SN6PR02MB5693.namprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDE1MzIxNDhcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1hMWI2MGY1Yy0xYTJjLTExZTktODc5MS1iODhhNjBhMzA2OTFcYW1lLXRlc3RcYTFiNjBmNWQtMWEyYy0xMWU5LTg3OTEtYjg4YTYwYTMwNjkxYm9keS5odG1sIiBzej0iMzI0MSIgdD0iMTMxOTIxODUwNjE1ODM0ODk4IiBoPSJyVEUxa0tqVGlmcEJQdm5sTnd6Y0ppcGdPZkk9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [165.225.102.64]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB4400;
 20:Z0Mt5IWnS0TBpeF+KvEewbY7bF9fycnbtfT8eLmktsR93JHO8CLW5veVRF2R9fdA1qtmNw9sRIFpt5jRGtIOb8XOsqkBPhcnW7XdWHjsbnHEyFY5lsvdKldfnVWaRTLvrofQyz49dWHk5HaDo/SM3PNy9jFIQMlaAOKQCT9vxsQ=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 354138a4-5e8c-46f6-8944-08d67c50894c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB4400; 
x-ms-traffictypediagnostic: SN6PR02MB4400:
x-microsoft-antispam-prvs: <SN6PR02MB440003C0DC1A4BE1C368544E96830@SN6PR02MB4400.namprd02.prod.outlook.com>
x-forefront-prvs: 0920602B08
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(2351001)(54896002)(316002)(9686003)(256004)(5024004)(106356001)(33656002)(486006)(6916009)(81166006)(81156014)(8676002)(1730700003)(4743002)(25786009)(5660300001)(7696005)(53936002)(476003)(74316002)(7736002)(3480700005)(68736007)(9326002)(72206003)(6506007)(99286004)(26005)(478600001)(14454004)(86362001)(2501003)(186003)(102836004)(80792005)(97736004)(55016002)(105586002)(6116002)(3846002)(71190400001)(71200400001)(8936002)(790700001)(66066001)(4744005)(6436002)(55236004)(6306002)(5640700003)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB4400;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zTkDCYo85rPcv4IvAm7NU85WUBToBkI4/mfHnU6kTlFqL4M/ViNKNOC69g9PjsLYOL3Zx/3GQbiFbVbpg5kw3zCkKbwcV8FmlZyv5h/iTc379GWgBcXrHKo6babGIF5d/+R1Hn0COb10jvkMLYN1da+rRXSxWiWXHJPLxL7CyY2VZyxhV69JBL8r6b1P+yra5ni8VGINUslnBbVj+Moh2qU2uCT3kIyFYRL4JuleCIUBnXQ60bQnLTM3bOpFs4fWOQQcynWzeIzqtwOqPjpkblv43/RL9iuBtPBZ4WMIu4d8SEX+t8kWHAFR15XGsVRgY+SWocDBtr5GA4vIZCpwBORjxGRZckarAShkoH60N0FMf4K3hhzaHH5CnTybbKTSZtxqti2xxijczGAbvDnlwsp5MwtTEIfqgZXdhVxXg7A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB5693D3A8387A48C7453FEC0796830SN6PR02MB5693namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354138a4-5e8c-46f6-8944-08d67c50894c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2019 07:51:06.0775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4400
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
X-List-Received-Date: Thu, 17 Jan 2019 07:51:13 -0000

--_000_SN6PR02MB5693D3A8387A48C7453FEC0796830SN6PR02MB5693namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi
I have couple questions about OpenBMC .

1.if I decide use OpenBMC solution , Does it mean I should put all BMC sour=
ce code on github including some commercial software  ?

2.Are there any tutorial or /document  for using dbus within OpenBMC ?

3.Why there is no release note after V1.05 ?  Will the coming release  atta=
ch release note ?

4.I know openBMC is using some file text to represent  device (LED , sensor=
) , but I am curious about how this files bind to real device ?
   Where is the low level operation relate code ?


Thanks -Brenden


Brenden Lai
SR. BMC Design Engineer
E&I, Jabil Design Services


--_000_SN6PR02MB5693D3A8387A48C7453FEC0796830SN6PR02MB5693namp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
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
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Hi <o:p></o:p></p>
<p class=3D"MsoNormal">I have couple questions about OpenBMC . <o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1.if I decide use OpenBMC solution , Does it mean I =
should put all BMC source code on github including some commercial software=
 &nbsp;?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2.Are there any tutorial or /document &nbsp;for usin=
g dbus within OpenBMC ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3.Why there is no release note after V1.05 ?&nbsp; W=
ill the coming release&nbsp; attach release note ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">4.I know openBMC is using some file text to represen=
t &nbsp;device (LED , sensor) , but I am curious about how this files bind =
to real device ?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; Where is the low level operation relate=
 code ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks -Brenden<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:10.0pt;color:black">Brenden Lai<br>
SR. BMC Design Engineer<br>
</span><span style=3D"font-size:10.0pt;color:#222222">E&amp;I, Jabil Design=
 Services</span><span style=3D"font-size:10.0pt;color:black"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SN6PR02MB5693D3A8387A48C7453FEC0796830SN6PR02MB5693namp_--
