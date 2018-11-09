Return-Path: <maheswari.a@atos.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=atos.net
 (client-ip=193.56.114.164; helo=smtppost.atos.net;
 envelope-from=maheswari.a@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=atos.net
Received: from smtppost.atos.net (smtppost.atos.net [193.56.114.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42rxh73YmKzF3ZV
 for <openbmc@lists.ozlabs.org>; Fri,  9 Nov 2018 21:48:05 +1100 (AEDT)
Received: from mail1-ext.my-it-solutions.net (mail1-ext.my-it-solutions.net)
 by smarthost3.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 5ad0_0ae9_bee37e23_5f88_455c_92f5_6aa0c2ea308d;
 Fri, 09 Nov 2018 11:48:01 +0100
Received: from mail3-int.my-it-solutions.net ([10.92.32.10])
 by mail1-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wA9Am1rj003009
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 9 Nov 2018 11:48:01 +0100
Received: from DEFTHW99ETYMSX.ww931.my-it-solutions.net
 (defthw99etymsx.ww931.my-it-solutions.net [10.86.142.53])
 by mail3-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wA9Am0DA021258
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 9 Nov 2018 11:48:01 +0100
Received: from DEFTHW99ETRMSX.ww931.my-it-solutions.net (10.86.142.99) by
 DEFTHW99ETYMSX.ww931.my-it-solutions.net (10.86.142.53) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Fri, 9 Nov 2018 11:48:00 +0100
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.99) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 9 Nov 2018 11:47:59 +0100
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com (20.177.195.218) by
 DB7PR02MB3833.eurprd02.prod.outlook.com (52.134.97.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.27; Fri, 9 Nov 2018 10:47:58 +0000
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::85c4:acab:8a58:5703]) by DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::85c4:acab:8a58:5703%4]) with mapi id 15.20.1294.034; Fri, 9 Nov 2018
 10:47:58 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: help: OpenBMC phosphor-hwmon-readd support for non-hwmon drivers in
 linux.
Thread-Topic: help: OpenBMC phosphor-hwmon-readd support for non-hwmon drivers
 in linux.
Thread-Index: AdR4GX0gbtwxnhA1SdGC/F2NXc9b8w==
Date: Fri, 9 Nov 2018 10:47:58 +0000
Message-ID: <DB7PR02MB4393A3457D05909DB01F6D2292C60@DB7PR02MB4393.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [125.17.240.230]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR02MB3833;
 6:jMHWGWy0dw1EkjykHISh4TPUs0Bz+NP7sVChoOofoaA0WCzTZ9dW4/Dp3lYoYL7qKRYSVGh4+sUKMCkhSRTClWEAch4qiofUwkD6e726vp8Nb1MS9qnG/g2oP+fGUTThtQIWC8nsSzCxZWGWKmS+dVgVhC6Cx8w51hIXXtuzXGq0dLsK9RfCGqwBnRxvRxQ8eMdeqDi0dQcWuaQgBcs0nKGa8qXiPCZ8yLk2mmy+VLHUPdnQRgWYsO2esZFc9ohuF+3qKYOzqsS5Mti0AOjK+BJacHF6/5gsjykdvJBp3SUWfT7Bc5zNZq/Lg/WBgEQGsX3golvKeXOd9234zrofWdgwTVqvnA3De4qRZVZJ577SrKc4DDruGhQACQHHqpkQ0KLE8omChjbcwGInAXBzIe+9FbUrDtRB4GUh7a0bU7li9VIZByhAHqoppYnik1dR1iwZWwyeacjohT8Ivbcxow==;
 5:39uSkos0Hm3JDylDRrIUVZYS+BUBxtfWQwO+u0cusbS5ryXtqlMeZho8rjvkjFl7/GSKrXeo0cPeRebs4nZ1Lu7GfN/hXvJzSQ3sd8sVBivTVQv49GNGxnp45qW68zl6pOetNTUAXd9NiewQTbs9M+T63smqO2MPLsA0sMQmDCo=;
 7:UOfE1KaEVwXtiMoK7zlmtNGurYH8IgijffNhniCLCXpmh8u1xT6S4eDIjRkbLRPpKHXcnASOzO0nU26kIPJY9nCn/Njqt9Z36oWQW6f0UoClxLlMzzDKBjF7K0S7Y3E9nPus6GAsWxDUYg3hzSnZpg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: fa759154-47c6-417f-b656-08d64630d055
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:DB7PR02MB3833; 
x-ms-traffictypediagnostic: DB7PR02MB3833:
x-microsoft-antispam-prvs: <DB7PR02MB3833FD35A9C23201C285EF6592C60@DB7PR02MB3833.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231382)(944501410)(52105095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:DB7PR02MB3833; BCL:0; PCL:0; RULEID:; SRVR:DB7PR02MB3833; 
x-forefront-prvs: 08512C5403
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39860400002)(346002)(366004)(136003)(396003)(189003)(199004)(6306002)(54896002)(2900100001)(33656002)(7736002)(9686003)(9326002)(66066001)(6436002)(71190400001)(74316002)(105586002)(71200400001)(14454004)(8676002)(476003)(55016002)(6116002)(486006)(3846002)(790700001)(86362001)(53936002)(81156014)(5660300001)(81166006)(106356001)(97736004)(8936002)(102836004)(478600001)(6916009)(316002)(6506007)(256004)(186003)(99286004)(2906002)(7696005)(26005)(68736007)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB3833;
 H:DB7PR02MB4393.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: exi6T17Adhp6zLCYQq8r7wwIq3yCZ3kHxhUqfbE/vsImCVyA1O98u9vIIlxEUDuWqU6JwmLE9hDcI++GBv/sCtR5IwG8yln5G3t22cljyMb9A9PZHR6/ZXiM9+b2uxgY4JpNEP2Js4NZJCzk37oCt5wnNcUwTu5ybOldFJo2DbzA05Z8k6QG9jaf6SHlktTi+un+z4awanVV7X5SGf/ERgkyVdA3bcnnIeiM1YBNChxwle1DnnM4KhXNmEB98hLYm6rdsYdW9nNo2dIeUC9QGWE7AIs/wdysTErkMcZJ395XmL4eqHnX/yIN4HCzXeF6aN0Nr6goCpxF0w4/Nz5lhSNXfCRioLw7JGK/IsJlp1M=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB7PR02MB4393A3457D05909DB01F6D2292C60DB7PR02MB4393eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fa759154-47c6-417f-b656-08d64630d055
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2018 10:47:58.6416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB3833
X-OriginatorOrg: atos.net
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
X-List-Received-Date: Fri, 09 Nov 2018 10:48:09 -0000

--_000_DB7PR02MB4393A3457D05909DB01F6D2292C60DB7PR02MB4393eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

As of my understanding, we need to add chip specific driver support in linu=
x hwmon feature to list the sensors in OpenBMC webUI.

1082 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-=
bus@140/pxm1310@XX
1083 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-=
bus@140/ir38163@XX
1084 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-=
bus@1c0/mpcie_bmc_temp@XX
1085 root      6388 S    phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-=
bus@140/pxe1610@XX

I have added some PMBUS driver to get temp ,input values of VRs and I used =
exiting lm75 hwmon driver to get temperature sensors.
Added OpenBMC configuration files also.  So, I am able to list some sensors=
  and its exact values in openbmc WebUI.

Now,

I need to add some more temp sensors which is connected to PCA95X chip chan=
nel 0,channel 1.
PCA95X driver is already supported in linux/driver/i2c/muxes/.   But NOT li=
sted under hwmon features.  So This chip attributes will NOT be registered =
as  hwmon sysfs attribute.

If I want to add this temperature sensor in OpenBMC webUI
Should I add this PCA95X driver code under hwmon?.  ( with hwmon_register a=
nd hwmon_unregister).
Please give your concern , is there any other way to add sensor attribute p=
ath to  phosphor-hwmon-readd daemon in OBMC.

Thanks
Maheswari A






--_000_DB7PR02MB4393A3457D05909DB01F6D2292C60DB7PR02MB4393eurp_
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
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As of my understanding, we need to add chip specific=
 driver support in linux hwmon feature to list the sensors in OpenBMC webUI=
.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1082 root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6388 S&nbsp;=
&nbsp;&nbsp; phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@140/pxm1=
310@XX<o:p></o:p></p>
<p class=3D"MsoNormal">1083 root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6388 S&nbsp;=
&nbsp;&nbsp; phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@140/ir38=
163@XX<o:p></o:p></p>
<p class=3D"MsoNormal">1084 root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6388 S&nbsp;=
&nbsp;&nbsp; phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@1c0/mpci=
e_bmc_temp@XX<o:p></o:p></p>
<p class=3D"MsoNormal">1085 root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6388 S&nbsp;=
&nbsp;&nbsp; phosphor-hwmon-readd -o /ahb/apb/i2c@1e78a000/i2c-bus@140/pxe1=
610@XX<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have added some PMBUS driver to get temp ,input va=
lues of VRs and I used exiting lm75 hwmon driver to get temperature sensors=
.
<o:p></o:p></p>
<p class=3D"MsoNormal">Added OpenBMC configuration files also. &nbsp;So, I =
am able to list some sensors&nbsp; and its exact values in openbmc WebUI.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Now, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I need to add some more temp sensors which is connec=
ted to PCA95X chip channel 0,channel 1.
<o:p></o:p></p>
<p class=3D"MsoNormal">PCA95X driver is already supported in linux/driver/i=
2c/muxes/.&nbsp;&nbsp;
<b><span style=3D"color:black">But NOT listed under hwmon features</span></=
b>. &nbsp;So This chip attributes will NOT be registered as &nbsp;hwmon sys=
fs attribute.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I want to add this temperature sensor in OpenBMC =
webUI<o:p></o:p></p>
<p class=3D"MsoNormal">Should I add this PCA95X driver code under hwmon?. &=
nbsp;( with hwmon_register and hwmon_unregister).
<o:p></o:p></p>
<p class=3D"MsoNormal">Please give your concern , is there any other way to=
 add sensor attribute path to &nbsp;phosphor-hwmon-readd daemon in OBMC.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Maheswari A<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB7PR02MB4393A3457D05909DB01F6D2292C60DB7PR02MB4393eurp_--
