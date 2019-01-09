Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.4.80; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="ctgJK8sw";
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40080.outbound.protection.outlook.com [40.107.4.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZcLf4QRjzDqc9
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 04:58:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94RCo8SwDnt1dm0wRSwMTeWI0IuTO5s81YGP18mEYEA=;
 b=ctgJK8swERguBPGoeyMtF9yehqK8um5w45uZ9kuUoAIYmhg5kwX/S4yw2FdH3EfKZjqf88ZihwwgRWUlFKDYvAXEZx/ahvXeho/ri49iDHXfII0ViWNVuPqlreZmU2HORCS4P0l48Dbao8EC6zMi3Cwj8+CsZlLteLo+48uvv5c=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3920.eurprd05.prod.outlook.com (52.134.8.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.9; Wed, 9 Jan 2019 17:58:28 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::fcbf:3f2:261a:612]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::fcbf:3f2:261a:612%5]) with mapi id 15.20.1495.011; Wed, 9 Jan 2019
 17:58:28 +0000
From: David Thompson <dthompson@mellanox.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: obmcutil: sh vs. python version
Thread-Topic: obmcutil: sh vs. python version
Thread-Index: AdSoREg1zOrW+XHpT/uzanj3v1kRkA==
Date: Wed, 9 Jan 2019 17:58:27 +0000
Message-ID: <VI1PR0502MB38698E35D46D139D3298D4CCDD8B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0502MB3920;
 6:Ko6MfHR5h6BevRnRkbSS7mS0mR+ZVB10GxbD0xqJ9l2+sanZrJ6wvQlSZtDi7Iu2tC/awMPy7QJWA823HpXPatU3lVuC+4X8Qo8V58zqybEGwCC6gHLhpy70+pmiOprSz0yTArLXCGRnvhaS08pnXetVEykDBmjHm9DChiqWu0cGAQ7V52xApD6IcA1+/TZSD8CDZYfOYuID1fk+T6SNySqZ7pYjAv9tPwW9sXyyBTjoezH/eiDdGV0BYUKGtJyjgbC8dsxv6tGJa14DUcdZ9pozyUlfwYt6CpGCQY4unUFGSU+BbNdE2WBzgztRg+MM8r1Pkb2MoqGMdbdVyeFeBFEZkJkWODqlrfbdLhIUsXIN57zTuA2GTK/Jwj4+Ofh3ovlX9649mMfgZ7d4jw4f1tgtHNq30dvJaGnRofcd2UG8E7iWP2i7LU4e0QoK+rePthj8cIvu2R1BLNXWwKtmpg==;
 5:gRbvXik74PQBjW9EyP+BKOLZbEU+KuyQ37z6DOf2UHwQuhQZsiiEM5MCh7lHwkxbUZCKppVwJkH8b1Nv0/iKfkqOHoQ+2EC4QbN+WNP1So81nUm2cOiOzbv9FQwe3ndln/jqnJKKKioggbmraC/5oXgTdokgAuK4Vg/QRLRm5OZpAaXUezzV+LJOZYXxKO6Gpfv7V/gONofk0m/Azt34ew==;
 7:Tb+AEtE/WYqA7AV4HiHqWjYWG216MOLqRdNH9CBHmE83PoVYHip1qPNRDgQxRPwUF4uT86CbRnfCrkZ/37YM5Y/N9WWs3Z+OgMljOV/zAknqJ4JQzhY99b0IM8kUl05ZxIPL4x1BTA8hOwdJqe2t8A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: e498e40d-6f70-43ae-e140-08d6765c0f06
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3920; 
x-ms-traffictypediagnostic: VI1PR0502MB3920:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-microsoft-antispam-prvs: <VI1PR0502MB392006854D7E72F04963C61BDD8B0@VI1PR0502MB3920.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3231475)(944501520)(52105112)(3002001)(93006095)(93001095)(10201501046)(6055026)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:VI1PR0502MB3920; BCL:0; PCL:0; RULEID:; SRVR:VI1PR0502MB3920; 
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(366004)(136003)(189003)(199004)(25786009)(54896002)(9686003)(6306002)(71190400001)(71200400001)(106356001)(186003)(68736007)(3846002)(6116002)(790700001)(6506007)(7696005)(86362001)(486006)(256004)(102836004)(53936002)(33656002)(7736002)(2906002)(5660300001)(316002)(97736004)(74316002)(6436002)(55016002)(8676002)(14454004)(66066001)(26005)(476003)(478600001)(81156014)(81166006)(6916009)(99286004)(105586002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3920;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l4uA0tDoPbJvuQaCtNvQi3CP3uSiWX9oUef6CwGF45wVvjZ5AbWd7MEqxYq5LFHNiobonwxozcHfBMVxxQrFBIhsdS5j6ifO5WHj7TXWGMnOGRhlDJtLURu26p3TL9UHNvKrxVA62JGBvYFlJ2X63B81XEo/vEEk6EKrg23VjTNixyCZP0FIJl/vDc8KVR3HH4nmBrXbHKXmNwncaI9WwzkhZACYsZ+pExizTCmNKJAhV90R+Lc/7YlZr1gnTwBTDTbdROgMQ8uKGYZ0sNZPaxWU8jqF1xu0BcjvCtdxDcfSYEEG0+P7TVvzGIGgdtpf
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0502MB38698E35D46D139D3298D4CCDD8B0VI1PR0502MB3869_"
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e498e40d-6f70-43ae-e140-08d6765c0f06
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 17:58:27.9641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3920
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
X-List-Received-Date: Wed, 09 Jan 2019 17:58:36 -0000

--_000_VI1PR0502MB38698E35D46D139D3298D4CCDD8B0VI1PR0502MB3869_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does the shell version of 'obmcutil' support the same features/options
that are supported by the python version of 'obmcutil'?  Also, based on
references in 'openbmc-test-automation' the intended destination of
'obmcutil' is '/usr/sbin'.  But, I don't see 'obmcutil' in the target rootf=
s
(built for AST2500 EVB on Dec 22 2018) nor do I see any logic within
OpenBMC that actually installs it.

Can someone comment on 'obmcutil' install and usage?

David Thompson
Sr. Staff Engineer, System SW
Mellanox Technologies
1900 West Park Drive, Suite 290
Westborough MA USA 01581
Direct: +1 508-475-6375


--_000_VI1PR0502MB38698E35D46D139D3298D4CCDD8B0VI1PR0502MB3869_
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
<p class=3D"MsoNormal">Does the shell version of &#8216;obmcutil&#8217; sup=
port the same features/options<o:p></o:p></p>
<p class=3D"MsoNormal">that are supported by the python version of &#8216;o=
bmcutil&#8217;?&nbsp; Also, based on<o:p></o:p></p>
<p class=3D"MsoNormal">references in &#8216;openbmc-test-automation&#8217; =
the intended destination of
<o:p></o:p></p>
<p class=3D"MsoNormal">&#8216;obmcutil&#8217; is &#8216;/usr/sbin&#8217;.&n=
bsp; But, I don&#8217;t see &#8216;obmcutil&#8217; in the target rootfs<o:p=
></o:p></p>
<p class=3D"MsoNormal">(built for AST2500 EVB on Dec 22 2018) nor do I see =
any logic within
<o:p></o:p></p>
<p class=3D"MsoNormal">OpenBMC that actually installs it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can someone comment on &#8216;obmcutil&#8217; instal=
l and usage?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">David Thompson<o:p></o:p></p>
<p class=3D"MsoNormal">Sr. Staff Engineer, System SW<o:p></o:p></p>
<p class=3D"MsoNormal">Mellanox Technologies<o:p></o:p></p>
<p class=3D"MsoNormal">1900 West Park Drive, Suite 290<o:p></o:p></p>
<p class=3D"MsoNormal">Westborough MA USA 01581<o:p></o:p></p>
<p class=3D"MsoNormal">Direct: &#43;1 508-475-6375<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_VI1PR0502MB38698E35D46D139D3298D4CCDD8B0VI1PR0502MB3869_--
