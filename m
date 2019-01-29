Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.72.112; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=permerror header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.com header.i=@jabil.com header.b="k6RMtlRI"; 
 dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720112.outbound.protection.outlook.com [40.107.72.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43pXyp0wpRzDqDY
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 15:07:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TImKZwYoRinLju2Vukk/rJEQVbcjeoHeM1cYIuIIMo4=;
 b=k6RMtlRINOrLRPk3xPY0GFudLNjnHvazISbn57IaxuFQKhmpSJyCMmF5ZnH1Aw9kXBmv+OOXi59bjfusuyfn7ty7aqGwXZxOZw35oybXKDjmmgC4KUmTvncW14/vP1YJu0nkbHTD/ORdBUN4+tV+ywE17KD+oClJhNZfCo36U8Q=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB4256.namprd02.prod.outlook.com (52.135.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.16; Tue, 29 Jan 2019 04:07:41 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::40f4:6107:9cdc:3271]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::40f4:6107:9cdc:3271%2]) with mapi id 15.20.1558.023; Tue, 29 Jan 2019
 04:07:40 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: dts file questions
Thread-Topic: dts file questions
Thread-Index: AdS3hk9s5ritFbd1TOeDOqaZjc2KKA==
Date: Tue, 29 Jan 2019 04:07:40 +0000
Message-ID: <SN6PR02MB5693EB44045D9C63CA2E48C896970@SN6PR02MB5693.namprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDE1MzIxNDhcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy02ODMyMGJmYy0yMzdiLTExZTktODc5YS1iODhhNjBhMzA2OTFcYW1lLXRlc3RcNjgzMjBiZmQtMjM3Yi0xMWU5LTg3OWEtYjg4YTYwYTMwNjkxYm9keS5odG1sIiBzej0iNTEzMCIgdD0iMTMxOTMyMDg0NTU3OTcxNjUzIiBoPSI4WE9VUGFPSEN2elZiMWZ0RGZLenF0VkI3M0k9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [165.225.102.66]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB4256;
 20:82hNxG2BwVjyfag3+hA+rzqU7cWM7U77IiW2Di17kfix5f5JtGAEwH1dKKO/9zYyHSVvAygxTuEd6npWRD3JITo3A7B5spDt0rc/plZJSCa2UuhAbS05XvuFvu88BcPt/NAPbGAzlCWG9a7m1GFzvSPp4eR+8TSn5erpJJM5XDs=
x-ms-office365-filtering-correlation-id: a8897b72-5255-490a-db0a-08d6859f501a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB4256; 
x-ms-traffictypediagnostic: SN6PR02MB4256:
x-microsoft-antispam-prvs: <SN6PR02MB4256BCA86EDEFD225B9730D096970@SN6PR02MB4256.namprd02.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(366004)(136003)(39860400002)(53754006)(189003)(199004)(105586002)(106356001)(7116003)(1730700003)(2351001)(81166006)(81156014)(7696005)(8676002)(8936002)(6436002)(606006)(5640700003)(55016002)(53936002)(790700001)(102836004)(186003)(55236004)(486006)(3480700005)(6116002)(476003)(26005)(4744005)(6506007)(3846002)(68736007)(33656002)(256004)(2501003)(6306002)(25786009)(54896002)(236005)(71190400001)(71200400001)(9686003)(2906002)(966005)(66066001)(80792005)(6916009)(97736004)(7736002)(86362001)(316002)(478600001)(14454004)(72206003)(99286004)(74316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB4256;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ddh+C44PsJMkU79GpXsHCIqb9Z29E+DJwqCEBulxWLoqi5TEvhWzFEmHQBOn2iKOlI0cRKKISjjAJhBPoRDsHAPUwppbFt4aw2pfFwqRt1aSGy5qawwDkT9IB4VLVZak89EFmy7H4B+nzPcMUzq6Byph8IYjC7XglDBVbt9TLDdD1XpkcfLk1NAoDS3NIcxMYD4GWqsR7VcQiOGumyflnifqIARIQYVvlK7CLxQWHozvnT6OMqbE9CfEbw6syhEIYBOfwK0ariXvCjEWniN/tAZaKJyb59JHZaUp8Wkrqr3dn+A85rP3I7QQumeAVTpmHmRPnuXIQDRs5zEKsSjwqCjfW+wa8MnTz40b4v4YY4y4fU10UFmkn2he79GLMAhOSr45/XBQxBJi5tkKD+g4XNEezdb/0GCySRCiurC1hgg=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB5693EB44045D9C63CA2E48C896970SN6PR02MB5693namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8897b72-5255-490a-db0a-08d6859f501a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 04:07:40.8329 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4256
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
X-List-Received-Date: Tue, 29 Jan 2019 04:07:47 -0000

--_000_SN6PR02MB5693EB44045D9C63CA2E48C896970SN6PR02MB5693namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all ,
               I have couple dts questions about  porting OpenBMC into a ne=
w machine .


  1.  Although  there are many dts file located in  https://github.com/open=
bmc/linux/blob/dev-4.13/arch/arm/boot/dts/ ,
But , how does bitbake know which one should be applied .

  1.  if there are no suitable dts file in github , it should be made by my=
self , where should I put my dts file in working space  source tree?



Brenden Lai
SR. BMC Design Engineer
E&I, Jabil Design Services


--_000_SN6PR02MB5693EB44045D9C63CA2E48C896970SN6PR02MB5693namp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:1597203049;
	mso-list-type:hybrid;
	mso-list-template-ids:-1414378138 1218487394 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:1.25in;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:1.75in;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.25in;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:2.75in;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:3.25in;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:3.75in;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:4.25in;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:4.75in;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all , <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have couple dts questions about &nbsp;po=
rting OpenBMC into a new machine .<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list:l0 level=
1 lfo1">Although&nbsp; there are many dts file located in&nbsp;
<a href=3D"https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts=
/">https://github.com/openbmc/linux/blob/dev-4.13/arch/arm/boot/dts/</a> ,
<o:p></o:p></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:.75in">But , how does bitbake k=
now which one should be applied .
<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:.25in;mso-list:l0 level=
1 lfo1">if there are no suitable dts file in github , it should be made by =
myself , where should I put my dts file in working space &nbsp;source tree?=
<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.75in"><o:p>&nbsp;</o:p></p>
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

--_000_SN6PR02MB5693EB44045D9C63CA2E48C896970SN6PR02MB5693namp_--
