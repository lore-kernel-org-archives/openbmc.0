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
 by lists.ozlabs.org (Postfix) with ESMTPS id 434f7K1jGCzDqWn
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 22:48:42 +1100 (AEDT)
Received: from mail2-ext.my-it-solutions.net (mail2-ext.my-it-solutions.net)
 by smarthost5.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 14ee_ae8b_1c7f7c3d_4da4_4fe2_93ac_6d548fec14bd;
 Wed, 28 Nov 2018 12:48:39 +0100
Received: from mail1-int.my-it-solutions.net ([10.92.32.11])
 by mail2-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wASBmafv017170
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 12:48:36 +0100
Received: from DEERLM99ETXMSX.ww931.my-it-solutions.net ([10.86.142.46])
 by mail1-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wASBmZZM021980
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 28 Nov 2018 12:48:36 +0100
Received: from DEERLM99ETUMSX.ww931.my-it-solutions.net (10.86.142.96) by
 DEERLM99ETXMSX.ww931.my-it-solutions.net (10.86.142.46) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Wed, 28 Nov 2018 12:48:35 +0100
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.96) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 28 Nov 2018 12:48:35 +0100
Received: from AM6PR02MB4392.eurprd02.prod.outlook.com (20.177.190.157) by
 AM6PR02MB4485.eurprd02.prod.outlook.com (20.177.196.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.28; Wed, 28 Nov 2018 11:48:34 +0000
Received: from AM6PR02MB4392.eurprd02.prod.outlook.com
 ([fe80::dc30:7d37:842e:5e94]) by AM6PR02MB4392.eurprd02.prod.outlook.com
 ([fe80::dc30:7d37:842e:5e94%3]) with mapi id 15.20.1361.019; Wed, 28 Nov 2018
 11:48:33 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Understand OpenBMC Event logging mechanism for beginner
Thread-Topic: Understand OpenBMC Event logging mechanism for beginner
Thread-Index: AdSHEEfYe57s/23mTc2JsASl+vTHwg==
Date: Wed, 28 Nov 2018 11:48:33 +0000
Message-ID: <AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10@AM6PR02MB4392.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [103.43.203.195]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR02MB4485;
 6:lsDwxg8eGwETLfjuvy2qJukkvTP6q/79DfR4U+T5A6pCvxub8wbnjVpx4/8n3b0cau2qiX9pDFffhg1e9FDKXH6CV+6xgRlU8o1E/KWmr52KETVidGVeE2bRao0PB/v81RK4RMIuT5r/EDdCoR50Q+xcdXqIDEK7EMuckliJ//cOY0o27e5G+qVw90rfIBcA+yhq/nCzE9Tk5CHupjJx8rjT56JUgZKp4jRgg3b4Qd2mmDvpbf9AUqajzGE3iDgTVFMchkxeQIvsIpWfOZCN3gJfyIu0B6FbRB217gkB+cFRe4og0SL1wpUBes7tdry523bN+33jsQCCBah06fjoIh+OP5EItK+n0y1V5H3rIBLcEha6m8nFTSha2DufGHf5mrZqJVu9/tUF6gYhYuCjPNLZZ0HIMvMoBM6HYgTYJlJIZOf+h0u/RwR2T9/lFGKzRIqG0z8oXVW8K6Vzg2vJGw==;
 5:NYfJAK0msbBdY8qZSEiJjktHNTzbaMEI+gELYjMVRJsoaXol1Kf4zBz4inteBsNm6eCGtS0IZleW6Nn6cKl7E7v04rMLyJwtRfl+SwzHlUvV5rjD9X8JeHZCQDinBfhQe89oxDEX7p5ASSS0FyEzcLkisBxAHkXQRoithq9BW7w=;
 7:JH3hE5O7Ul7YXW7JoZub20DDcXPiOUDh853rIcEJDLNdqxWaLKq/VWc3Ji+a5o8MR9Jz5wqVihlTxF7Y2KIoLadd+0v+JKvGG+cdM6q5wcQdSjqk/tPeQsaiKLtK0stHmwZNG9LOeTFWCWTOsjgRIA==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 1bd32957-f68f-49ee-ed5a-08d655276cea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:AM6PR02MB4485; 
x-ms-traffictypediagnostic: AM6PR02MB4485:
x-microsoft-antispam-prvs: <AM6PR02MB4485786559FAA65B2A738F1492D10@AM6PR02MB4485.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231443)(999002)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:AM6PR02MB4485; BCL:0; PCL:0; RULEID:; SRVR:AM6PR02MB4485; 
x-forefront-prvs: 0870212862
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(39860400002)(346002)(136003)(396003)(189003)(199004)(33656002)(102836004)(14454004)(2906002)(790700001)(97736004)(476003)(486006)(6116002)(68736007)(9686003)(6306002)(3846002)(66066001)(53936002)(186003)(71190400001)(478600001)(71200400001)(55016002)(54896002)(6916009)(74316002)(256004)(106356001)(7696005)(6506007)(26005)(5660300001)(99286004)(14444005)(105586002)(7736002)(316002)(81166006)(25786009)(81156014)(6436002)(86362001)(9326002)(8676002)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4485;
 H:AM6PR02MB4392.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ccmIvTjGJ7CBx2XV9+04gTDx893eQi75pgINL8kBcXFuCMnGblmSzHBqvFwFA0fanUe8t1PEw4ZthCmpasgVmSsUxnGjXLBfvcniupxvFrw0OMuRzIjguX7mGSwN6PcmUl2r3iYwoo/ERn1GbB3abVL6rPv573d3eb0k/be8JMT6ZdFAujzyyBokzXIrroBzMtbhnuAW38izH38ASFZ6mkIFlo6w0HxAYFexGZmELW7lf4eD7W8MoHA6lzxItotyo1CGtX12SZxMcR89TxSO0Kdu05KoG9ZmDk7/J4etXxJNJchSk4aL8Xfg2z5+G2Bif0zq+xoibLy2d/7PaTmF/fs3TZtGcBHlHLyBIBjxxU0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10AM6PR02MB4392eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd32957-f68f-49ee-ed5a-08d655276cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2018 11:48:33.8299 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4485
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
X-List-Received-Date: Wed, 28 Nov 2018 11:48:47 -0000

--_000_AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10AM6PR02MB4392eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I found some OpenBMC document to understand LED Control architecture.
Document is very useful for beginner.


But There is no document to understand workflow of OpenBMC event management=
 for beginner.

We need to understand BMC SEL logging mechanism in OpenBMC.

  1.  BMC Need to log chassis intrusion SEL.
  2.  We need to log Event while Emergency Power OFF case .

I hope below packages are concerns to record events.

Phosphor-logging   ( getting fan ReadFailure log in REST command xyz.openpr=
oject.logging ).
Phosphor-event
Phosphor-dbus-monitor
obmc-event-mgmt is removed from stack.


Please clarify which recipes are needed to log events in BMC.
Please explain some basic understanding to log test event.

How do verify logged events .

Thanks
Maheswari A





--_000_AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10AM6PR02MB4392eurp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
/* List Definitions */
@list l0
	{mso-list-id:1526362720;
	mso-list-type:hybrid;
	mso-list-template-ids:1239688030 -192611234 1074331673 1074331675 10743316=
63 1074331673 1074331675 1074331663 1074331673 1074331675;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:25.5pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:61.5pt;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:97.5pt;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:133.5pt;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:169.5pt;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:205.5pt;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:241.5pt;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:277.5pt;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:313.5pt;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal">I found some OpenBMC document to understand LED Cont=
rol architecture.
<o:p></o:p></p>
<p class=3D"MsoNormal">Document is very useful for beginner. <o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But There is no document to understand workflow of O=
penBMC event management for beginner. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We need to understand BMC SEL logging mechanism in O=
penBMC. <o:p>
</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-10.5pt;mso-list:l0 lev=
el1 lfo1">
BMC Need to log chassis intrusion SEL. <o:p></o:p></li><li class=3D"MsoList=
Paragraph" style=3D"margin-left:-10.5pt;mso-list:l0 level1 lfo1">
We need to log Event while Emergency Power OFF case . <o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I hope below packages are concerns to record events.=
 <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Phosphor-logging &nbsp;&nbsp;( getting fan ReadFailu=
re log in REST command xyz.openproject.logging ).<o:p></o:p></p>
<p class=3D"MsoNormal">Phosphor-event <o:p></o:p></p>
<p class=3D"MsoNormal">Phosphor-dbus-monitor <o:p></o:p></p>
<p class=3D"MsoNormal">obmc-event-mgmt is removed from stack. <o:p></o:p></=
p>
<p class=3D"MsoListParagraph" style=3D"margin-left:25.5pt"><o:p>&nbsp;</o:p=
></p>
<p class=3D"MsoNormal">Please clarify which recipes are needed to log event=
s in BMC.
<o:p></o:p></p>
<p class=3D"MsoNormal">Please explain some basic understanding to log test =
event. <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How do verify logged events . <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal">Maheswari A<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_AM6PR02MB4392A3F66A51CFB0AAFEE86C92D10AM6PR02MB4392eurp_--
