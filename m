Return-Path: <prvs=5975b581f2=mattconolly@fb.com>
X-Greylist: delayed 1397 seconds by postgrey-1.35 at bilbo;
 Thu, 16 Jun 2016 12:16:32 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b=dNdeVNXD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b=UktSlQw4; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rVRp86zGpzDqZr
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2016 12:16:32 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.11/8.16.0.11) with SMTP id u5G1oVP3018615
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 18:53:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com;
 h=from : to : cc : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=be1QIPaNIZuFjipo7Ys0PL1OUdtG6shNQs1Mjanjz4Q=;
 b=dNdeVNXD3pWOcQWXywqwA3RwKmC5VynPw/1+nbkaApoZ+pQrcoVK1jaQdE1ZnTV7xP9e
 6Nc5B6ZDSgP4tmV0AdLyPsZsRyeR+qD/MABB+A9O28sgxsHxzrS2NuNhzCMg/cX4RQyN
 jvljPDhS3FVjw1cuMNcZReB+EvSmXPDDenk= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 23jehr8yy1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 18:53:11 -0700
Received: from na01-bn1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.21) with Microsoft SMTP Server (TLS)
 id 14.3.294.0; Wed, 15 Jun 2016 21:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=be1QIPaNIZuFjipo7Ys0PL1OUdtG6shNQs1Mjanjz4Q=;
 b=UktSlQw4hWFK9wvdjRwdNRSaINw9K4irtUeiGD9j9+Xoz4IqmHGkpYfXlaYp1eFg3xci7Z7mOc//UhqVP/aRQyHjgtpkKjdRC71vDC1QulnlIuRGqazMHzToR2MoPoe91Qx2pUsyrHxt34FE9VXipCuy84xKCPm3KcBebsiVymI=
Received: from BY2PR15MB0421.namprd15.prod.outlook.com (10.163.109.27) by
 CY1PR15MB0597.namprd15.prod.outlook.com (10.164.73.19) with Microsoft SMTP
 Server (TLS) id 15.1.517.8; Thu, 16 Jun 2016 01:52:53 +0000
Received: from BY2PR15MB0421.namprd15.prod.outlook.com ([10.163.109.27]) by
 BY2PR15MB0421.namprd15.prod.outlook.com ([10.163.109.27]) with mapi id
 15.01.0506.017; Thu, 16 Jun 2016 01:52:53 +0000
From: Matthew Conolly <mattconolly@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: 4.1 kernel tree - ast2500
Thread-Topic: 4.1 kernel tree - ast2500
Thread-Index: AQHRx3HLnSHLzuJ6gkGmXx1+Me+lmw==
Date: Thu, 16 Jun 2016 01:52:53 +0000
Message-ID: <001A853E-89BE-4753-8F30-2CBB3492AD54@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::f:1d5e]
x-ms-office365-filtering-correlation-id: 7349ed3c-24b5-42de-23eb-08d39588ee5c
x-microsoft-exchange-diagnostics: 1; CY1PR15MB0597;
 6:iC9xqRHunJ5RtaQIN0N2bnfdpU4/BXC2l6oRu6vRPNNthafEb4NUYpcsiqSZYB3zsyrNjtCdPZSOl/HViFqqUT+GujmVWPqd/69oGsvG/HfERMWc0+p075K6iA2ersEEFvzPAvFTGl64k8VPBTImfcX3iFdU1OtfbTY0WwJVABu0eIl95snFVDZ204hiu/UhjLxopLKlJSatdjiApi7rdIEDiqoxbXB52Xk2loOGPRAiSliHVQwIvi6+YXTS+w1sHIVRXF9YBnrgUgXAs/C8og==;
 5:TdhiGtYMCgkedxzWL4gtScjHX99RPN6LjE3iKY5KI/Uox8AmjbV5BNPfPZR3tKP5zwApf9VxphRlj8sR3XZ3VPd0IJntcbgex8Y/upSs6QzAacxvZ4nPDqKpycCY7JyMD4Hce51cBnoa0NPbd9dKUQ==;
 24:00BA+zox/5sq8V5g7is3OOLWPbY0KhvGrKVqtvtJHXNNJafJ9DUCgDuAXiNLaQGm2E15pF23H1uj+rYL6juOVLSFK18T3SiKniNMj1UTeas=;
 7:ne0ROmj+j77AFzPQHHEREOxJG2j8c4p99cBEp3A5Tk4kMnZm7L6VW2oXTzggjeNPoJaF387z1NNg/JXD9hPl2LeWZoIpYFgDtLRcy2nT+D70PYFBao4V9CIkrrlzYFI9hcvstkJYgTOGDAVFNNGWdVJRHUpp9VLCbJZKEGYOZ2meNgc+e4MvQhbQF/htOJ5s6mCOJe/jAsCgivcpbX3eWg==;
 20:56gMOBUKWzImjPfgERCTBU02KQhZcu8gbvyp0eqc1F/5nUY6e0+n4wx5cbcVt43pGfZZtvWXSeHc4y3MxCuOCSNYyBRaxUy+f/mXon7fEXmAx914Yol7EN9zX7oFWAZ7Z11rEXRgxO7fembjjTWmLBGtHknAPmx9aEX7b9zL5I4=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR15MB0597;
x-microsoft-antispam-prvs: <CY1PR15MB0597AC15C61A65765EC84658C9560@CY1PR15MB0597.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
 SRVR:CY1PR15MB0597; BCL:0; PCL:0; RULEID:; SRVR:CY1PR15MB0597; 
x-forefront-prvs: 09752BC779
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(7916002)(199003)(189002)(53754006)(229853001)(33656002)(97736004)(10400500002)(81156014)(81166006)(11100500001)(2351001)(92566002)(1730700003)(450100001)(5002640100001)(5004730100002)(586003)(102836003)(122556002)(99286002)(6116002)(110136002)(19617315012)(8676002)(77096005)(189998001)(15975445007)(2900100001)(106116001)(105586002)(2501003)(106356001)(5008740100001)(87936001)(101416001)(19580395003)(68736007)(2906002)(8936002)(86362001)(16236675004)(558084003)(82746002)(3280700002)(83716003)(7906002)(4326007)(50986999)(36756003)(54356999)(3660700001)(3826002)(104396002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR15MB0597;
 H:BY2PR15MB0421.namprd15.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; CAT:NONE; LANG:en; CAT:NONE; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_001A853E89BE47538F302CBB3492AD54fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2016 01:52:53.4603 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR15MB0597
X-OriginatorOrg: fb.com
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-16_01:, , signatures=0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 02:16:34 -0000

--_000_001A853E89BE47538F302CBB3492AD54fbcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

For your reference, this is the 4.1 kernel tree that we have for ast2500.
It's based on the aspeed sdk 3.18 kernel.

https://github.com/mmjconolly/linux/tree/openbmc/helium/4.1

I hope it is of some use :)

- Matthew

--_000_001A853E89BE47538F302CBB3492AD54fbcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <1A0606CB2FCFD44AA6EC60912EBF10DB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-lin=
e-break: after-white-space;" class=3D"">
<div class=3D"">Hi all,</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">For your reference, this is the 4.1 kernel tree that we hav=
e for ast2500.</div>
<div class=3D"">It's based on the aspeed sdk 3.18 kernel.</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D""></div>
<div class=3D""><a href=3D"https://github.com/mmjconolly/linux/tree/openbmc=
/helium/4.1" class=3D"">https://github.com/mmjconolly/linux/tree/openbmc/he=
lium/4.1</a></div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">I hope it is of some use :)</div>
<div class=3D""><br class=3D"">
</div>
<div class=3D"">- Matthew</div>
</body>
</html>

--_000_001A853E89BE47538F302CBB3492AD54fbcom_--
