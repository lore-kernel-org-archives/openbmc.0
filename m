Return-Path: <prvs=8983677cc9=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=8983677cc9=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="m9mcQTSw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="g53b9yLz"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QHCK2KBxzDqDx
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 06:38:36 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2LJX9pX018199
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 12:38:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=Z+LNsjahtZT9BCi9G3oT81pfQziikdSd/MpozW6OWXo=;
 b=m9mcQTSwNk6atxsB4K4cAQFrHedIXksiFwZvtuOFikAlkYtX+W/nhnbaStgsmqlBJgJh
 XJqUbxVoMJ5IgDkdr2kCG7S3M1Exk5Nm9yIy0oeuP7BHifeLT3JpSz2oRFaVKJFSF6vI
 An7679TQPv5qQwzLsdVJZ2FtK/fQfO34GbY= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rcgm9g2f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 12:38:34 -0700
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 21 Mar 2019 12:38:33 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 21 Mar 2019 12:38:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+LNsjahtZT9BCi9G3oT81pfQziikdSd/MpozW6OWXo=;
 b=g53b9yLzGCNxTB6IrTj2Oxg0hSWBkOun5w7nBvXnUxymLnwsDX4LfKDT9TqhgI54wliz5CBE2qE/AKelsEAe4NR2janNTt0C2cCpglTPJFKNc8uIhoSP1zCA6V6PBsVtgVuXPBnjvh7sPgPVGN67PcGCKQX3bEwQW6SmxjfUP98=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1846.namprd15.prod.outlook.com (10.174.54.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Thu, 21 Mar 2019 19:38:32 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1709.015; Thu, 21 Mar 2019
 19:38:32 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: IPMID crashing
Thread-Topic: IPMID crashing
Thread-Index: AQHU4B2q5jrvB+ZVe0We4JZKaBbl6w==
Date: Thu, 21 Mar 2019 19:38:32 +0000
Message-ID: <581CE770-69F0-404F-9D87-8378753457C6@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:2139]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34285e0b-c2a3-44aa-6341-08d6ae34cd6d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1846; 
x-ms-traffictypediagnostic: CY4PR15MB1846:
x-microsoft-antispam-prvs: <CY4PR15MB184650499C0921822017F5E2DD420@CY4PR15MB1846.namprd15.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(136003)(366004)(346002)(396003)(376002)(199004)(189003)(6436002)(86362001)(46003)(81166006)(81156014)(7736002)(14454004)(478600001)(8936002)(221733001)(33656002)(53936002)(3480700005)(6916009)(83716004)(5660300002)(54896002)(6306002)(6512007)(8676002)(68736007)(71200400001)(7116003)(71190400001)(316002)(186003)(6116002)(36756003)(6506007)(97736004)(106356001)(256004)(476003)(2616005)(486006)(105586002)(102836004)(99286004)(82746002)(2906002)(6486002)(558084003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1846;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FacoOiUDqiU3HGe5QxvImEC+S2OwJT3qBZv6gRE/RD95Z/9Dc2NN3yTQ8PAl1L/a4ijj+emfZlGJK7OKCeXAqSreT+qaKREmUu5yJzDmmkycilWH2KTiTIsQ2Kc6Cl2afkLPFI5gJNXJeVKN/C5LgWkMX+gTZ9Db0G/YlsNIFMj2R7oikpHGPCv9bYlxaazMkzJQXSjIvNYEiALuy2/VIJT412Bj3bYi2db8QgbqEhtKDWDLDzpoC625UlE7w+W7zGMECCIWWOv4PgDm4w2xjjtovMRPNoFhP3/X8GrH6wh92EY3mE0V3AIemU5GL58mriSNXNBizGtjSFw5VMLCwdQg4A4+DbLUG3q131HMeTSOQqBDC419pE+tpLH83m3CK5mhoVz7dU/76ZddBIWAhdafnDE+qGcSNw2twh94jX4=
Content-Type: multipart/alternative;
 boundary="_000_581CE77069F0404F9D878378753457C6fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 34285e0b-c2a3-44aa-6341-08d6ae34cd6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 19:38:32.7084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1846
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-21_08:, , signatures=0
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
X-List-Received-Date: Thu, 21 Mar 2019 19:38:38 -0000

--_000_581CE77069F0404F9D878378753457C6fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QW55b25lIGlzIHNlZWluZyBpcG1pZCBjcmFzaGluZy4gSSBoYXZlIGNoZWNrZWRvdXQgb3BlbmJt
YyB0b2RheSBhbmQgc2VlaW5nIGlwbWlkIGlzIGNyYXNoaW5nIHdpdGggZm9sbG93aW5nIG1lc3Nh
Z2UNCg0KcmVhbGxvYygpOiBpbnZhbGlkIG5leHQgc2l6ZQ0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_581CE77069F0404F9D878378753457C6fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <FA9475F2FE41CD4EB48C06F95C5B7348@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5Ok1lbmxvOw0K
CXBhbm9zZS0xOjIgMTEgNiA5IDMgOCA0IDIgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICov
DQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47
DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXtt
c28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6IzA1NjNDMTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Izk1NEY3MjsNCgl0ZXh0LWRlY29yYXRpb246dW5k
ZXJsaW5lO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLWNv
bXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93
dGV4dDt9DQpwLnAxLCBsaS5wMSwgZGl2LnAxDQoJe21zby1zdHlsZS1uYW1lOnAxOw0KCW1hcmdp
bjowaW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWJhY2tncm91bmQ6d2hpdGU7DQoJZm9u
dC1zaXplOjguNXB0Ow0KCWZvbnQtZmFtaWx5Ok1lbmxvOw0KCWNvbG9yOmJsYWNrO30NCnNwYW4u
czENCgl7bXNvLXN0eWxlLW5hbWU6czE7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5
cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBh
Z2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBp
biAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30N
Ci0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5BbnlvbmUgaXMgc2VlaW5n
IGlwbWlkIGNyYXNoaW5nLiBJIGhhdmUgY2hlY2tlZG91dCBvcGVuYm1jIHRvZGF5IGFuZCBzZWVp
bmcgaXBtaWQgaXMgY3Jhc2hpbmcgd2l0aCBmb2xsb3dpbmcgbWVzc2FnZTxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gY2xhc3M9InMxIj5yZWFsbG9jKCk6IGludmFs
aWQgbmV4dCBzaXplPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5S
ZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_581CE77069F0404F9D878378753457C6fbcom_--
