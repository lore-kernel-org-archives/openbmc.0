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
 by lists.ozlabs.org (Postfix) with ESMTPS id 42kCx24KK1zDrPy
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 23:05:54 +1100 (AEDT)
Received: from mail2-ext.my-it-solutions.net (mail2-ext.my-it-solutions.net)
 by smarthost5.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 3244_7c46_afa547e2_0e34_41fb_8ae5_03bcb44c52cd;
 Mon, 29 Oct 2018 13:05:41 +0100
Received: from mail3-int.my-it-solutions.net ([10.92.32.10])
 by mail2-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id w9TC5fU0001836
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Oct 2018 13:05:41 +0100
Received: from DEERLM99ETRMSX.ww931.my-it-solutions.net ([10.86.142.103])
 by mail3-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id w9TC5fRY004012
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 29 Oct 2018 13:05:41 +0100
Received: from DEERLM99ETQMSX.ww931.my-it-solutions.net (10.86.142.102) by
 DEERLM99ETRMSX.ww931.my-it-solutions.net (10.86.142.103) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Mon, 29 Oct 2018 13:05:40 +0100
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.102) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Mon, 29 Oct 2018 13:05:39 +0100
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com (20.177.195.218) by
 DB7PR02MB4267.eurprd02.prod.outlook.com (20.176.239.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1273.26; Mon, 29 Oct 2018 12:05:38 +0000
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::85c4:acab:8a58:5703]) by DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::85c4:acab:8a58:5703%4]) with mapi id 15.20.1273.027; Mon, 29 Oct 2018
 12:05:38 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: help: OpenBMC host power on from power button press
Thread-Topic: help: OpenBMC host power on from power button press
Thread-Index: AdRs54UeqefSR9IQS/m8iyhijr0xNwAgRy4AAIVFeiA=
Date: Mon, 29 Oct 2018 12:05:38 +0000
Message-ID: <DB7PR02MB4393F07453FADA45F59118FD92F30@DB7PR02MB4393.eurprd02.prod.outlook.com>
References: <DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com>
 <8d187aba-eba1-f68b-17c5-62686e0227a8@linux.vnet.ibm.com>
In-Reply-To: <8d187aba-eba1-f68b-17c5-62686e0227a8@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [125.17.240.232]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR02MB4267;
 6:dxa6qX5KRuPlqiZYPofhy5NgB8N0Kh1eOeKxAEpnY6eAlwSdusfxOD4kQOOSbH6UQVDe+9luHam/x3fqqK/tByJrdKZW4iMhitI5YXvds7utQ/3DPIGme8HPqikwOmg3DZk+nGl0TI1rrBCGGQd1dGWvSBNWDDQ30lcfiz9GNJTEdZkEZRPi2Kl/WTfW1+gOjT8W2JblXIzpBO3ZCWuxYYSS9vuRnxGoZFcCP+86qxENADeToxaN8XcCEYoDAof+deJduPK+84mccBmh1z3snJXc0+1XasPhOTZNzy07KbjCpwPz6kC1KXbI5F1zzMTZg32b0EPCUfVOrsV3fTFQw9WtDb/DOe2ufDTtLpXtCTSTLR5lLWF32r4jmyLl1+pBXuuef8LfsVEadN4jqea9wHEganrfPclCKgVgV7CincUgQrhtSTtErLb+we4wQdnC+2FbPSIEQd70USi6C/xhMw==;
 5:DK3lKnNZ7zygS8cQ2ylZZL9YaiAclv8BP3KOvEHK0xwEh1lX42bjjt3WeVPsBO1DJ2MnUhY524rZBwCwRx9IJ2/ab0fW7IQNzdCRbDcG1fej/BGoGjeUzDUthsPJTuVlrjr+DZx52597fYd3BB4YGoxltovP0EldrTHu/V1WdOc=;
 7:SOiCnocq6je66bqw9WupHvuoy7ercQ3pLGqjf17o++qAe/wcMITaPn+jGXXtMWrpMf5meMXuP+/uDhsip00x3G+byS+8WqUa24oTnQDY1a8rDbzCmUglmuns7JD6AE3oBtUpsRC1Bseth/GBntS/ig==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ca80cc7a-e111-4796-b3ae-08d63d96d74b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:DB7PR02MB4267; 
x-ms-traffictypediagnostic: DB7PR02MB4267:
x-microsoft-antispam-prvs: <DB7PR02MB426735A12F0711CCB89A696392F30@DB7PR02MB4267.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(72170088055959)(104084551191319)(164563717011359)(65623756079841)(21748063052155)(28532068793085)(190501279198761)(227612066756510);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:DB7PR02MB4267; BCL:0; PCL:0; RULEID:; SRVR:DB7PR02MB4267; 
x-forefront-prvs: 084080FC15
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(236005)(6246003)(2900100001)(106356001)(55016002)(54896002)(8936002)(81166006)(81156014)(6916009)(8676002)(6306002)(33656002)(105586002)(6436002)(4326008)(53936002)(5660300001)(9686003)(6116002)(790700001)(3846002)(14454004)(478600001)(476003)(486006)(229853002)(53546011)(7696005)(68736007)(76176011)(5250100002)(6506007)(97736004)(26005)(25786009)(66066001)(71200400001)(71190400001)(256004)(9326002)(186003)(74316002)(102836004)(316002)(2906002)(86362001)(99286004)(446003)(11346002)(7736002)(460985005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB4267;
 H:DB7PR02MB4393.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: oTRelYKNNMMxqJHed42Pwy4ytupPDrPxokVpp9TfbG3Jyb7EegX4KSUOnRfcOY0kPg6CnHi1FcQnAHB3nfi44LifurDMt2JM3uVaYuyepkJVRHHInNiCU/2MFrVeMFDMU0PLbY4eJpS0JCKEUDyspFo+cr6gy2kmv8Mmabkb5PfA4B9rAd5mcvoxNJ356AqUxfE3P3Uv1Y1EuK8JbC47pvLBX70ZVWAzsT9Jw98ayHh+h/81aeHGiMLfcZVAfqf79Am8SUoCqnciqwJQcmbKFUHC1P8xAb9IWcpiv3Adwi/OiAcarBb7bDDslsXSdM/nz/c4PDEQpMRpmhk36As8Fh8+CJ/7SdTm/iXT+NMFw08=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB7PR02MB4393F07453FADA45F59118FD92F30DB7PR02MB4393eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ca80cc7a-e111-4796-b3ae-08d63d96d74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2018 12:05:38.5024 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4267
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
X-List-Received-Date: Mon, 29 Oct 2018 12:06:01 -0000

--_000_DB7PR02MB4393F07453FADA45F59118FD92F30DB7PR02MB4393eurp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable


Hi Matt,

Thanks for your response.

I am able to power on the Host by monitoring GPIO using =1B$B!H=1B(Bphospho=
r-gpio-monitor=1B$B!I=1B(B service.

But still we need to achieve same result by org.openbmc.buttons.Power@0.ser=
vice<mailto:org.openbmc.buttons.Power@0.service> in future.

Here is the response :

# systemctl status org.openbmc.buttons.Power@0.service<mailto:org.openbmc.b=
uttons.Power@0.service>
=1B$B!|=1B(B org.openbmc.buttons.Power@0.service - Phosphor Power Button0
   Loaded: loaded (/lib/systemd/system/org.openbmc.buttons.Power@.service; =
indirect; vendor preset: enabled)
   Active: inactive (dead)

hwmi~# ps | grep button_power.exe
1205 root      3100 S    grep button_power.exe
hwmi:~#

button_power.exe is not running in BMC.  Service status with instance 0 is =
not showing any error. But button_power.exe is not running. So that I tried=
 with instance 1.

I think below file is responsible for button power controlling in OBMC.
c/skeleton/blob/master/pwrbutton/button_power_obj.c

Here is the receipe file.

Cat ./meta-phosphor/recipes-phosphor/chassis/obmc-button-power.bb
SUMMARY =3D "OpenBMC org.openbmc.Button example implementation"
DESCRIPTION =3D "A sample implementation for a button controlling a power d=
omain."
PR =3D "r1"

inherit skeleton-gdbus
inherit obmc-phosphor-dbus-service
inherit pkgconfig

SKELETON_DIR =3D "pwrbutton"

FMT =3D "org.openbmc.buttons.Power@{0}.service"
DBUS_SERVICE_${PN} +=3D "${@compose_list(d, 'FMT', 'OBMC_POWER_BUTTON_INSTA=
NCES')}"

If you need journal log, then I can share it. I need to understand the flow=
.

Please help to achieve.

Thanks
Maheswari A
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Sent: Saturday, October 27, 2018 1:45 AM
To: A, Maheswari <maheswari.a@atos.net>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: help: OpenBMC host power on from power button press


On 10/25/2018 11:52 PM, A, Maheswari wrote:
Hi,

I am new to openBMC project.

We are in the process of porting power button gpio interrupt handling in op=
enBMC.

After some a lot of analysis, I found that obmc-button-power related servic=
e are necessary to power on the host using power button press event.

I have added POWER_BUTTON and machine specific GPIO number and polarity in =
gpio_defs.json.

While starting the =1B$B!H=1B(Borg.openbmc.button.Power=1B$B!I=1B(B service=
, I am getting the below error.

   org.openbmc.buttons.Power@1.service<mailto:org.openbmc.buttons.Power@1.s=
ervice> - Phosphor Power Button1
   Loaded: [[0;1;31merror[[0m (Reason: File exists)
   Active: inactive (dead)

Oct 22 14:14:13 hwmi systemd[1]: [[0;1;31m[[0;1;39m[[0;1;31morg.openbmc.but=
tons.Power@1.service<mailto:0;1;31morg.openbmc.buttons.Power@1.service>: Tw=
o services allocated for the same bus name org.open
bmc.butto.Power, refusing operation.[[0m

Please help to figure out and proceed.


Hi Maheswari,

I'm guessing you already have an org.openbmc.buttons.Power@0.service<mailto=
:org.openbmc.buttons.Power@0.service> running.

You can check with:

# systemctl status org.openbmc.buttons.Power@0.service<mailto:org.openbmc.b=
uttons.Power@0.service>
or just check for the button_power.exe process already running.




Thanks
Maheswari A



--_000_DB7PR02MB4393F07453FADA45F59118FD92F30DB7PR02MB4393eurp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
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
	color:black;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body bgcolor=3D"white" lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Hi Matt, <o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks for your res=
ponse.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">I am able to power =
on the Host by monitoring GPIO using =1B$B!H=1B(Bphosphor-gpio-monitor=1B$B=
!I=1B(B service.
<o:p></o:p></span></p>
<p><span style=3D"color:windowtext">But still we need to achieve same resul=
t by </span>
<a href=3D"mailto:org.openbmc.buttons.Power@0.service">org.openbmc.buttons.=
Power@0.service</a> in future.
<o:p></o:p></p>
<p><span style=3D"color:windowtext">Here is the response :</span><o:p></o:p=
></p>
<p><span style=3D"color:windowtext"></span># systemctl status <a href=3D"ma=
ilto:org.openbmc.buttons.Power@0.service">
org.openbmc.buttons.Power@0.service</a><span style=3D"color:windowtext"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">=1B$B!|=1B(B org.op=
enbmc.buttons.Power@0.service - Phosphor Power Button0<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp; &nbsp;Loaded=
: loaded (/lib/systemd/system/org.openbmc.buttons.Power@.service; indirect;=
 vendor preset: enabled)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">&nbsp;&nbsp; Active=
: inactive (dead)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">hwmi~# ps | grep bu=
tton_power.exe<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">1205 root&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 3100 S&nbsp;&nbsp;&nbsp; grep button_power.exe<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">hwmi:~#<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">button_power.exe is=
 not running in BMC. &nbsp;Service status with instance 0 is not showing an=
y error. But button_power.exe is not running. So that I tried with instance=
 1.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">I think below file =
is responsible for button power controlling in OBMC.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">c/skeleton/blob/mas=
ter/pwrbutton/button_power_obj.c
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Here is the receipe=
 file. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Cat ./meta-phosphor=
/recipes-phosphor/chassis/obmc-button-power.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">SUMMARY =3D &quot;O=
penBMC org.openbmc.Button example implementation&quot;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">DESCRIPTION =3D &qu=
ot;A sample implementation for a button controlling a power domain.&quot;<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">PR =3D &quot;r1&quo=
t;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">inherit skeleton-gd=
bus<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">inherit obmc-phosph=
or-dbus-service<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">inherit pkgconfig<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">SKELETON_DIR =3D &q=
uot;pwrbutton&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"DE" style=3D"color:windowtext">FMT =3D=
 &quot;org.openbmc.buttons.Power@{0}.service&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">DBUS_SERVICE_${PN} =
&#43;=3D &quot;${@compose_list(d, 'FMT', 'OBMC_POWER_BUTTON_INSTANCES')}&qu=
ot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">If you need journal=
 log, then I can share it. I need to understand the flow.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Please help to achi=
eve. <o:p>
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Thanks <o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:windowtext">Maheswari A<o:p></o=
:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"color:windowtext;ms=
o-fareast-language:EN-IN">From:</span></b><span lang=3D"EN-US" style=3D"col=
or:windowtext;mso-fareast-language:EN-IN"> Matt Spinler &lt;mspinler@linux.=
vnet.ibm.com&gt;
<br>
<b>Sent:</b> Saturday, October 27, 2018 1:45 AM<br>
<b>To:</b> A, Maheswari &lt;maheswari.a@atos.net&gt;<br>
<b>Cc:</b> OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> Re: help: OpenBMC host power on from power button press<o:p=
></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-IN"><o:p>&nbs=
p;</o:p></span></p>
<div>
<p class=3D"MsoNormal">On 10/25/2018 11:52 PM, A, Maheswari wrote:<o:p></o:=
p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I am new to openBMC project. <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">We are in the process of porting power button gpio i=
nterrupt handling in openBMC.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">After some a lot of analysis, I found that obmc-butt=
on-power related service are necessary to power on the host using power but=
ton press event.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I have added POWER_BUTTON and machine specific GPIO =
number and polarity in gpio_defs.json.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">While starting the =1B$B!H=1B(Borg.openbmc.button.Po=
wer=1B$B!I=1B(B service, I am getting the below error.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; &nbsp;<b><a href=3D"mailto:org.openbmc.button=
s.Power@1.service">org.openbmc.buttons.Power@1.service</a> - Phosphor Power=
 Button1</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Loaded: [[0;1;31merror[[0m (Reason: =
File exists)</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Active: inactive (dead)</b><o:p></o:=
p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Oct 22 14:14:13 hwmi systemd[1]: [[0;1;31m[[0;1;3=
9m[[<a href=3D"mailto:0;1;31morg.openbmc.buttons.Power@1.service">0;1;31mor=
g.openbmc.buttons.Power@1.service</a>: Two services allocated for the same =
bus name org.open</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>bmc.butto.Power, refusing operation.[[0m</b><o:p>=
</o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Please help to figure out and proceed. <o:p></o:p></=
p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-IN"><o:p>&nbs=
p;</o:p></span></p>
<p>Hi Maheswari,<o:p></o:p></p>
<p>I'm guessing you already have an <a href=3D"mailto:org.openbmc.buttons.P=
ower@0.service">
org.openbmc.buttons.Power@0.service</a> running.<o:p></o:p></p>
<p>You can check with:<o:p></o:p></p>
<p># systemctl status <a href=3D"mailto:org.openbmc.buttons.Power@0.service=
">org.openbmc.buttons.Power@0.service</a>
<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-IN">or just c=
heck for the button_power.exe process already running.<br>
<br>
<br>
<br>
<o:p></o:p></span></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Maheswari A <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-IN"><o:p>&nbs=
p;</o:p></span></p>
</div>
</body>
</html>

--_000_DB7PR02MB4393F07453FADA45F59118FD92F30DB7PR02MB4393eurp_--
