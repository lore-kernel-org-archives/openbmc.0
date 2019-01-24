Return-Path: <prvs=6927b2db97=amithash@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6927b2db97=amithash@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="pxc2L7z+"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Xy8pM4lp"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lySB2xXdzDqKl
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 10:05:42 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0ON4Y3x030791; Thu, 24 Jan 2019 15:05:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=vwwp7vAyvJgavPNk1Ps6Aer6sgInott4SBrCSGhlwVU=;
 b=pxc2L7z+Qn5DovJ/GffR9RMkQnOaYmRxW0T5XcKDj/e55BX37I9J/4UrYGPkKmF1Hqf0
 pvjsIuMXXvzkEuEH5T834cCfty5Mkz5S0zS1l0Gc0Jt1rgz92gPW1W+udqkJUYlPNvmy
 AaUZHdSknMUprVuIKOw08yW9EYOIMfH2030= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q7mxx8as3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 24 Jan 2019 15:05:35 -0800
Received: from prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 24 Jan 2019 15:05:32 -0800
Received: from prn-hub05.TheFacebook.com (2620:10d:c081:35::129) by
 prn-mbx02.TheFacebook.com (2620:10d:c081:6::16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Thu, 24 Jan 2019 15:05:31 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Thu, 24 Jan 2019 15:05:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwwp7vAyvJgavPNk1Ps6Aer6sgInott4SBrCSGhlwVU=;
 b=Xy8pM4lpITi7aTvIuHOT0YMYGqMu1E0kijrnkMfyyQIHk23L5DrJ+sSp8KaraOYBc5DUK1kd6954CMWol5CsJLqU72osTAvCujr77bmddasuQIBDAw4HrHQ95uRM0KUHTKUgV6OcvyQ3/q3dFIFEQG186Bgz7DF9AOcvOAWfAkI=
Received: from MWHPR15MB1486.namprd15.prod.outlook.com (10.173.235.7) by
 MWHPR15MB1568.namprd15.prod.outlook.com (10.173.235.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.31; Thu, 24 Jan 2019 23:05:29 +0000
Received: from MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::e042:b8f3:1cab:b6f5]) by MWHPR15MB1486.namprd15.prod.outlook.com
 ([fe80::e042:b8f3:1cab:b6f5%3]) with mapi id 15.20.1558.016; Thu, 24 Jan 2019
 23:05:29 +0000
From: Amithash Prasad <amithash@fb.com>
To: "Li, Yong B" <yong.b.li@linux.intel.com>, Vijay Khemka
 <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "cheng.c.yang@intel.com" <cheng.c.yang@intel.com>, "osk@google.com"
 <osk@google.com>
Subject: Re: configuring lpc register from user space
Thread-Topic: configuring lpc register from user space
Thread-Index: AQHUsq7mJL8Gq6TnZUm014bNCUUai6W8GF+AgALzsz8=
Date: Thu, 24 Jan 2019 23:05:29 +0000
Message-ID: <MWHPR15MB148626B6581162BFF5A17113B29A0@MWHPR15MB1486.namprd15.prod.outlook.com>
References: <898F383C-6AB8-4AF0-91F4-680CA01C2D50@fb.com>,
 <3aa23d34-2d9b-7500-1fb0-a211377ecc4d@linux.intel.com>
In-Reply-To: <3aa23d34-2d9b-7500-1fb0-a211377ecc4d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:cfa6]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1568;
 20:35IDMbDEblcDL2q91XIIhZagyOx93OQEdBc92ZGY2WfGqr5unZ2vPIspOFGnXiY00tx2fYbJ+2QkTVJIrqUr3bDzOExqdkj97aYtuPu2ptO1gE94VJhbFX7V/kha50aWoAXRILDwjxgNKHO40jbCgXG/rMkAYErV5jhz4S2klII=
x-ms-office365-filtering-correlation-id: 2374229a-24d4-425d-4894-08d682506f6a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1568; 
x-ms-traffictypediagnostic: MWHPR15MB1568:
x-microsoft-antispam-prvs: <MWHPR15MB15683E5D2F4251FC1E228F19B29A0@MWHPR15MB1568.namprd15.prod.outlook.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(136003)(366004)(346002)(376002)(189003)(199004)(71200400001)(106356001)(6436002)(68736007)(7736002)(71190400001)(2501003)(81166006)(97736004)(558084003)(81156014)(229853002)(8676002)(8936002)(105586002)(105004)(476003)(46003)(86362001)(74316002)(256004)(14454004)(99286004)(2906002)(9686003)(6306002)(54896002)(236005)(486006)(55016002)(11346002)(6506007)(110136005)(606006)(33656002)(19627405001)(53936002)(54906003)(4326008)(446003)(316002)(7696005)(186003)(6116002)(478600001)(25786009)(76176011)(6246003)(102836004)(966005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1568;
 H:MWHPR15MB1486.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y0CxMFpHyZRF39WSuRa1J+JZnqtEHuwbOod9x3bRCUj3OwNjoUlSMjEvR7o2NTgUulGUPqDKJCKvr4bJ0XgjpEu6yHSJVLvQfIvk+xB10qATc0wVcx1TOteT+gxjBzUp+wlUK2KH5+0pq/BQq3eOlsc5jYzxVdTn5iWFRhDO5k78WwhndRnlyB/6a7QnDQuyzcwhFTeEo6AAvotQS9hcxMOF3nXlMQ52TquZeWHggRvNU5RB6tP49u9unbfvMZIq/L14m5Z5Iz6BDmKAWAlckdtRujFCFxZJAjDL/X+fm7XT1ohOkP4LBJTmmfvIRRp/2qJBAzePwuqJG8zDF4to03l8LtfqpOhBBdoWZFemTsb45pcTzalD789GxKKpN+Tw3FxoNZfE5+iEVsmetO22RAgBoXpboibi5cm1G7HG8hs=
Content-Type: multipart/alternative;
 boundary="_000_MWHPR15MB148626B6581162BFF5A17113B29A0MWHPR15MB1486namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2374229a-24d4-425d-4894-08d682506f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 23:05:29.6353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1568
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-24_15:, , signatures=0
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
X-List-Received-Date: Thu, 24 Jan 2019 23:05:47 -0000

--_000_MWHPR15MB148626B6581162BFF5A17113B29A0MWHPR15MB1486namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> For the UART routeing, there is a kernel device driver, it will export
> several entities in sysfs, you can adjust the routing.
> https://patchwork.ozlabs.org/patch/969238/
Looks like this driver never made it into the mainline kernel.

--_000_MWHPR15MB148626B6581162BFF5A17113B29A0MWHPR15MB1486namp_
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
&gt; For the UART routeing, there is a kernel device driver, it will export=
&nbsp;<br>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">&gt; several entities in sysfs, you can adjust the=
 routing.</div>
<div class=3D"PlainText">&gt;&nbsp;<a href=3D"https://patchwork.ozlabs.org/=
patch/969238/">https://patchwork.ozlabs.org/patch/969238/</a><br>
Looks like this driver never made it into the mainline kernel.</div>
</span></font></div>
</body>
</html>

--_000_MWHPR15MB148626B6581162BFF5A17113B29A0MWHPR15MB1486namp_--
