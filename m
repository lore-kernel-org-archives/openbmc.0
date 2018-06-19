Return-Path: <prvs=97089db6e8=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=97089db6e8=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lqw2546J"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="AKReuBa4"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 419F1j08JWzF0fX
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 03:14:12 +1000 (AEST)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5JH9kxM023429; Tue, 19 Jun 2018 10:14:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=gQKs/OPUy30Bv31gSsj5VOCruFLASVK3O+nlAoQQBlQ=;
 b=lqw2546JY173lAtAjmmgD0KO1XBCe6JQhQlXX3ZLhBYVWtk9LvVW+0ZBS25AF8CNHYvD
 i7upujcqVRq6wtI0Bh9nFDqqMEGvF4cVKF8u6trYzEdtxFK42/6oI7Dq9wLNew2d5i6b
 u2Rb9JPR72ZFTinm9orh7zrUaVjV6KTc0dU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2jq2re8qpg-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 19 Jun 2018 10:14:07 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.31) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Tue, 19 Jun 2018 13:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQKs/OPUy30Bv31gSsj5VOCruFLASVK3O+nlAoQQBlQ=;
 b=AKReuBa4LA31IVAx/Kl+NvVVyJd4ulq24Na4qiq07sVXOSufmT2RjCfy7bRFFDY664gbGcsTslYYMDMguRSnqbUqvGzFKf5k0IwB+4qyTUMF+X8FQemiLASGCzkf3FazvNvWuxNRPew762JOIyyTBtuohIhBzzp/VGrnIWCJJOg=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1293.namprd15.prod.outlook.com (10.175.3.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.863.17; Tue, 19 Jun 2018 17:14:03 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ed33:380d:2f64:d615]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ed33:380d:2f64:d615%3]) with mapi id 15.20.0863.016; Tue, 19 Jun 2018
 17:14:03 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: 4.17 kernel published
Thread-Topic: 4.17 kernel published
Thread-Index: AQHUB4m8vXgAYG7PB0iUenavfRUJ+aRnXWoA
Date: Tue, 19 Jun 2018 17:14:03 +0000
Message-ID: <E094D088-26F3-4D65-BD91-2AE5665E7E8F@fb.com>
References: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:2199]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1293;
 7:kd/wvUNCMk+0ThgL2Bi66F+96zHXp5kBKztvvkqsCFGvX9dxzFISYKZWLEsz9kqCxY2R2zi03Ssb7KHf4ZZWAdDMg3ZjMozAxI/knOy4Dh3yNjnMn2673PTkO0pOPOsx3wAWjPuAKiViDIOu7qzrkggJ78PVZ9C5KPkD3itaK0wEPMtBNyjIEpeTXj2LXylurN1gXS85Tb3XvivlyYErzbDYLNG8y9xm83aNioOF9xXdwnnbbQAHA5Pmh8oLSeOh;
 20:E1kT0UHPu+TRKOcN3TCmytJWPSk/D1RyXHr9qf8QVCq7ANef9NnTOda9fASgbavRR24ebEVhxwpMbTL78TBD1evaqWJ4juXMkk2TpY6idlsEsOJBzjdlMEKWKiLgNRja/tS6KybkIcVcb8JhRpkicPJnv6YRAQHNMJkjpLMZ4Vw=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 69aeee4d-2b09-4d86-17a3-08d5d6080e9c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1293; 
x-ms-traffictypediagnostic: MWHPR15MB1293:
x-microsoft-antispam-prvs: <MWHPR15MB1293F8F2F8E7167D39895C83B2700@MWHPR15MB1293.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(65623756079841);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231254)(11241501184)(944501410)(52105095)(93006095)(93001095)(149027)(150027)(6041310)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1293; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1293; 
x-forefront-prvs: 07083FF734
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39380400002)(396003)(346002)(376002)(366004)(39860400002)(199004)(189003)(3280700002)(8676002)(36756003)(25786009)(81166006)(2906002)(6116002)(6506007)(6916009)(81156014)(76176011)(345774005)(102836004)(478600001)(3660700001)(86362001)(46003)(4326008)(68736007)(83716003)(186003)(5660300001)(59450400001)(6246003)(7116003)(8936002)(2900100001)(486006)(316002)(82746002)(99286004)(53936002)(446003)(11346002)(6486002)(14454004)(6436002)(5250100002)(106356001)(7736002)(305945005)(229853002)(6512007)(105586002)(97736004)(2616005)(476003)(33656002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1293;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: J8+4Lejva8dDRIoDelSkXY4Npi769F9ezksrjSV2wR6tAyffJCWdKsDwd8Z3M1MKC0MM7XuTyz39FbOZEIL8JoFDX+KvgupvqVfSa5JSSDA6lQDnPMtaG2NPYHjBUxtbZEF2LuDdQJ3tSkc75+p0NIuMuNk9HCF8PcHbjpemqLBDqm0ITFT+jg/Mpi65pZDKdrL3D94bjMQqg553BaGCGYUFABB/cBNIzDtmGfWhw+m0TA7POV8CI3a+eAsiJuzPZQ+2jfbZXkLdKuo+/a0emqEDX1oqwup0UH1Cf/guxCJ/2Xe3bRYZLe/kLxXxdEbhDxWxJIofKvH3lJ4H/hSLpg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <D462B18BC8D901418AB7DEBE8B790C4D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 69aeee4d-2b09-4d86-17a3-08d5d6080e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2018 17:14:03.4965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1293
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-19_09:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 17:14:19 -0000

R3JlYXQuIFRoYW5rIHlvdSBmb3IgdGhlIG5vdGljZSENCg0KDQpDaGVlcnMsDQoNClRhbw0KDQrv
u79PbiA2LzE4LzE4LCA5OjU1IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgSm9lbCBTdGFubGV5
IiA8b3BlbmJtYy1ib3VuY2VzK3Rhb3Jlbj1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBiZWhh
bGYgb2Ygam9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KDQogICAgVGhlIDQuMTcgYmFzZWQga2VybmVs
IGhhcyBiZWVuIHB1c2hlZCB0byB0aGUgb3BlbmJtYyBMaW51eCByZXBvc2l0b3J5Lg0KICAgIEZy
b20gZ2Vycml0Og0KICAgIA0KICAgICAgICBrZXJuZWw6IE1vdmUgdG8gNC4xNw0KICAgIA0KICAg
ICAgICBUaGlzIGJyaW5ncyB0aGUgZGV2LTQuMTMgZGV2ZWxvcG1lbnQgY3ljbGUgdG8gYSBjbG9z
ZS4gQnkgdGhlIGVuZCBvZiB0aGUNCiAgICAgICAgY3ljbGUgdGhlIDQuMTMgdHJlZSBjb250YWlu
ZWQgMjM2IHBhdGNoZXMuDQogICAgDQogICAgICAgIFRoaXMgbW92ZXMgYWxsIG9mIHRoZSA0LjEz
IGJhc2VkIGZ1bmN0aW9uYWxpdHkgb24gdG9wIG9mIGEgNC4xNyBiYXNlLiBXZQ0KICAgICAgICBj
dXJyZW50bHkgaGF2ZSA5NyBwYXRjaGVzIGluIHRoZSB0cmVlLiBUaGUgcmVkdWN0aW9uIG9mIDEz
OSBpcyBtb3N0bHkNCiAgICAgICAgZHVlIHRvIGNvZGUgbGFuZGluZyBpbiBMaW51cycgdHJlZSwg
d2l0aCBhIGhhbmRmdWwgb2YgZml4ZXMgYmVpbmcgbWVyZ2VkDQogICAgICAgIGludG8gdGhlIGJh
c2UgcGF0Y2guDQogICAgDQogICAgICAgIFRoZSBjb25maWd1cmF0aW9uIGlzIHVwZGF0ZWQgd2l0
aCBuZXdseSBsYW5kZWQgZHJpdmVycy4gSW4gYWRkaXRpb24gbmV3DQogICAgICAgIHVwc3RyZWFt
IHNlY3VyaXR5IGZlYXR1cmVzIGFyZSBlbmFibGVkLCBhbmQgbGVnYWN5IEFUQUcgRFRCIHN1cHBv
cnQgYW5kDQogICAgICAgIC9kZXYvbWVtIGFyZSByZW1vdmVkLg0KICAgIA0KICAgIFBsZWFzZSBh
ZGRyZXNzIGZ1dHVyZSBwYXRjaGVzIHRvIHRoZSBkZXYtNC4xNyBicmFuY2guDQogICAgDQogICAg
Q2hlZXJzLA0KICAgIA0KICAgIEpvZWwNCiAgICANCg0K
