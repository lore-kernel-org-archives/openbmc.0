Return-Path: <maheswari.a@atos.net>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=atos.net
 (client-ip=193.56.114.164; helo=smtppost.atos.net;
 envelope-from=maheswari.a@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=atos.net
X-Greylist: delayed 323 seconds by postgrey-1.36 at bilbo;
 Fri, 26 Oct 2018 15:57:44 AEDT
Received: from smtppost.atos.net (smtppost.atos.net [193.56.114.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42hBZJ6vBDzF3Fh
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 15:57:43 +1100 (AEDT)
Received: from mail1-ext.my-it-solutions.net (mail1-ext.my-it-solutions.net)
 by smarthost3.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 613b_8268_e6b7bc50_ccc1_4018_8ceb_d2693e2a125b;
 Fri, 26 Oct 2018 06:52:12 +0200
Received: from mail2-int.my-it-solutions.net ([10.92.32.13])
 by mail1-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id w9Q4qBjj007475
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 06:52:12 +0200
Received: from DEFTHW99ETUMSX.ww931.my-it-solutions.net ([10.86.142.49])
 by mail2-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id w9Q4qBZj023263
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Oct 2018 06:52:11 +0200
Received: from DEFTHW99ETTMSX.ww931.my-it-solutions.net (10.86.142.101) by
 DEFTHW99ETUMSX.ww931.my-it-solutions.net (10.86.142.49) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Fri, 26 Oct 2018 06:52:11 +0200
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.101) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Fri, 26 Oct 2018 06:52:10 +0200
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com (20.177.195.218) by
 DB7PR02MB4250.eurprd02.prod.outlook.com (20.176.239.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1250.20; Fri, 26 Oct 2018 04:52:09 +0000
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::85c4:acab:8a58:5703]) by DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::85c4:acab:8a58:5703%4]) with mapi id 15.20.1273.025; Fri, 26 Oct 2018
 04:52:09 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: help: OpenBMC host power on from power button press
Thread-Topic: help: OpenBMC host power on from power button press
Thread-Index: AdRs54UeqefSR9IQS/m8iyhijr0xNw==
Date: Fri, 26 Oct 2018 04:52:08 +0000
Message-ID: <DB7PR02MB43932ACAD795B6BB37676D1192F00@DB7PR02MB4393.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [125.17.240.230]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR02MB4250;
 6:fqHabPgKuaysS1UajqrdeA5S2qtCOOMW2FB5bBfNClwZR+YFbeovmMmWFbVyds04b+BW3GGjwrGi9V1UZdfcuy/Gdzz0pyV1WHfQsGrYNvsNZI4lU/FFN2WlOgkqGAl/b5sxbFqTe0ZLktLongIlU0v/rt50Ys/i3cezCjFZD953//JrP8mZ9ubKRw4GTQrHVxhppXUppXc5rzqN2fi2k0Rb66cCNzze87XM85+5POIs/4d01FKa7T1g7yYeIwvObvSXniN7K+c1cm1fN2m7a5GOumY0RnzF4bOgWTYVwnzQoNycG1KbsVGifd4CTflWpG+Nk2AAUJdwdqgOnvBm7CZ3cxXjTaHY/1I6C6uPjZyRpdxqG3q0qOh81tVilOgYnsgYI6SxGbBQ2FrWzbiZWv87tnlJCM8KndyBmg/qCXZsW00oH1QcRYL49ITosT8txWE09gawvrmPUmwkIHqONw==;
 5:yVL9P1AN9g2daLUqJghd6RSZEov1hcL7lAQjDpF6zMzCSUVbh6GznDJYdZ29Q/lB+7G9ZJM1eKdfOvtAALXVqdQSMBqth+rk8nmL1tG/VgotXz5hQcENJDnTWI9TnMfLBCRNUOtkbvq/i8SQxn6tCLwBJNgVdGOhcZ9LM8IHP80=;
 7:yaPe8J02mURdef/OWKx23Ho5F5okjEIH2oJOcBcfetjNLxd3BtsgIOeuUqD9DZzcIei01Oq5FlqYO/QnnrifJbBc5d/+KUOitRQ622M+Ue8JVZzQN1FckkT0ui5/pvTwhKcoiMs2sUhee9iPXMyaMWGXSULzKrbbK0L3jtm6fzgFmzPIWtwNiYLJbei3VT6XlSMRpflVHxjyNs21R4J0RrLY5W1s8mLEk03o2JjVhMLeh/6rB4PYa59rnBpSvkdx
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: abef3ae9-d217-4e1a-1415-08d63afec947
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:DB7PR02MB4250; 
x-ms-traffictypediagnostic: DB7PR02MB4250:
x-microsoft-antispam-prvs: <DB7PR02MB4250D46092607C65B2FC002B92F00@DB7PR02MB4250.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:DB7PR02MB4250; BCL:0; PCL:0; RULEID:; SRVR:DB7PR02MB4250; 
x-forefront-prvs: 083751FCA6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(99286004)(3846002)(6116002)(25786009)(2906002)(478600001)(790700001)(256004)(7736002)(71200400001)(8936002)(71190400001)(2900100001)(53936002)(86362001)(97736004)(6436002)(54896002)(6306002)(68736007)(81166006)(5640700003)(236005)(8676002)(81156014)(9686003)(55016002)(9326002)(6916009)(6506007)(26005)(476003)(105586002)(102836004)(106356001)(186003)(2351001)(1730700003)(5660300001)(14454004)(5250100002)(74316002)(2501003)(7696005)(316002)(33656002)(486006)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB4250;
 H:DB7PR02MB4393.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ofCaDXL9/MJICMPAV1aBK+1bi4+8az/Z9S9+woos1KvkdMR+MtNX2lTHuu1bHWJKWN8B7hHNM2tSOcxscbDRkqe6o4glWtj8bxFiCHweVTZpn4AhjJzOi6s0vEL7k6/XjMh4Nw/Gkko3OoxKc27C4yCNeYDgh5ZFImfy2LWVGW+4qszpjmEdHH/e2qPNRHKKc2GgPAiibWkQKlAfyyo74fG4ZECN0zh05JV1sp1MZivtdxj5eUfgqBgaW6N9o2he6eC5iqQllKiKt0S8Nbuq4S/TPZ7Y7vnathrK+Zn3e2WEikl1HuOxrtQHflQDJOJvMVZxdiEpOUEaKUiGxo258ocvNMBOhAw9XM5PJ9AuiIk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB7PR02MB43932ACAD795B6BB37676D1192F00DB7PR02MB4393eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: abef3ae9-d217-4e1a-1415-08d63afec947
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2018 04:52:09.0635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4250
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
X-List-Received-Date: Fri, 26 Oct 2018 04:57:47 -0000

--_000_DB7PR02MB43932ACAD795B6BB37676D1192F00DB7PR02MB4393eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am new to openBMC project.

We are in the process of porting power button gpio interrupt handling in op=
enBMC.

After some a lot of analysis, I found that obmc-button-power related servic=
e are necessary to power on the host using power button press event.

I have added POWER_BUTTON and machine specific GPIO number and polarity in =
gpio_defs.json.

While starting the "org.openbmc.button.Power" service, I am getting the bel=
ow error.

   org.openbmc.buttons.Power@1.service<mailto:org.openbmc.buttons.Power@1.s=
ervice> - Phosphor Power Button1
   Loaded: [[0;1;31merror[[0m (Reason: File exists)
   Active: inactive (dead)

Oct 22 14:14:13 hwmi systemd[1]: [[0;1;31m[[0;1;39m[[0;1;31morg.openbmc.but=
tons.Power@1.service: Two services allocated for the same bus name org.open
bmc.butto.Power, refusing operation.[[0m

Please help to figure out and proceed.

Thanks
Maheswari A


--_000_DB7PR02MB43932ACAD795B6BB37676D1192F00DB7PR02MB4393eurp_
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
<p class=3D"MsoNormal">I am new to openBMC project. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are in the process of porting power button gpio i=
nterrupt handling in openBMC.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After some a lot of analysis, I found that obmc-butt=
on-power related service are necessary to power on the host using power but=
ton press event.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have added POWER_BUTTON and machine specific GPIO =
number and polarity in gpio_defs.json.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While starting the &#8220;org.openbmc.button.Power&#=
8221; service, I am getting the below error.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp; &nbsp;<b><a href=3D"mailto:org.openbmc.button=
s.Power@1.service">org.openbmc.buttons.Power@1.service</a> - Phosphor Power=
 Button1<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Loaded: [[0;1;31merror[[0m (Reason: =
File exists)<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Active: inactive (dead)<o:p></o:p></=
b></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal"><b>Oct 22 14:14:13 hwmi systemd[1]: [[0;1;31m[[0;1;3=
9m[[0;1;31morg.openbmc.buttons.Power@1.service: Two services allocated for =
the same bus name org.open<o:p></o:p></b></p>
<p class=3D"MsoNormal"><b>bmc.butto.Power, refusing operation.[[0m<o:p></o:=
p></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please help to figure out and proceed. <o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Maheswari A <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB7PR02MB43932ACAD795B6BB37676D1192F00DB7PR02MB4393eurp_--
