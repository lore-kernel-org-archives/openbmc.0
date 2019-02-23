Return-Path: <prvs=795778ddec=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=795778ddec=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="nhPrYGC0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="d+wPnCln"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445pRS54LrzDq8B
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 11:06:55 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x1MNqocj013275
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 16:06:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=tMBF2tgWzrWHK6bwrxhIqayqYZNXxvpTMxZ1I9btGeg=;
 b=nhPrYGC0VgutXBHQszEAJDuwT6fuNTnVnHuGR/oGuQ9rpOQ+cyELgjtwh0qreeOqqfFJ
 H6gSn74A6ewwNRbyYijX7PCPTuDEtik/WK+j2alazh17ERQyd+GHfXJNn23P2jwvgzIH
 ZRVxKsSU6OiZInLFXCioV/T2JzYlpWbKCRc= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2qtpuhgugx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 16:06:47 -0800
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 22 Feb 2019 16:06:45 -0800
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 22 Feb 2019 16:06:45 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 22 Feb 2019 16:06:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMBF2tgWzrWHK6bwrxhIqayqYZNXxvpTMxZ1I9btGeg=;
 b=d+wPnClnDv34xYO5o33+4IXlVZPTuKaozkSDMBKioL7mWf/FGx5BIx9ERHqwhopUKWARcceaXRQYjijHT+rryI2K5PX15BSKEt/cefqKRld5DULjYSSDCpUveI4TdTWntj/UlC64wpDvm6Kg5GDh2Q2Rb2XkBpItbFaDCeBg79c=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1829.namprd15.prod.outlook.com (10.172.76.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.15; Sat, 23 Feb 2019 00:06:44 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c47c:32d3:4b03:adea]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::c47c:32d3:4b03:adea%3]) with mapi id 15.20.1643.018; Sat, 23 Feb 2019
 00:06:44 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Max IPMI buffer size
Thread-Topic: Max IPMI buffer size
Thread-Index: AQHUywupCNIn1P6nokCPZmCoJAC6dA==
Date: Sat, 23 Feb 2019 00:06:44 +0000
Message-ID: <E7B0409E-1C26-4A80-98CC-73987DCD0C6A@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:af0d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7804e771-6740-490d-ca5d-08d69922cbc4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1829; 
x-ms-traffictypediagnostic: CY4PR15MB1829:
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1829;
 20:g9FWFXMaJ+lDPK3sexV6pGLR4ihS1RnmCCbPzy6wgUYgcFbNBW9LVbjhs1w2DIluF/PrPmPZoZd9y6UcHeDycIBdPT2R/Md2OxS/g9AUZclsDt7JdxtDWzBSbBKpHIMK7yvy1S68x4nAhZkCXaFZ4qrC2l5cxrPUx5hugCBJVWY=
x-microsoft-antispam-prvs: <CY4PR15MB18291ECB677724C575C93385DD780@CY4PR15MB1829.namprd15.prod.outlook.com>
x-forefront-prvs: 0957AD37A0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(376002)(39860400002)(136003)(346002)(189003)(199004)(2351001)(86362001)(2616005)(476003)(105586002)(36756003)(558084003)(486006)(3480700005)(71200400001)(71190400001)(6116002)(68736007)(106356001)(83716004)(46003)(256004)(33656002)(6916009)(14454004)(8676002)(5660300002)(1730700003)(5640700003)(6486002)(82746002)(97736004)(7736002)(25786009)(6506007)(186003)(2501003)(99286004)(81166006)(81156014)(6306002)(53936002)(8936002)(316002)(6512007)(478600001)(54896002)(102836004)(6436002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1829;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5s6P+zMSYpUd9BrxKQ5hsUu8TWjzrK7IJL4d7bd6nBRWUT4uQ0V+tGoYW7NIFg6jZmsk8G+uUvY56f88s+HjEcDFwRy9wgKAKpL6qfFQLQN/72WXK/oVzWYWi1o+0Coht7DzucdnApXOmiL4X8G6Ck0+bKBBEnZ7XafJ33znSP2DvXqJtFr3YiQsT4U6ZyXsQtqLJsPSoKsDJd3iMtSPwS3Ey/Gzt3KyWozpNMBS54YRgwiozjdAFjAYdvcC7ijR5bfPLRafC1l7npeKfMJoA7F3QWX73oFHQd91zCOojZpADF57jn8GAEYRl5YHVmxvgUyPBuf9OfghrVDxUmVfEC7B+lR47i5u+NauoKlk6s9AtceKg/YxFs0Ry78mJdkPPmzKB5lsSWN3i9orkpF+WyQUPnS0Z8mg3auPQqsGWWk=
Content-Type: multipart/alternative;
 boundary="_000_E7B0409E1C264A8098CC73987DCD0C6Afbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7804e771-6740-490d-ca5d-08d69922cbc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2019 00:06:44.3861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1829
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-22_15:, , signatures=0
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
X-List-Received-Date: Sat, 23 Feb 2019 00:07:01 -0000

--_000_E7B0409E1C264A8098CC73987DCD0C6Afbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCg0KSSBzZWUgZGVmaW5pdGlvbiBvZiBNQVhfSVBNSV9CVUZGRVIgaXMgNjQgaW4gcGhv
c3Bob3ItaXBtaS1ob3N0L2lwbWlkLmhwcC4gQW5kIHRoZXJlIGlzIGEgY29tbWVudCB0aGF0IEJU
IEZJRk8gaW4gQVNUMjQwMCBjYW4gaGFuZGxlIG9ubHkgNjQgYnl0ZXMuIFdlIGFyZSB1c2luZyBB
U1QyNTAwIGFuZCBmb3Igb3VyIElQTUIgT0VNIGNvbW1hbmQsIHdlIG5lZWQgYnVmZmVyIG1heCBz
aXplIHRvIGJlIDI1Ni4gUGxlYXNlIHN1Z2dlc3QgaG93IHRvIGFib3V0IGNoYW5nZXMuDQoNClJl
Z2FyZHMNCi1WaWpheQ0K

--_000_E7B0409E1C264A8098CC73987DCD0C6Afbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <ADE5F5146B534245B5A0BB8C47D88FDC@namprd15.prod.outlook.com>
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
cGU6ZXhwb3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGlu
Ow0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJ
e3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJF
Ti1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNl
Y3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij5UZWFtLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJwMSI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkkgc2VlIGRlZmluaXRpb24gb2YgTUFYX0lQTUlfQlVGRkVS
IGlzIDY0IGluDQo8L3NwYW4+PHNwYW4gY2xhc3M9InMxIj5waG9zcGhvci1pcG1pLWhvc3QvaXBt
aWQuaHBwPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij4uIEFuZCB0aGVyZSBp
cyBhIGNvbW1lbnQgdGhhdCBCVCBGSUZPIGluIEFTVDI0MDAgY2FuIGhhbmRsZSBvbmx5IDY0IGJ5
dGVzLiBXZSBhcmUgdXNpbmcgQVNUMjUwMCBhbmQgZm9yIG91ciBJUE1CIE9FTSBjb21tYW5kLCB3
ZSBuZWVkIGJ1ZmZlciBtYXggc2l6ZSB0byBiZSAyNTYuIFBsZWFzZQ0KIHN1Z2dlc3QgaG93IHRv
IGFib3V0IGNoYW5nZXMuPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_E7B0409E1C264A8098CC73987DCD0C6Afbcom_--
