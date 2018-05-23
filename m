Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=104.47.2.63; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="EOYyUeyX"; dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0063.outbound.protection.outlook.com [104.47.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40rf9S4lPBzF0wf
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 03:08:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk4V3MWpeD38mx171Sldxu3vUfMPMY3zkC78f598wzE=;
 b=EOYyUeyXf+SP7oAo6Td1QUdAp2It4me1mIQor5BgCZ2/Y3pfgVDK+GF7yUJpMMfaLfAkvLq9G9javveGZmwoUxsZK5p0ADXN53MTS6J99VD4WwUbpWWsrDWEbuv7XioqBWsc524jbFyGUH8u35Bo68JqT6px/6bupkAWkrUy4EA=
Received: from AM4PR0802MB2306.eurprd08.prod.outlook.com (10.172.218.15) by
 AM4PR0802MB2177.eurprd08.prod.outlook.com (10.172.217.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.797.11; Wed, 23 May 2018 17:08:16 +0000
Received: from AM4PR0802MB2306.eurprd08.prod.outlook.com
 ([fe80::c069:5358:a14d:c096]) by AM4PR0802MB2306.eurprd08.prod.outlook.com
 ([fe80::c069:5358:a14d:c096%10]) with mapi id 15.20.0797.011; Wed, 23 May
 2018 17:08:16 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Community Meetings
Thread-Topic: Community Meetings
Thread-Index: AdPyt1i7D7Jr4rimRWCiqATcbOo7pw==
Date: Wed, 23 May 2018 17:08:16 +0000
Message-ID: <AM4PR0802MB23062619ABE44754D92668EE806B0@AM4PR0802MB2306.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [217.140.111.135]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR0802MB2177;
 7:kANCLalWVVPnZOimW8NzYTvif5wk77PjV9tIGIPpUpyU0JRwGUHDkUF8XUrkbr9sb0C9TJ87kHk0DkjHiuqiuP2noYclQmiddDfb2BBhck+J68/c04K50TrJCrRbZZudxzdCnUeVoFmndpIMtopVJZov0nVxGpqKY/PA3ZBjMrEW1+eK+KHFGGsBsu6UgyHYjsPEZ1vIqaCEQOxvybU3xItbDNXMUKb4z9IQXPStRSNCVOoH8mEDcm4CW0ok1kXB
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(5600026)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
 SRVR:AM4PR0802MB2177; 
x-ms-traffictypediagnostic: AM4PR0802MB2177:
x-microsoft-antispam-prvs: <AM4PR0802MB2177EDD2EB37DF0463D07846806B0@AM4PR0802MB2177.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231254)(944501410)(52105095)(3002001)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:AM4PR0802MB2177; BCL:0; PCL:0; RULEID:; SRVR:AM4PR0802MB2177; 
x-forefront-prvs: 06818431B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(39380400002)(366004)(396003)(189003)(40434004)(199004)(5640700003)(6436002)(106356001)(53936002)(5660300001)(7116003)(790700001)(6116002)(3846002)(6306002)(221733001)(9686003)(54896002)(486006)(476003)(55016002)(74316002)(2351001)(97736004)(86362001)(5890100001)(2501003)(5250100002)(3280700002)(2906002)(3660700001)(25786009)(33656002)(2900100001)(316002)(478600001)(68736007)(72206003)(14454004)(99286004)(59450400001)(7736002)(7696005)(6506007)(6916009)(66066001)(105586002)(186003)(26005)(81166006)(81156014)(1730700003)(8676002)(102836004)(3480700004)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2177;
 H:AM4PR0802MB2306.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: h3ifonwoNlDpkXqCJZH6Cpl0OYqWfnVcdv9j5M8NBlfyyM/m/X9SMtACzKTuQ6U1arpM3rZHn3UnRbJ+APQHlKTCmCtBu53NFFEUmpV4oZJDWcJ9IH+yCOlotvEpTuTdEgKFgTu1QIDs6ZFg5gQr6EO/9VMzqRGDwJkERwMbN6yo3bW04wmDAikOmSSN36Gk
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_AM4PR0802MB23062619ABE44754D92668EE806B0AM4PR0802MB2306_"
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: b1b192b3-4dbe-4bea-b924-08d5c0cfc6bb
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b192b3-4dbe-4bea-b924-08d5c0cfc6bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2018 17:08:16.6737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2177
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 23 May 2018 17:08:30 -0000

--_000_AM4PR0802MB23062619ABE44754D92668EE806B0AM4PR0802MB2306_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Openbmc community,

I am from Arm and just started looking into openbmc enablement.
I am subscribed to the mailing list, However, I am unable to participate in=
 community meetings as
I don't see any meeting requests on the mailing list.

It will be appreciated, if someone could help me on how to subscribe to
openbmc developer community meetings.

I am attending  (DMTF) PMCI work group meetings, but not sure whether there=
 is openbmc developer community
meeting as well.

Thanks,
Supreeth
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM4PR0802MB23062619ABE44754D92668EE806B0AM4PR0802MB2306_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hello Openbmc community,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am from Arm and just started looking into openbmc =
enablement.<o:p></o:p></p>
<p class=3D"MsoNormal">I am subscribed to the mailing list, However, I am u=
nable to participate in community meetings as
<o:p></o:p></p>
<p class=3D"MsoNormal">I don&#8217;t see any meeting requests on the mailin=
g list. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It will be appreciated, if someone could help me on =
how to subscribe to
<o:p></o:p></p>
<p class=3D"MsoNormal">openbmc developer community meetings.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am attending&nbsp; (DMTF) PMCI work group meetings=
, but not sure whether there is openbmc developer community
<o:p></o:p></p>
<p class=3D"MsoNormal">meeting as well.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Supreeth<o:p></o:p></p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM4PR0802MB23062619ABE44754D92668EE806B0AM4PR0802MB2306_--
