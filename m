Return-Path: <prvs=587540bc09=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=587540bc09=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="iLatKFVB"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Lflvz6yg"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437y1v6wmNzDqQs
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 07:55:27 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 wB3KqK5A022657; Mon, 3 Dec 2018 12:55:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=alEEbU/LBgBlPs8ywneOFeFbhN8LPSwC/Mcx2y6eFLw=;
 b=iLatKFVBt/6L3EjFB75hc+sio1AHzgH3UJltsvOCe4x3KKez53ag7q3zpWhOsH9USh8w
 Bx8/4Zb9ouoRLLQ/lRturiD/JVhVoSxL6l/wsp7o2oxiCO56h0MQVoIxRYd48KVb0etk
 W/rrx1WJVH9IWp5YBpFwZn0Rkmn3B0o0kRk= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2p5bk3r311-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 03 Dec 2018 12:55:24 -0800
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 12:55:24 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 3 Dec 2018 12:55:23 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 3 Dec 2018 12:55:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alEEbU/LBgBlPs8ywneOFeFbhN8LPSwC/Mcx2y6eFLw=;
 b=Lflvz6ygOIgJ0/7RgYyF7SgBNmwkzsH0HNwP510sQ6tb9ylDXuuGLbVBH/zg1bALHK2Dbk0mCQ/klOcC9ZRhCnDFV5j9sMu+XR5MzF9gDcw2crJdAKbilQ2SQxXDwmKYhozw6qO8Gj1D8J3VXAtGR0IaOfYf6u6V3pCPbRo6xvQ=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1581.namprd15.prod.outlook.com (10.173.235.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Mon, 3 Dec 2018 20:55:22 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::e009:f382:daad:e607]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::e009:f382:daad:e607%10]) with mapi id 15.20.1382.020; Mon, 3 Dec 2018
 20:55:21 +0000
From: Amithash Prasad <amithash@fb.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Joel Stanley <joel@jms.id.au>, "OpenBMC
 Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: Linux dev-4.19
Thread-Topic: Linux dev-4.19
Thread-Index: AQHUh32YVSLrYXNGk0ae0yZAJE7ArqVskECAgADYwYCAABv7sA==
Date: Mon, 3 Dec 2018 20:55:21 +0000
Message-ID: <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>,
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
In-Reply-To: <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:4523]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1581;
 20:gHuwae/63K3MU4+Lg66u+AWzcrw2tWporeH79JGIOpsYgMvWUHjFEpRnnjyJgBj0rbDWmCOr4+U1O0pVM/mZs06UWtmP4xT31Yl5S7f7/766mXILPsgxlz2sFRPaDOOvcgQjroYoZNszKNmiNu0282x72OUMpOK4nOgxCpuCFJM=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(346002)(396003)(39860400002)(189003)(199004)(74316002)(8936002)(110136005)(6306002)(2906002)(8676002)(97736004)(68736007)(81166006)(606006)(7736002)(316002)(229853002)(33656002)(19627405001)(76176011)(106356001)(7696005)(14454004)(81156014)(256004)(186003)(446003)(478600001)(6246003)(105004)(46003)(486006)(6506007)(966005)(6116002)(476003)(102836004)(86362001)(105586002)(71190400001)(5660300001)(99286004)(71200400001)(236005)(9686003)(53936002)(11346002)(54896002)(6436002)(55016002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1581;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: 8155a36c-f496-472a-7446-08d65961a403
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1581; 
x-ms-traffictypediagnostic: MWHPR15MB1581:
x-microsoft-antispam-prvs: <MWHPR15MB158100FECB1E5DFB625FB964B2AE0@MWHPR15MB1581.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(3231455)(999002)(11241501185)(944501493)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1581; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1581; 
x-forefront-prvs: 08756AC3C8
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: tRZh6J8gQhEP6SuuR6iBpljCbocBaDgidAJdkbOqzJH5BJah0uGKiy4AQ2F6SWJZ3KbbFEyqpNO/aSKWgew4CrWUf66r06AiVnCnDSB7CR5MVTXzqyHUeT8iY9SHUbdMuFdin4IKHO7qXzjLlwluxl+QpWcRFwamtL6CspU5RF0qwe89SbTMfXvlQbeVNf2/3BV+L3NIoz3J3s02onr1DOrofWxzaWl/3hWsc1vKwviYcqLfgcHjJSSbOfoRmmulpjqajEgc+KNjgTYwwu5pTS2lMHexYv7+7D/NC8OA9rtUFrpNY/UTze13rcv8ftQZ3axq2nDke+rAjsnfV1LSQ/JpYD/8vfTgjSKEp+XHGlw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_MWHPR15MB1486493B01A346850E6B73A7B2AE0MWHPR15MB1486namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8155a36c-f496-472a-7446-08d65961a403
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2018 20:55:21.6643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1581
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-03_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Mon, 03 Dec 2018 20:55:32 -0000

--_000_MWHPR15MB1486493B01A346850E6B73A7B2AE0MWHPR15MB1486namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>> I have couple of NCSI patch which were up streamed last week in linux-ne=
xt kernel. Will those be part of this 4.19 kernel in openbmc or what is pro=
cedure to pull those patches in openbmc build. As these are required for Me=
ta-facebook build with networking working.
Joel,

Thanks for cherry-picking a few of the NCSI changes into dev-4.19! Along wi=
th these, can we get a couple more cherry-picked into dev-4.19?

One patch from linux-next:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
net/ncsi?h=3Dnext-20181203&id=3D16e8c4ca21a238cdf0355475bf15bd72e92feb8f

One merged patch to bring in the Tiogapass device tree:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/arc=
h/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts?id=3D3368e06e2a91a65cff59e=
520acc51b9adf4900bf

Thanks,
Amithash

--_000_MWHPR15MB1486493B01A346850E6B73A7B2AE0MWHPR15MB1486namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt;&gt;&nbsp;<span style=3D"color: rgb(51, 51, 51); font-family: &quot;Seg=
oe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;=
, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sa=
ns-serif; font-size: 14.6667px; background-color: rgb(255, 255, 255); displ=
ay: inline !important">I
 have couple of NCSI patch which were up streamed last week in linux-next k=
ernel. Will those be part of this 4.19 kernel in openbmc or what is procedu=
re to pull those patches in openbmc build. As these are required for Meta-f=
acebook build with networking working.</span><br style=3D"color: rgb(51, 51=
, 51); font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European=
)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &=
quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; background-col=
or: rgb(255, 255, 255)">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Joel,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for cherry-picking a few of the NCSI changes into dev-4.19! Along wi=
th these, can we get a couple more cherry-picked into dev-4.19?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
One patch from linux-next:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git/commit/net/ncsi?h=3Dnext-20181203&amp;id=3D16e8c4ca21a238cdf0355475bf15=
bd72e92feb8f">https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/net/ncsi?h=3Dnext-20181203&amp;id=3D16e8c4ca21a238cdf0355475b=
f15bd72e92feb8f</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
One merged patch to bring in the Tiogapass device tree:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/commit/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts?id=3D3368e06e2a=
91a65cff59e520acc51b9adf4900bf">https://git.kernel.org/pub/scm/linux/kernel=
/git/stable/linux.git/commit/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapas=
s.dts?id=3D3368e06e2a91a65cff59e520acc51b9adf4900bf</a><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Amithash</div>
</body>
</html>

--_000_MWHPR15MB1486493B01A346850E6B73A7B2AE0MWHPR15MB1486namp_--
