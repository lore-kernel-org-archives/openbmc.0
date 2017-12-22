Return-Path: <arjun.padmanabhan@microsemi.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsemi.com
 (client-ip=104.47.38.48; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=arjun.padmanabhan@microsemi.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mscc365.onmicrosoft.com
 header.i=@mscc365.onmicrosoft.com header.b="IpzIPpMG"; 
 dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0048.outbound.protection.outlook.com [104.47.38.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2xHn6MC1zDsQP
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 16:04:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mscc365.onmicrosoft.com; s=selector1-microsemi-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=9krOgdmM6LneUW8fBcamHO2SALIXTFKAN0k5WmZ3bbA=;
 b=IpzIPpMGTfjkK1ae8J1kXlw+Uv0EPDFHZqjgAnw3lAwBgOFO6+H5nNhDu4ayg87SiEHMOqOsADe8EJ/1xvT/DMAc/Ql3Nn6CkeW3YpWOqTZGQuLCQna89Gv9WJFH8KU7K9Lr+F5yh8hEvgnWFy8Oj5NI1mP9hitA5Spk6lORjnE=
Received: from MWHPR02CA0034.namprd02.prod.outlook.com (10.164.133.23) by
 BLUPR0201MB1828.namprd02.prod.outlook.com (10.162.239.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.345.14; Fri, 22 Dec 2017 05:03:56 +0000
Received: from BL2FFO11FD016.protection.gbl (2a01:111:f400:7c09::131) by
 MWHPR02CA0034.outlook.office365.com (2603:10b6:301:60::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.345.14 via Frontend Transport; Fri, 22 Dec 2017 05:03:56 +0000
Authentication-Results: spf=pass (sender IP is 208.19.100.23)
 smtp.mailfrom=microsemi.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=bestguesspass action=none
 header.from=microsemi.com;
Received-SPF: Pass (protection.outlook.com: domain of microsemi.com designates
 208.19.100.23 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=208.19.100.23; helo=AVMBX3.microsemi.net;
Received: from AVMBX3.microsemi.net (208.19.100.23) by
 BL2FFO11FD016.mail.protection.outlook.com (10.173.160.224) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.20.302.6 via
 Frontend Transport; Fri, 22 Dec 2017 05:03:41 +0000
Received: from AVMBX1.microsemi.net (10.100.34.31) by AVMBX3.microsemi.net
 (10.100.34.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1261.35; Thu, 21 Dec
 2017 21:03:53 -0800
Received: from AVMBX1.microsemi.net ([10.100.253.31]) by AVMBX1.microsemi.net
 ([10.100.253.31]) with mapi id 15.01.1261.035;
 Thu, 21 Dec 2017 21:03:53 -0800
From: Arjun Padmanabhan <arjun.padmanabhan@microsemi.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Balaji Marimuthu <balaji.marimuthu@microsemi.com>
Subject: Build for AST2400 EVB
Thread-Topic: Build for AST2400 EVB
Thread-Index: AdN4skFOaCpnZ0vxQrOp9cbY0iMI+gCL9vMA
Date: Fri, 22 Dec 2017 05:03:53 +0000
Message-ID: <45d2e26bbcee409b9aa125288c1adf02@microsemi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.34.16]
Content-Type: multipart/alternative;
 boundary="_000_45d2e26bbcee409b9aa125288c1adf02microsemicom_"
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:208.19.100.23; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(39380400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(5000100001)(106466001)(4546004)(53416004)(2351001)(5640700003)(4326008)(6916009)(107886003)(3846002)(77096006)(6116002)(790700001)(69596002)(86362001)(30436002)(53936002)(97736004)(54896002)(2501003)(6306002)(81166006)(106002)(478600001)(7736002)(2900100001)(260700001)(8936002)(5660300001)(9326002)(36756003)(24736004)(108616005)(14454004)(84326002)(356003)(512954002)(68736007)(102836004)(16586007)(1730700003)(8676002)(316002)(81156014)(2906002)(59450400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR0201MB1828; H:AVMBX3.microsemi.net; FPR:;
 SPF:Pass; PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD016;
 1:gEPpSeCCcgjv/YqVrKnc7SJG7ZfJJ60btiOfT7OUXM0ARXsvm0xWX9VtT0fEy7sJadCYY6BLz+Y6gUQUQWMw8hT2dsNJXDSuEq0OrCfY7FKXPziuMC+2E25ZEgld1QRM
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46369397-8253-45ef-55ff-08d548f95eab
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
 SRVR:BLUPR0201MB1828; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1828;
 3:TebaMh71QXsFdw1xzpa6H9ZWv/uyydKr9xgVVeLTTrQFOfJeBdkhO9kYiDdPRIeM/1UqaL9wVE46fTB8KnyHMDazGgCqM7KmVTlxnZeURo2ChOpGQ1+yAo8xOAJ8i1YW6wi3S8uSa9VLReQh/McUgs+WXeQFY8xIJl4DsMXO1j7/BL3STKisLyrZNGtYeI8rvbIz8kO4E4FTf4SGLCxHq77Zugp2DEW/HyxQ/MIYGW8mrFuSwhjiWsRJiTcKf5zYRnwNM8DW53dDqt4Fge9j06dRfNexMOb63mqNyQL3bx183+KU7dEBg7lgH1kE7sywPUirUfjqYvdlVKBtF5lMalvCxGQyEef/e18CABHEmII=;
 25:f+3Tn7aHu0MCvsFD+xPHHa0QkaeETNYa6Qr2XpbEI10Qh5qoRq61yfcGcvuhM2DKAad7vzvYF8nIOkd5xLnB4+Z/K9z7gsoTTHx/M1gvrRe9mBgcUQI6K8MkI0Ji5Tf1uA5BgHBOkQPlqJgdu8ZcbHWccTw3dXPixRiUeRDqfwtDrM9KqJ9ZF+bj8KFA8/kTZK25HcNZqwyJs4tnpsbrtPosiDVqN+5iG0gVJgzA/0KBnnyH7F13EqkYcDkURrO10Vy3tsHp5eLuXkawBgFh4QxC1Zpo8eadJ4cH4dtmLBUQ0hqSF6WgtUzFVX4O8xeMKTXXqTYSNYVw2k6ImFrvqA==
X-MS-TrafficTypeDiagnostic: BLUPR0201MB1828:
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1828;
 31:qUIYJ7uPqaeCXD82/WwyvaRUJaNcTJ5I9D/PPUQKcB94KRR7RJM6LYVclCs9CrxL99oUuuTeAl78szLrAVOQmg8xutb99Giq65SuDv7Z74NRcwngBCi0QzGNwiLoms9pxNbpO3P6R7DVwhj5e2riexNQLzgt394mDkn4LtnGxfEy6aWZUeRLeWMROLA0kC+MjBT/BbIi4yDJdUlQckLWc+3NXklU9B6I2g2OK2tXGRE=;
 20:xoQ6f3qWyFq7D0WCiMIXu755AhypcBAAKlWDuXt2SPQiqYrPmLgb4C194+eRO1+gvVunKhPh/lryxR3IMnjtWTETLD71S266dikqBXhQ+PUGQMwf6DmXL129EkhG6rxR5Ov5qxTSSMqP/hLd1GxZdXR7iNZEBRPIp8QCMnd77muNEXkJ+MAkOzxRSzlLcuZFoX4HSfQBwDEUWWygYzVjeo0PLxpAsTc71YGWTNgWmJo5QbwRUpqBJHCDwDP0o3w6XIT2kerjPsiGqNsFAA2Z0T65EBnc19tr/zlr0WISQ+P+Q/N72aycFygXuMwnULMKrxscOTMUINOp7840xALUeJeQbX3/odIcYE+8DV0/twOfhJAoPzZ4Mmofm2Qdn4LQVWtiVPWPTeZKpcUQ7hs78VGMM9S6qjeqVn4w0YJjl/EnNSFfMnrUZFBMwoSDdiTqDDUJ7jYy2IDA2uai8BJTrr4JIljAwYhq35ECGvl4oegG31CnqdiVzqDC3Iud82wODVP3MDKV4U9kBXNOn7aKIGZ60nWs91CchABVZIrvbk+oNOp49/WmGloV6MNID/ZqeChW+MmfPMSFUFOGvhnJzzA+PSHg4ir69BzJ7udxeiM=
X-Microsoft-Antispam-PRVS: <BLUPR0201MB1828F8B7517718648F40D493E2020@BLUPR0201MB1828.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21748063052155);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(3231023)(944501037)(10201501046)(6055026)(6041268)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
 SRVR:BLUPR0201MB1828; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:BLUPR0201MB1828; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1828;
 4:ySVVifsRmF+4fRAZS3XbFDfPzHnKYiEswcGmQxIcIat8Ax0dhr+nYfkBHseJrnrDw9CnI6yUmtMzHch1xZxKG15QqNrOSFZ6OUw2AD9DzeAWaotVH2jmvGKesqT1zHFlwizZR4px3+txKTjVmVBtNX3VDJvpWtb1qhkpYLJKcIGwZ/ujgpStuNoCNOrOrS+GHL4Ab+z3NwZRaJPu8dMQfeJ/V/wNlMvFUgUSa0jk9QVMPPIobXxBddmS4eFzRfXH7qWRYR1lT0hQgubCa6GLznOomWDV1Jslh1RCparibJHMfaJEWYSFlQ47KPJfNdH0
X-Forefront-PRVS: 05299D545B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR0201MB1828;
 23:M4rxO3HK7fbMJw5wY7ESP+IeC3fnjw68Eu0P0D5?=
 =?us-ascii?Q?8Hmjy/pq7aHNBgF53UcjPKD3/eTMFh8geXj0GkhValAcwu+dXcELLYT73TGa?=
 =?us-ascii?Q?ziB/iIvgMbFnggYsrUoy59ob3bOl/jeUFFyFShZ0rMDgWLU69k8+efzf14az?=
 =?us-ascii?Q?rl+AatKWH6qkLZ8cVwN/EahOQAzA592SYpuC7DShoK58k9u1FJOy994URYYY?=
 =?us-ascii?Q?0BI0UWsxVpTFW0xwicMbgzM8DaTaMpV7lAMa4EeRpw557bu71++eahjbXne/?=
 =?us-ascii?Q?gx/jp7buomeVg9sCCTyoCgiYsvPpFr/QDYBfe338jFkmxHiYtf/Pd3vtnOxr?=
 =?us-ascii?Q?f4U9Z/5puheJ1INmy8XZg9LQDxKVmqitf3Cexa+9yJ7bE3dEmXLpY1U355YC?=
 =?us-ascii?Q?HGJLx+NtJaM47sG4/J8tYiy42xvcXjRHoS0gjljcG7HzuqfBwK35Zu8WUr1H?=
 =?us-ascii?Q?Kvs7wqEQuaqQCHpLDy0bqzn4H2XxGqERe8X3Ne4eMVbc1vhn52CmGOtNAkwa?=
 =?us-ascii?Q?ow2+2uuV2GgEaZvvOQi24ab8qOstnFcBaJBP9nX180gdPe8h88bXmp9OR91c?=
 =?us-ascii?Q?DeqmZOSW4SaDlOEvEb0s/BFRgqc32yWE+0fZEUSebEqx0ZeRjAQ+7tl+oK5z?=
 =?us-ascii?Q?6u3Xaz8WNGVq/dttvb6Of2Ba+X+NynVXG4jlDdxAFZKalRiBZwR2zcprxCrQ?=
 =?us-ascii?Q?8rUQ6i7rV9M+cX1Ceegyxull0B+fxmOEmO/ooXSsMkQl1t2N1gliKsRVQ2Y3?=
 =?us-ascii?Q?SC5yaxBNFjF2T6jPZE8GxRZRv+FHKeMuyiQdUa7NmI9XCWYUDpVRjWlV4NwZ?=
 =?us-ascii?Q?hf5wstbu4u3/ilvmV1kKwgg4NAwRkPaOVRDkhkH92EgLbC0IYCKiyhPtL2Qf?=
 =?us-ascii?Q?YhdyZx0VnbBgq8KByKzcWXzgi4R/Dp0sylIN/035MTbyw/Gc2WquBQ6mQjKc?=
 =?us-ascii?Q?jVEdobf6P+WfomL5XC/dxz4ecE48Dlp0D8U1FqUC0YQhOdioPyPs+erWA0NP?=
 =?us-ascii?Q?2EeunElpuawJwJ4svMOU91gZuKy6XzHESLD0yH0G35HGwsV6EXec2apJ1Gzc?=
 =?us-ascii?Q?xA3yaHu2zuXZp7TOLK855lwrHFJ5AanSp0WaFlgKM0myJlxKZoCV0SSKqUVP?=
 =?us-ascii?Q?RxNK6P2vAvRbT48UkCqbikPHGqNRtPR00xENBJzpqic3wDS3fXxkVw7weGf0?=
 =?us-ascii?Q?t1zFkFkZZx+6T1zczRepplht9LU8QDKzQqPChSEChdy76tLSHiMNRGAYP6kh?=
 =?us-ascii?Q?H1msoK6C8llV3zvuOTXI25ux3WkVzr5jNfC/q+KMC?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR0201MB1828;
 6:v8SuoiFeVM32EEpvnQUHD3r165YiW54IVEL+4jIy0jNnR5ofYrqEBFLNHhbSUDaifAFtJv/w5pwwgr1R13/jknCTIilbEXWUnPyskiBTAgKkYcbY9rjj3yKpQAVwjdz1xJMLuCXOR6lbV6QqDD/TJwnWitXPx8aco8s4qeq40y5I8taYjTJwTeCtxyVKX65myO3eBV6ixEHYFIzG0sibIvBmOSBLP1/+xBWs0BBxQenNkEiNxam9TvPRvWDmQ4khtIzNThR2Ry0KYDoO8cqBeu5Y4eCBPzfcBLgJ602AkKOFaoP7CHMf/SMI3u328yU6nmtUW49e6wVRknjNgTQJZXiljcml5c0dSIpiyBQVaAE=;
 5:smEui4M5wWyWtglo76DSc2ROgljUcfhKZdACHEDmarcHc/rYM+J2reBcXZm62lXk0hITlxY5e2jSIr+IuoM5iuFZi2ckoKTVCOtyvNPoAiQKIwaKytKUgImS7wPHRS5LXdQpiyc7zBdXg7IhLZ2SC9+wdGzRqS9ZRdqa4FxBoWg=;
 24:AlAFWKh5PN0DXzokzSBJdfzAZ6QixalgGQNfY+g0cHBcriaIjXeDl9xGr06GxQPhU620qMwDG7nBmPzaoPo+kCs6lL96vCTHy+sDjwNgLv4=;
 7:pFLgXdvpV0LBTLrVZAQXi0xVysbejn9tUqOCV+NwFh34lKX/ulo75wz8Aa6y0jZVsKCoLAIirP6SfuIvHYZxxWdhIfi5LupCsqcOnOhrp5nbMfaKf6ZNTMK+HUWUAKrS8nW44G4FfwwptCWLvT++mHHkqndQAAaT4vip8cDbf6wwXV4cdQTPxI+jw0dZoVQlOe4U77le8vOAQI7/U6/oJKtQzUsO/qeXvzW+DHGfY/vrMV5Tcn3s8IqXvpPK2l8Z
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: microsemi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2017 05:03:41.3888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46369397-8253-45ef-55ff-08d548f95eab
X-MS-Exchange-CrossTenant-Id: f267a5c8-86d8-4cc9-af71-1fd2c67c8fad
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f267a5c8-86d8-4cc9-af71-1fd2c67c8fad; Ip=[208.19.100.23];
 Helo=[AVMBX3.microsemi.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0201MB1828
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
X-List-Received-Date: Fri, 22 Dec 2017 05:04:08 -0000

--_000_45d2e26bbcee409b9aa125288c1adf02microsemicom_
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

--_000_45d2e26bbcee409b9aa125288c1adf02microsemicom_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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

--_000_45d2e26bbcee409b9aa125288c1adf02microsemicom_--
