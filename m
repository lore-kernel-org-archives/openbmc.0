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
 by lists.ozlabs.org (Postfix) with ESMTPS id 435plZ4WVyzDrQ9
 for <openbmc@lists.ozlabs.org>; Fri, 30 Nov 2018 20:20:38 +1100 (AEDT)
Received: from mail2-ext.my-it-solutions.net (mail2-ext.my-it-solutions.net)
 by smarthost5.atos.net with smtp
 (TLS: TLSv1/SSLv3,256bits,ECDHE-RSA-AES256-GCM-SHA384)
 id 21a7_5abc_9a01712d_abd6_4c2c_a457_0d1c93932e29;
 Fri, 30 Nov 2018 10:20:33 +0100
Received: from mail1-int.my-it-solutions.net ([10.92.32.11])
 by mail2-ext.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wAU9KU1o006480
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Nov 2018 10:20:30 +0100
Received: from DEERLM99ETYMSX.ww931.my-it-solutions.net ([10.86.142.47])
 by mail1-int.my-it-solutions.net (8.15.2/8.15.2) with ESMTPS id wAU9KTvm002451
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Nov 2018 10:20:30 +0100
Received: from DEERLM99ETTMSX.ww931.my-it-solutions.net (10.86.142.105) by
 DEERLM99ETYMSX.ww931.my-it-solutions.net (10.86.142.47) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Fri, 30 Nov 2018 10:20:29 +0100
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (10.86.142.137)
 by hybridsmtp.it-solutions.atos.net (10.86.142.105) with Microsoft SMTP
 Server (TLS) id 14.3.408.0; Fri, 30 Nov 2018 10:18:10 +0100
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com (20.177.195.218) by
 DB7PR02MB4854.eurprd02.prod.outlook.com (20.177.193.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.19; Fri, 30 Nov 2018 09:18:09 +0000
Received: from DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::d8e4:2dfd:19f5:1b93]) by DB7PR02MB4393.eurprd02.prod.outlook.com
 ([fe80::d8e4:2dfd:19f5:1b93%3]) with mapi id 15.20.1382.020; Fri, 30 Nov 2018
 09:18:09 +0000
From: "A, Maheswari" <maheswari.a@atos.net>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "dkodihal@linux.vnet.ibm.com"
 <dkodihal@linux.vnet.ibm.com>
CC: jrey <jrey@linux.vnet.ibm.com>
Subject: Understand OpenBMC Event logging mechanism for beginner
Thread-Topic: Understand OpenBMC Event logging mechanism for beginner
Thread-Index: AdSIjNGSZvQ9MC4WRM+VKx4zm1imLg==
Date: Fri, 30 Nov 2018 09:18:09 +0000
Message-ID: <DB7PR02MB4393FB402D59C1D84DD8EBC892D30@DB7PR02MB4393.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=maheswari.a@atos.net; 
x-originating-ip: [125.17.240.232]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR02MB4854;
 6:2PuzIXyfdkqKjhpQXjakZ8Ni262VAqtz/ykNHHx7rpOPFRi6oTWDvAjehj2+oThMWUwvscJLPTbcTf0EdSuCaP9030BXIJKF2C97VGnxqC4iOaIPf3xnM7twSlrld9FJfALn2uMtWars7PyVwIkcGCQy96nkSb8+gX1T9xlcfUPa5AkuaXrYivcK6nS16OP2IHbLXVk9ptZbysQDV+oQvGSYASv6GBiaQodzY9KiBfR6HFAXNJaiIZVEsK3+sT7do6nLvWsvbsjj71HXtwRXsGIHjeefW3vgIUU1wXfpfGw6CnpcwgD9jADdfv8xiknSd06TJnTGNiOt6zJsGirQfkhhpiQ6ATV9MZPHBk7blhtoYzQwNZiwjD08a8woj+/oP5VzI4T7hYPpOZi54MYk3Xp7lxXymYFg0HeNuMHQPmh2nuZBPV+zJvEcqGv6JYZpu8DczP9bU2DQKMSInLdpOA==;
 5:gc9Hy9CqlL17UQ3XCpQ5vTcITqk/mwdqv/FbMtjYHaWKqxmbf7KiMLCbSdP5m1XS2oc553pojQkSZshM5tg5IesxMj43MbZ0F+t26N5jXTvH/WPa/dVCnmTZMrNOVTd+BMggN0OqVk1AnGmxKdvUCAKx9bFt5TU6RDuoQA0iQIU=;
 7:oy9lwhjLGroxH/XHoev0TwN1K01mj/1fajWBP2jN2GK/EYboivpSuSLAXpJWRG0tHph5y/Bq/fIIecWhx8D/FG4EaideazzgR2B55UFKX/BBYIhPj8QXtt2k8AdIbxkSpLccLXZX+W2Zi9IsoM8J1A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: bf522312-291e-417f-b0ef-08d656a4befa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:DB7PR02MB4854; 
x-ms-traffictypediagnostic: DB7PR02MB4854:
x-microsoft-antispam-prvs: <DB7PR02MB4854CA3FCEAF6D2434CFFAA192D30@DB7PR02MB4854.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231453)(999002)(944501410)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
 SRVR:DB7PR02MB4854; BCL:0; PCL:0; RULEID:; SRVR:DB7PR02MB4854; 
x-forefront-prvs: 087223B4DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(189003)(3846002)(6116002)(6306002)(790700001)(8676002)(54896002)(14444005)(4326008)(6436002)(256004)(9686003)(2501003)(14454004)(236005)(33656002)(9326002)(8936002)(102836004)(105586002)(106356001)(316002)(55016002)(74316002)(110136005)(5660300001)(97736004)(25786009)(476003)(2906002)(86362001)(478600001)(53936002)(186003)(7736002)(26005)(81156014)(81166006)(7696005)(99286004)(6506007)(71200400001)(68736007)(71190400001)(486006)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB7PR02MB4854;
 H:DB7PR02MB4393.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: atos.net does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: AAYnEvURA4bornW9cfRHdz7EIdrfnq0rSXm4z5v6on6zzfZodi2JxIuAI8zFY/Y5Imp34PkJecLuZkSLSPiF66pb19GitgspnkFmYc58VLhP6KXolkQ6o6QidDhyjt0MH/EGjErSIocwi/YkKvbxNOJvEbjnP/a6dzS8S58WB8HEbKRf7V9+QxvJ0zCqokmy6UKyFByBoyruXmn98VbV6h98gLHv2qIASOaq3zUtL8R30WojP3V1WEPXtmofykEUwHMMUCUpxXYP9altMstWMa03A+4p/UMjTxovXB7qZsU8bKkopjFoH9N6nwVLw+qTA7UNEAleCx3OPMVibB6VcuagI+Y9Rn/HR8QOBVdEK3Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_DB7PR02MB4393FB402D59C1D84DD8EBC892D30DB7PR02MB4393eurp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bf522312-291e-417f-b0ef-08d656a4befa
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2018 09:18:09.6666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR02MB4854
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
X-List-Received-Date: Fri, 30 Nov 2018 09:20:46 -0000

--_000_DB7PR02MB4393FB402D59C1D84DD8EBC892D30DB7PR02MB4393eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,



Thanks for your response.



I am referring the link you shared.



Thanks

Maheswari A



Message-ID: <9feec1c27297d6091f1fa5e3af1c6805@linux.vnet.ibm.com<mailto:9fe=
ec1c27297d6091f1fa5e3af1c6805@linux.vnet.ibm.com>>





>> Hi,

>>

>> I found some OpenBMC document to understand LED Control architecture.

>>

>> Document is very useful for beginner.

>>

>> But There is no document to understand workflow of OpenBMC event

>> management for beginner.

>

>

> Agree. I volunteer to write a document related to phosphor-logging.



I am interested in reviewing your doc.



I interpret Maheswari's original question as:

1. how to create a new event type,

2. how to generate an event (such as from a daemon monitoring a gpio pin, o=
r interactively from the command line or a test program), 3. how to monitor=
 for event and write SELs, and 4. how to read SELs from the log.



That is, generating the SEL is the desired result, but I need to understand=
 the flow from end-to-end.



I assume there is code that already does each of these things.  Perhaps you=
r doc could walk us through it and explain each piece?



...snip...



>>>>>Maheswari :  Yes. It would be very helpful. If there is a document to =
explain above flow end-to-end.



>>

>> Please clarify which recipes are needed to log events in BMC.

>>

>> Please explain some basic understanding to log test event.

>>

>> How do verify logged events .

>

>

> If you're just interested in IPMI SELs, you should look at those

> reviews I posted above. Were you looking at something else though as

> the external interface - such as Redfish?

>

>> Thanks

>>

>> Maheswari A

>>

>

> Regards,

> Deepak



- Joseph


--_000_DB7PR02MB4393FB402D59C1D84DD8EBC892D30DB7PR02MB4393eurp_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoPlainText">Hi Deepak,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks for your response. <o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I am referring the link you shared. <o:p></o:p></=
p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks <o:p></o:p></p>
<p class=3D"MsoPlainText">Maheswari A<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Message-ID: &lt;<a href=3D"mailto:9feec1c27297d60=
91f1fa5e3af1c6805@linux.vnet.ibm.com">9feec1c27297d6091f1fa5e3af1c6805@linu=
x.vnet.ibm.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Hi,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; I found some OpenBMC document to underst=
and LED Control architecture.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Document is very useful for beginner.<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; But There is no document to understand w=
orkflow of OpenBMC event
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; management for beginner.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Agree. I volunteer to write a document relat=
ed to phosphor-logging.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I am interested in reviewing your doc.<o:p></o:p>=
</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I interpret Maheswari's original question as:<o:p=
></o:p></p>
<p class=3D"MsoPlainText">1. how to create a new event type,<o:p></o:p></p>
<p class=3D"MsoPlainText">2. how to generate an event (such as from a daemo=
n monitoring a gpio pin, or interactively from the command line or a test p=
rogram), 3. how to monitor for event and write SELs, and 4. how to read SEL=
s from the log.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">That is, generating the SEL is the desired result=
, but I need to understand the flow from end-to-end.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I assume there is code that already does each of =
these things.&nbsp; Perhaps your doc could walk us through it and explain e=
ach piece?<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">...snip...<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;&gt;&gt;&gt;&gt;Maheswari : &nbsp;Yes. It wou=
ld be very helpful. If there is a document to explain above flow end-to-end=
.
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Please clarify which recipes are needed =
to log events in BMC.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Please explain some basic understanding =
to log test event.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; How do verify logged events .<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; If you're just interested in IPMI SELs, you =
should look at those
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; reviews I posted above. Were you looking at =
something else though as
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; the external interface - such as Redfish?<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Thanks<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; Maheswari A<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Regards,<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Deepak<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">- Joseph<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DB7PR02MB4393FB402D59C1D84DD8EBC892D30DB7PR02MB4393eurp_--
