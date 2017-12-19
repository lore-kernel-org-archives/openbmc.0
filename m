Return-Path: <arjun.padmanabhan@microsemi.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsemi.com
 (client-ip=104.47.36.77; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=arjun.padmanabhan@microsemi.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b="a0AARXhk"; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on0077.outbound.protection.outlook.com [104.47.36.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1DQY1hCFzDsSf
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 21:18:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=nzaQDZjBmgi9V7L8TOEW7M75ZKcgnRakts88AwrzENE=;
 b=a0AARXhkqvqkZG2Nq/Dhhi3DlNo5rWU8pC27hRu7hmfDg0NDSf8Ww4r121yPZ7RNldZZiiR0YaPcdGtlwdCrso5o44pCbHMGvGHUc1vlhGNiujm9wndgOhzWWHFzVuO2Wlj22ubfzQA5HVvH9Sijv1bWZwqs7TBCFWwlo6Q4icY=
Received: from BN6PR02CA0082.namprd02.prod.outlook.com (10.161.158.23) by
 BY2PR02MB139.namprd02.prod.outlook.com (10.242.45.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.302.9; Tue, 19 Dec 2017 10:18:54 +0000
Received: from BY2FFO11OLC011.protection.gbl (2a01:111:f400:7c0c::115) by
 BN6PR02CA0082.outlook.office365.com (2603:10b6:405:60::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.323.15 via Frontend Transport; Tue, 19 Dec 2017 10:18:52 +0000
Authentication-Results: spf=pass (sender IP is 208.19.100.21)
 smtp.mailfrom=microsemi.com; stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=bestguesspass action=none
 header.from=microsemi.com;
Received-SPF: Pass (protection.outlook.com: domain of microsemi.com designates
 208.19.100.21 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=208.19.100.21; helo=avsrvexchhts1.microsemi.net;
Received: from avsrvexchhts1.microsemi.net (208.19.100.21) by
 BY2FFO11OLC011.mail.protection.outlook.com (10.1.15.22) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.20.302.6 via Frontend Transport; Tue, 19 Dec 2017 10:18:39 +0000
Received: from AVMBX1.microsemi.net (10.100.34.31) by
 avsrvexchhts1.microsemi.net (10.100.34.105) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 19 Dec 2017 02:18:51 -0800
Received: from AVMBX1.microsemi.net (10.100.34.31) by AVMBX1.microsemi.net
 (10.100.34.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Tue, 19 Dec
 2017 02:18:50 -0800
Received: from AVMBX1.microsemi.net ([10.100.253.31]) by AVMBX1.microsemi.net
 ([10.100.253.31]) with mapi id 15.01.1261.035;
 Tue, 19 Dec 2017 02:18:50 -0800
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Patrick Williams
 <patrick@stwcx.xyz>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: Build for AST2400 EVB
Thread-Topic: Build for AST2400 EVB
Thread-Index: AdN4skFOaCpnZ0vxQrOp9cbY0iMI+g==
Date: Tue, 19 Dec 2017 10:18:50 +0000
Message-ID: <20539bcc125442b89c4ffac827e5bbf5@microsemi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.16]
Content-Type: multipart/alternative;
 boundary="_000_20539bcc125442b89c4ffac827e5bbf5microsemicom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.21; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(2980300002)(438002)(189003)(199004)(8936002)(97736004)(106466001)(6306002)(6116002)(36756003)(2501003)(68736007)(3846002)(102836003)(54896002)(77096006)(84326002)(260700001)(790700001)(110136005)(59450400001)(512954002)(9326002)(24736004)(108616005)(81156014)(86362001)(2906002)(30436002)(69596002)(53416004)(478600001)(16586007)(53936002)(8676002)(316002)(107886003)(5660300001)(2900100001)(4326008)(106002)(356003)(81166006)(4546004)(7736002)(14454004)(5000100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB139; H:avsrvexchhts1.microsemi.net;
 FPR:; SPF:Pass; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC011;
 1:bKCJRTqO3HGF8XoqaB5EwryZanusJ9NyxB1FYJrz5y5KtGAR3okCiDaevIyaJfdttY0KXXFA+WRVjEjHNABG7gTScIi1nwu5bU6I6eL6vD55KppioYqgM0r8rnlCe0/2
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a89200b7-4157-4d30-bbf8-08d546c9dfd2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307);
 SRVR:BY2PR02MB139; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB139;
 3:RjyCZIAhSCcwrxzJIY4vbXqCaf7RIr7c6DEG5NaSU57sn7GdEMLhNL1tXVt0a7FH8jNB18HJPQh051grYH+qqo6I7BOzugDyl4BsdrhijoFL7etwSGxI5ZeHW/5OIB/5qiJK3HULDlvYzQsz7O/6OcO5wbNazA77qv+19BJm1a+FDlWCiTnY7wPnZ30gCA0eA2Bs17jruzzAAK2Gu/U3zPhkRRN80aRSI6fao34WJ4tvH89hLVNNRMckjviBZL//CDf0muiTHEpgMVQXO7UFjFebC1Inj7AxybIQthmh/CNXObvGLTwXLjHn7U9UiTyAl/6J1DGbbB7cgEgJry7Tza3v2w48ODxdmrRoZQQDX3k=;
 25:uLAugmIbk/1K4/1H/ptzvJwRZsdxiCIPHbq0dXnxqr+dxFtHIF3Ca8Yf56DSfoZ4J6R2svwCmTrbRX2G0JMQwRcHUVldqKP5/HABROHA+K2JVFKxO5mw51WB/st2/P8DOXzvtN/E6wM7dFfYIgwo1zuI81gcQZwpH48Pzb53YPfUt/XkPF3U0yHAytGPp8lD9qxrkxxhXdr00AOS3uyDJiP017TvPwT76CCyxOz4rlhmuvz/Ej99OrTs0mD3TpuaxzlpgBKk7n9n62BV4RVNrQKVbvz/hyVUu2E31bAbJVZLwOCFTgbSWzxJ04ewsr5zSi5tweRGstxI0JGSp9nE5uFbDJB3Fo4AcNv59wJWWfw=
X-MS-TrafficTypeDiagnostic: BY2PR02MB139:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB139;
 31:8Y3zVLsBK0GmUfXxMWaor/ivfhF8Wrqotj8kZT5VXxQvWp1IV1XWRyD3gUbbDfENXcFqgN/mbDulqrVS13v69ZHhL63FpvhjRFiSOhlX+PDwoD5p9sOiuRhrq9/r6f+lsvNbzGYK1jVsACULEo+6rjPIWNbmVetYrs7Px7gVXwR2ytXA8ZT4v6ZN3rplfJDy7MCCs+AaCx7KmKfQPiMl4rBASBm6k1B14ypF3FbvMkE=;
 20:vClRd/tvZL1kwHYr43RNlgyF7fX+PqBKgLmWoZdwsNBoozZubdaZFS0rZQFIgQ7B1iEtciSfZtjS7LWzhU7BSGP8rXf2VrwBRwSLle2rx+ZIP1t/mWpxJJuaxFcahkLDlsSdAoS2/dAFZ1OmNYoe80/1iJ3WHLt2PMGBrDhdFmhdBdl8sCfjEKK+stngL3k/wTOg8Iy4kWeIi2QGUozf9/x7cK08JfRZYYxkWqiMH7nYHySTX8HrqKr1lF7aoJ7ZaRiKCbC5ojeKQn448JHRPCAvrmRO9WsHL1mW/lIo3p04Rehc7FlTWRo+OkyILVLctiRP9G/OBP/mRdOm4ZAd4kpY+zv9EIS4uJw8tB7hmiIuKAHrBOF2a3QOdw63L+N868WCN11p10H+nX3Oaiw8eBUGBASVMBZlIG03ZzWV3Iwuag1BhruZaK5E7KZKAB4RPTYLhkxJk9yyscwcIWuzUZLWN/qeJU0tc7olxy28Qbb3uNHgnj8KU82e/xCYTt/2gXppP9s7UKMZmy6BC9oqTRzc5R/fsRWB4BIS6OFg1kCGkcPVCjK0/A9Vq39aQgtqVPJr5WBAllF2CaagEqbZtJG9nWXa7r3X2Gzlw1koB0A=
X-Microsoft-Antispam-PRVS: <BY2PR02MB139C6905404C14F2B66258BE20F0@BY2PR02MB139.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21748063052155);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93004095)(3231023)(6055026)(6041248)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123564025)(20161123555025)(6072148)(201708071742011);
 SRVR:BY2PR02MB139; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:BY2PR02MB139; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB139;
 4:kUSHceDjbdo/gmRZwoYD394XpBfqc4liMSjGs7fRG4I6dFmyIcGhEhwcL1O02H0/eWanhNxke4AFNflia4MjGnzEKCCMyr/DkRguclLU94JTzYPrs2At1UyATUvJOj44/sFdVocTghc5NLAHzPB77j72yBuALJLIoukpGNT1+i2jFEMe4HWiTXj4BKyXXSmNniV2fXLQjyoysbXYppPUmBivPI1eLWAW+25xZ1nkU0MF+lqoXSs99cqwqh2vqGBaqEHDfP7ZTWEOUvhdhntcdicHcs3ROaFe9P7LXv/gyJoQCw3UD1zDqcx5x+wUgv2F
X-Forefront-PRVS: 052670E5A4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB139;
 23:5zWbaVzao615Wpd0qUYXN71VNA52xfht+Dd2aoxoCs?=
 =?us-ascii?Q?1nfMJLNsCJM0InPxu54SSOc7qK3MJ9xjQXLo0rr2MSo1O630L5I5PZDxSdp7?=
 =?us-ascii?Q?4sGJ1D/DCBkUelPItkTE3IeBAeX+S22RX5ofRIsgFxFrjk3X4AgQB+1MtDUH?=
 =?us-ascii?Q?/01Na1vlXl0KWGGuk9phRVbCQO1FEoIORzD8s7WcSVUsDFBvBdY8I0xjOfbL?=
 =?us-ascii?Q?+hddRm7GqKHun7EoF4Jg2fTn6TH1PaIgPZeeUJjZ3nlA0cI8n2ODeq04LE3g?=
 =?us-ascii?Q?9vt+5I6nzuB0yg40UdIKCOQpVMCy14NPlgsVqodFUWMIyVZLdX6MJpcpuWh5?=
 =?us-ascii?Q?2vwVN2nfZwD6Minn4RTnOo5KD8ia8BDSTLaPT4RYL2Kw6JWRKGUKUxdciJHk?=
 =?us-ascii?Q?87CVHH40R3dqpj/i4lEfN0CKeOb8X7Rh2xNq2B937UsNL1LTWnahLJq///0m?=
 =?us-ascii?Q?ua7IdXgHWIGHCNB6ALttqV6UpajB1kIjjWqa4Z0ZknI8Q3q3OS7KhK3ZMt48?=
 =?us-ascii?Q?Xfua21QLNShcmXjjhiA99FgFenYp76+lhXPvzlGmgF/KSUfFbDd/+kGwPDC8?=
 =?us-ascii?Q?eScQrhFhntcRpaygoLFuzCickTntM9C/4qa9/Bv/fFrIos5++emqPkozg0sa?=
 =?us-ascii?Q?vx6imFyIBD6ussW863h+rktcz7KSrQuuz2oePPznFUybn9rVMxo//lBvpd9l?=
 =?us-ascii?Q?U2iCBjqoJztWZDKC5AXQarLVXltIg7oFj9D7RHKM4z+8nmodZX07aZtTdDvg?=
 =?us-ascii?Q?c1xsSQFS/pL0J7dvWz3CmkDmP7x60kpe6Zf4//g9LryJGzuW405zFNlkq+Eb?=
 =?us-ascii?Q?qbsU285kmLR8fNenQER5cywv5sPL6QvVNSnAndKZw9ZgN4tvC110u2/tG5Q8?=
 =?us-ascii?Q?R0GHbpHibXS5yZyg658+a+YqfQvyy2GkEHb5QBQWVGFKyY6VB3VkO3B6xVH2?=
 =?us-ascii?Q?jtpJNgNVbVhaF6k35hGVMjsEp6tqcST3e1sCdgG0hhs438xukfhrYYMS4w1I?=
 =?us-ascii?Q?JibMB3AP8MMz2xDDFw0rn/dn2HyPaa0/MBtA3ZyEKU+tLBUKao6x9GbFaAiU?=
 =?us-ascii?Q?XHSeog2eM/Nwy4Xiui+b4XPt13c1iRO4aMbLq7yhl4IQ7xvCI/0suz6gG126?=
 =?us-ascii?Q?MTfBIZ+LDMNwl/Ykf1TjXP3GfQJShMnq/8Q9+L12q6RVWtfF72DvM0wYRXX3?=
 =?us-ascii?Q?LWuVCiosyUFlg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB139;
 6:8iUcl1MJO/0cKJZWW1LfmXQ13Gr5Tv1s39z/sJ5JR6f23eruUyStIC+3W5iPR/arv3vHhTxwIVqa78WRSvkRXqmM1WFHpirxRTdb8Lp+xN9tN6OKAjSMlUiEtTYHEV+UxKblEOICwftiyez3gCBIRfjjYj6xHwvizaOPcJNzBO4ikfhQVY+LUcxp9I1x912mWOd/+wnusta1ub7gZ6JD9Cb4Q2aBVgoUvhf0mQJ1d41HofVd++daZnpw/hRIam6AwQJV100zuVUAxzJcItvmaHS/FXVp8nGluDP9MKsysLk4hVEA9CJnvVuB1N5jGO3r5+zSIPqZNMT0AuJUzUiWp1VYSFecMCtfp4n9kQ0JmQs=;
 5:GooK95tQpgpDhzZ83fN2wX9rYIPm/p4oPPf560lDi1mFoqHldttVq9zD6i5UBqgOdT9Qt9RMF+X6z4dZmhYyE+4v4/jwNTcTmxJjJBqXPzkqLH4kppsNMNXoRyb7QmyUemw+TiUHolRdW3bCpX+zvFn3lZaTW2xw0Lwx7EIKmQ8=;
 24:rWlyK2EM8L+12V3K2qYFfb0MUIQv1z7hymAXw+AWSR11x8Xy2tYer5RCqDKQhUAvEy0UoTSMZOO1XHrZj80J5OQh5lV3iBrrQY5IQpQHfpI=;
 7:K0WS+4PLQ5p9aOEwiNKav6Mq4ogu7+CJUxnpbZypPObU7mUQIx/vwIANATOm23QnsCDrgJqn3ln6vFzfq2A3BkYlx7UAxhakVVZC3zr1JSJSlLSjSN0ipPzcB1VZBSV3bBd3f41VRxyybe+cniLsGtfD542UY0TA/EZO3Edvlfeaq6rKR/YyhZyv2Kdp63PUEQtfCWTC0YQSRTUzvk+yseg6pTlvBARq8yUueKZMec46cLlGpkN68hOHK/Z2O/y6
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2017 10:18:39.7797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89200b7-4157-4d30-bbf8-08d546c9dfd2
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.21];
 Helo=[avsrvexchhts1.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB139
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 10:19:02 -0000

--_000_20539bcc125442b89c4ffac827e5bbf5microsemicom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I have Aspeed AST2400 EVB-DDR3 V1.1 board with me.

My requirement is to run an application on aspeed board which runs open-bmc=
 image.

Can anyone please guide me to a document/steps which will help me in buildi=
ng an open-bmc image for this particular board?

Regards
Arjun Padmanabhan
Software Design Engineer
Microsemi Storage Solutions India Pvt. Ltd.

--_000_20539bcc125442b89c4ffac827e5bbf5microsemicom_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have Aspeed AST2400 EVB-DDR3 V1.1 board with me.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My requirement is to run an application on aspeed bo=
ard which runs open-bmc image.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can anyone please guide me to a document/steps which=
 will help me in building an open-bmc image for this particular board?<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">Arjun Padmanabhan<o:p></o:p></p>
<p class=3D"MsoNormal">Software Design Engineer<o:p></o:p></p>
<p class=3D"MsoNormal">Microsemi Storage Solutions India Pvt. Ltd.<o:p></o:=
p></p>
</div>
</body>
</html>

--_000_20539bcc125442b89c4ffac827e5bbf5microsemicom_--
