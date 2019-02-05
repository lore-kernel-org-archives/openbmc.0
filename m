Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.73.139; helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.com header.i=@jabil.com header.b="qMYrRuTY"; 
 dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730139.outbound.protection.outlook.com [40.107.73.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tsfP6g3yzDqJt
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 15:53:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQtzx95K6ypJL/3rLoKbTPWFLoe8CEeRDGq0Evina4k=;
 b=qMYrRuTYGrT84+BGwGJQTtuOlR635DWQjN7WV2igCK20Y9nGYFFvHo+U0Q6LbHxCzjAW/S+E7qd40I/Z6+ph0qHU+LxobR5jB1bn/GgemXxatGmQqH6cJytZ1P4W4pDYxbsUiie3gNDv/3ZSIYzX/iDRhmjRANUtZTltkl6bVl4=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB4287.namprd02.prod.outlook.com (52.135.118.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.22; Tue, 5 Feb 2019 04:53:25 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::40f4:6107:9cdc:3271]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::40f4:6107:9cdc:3271%2]) with mapi id 15.20.1580.019; Tue, 5 Feb 2019
 04:53:25 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: recipes for repo
Thread-Topic: recipes for repo
Thread-Index: AdS9DpGfLLEjp7YPRWS5uy60zL51dw==
Date: Tue, 5 Feb 2019 04:53:24 +0000
Message-ID: <SN6PR02MB5693D019A575B7B7E990B7EE966E0@SN6PR02MB5693.namprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDE1MzIxNDhcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1mMmVhOTkyMy0yOTAxLTExZTktODc5Yy1iODhhNjBhMzA2OTFcYW1lLXRlc3RcZjJlYTk5MjQtMjkwMS0xMWU5LTg3OWMtYjg4YTYwYTMwNjkxYm9keS5odG1sIiBzej0iNTM4MiIgdD0iMTMxOTM4MTU5OTY5MDczOTIwIiBoPSJvb1g4UmdvWXVUd2FGMXhJL3BEZlUwWlRsUGM9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [2001:b011:300b:16b6:5542:b1b7:c26d:1615]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB4287;
 20:JjmnIzHG5PtGRNAvodSWrkiyZVmGTZgA8PZqi/5HR8624gzTscQx3Z035WIgFBNk4OovxbOOUhMntxoS+G0rwuOYYLrdWZz289yRfvT1kinP837HHT3ShmxSjboOvzm2K/0V6NTKFGYZbRqGC+UcME2k7usIwNQ+2ZR3nEDnNhQ=
x-ms-office365-filtering-correlation-id: f4af45d3-9bf1-409e-8d78-08d68b25dcb4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB4287; 
x-ms-traffictypediagnostic: SN6PR02MB4287:
x-microsoft-antispam-prvs: <SN6PR02MB4287412EF3F71124A98FACA7966E0@SN6PR02MB4287.namprd02.prod.outlook.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(376002)(396003)(366004)(136003)(189003)(199004)(71200400001)(71190400001)(53936002)(25786009)(102836004)(3480700005)(74316002)(9686003)(6306002)(54896002)(7696005)(55016002)(6436002)(5640700003)(6506007)(7736002)(4744005)(6916009)(86362001)(2906002)(33656002)(256004)(486006)(105586002)(7116003)(106356001)(2351001)(476003)(8936002)(46003)(8676002)(81156014)(81166006)(1730700003)(68736007)(80792005)(966005)(72206003)(14454004)(478600001)(2501003)(186003)(99286004)(316002)(97736004)(790700001)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB4287;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 59/sydrMw6wkegXWxhcKMUzWxLFP0/rHZaevJ4A9itozRK4wxqjSoG1B2xpiyn+DpsHxrtGx+rFKUP9oUsU9h7xIeFYE7m7c31rEe/kSAJni61SIrnMoLUHE07xvJTXS9X9JC3X3b0qmR62/jtryYyPxi9/OJjvXpYdWxQhpWZGPdHpRrYqRt2BHQiqihJ6juysnGno0uU7hsS2tZwivzpTzIdDIeqKcgPNf/J5aO9XMgE3jDktOPi7L/s9nYVZhi2kj2oqR7Klda70DOIKuwNcD1HrRj60bOKhrl/R/6EY58GajrsATnFo7tZ33Gd2nXYdVeXdNiOsAOCtpMDTmrYEvGsvoKjWdQbyQqHGSvYAxinTvW9MnHhYrvv9R8iQYEZI9hMtfdb9w0kIx/tAs9pCY9oN+k6Oupo8Jm8tjyeQ=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR02MB5693D019A575B7B7E990B7EE966E0SN6PR02MB5693namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4af45d3-9bf1-409e-8d78-08d68b25dcb4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 04:53:25.0603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4287
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
X-List-Received-Date: Tue, 05 Feb 2019 04:53:35 -0000

--_000_SN6PR02MB5693D019A575B7B7E990B7EE966E0SN6PR02MB5693namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi ,

I knew there are many features (bmcweb,ikvm,dbus-sensor) are implemented in=
 each repo .
However , I compiled the dbus revision ipmitool source code, copy prebuild =
binary to image by refer to below
https://github.com/openbmc/docs/blob/master/yocto-development.md
I was able to test the phosphor-host-ipmid functionality via dbus-ipmitool =
within openbmc image
But are there any recipe to include ipmitool while building openbmc images =
?
I mean just type bitbake obmc-phosphor-image , then all selected feature wi=
ll be include in the target image.
After checking , Not only ipmitool lack  , but also the major features(IPMI=
 , redfish ..etc).

Here comes my questions.

  1.  Will OpenBMC  have plans to provide recipes for every OpenBMC repo in=
 the near feature ?
  2.  Take Romulus for example , how it include bmcweb feature into image w=
ithout recipe for bmcweb repo ?

Thanks -Brenden



Brenden Lai
SR. BMC Design Engineer
E&I, Jabil Design Services


--_000_SN6PR02MB5693D019A575B7B7E990B7EE966E0SN6PR02MB5693namp_
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
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1783963290;
	mso-list-type:hybrid;
	mso-list-template-ids:546497850 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
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
<p class=3D"MsoNormal">Hi , <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I knew there are many features (bmcweb,ikvm,dbus-sen=
sor) are implemented in each repo .
<o:p></o:p></p>
<p class=3D"MsoNormal">However , I compiled the dbus revision ipmitool sour=
ce code, copy prebuild binary to image by refer to below<o:p></o:p></p>
<p class=3D"MsoNormal">https://github.com/openbmc/docs/blob/master/yocto-de=
velopment.md &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I was able to test the phosphor-host-ipmid functiona=
lity via dbus-ipmitool within openbmc image
<o:p></o:p></p>
<p class=3D"MsoNormal">But are there any recipe to include ipmitool while b=
uilding openbmc images ?<o:p></o:p></p>
<p class=3D"MsoNormal">I mean just type bitbake obmc-phosphor-image , then =
all selected feature will be include in the target image.
<o:p></o:p></p>
<p class=3D"MsoNormal">After checking , Not only ipmitool lack &nbsp;, but =
also the major features(IPMI , redfish ..etc).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here comes my questions.<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Will OpenBMC &nbsp;have plans to provide recipes for every OpenBMC re=
po in the near feature ?<o:p></o:p></li><li class=3D"MsoListParagraph" styl=
e=3D"margin-left:0in;mso-list:l0 level1 lfo1">Take Romulus for example , ho=
w it include bmcweb feature into image without recipe for bmcweb repo ?
<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks -Brenden<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_SN6PR02MB5693D019A575B7B7E990B7EE966E0SN6PR02MB5693namp_--
