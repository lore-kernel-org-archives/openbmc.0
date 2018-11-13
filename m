Return-Path: <prvs=48557a82bc=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=48557a82bc=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Vfb7ev5a"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="earvEw4X"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42vhHP6gPnzF3Ks
 for <openbmc@lists.ozlabs.org>; Wed, 14 Nov 2018 08:54:37 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.22/8.16.0.22) with SMTP id wADLsPpT025103;
 Tue, 13 Nov 2018 13:54:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Iva01igzyiB3nB1wOZ3OH1hL2ayZdWI1VK0v2rehpJA=;
 b=Vfb7ev5aguKaOEIkAa/s0lKmRYYURGleotqD/KNBs1Z+gRFRFzV288bFxjblEtAokMPr
 oVWsUaLin3FqN8Tj8eaos9ReL/aYVL1BvTCJ2kxXKycz5dVv1m+44m2QFig1H16EuoaN
 GWToiOTo2jXxOj/KOC50MCgILSBrIK/gaSQ= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2nr4gj0h3w-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Tue, 13 Nov 2018 13:54:33 -0800
Received: from frc-mbx06.TheFacebook.com (2620:10d:c0a1:f82::30) by
 frc-hub03.TheFacebook.com (2620:10d:c021:18::173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 13 Nov 2018 13:54:01 -0800
Received: from frc-hub04.TheFacebook.com (2620:10d:c021:18::174) by
 frc-mbx06.TheFacebook.com (2620:10d:c0a1:f82::30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 13 Nov 2018 13:54:01 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.74) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 13 Nov 2018 13:54:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iva01igzyiB3nB1wOZ3OH1hL2ayZdWI1VK0v2rehpJA=;
 b=earvEw4XfiJB9P+0qSFhA79Hai+94GMo3SdHlXV+Yy6QT2QlqneRwAqi6NbaR98PYkrghqcTJeKt2BA77NMvUCLmy4PtC/iUjRpGLNdM2xKMaU3E8lQZZhCEXDQE2ZdGPB9YxMF9wA/vpKzyZR10FdK1lb48MnF3waSnLglZDU0=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1264.namprd15.prod.outlook.com (10.175.3.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1339.20; Tue, 13 Nov 2018 21:54:00 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f8fb:c0d5:46cd:cf56%2]) with mapi id 15.20.1294.045; Tue, 13 Nov 2018
 21:54:00 +0000
From: Sai Dasari <sdasari@fb.com>
To: Andrew Geissler <geissonator@gmail.com>, Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Infrastructure Workgroup Meeting Time
Thread-Topic: OpenBMC Infrastructure Workgroup Meeting Time
Thread-Index: AQHUerhyhff56KsKn0mKzpYbKF9ayKVNILSAgAEMDQD//450AA==
Date: Tue, 13 Nov 2018 21:53:59 +0000
Message-ID: <F19DABDF-B5E9-42B5-8001-1632DDF1ED8C@fb.com>
References: <0000000000002cf60d057a7c257b@google.com>
 <CACPK8Xc7M0QLB4rp3xf6mWzq-cVKrEFCWm7vhNoORwv3Fzd2Hw@mail.gmail.com>
 <CALLMt=r8i-bugAiHYwdbB+MadLV01FKnr8o3N4g75Y66LMhoLA@mail.gmail.com>
In-Reply-To: <CALLMt=r8i-bugAiHYwdbB+MadLV01FKnr8o3N4g75Y66LMhoLA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:f6df]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1264;
 20:0Byi+7tvO9Y6oFEJwanLIb78ey4V+6//GSLVCxAWUNnk3jj60CQC4RmPDH4NiJYmg8D1qWoS/R+pZf5ZErCG85glxNF1Ze6B8N3kUnfRoS2a4IJ0zXsLB2qootHhU/hLAnKnrGO0fG6X5CwgGVnXsB2cwTsQyG912mWnaLS71Jk=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 0037c3d6-1ac8-4773-9c88-08d649b284ca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390060)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1264; 
x-ms-traffictypediagnostic: MWHPR15MB1264:
x-microsoft-antispam-prvs: <MWHPR15MB12643C8D17122BB69C69053DCEC20@MWHPR15MB1264.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231410)(11241501184)(944501410)(52105112)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1264; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1264; 
x-forefront-prvs: 085551F5A8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(396003)(376002)(136003)(366004)(39860400002)(199004)(189003)(81156014)(446003)(53936002)(86362001)(68736007)(25786009)(2900100001)(8676002)(486006)(71190400001)(71200400001)(7736002)(105586002)(99286004)(11346002)(305945005)(106356001)(8936002)(46003)(76176011)(82746002)(2616005)(83716004)(97736004)(81166006)(6506007)(476003)(6246003)(478600001)(6512007)(102836004)(229853002)(2906002)(6486002)(6116002)(186003)(14454004)(4326008)(256004)(39060400002)(110136005)(316002)(33656002)(5660300001)(6436002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1264;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: FERNBFSSL9aYe3aJHsxD+HeQI2NOePWlYd21C2b0uY5fKlxHUnIuUN1z+ECoSh6VJbirh4pUul1v98dVzQzpVjkTJlPEB0cx+wDVrQ6TxK5brA3FfnvfXi0rRehJRRXxW8sYxF3/98niqfh29f1e02fjuf6IEK8VnpmUaBR63Yb4vaCj3ofBBZbpDPru+8A2qr+pRROkAPgXzMDOmhFJgWPzEuHsqrTwriSYU4bf7vtU9uqjgSFJYCn4KXdJrN9t/uyUxLxE+bfNrncaIEXKsCGS1IexvCaOM5fR3GnGB4PrqjLRUfHnQOswFaNayuevbxsxsc04xw5+BrIei73lii+UHuqSZNdktZLNAdokvDc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFDDBAFD20003043B068FDAD02844437@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0037c3d6-1ac8-4773-9c88-08d649b284ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2018 21:53:59.8349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1264
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-13_15:, , signatures=0
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
X-List-Received-Date: Tue, 13 Nov 2018 21:54:43 -0000

DQoNCu+7v09uIDExLzEzLzE4LCAxMjo0MiBQTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIEFuZHJl
dyBHZWlzc2xlciIgPG9wZW5ibWMtYm91bmNlcytzZGFzYXJpPWZiLmNvbUBsaXN0cy5vemxhYnMu
b3JnIG9uIGJlaGFsZiBvZiBnZWlzc29uYXRvckBnbWFpbC5jb20+IHdyb3RlOg0KICAgID4gPg0K
ICAgID4gPiBUaGUgb3Bwb3NpdGUgd2VlayBvZiB0aGUgdGVzdCB3b3JrZ3JvdXAsIFRodXJzZGF5
LCAxMC0xMWFtIENlbnRyYWwNCiAgICA+ID4gVGhlIG9wcG9zaXRlIHdlZWsgb2YgdGhlIHJlbGVh
c2Ugd29ya2dyb3VwLCBNb25kYXksIDMtNHBtIENlbnRyYWwNCiAgICA+DQogICAgPiBEbyB5b3Ug
bWVhbiBBdXN0cmFsaWFuIENlbnRyYWwgU3RhbmRhcmQgVGltZT8NCiAgICANCiAgICBJIHRoaW5r
IGJhc2VkIG9uIHRoZSBmZWVkYmFjaywgSSdtIGdvaW5nIHRvIHRyeSBmb3IgYSBldmVyeSBvdGhl
ciB3ZWVrDQogICAgb24gV2VkbmVzZGF5LCAzLTRwbSBDZW50cmFsDQoNCklzIHRoaXMgV2VkbmVz
ZGF5IG9yIE1vbmRheSBhcyBwZXIgdGhlIG9yaWdpbmFsIHBvbGw/DQogDQogICAgVGhhbmtzIGZv
ciBhbGwgdGhlIHF1aWNrIHJlc3BvbnNlcyENCiAgICANCiAgICA+DQogICAgPiBDaGVlcnMsDQog
ICAgPg0KICAgID4gSm9lbA0KICAgIA0KDQo=
