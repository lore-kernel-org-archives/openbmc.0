Return-Path: <prvs=48444bab5c=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=48444bab5c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Pwvi7jBt"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="DK6PpDtQ"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mxdd2BxwzF37M
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 09:32:00 +1100 (AEDT)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA2MT82r022587
 for <openbmc@lists.ozlabs.org>; Fri, 2 Nov 2018 15:31:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=uu+our8/K21X/JDkc94H+8qv0Ggkbr2x48brZNYA44E=;
 b=Pwvi7jBtveJlFLqv6qUyRxKNdKzguiw0PktLgyeMmhMDM4SI4Y7XgvTb2HdTQ7ZVeC60
 /CKGH0zyu+Or6AsJr+rmD/lvygisY/D37tUBO2q/OZyp4MNB+WiNuB2okGCl4T7STRdJ
 xBPBuxiZVWcp6PkbPUk3tAhkuA7JK4Wb2E4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2ngvjgrhkh-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 15:31:56 -0700
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 2 Nov 2018 15:31:18 -0700
Received: from PRN-CHUB07.TheFacebook.com (2620:10d:c081:35::16) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Fri, 2 Nov 2018 15:31:18 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.17) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Fri, 2 Nov 2018 15:31:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uu+our8/K21X/JDkc94H+8qv0Ggkbr2x48brZNYA44E=;
 b=DK6PpDtQ2LwXKoYn9uu1zT0pBey5mKU/gzfxnjrqAbEphXHYghdTk9UxqNkm/hvAwK8KuKC3Qn+IpzNTG2kTCCYMzi+j0PMmWyQEvk35B00xVtxbUTYLK21XPQdGsOzG9LNWqiXXqrXytb4pdCgrURJnFFbT9hhgLwgE+F8TvNI=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1525.namprd15.prod.outlook.com (10.172.157.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1273.25; Fri, 2 Nov 2018 22:31:17 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::ec34:3b6a:58ac:e1f2]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::ec34:3b6a:58ac:e1f2%9]) with mapi id 15.20.1273.030; Fri, 2 Nov 2018
 22:31:17 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Code review
Thread-Topic: Code review
Thread-Index: AQHUcvvFWTtQpHYQGEaagVmO3jWvXA==
Date: Fri, 2 Nov 2018 22:31:17 +0000
Message-ID: <4ED837FB-2211-442E-9600-C9F3D496963F@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:2428]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1525;
 20:l6zT5hZfq4LedwAfNNPCSZ3XStrf6a5ryrVtrHIU4iy07xw1Sd/dzRVDGTPtOJApyuB80lvG5txs/gzkS2qJHMoT3/qXulVVfynrlw8MPzsXTgQrDo69+BevvEFOL7kdjxBPFIJgemEv87SCT5AWoxTwi+LXpC9JnwA/QW3nrX0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: acd32dda-1c51-49c4-cda7-08d64112e7cc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1525; 
x-ms-traffictypediagnostic: CY4PR15MB1525:
x-microsoft-antispam-prvs: <CY4PR15MB15253A6827BB0737CB757D18DDCF0@CY4PR15MB1525.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(21748063052155)(28532068793085)(190501279198761)(227612066756510); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231382)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:CY4PR15MB1525; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1525; 
x-forefront-prvs: 08444C7C87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(39860400002)(376002)(136003)(346002)(199004)(189003)(82746002)(99286004)(81156014)(316002)(33656002)(8936002)(81166006)(97736004)(606006)(8676002)(966005)(1730700003)(2616005)(5660300001)(7116003)(25786009)(2906002)(46003)(476003)(83716004)(486006)(2501003)(14454004)(3480700004)(790700001)(68736007)(6116002)(256004)(478600001)(71200400001)(9326002)(71190400001)(558084003)(6306002)(6512007)(54896002)(5640700003)(236005)(6506007)(53936002)(102836004)(6486002)(186003)(6436002)(86362001)(2900100001)(6916009)(221733001)(2351001)(105586002)(106356001)(7736002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1525;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ADbyqkGB6ffxGMBEJi8naq41WWbRP9m21IHxdIlghJBrtaGXFPy5iAtrW0fNFJ2HWLZJF+OBCw1gNRpFkaddj8AakUzrT38WtwNCKqw0sQZKFpt6skaytduWjxPUBxxaDiBw108nDlUmK7tB9x9dgpSmK6JaWNdofnODQgrx/xUS3N1ywgmBe5smyNZCMn2YFEM5QVUJuLn1TuzVb5GxGo/B+Iq45N00Qsima/4E7YcbHbZ6iKZvBcKA84hq7MmyLM+ST2HEHIx+2RjoWWTPCENT/eTRd5fEG86HMph3Fw8u1HZtM5iO2cYwtkozOKZlCeyiPYCVe8ftziTABisWVbCW63KzC6N+2o3OUUfGA4E=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_4ED837FB2211442E9600C9F3D496963Ffbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: acd32dda-1c51-49c4-cda7-08d64112e7cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2018 22:31:17.2068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1525
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-02_13:, , signatures=0
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
X-List-Received-Date: Fri, 02 Nov 2018 22:32:06 -0000

--_000_4ED837FB2211442E9600C9F3D496963Ffbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpJIGhhdmUgYSBwYXRjaCBiZWxvdyBmb3IgcmV2aWV3IGFuZCB3YXMgd29uZGVyaW5nIHdo
b20gc2hvdWxkIEkgYWRkIGZvciByZXZpZXcuDQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2pl
Y3QueHl6LyMvYy9vcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNlcy8rLzE1MDI5Lw0KDQpS
ZWdhcmRzDQotVmlqYXkNCg==

--_000_4ED837FB2211442E9600C9F3D496963Ffbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8B7C4587B9CA094FBDACC713D7419A0F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWlj
cm9zb2Z0LmNvbS9vZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcv
VFIvUkVDLWh0bWw0MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIg
Y29udGVudD0idGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRv
ciIgY29udGVudD0iTWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkRlbmdYaWFuOw0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAx
IDE7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUg
NSAyIDIgMiA0IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IlxARGVuZ1hpYW4i
Ow0KCXBhbm9zZS0xOjIgMSA2IDAgMyAxIDEgMSAxIDE7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMg
Ki8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBp
bjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZh
bWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJ
e21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlv
bjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFuLk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21z
by1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojOTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1
bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwt
Y29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5k
b3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0K
CXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0K
ZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1b
aWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1h
eD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0K
PG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9
IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9k
eSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFz
cz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBoYXZlIGEgcGF0Y2ggYmVsb3cg
Zm9yIHJldmlldyBhbmQgd2FzIHdvbmRlcmluZyB3aG9tIHNob3VsZCBJIGFkZCBmb3IgcmV2aWV3
LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij48YSBocmVmPSJodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2pl
Y3QueHl6LyMvYy9vcGVuYm1jL3Bob3NwaG9yLWRidXMtaW50ZXJmYWNlcy8mIzQzOy8xNTAyOS8i
Pmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMvcGhvc3Bob3It
ZGJ1cy1pbnRlcmZhY2VzLyYjNDM7LzE1MDI5LzwvYT48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4m
bmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9
ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5PG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4ED837FB2211442E9600C9F3D496963Ffbcom_--
