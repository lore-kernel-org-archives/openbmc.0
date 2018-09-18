Return-Path: <prvs=2799d38cdb=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=2799d38cdb=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="bfL4pia6"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NbYfUtAf"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FGDv3Rd1zDqjx
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 07:23:10 +1000 (AEST)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8ILJKVG031004; Tue, 18 Sep 2018 14:23:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=XC1ix/gg50VQeO8k0BeR1bfOxyUASJZ65p7NMvKAh7g=;
 b=bfL4pia6T37LKwe2xAZi2v7faClz+zt4aXyr08SGeYrrUKAYXvjXs7FYnsuJF3PLwnKK
 6xBZvbI9udO1/4Ri1sCki++RD/bvIBW1msK7gxo5nRJorEm2ofhCn0LGuNKBNI6rwxh1
 Uv40MFEqCpQ9PcdTGwEPqy39N9ph0hx6hjw= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mk6898ms3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 18 Sep 2018 14:23:08 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.30) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Tue, 18 Sep 2018 17:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC1ix/gg50VQeO8k0BeR1bfOxyUASJZ65p7NMvKAh7g=;
 b=NbYfUtAfxQ5Ps5TwcHrp6QEO+V9dc+lxs42ljIVkCLr7sqLJzQzxJwXWBOlXuUYZwDziQCt9OiTq+tw3l/Twd8zKRdQk7yR1xqqvTDNh/qVpeqq9X1isSw/I6VRJkbsZZJGe378Olj4QgrN6rFwTm4ZdFPjEVZE0K+gYHR7+nEE=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1949.namprd15.prod.outlook.com (10.175.8.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.17; Tue, 18 Sep 2018 21:23:06 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6%7]) with mapi id 15.20.1143.017; Tue, 18 Sep 2018
 21:23:06 +0000
From: Sai Dasari <sdasari@fb.com>
To: Joseph Reynolds <jrey@us.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Hackathon @ OpenPower Summit
Thread-Topic: OpenBMC Hackathon @ OpenPower Summit
Thread-Index: AQHUT5XK2u8Y4iKGYkuWNWDk2gTO/w==
Date: Tue, 18 Sep 2018 21:23:06 +0000
Message-ID: <F14EC3A3-3D10-481C-965F-86006FA6AD6D@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:bc75]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1949;
 20:zVHT/Vyf3E5vkW8B93O2hrwg7maHPjdrMGYUuIz2Cdy378EfcbkTxDnsfgKcOeG6El1tDiGh+DJjceLle0jnlSsC9pJ/jNrtNx9OzEa7aSjlmljr8Fc/gwkVwVRhBacv4h9NQr4M3g23z3UsOkCuzUSh+YODTi32fTK3VBh94M0=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: edc699d3-bac6-41be-84e6-08d61dacecdd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1949; 
x-ms-traffictypediagnostic: MWHPR15MB1949:
x-microsoft-antispam-prvs: <MWHPR15MB1949D38F70ACAEF1C33A8734CE1D0@MWHPR15MB1949.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(166708455590820)(21748063052155)(163750095850); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(11241501184)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699050);
 SRVR:MWHPR15MB1949; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1949; 
x-forefront-prvs: 0799B1B2D7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39860400002)(376002)(346002)(136003)(199004)(189003)(2906002)(81156014)(81166006)(86362001)(6436002)(316002)(25786009)(7736002)(54896002)(36756003)(6306002)(33656002)(6512007)(105586002)(476003)(106356001)(478600001)(2616005)(6486002)(229853002)(2501003)(5250100002)(46003)(8936002)(110136005)(486006)(68736007)(186003)(97736004)(256004)(14444005)(83716003)(102836004)(8676002)(5660300001)(6506007)(6246003)(53936002)(6116002)(14454004)(99286004)(2900100001)(82746002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1949;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: c/CzPH5adkV0j17O2JcI5k7OUqz0t8+0kL4jZBfL1T/mV+16jvo85VKTIkKlQyefHAuJaMtHSpNPDiPas9LgV+oR42jEUfuzzjOhRberm17OZGqiCpd81jY0Isp4kaNVGnRKLVclfhs8BA2Sjy6RFaAP5JuxeZmGMWDv1e/Z2p9Kyknerd6E4E6FMdutQ1Ag05H6JR/PrpdyY9krW3AeikTbQNVCpV13gyJw2iYHiAMJBTDJ0Y4jo0xZN3enuczXvj5XPWaL41/HqnIXu7I46xhULYgbMaqWBB1OUWrFbMTVKaf8ucM1HMHQjpW29yqj1hb7m+RHtEBVsJp2HnoYPnN3TRTa9jpRZIIzV/bM9bw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_F14EC3A33D10481C965F86006FA6AD6Dfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: edc699d3-bac6-41be-84e6-08d61dacecdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2018 21:23:06.3843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1949
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-09-18_08:, , signatures=0
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
X-List-Received-Date: Tue, 18 Sep 2018 21:23:12 -0000

--_000_F14EC3A33D10481C965F86006FA6AD6Dfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Pj4tIENhbiBzb21lIHRoZSBwcmVzZW50YXRpb25zIG9yIHNlc3Npb25zIGJlIHdyaXR0ZW4gdXAg
YW5kIGFkZGVkIHRvIHRoZSBvcGVuYm1jL2RvY3MgcmVwbz8gIEl0IGlzIHNvbWV0aW1lcyBoYXJk
IHRvIGZpbmQgcHJlc2VudGF0aW9ucyBhZnRlciB0aGV5IGFyZSBkb25lLiAgSXQgaXMgYWxzbyBt
dWNoIGVhc2llciB0byBrZWVwIGRldGFpbHMgdXAgdG8gZGF0ZSB3aGVuIHRoZXkgYXJlIGluIGEg
cGxhaW4gdGV4dCBmb3JtYXQgKGNvbXBhcmVkIHRvIHBvd2VycG9pbnQpLg0KDQpHcmVhdCBpZGVh
ISBNb3N0IG9mIHRoZSBwcmVzZW50YXRpb25zIHdlIGRvIGFyZSBpbiBwb3dlcnBvaW50IChvciBj
b252ZXJ0ZWQgdG8gcGRmIGZvciBkaXN0cmlidXRpb24pLiBJcyB0aGVyZSBhIHN0YW5kYXJkIHBy
YWN0aWNlIG9uIGhvdyB0byBzaGFyZSB0aGVzZSBpbiBvcGVuYm1jL2RvY3MgcmVwbz8gaS5lIG9w
ZW4gYSBnZXJyaXQgcmVxdWVzdCBmb3IgcmV2aWV3IGFuZCBhZGQ/IFdlIGhhdmUgZmV3IHByZXNl
bnRhdGlvbnMgZnJvbSBsYXN0IE9DUCBzdW1taXQgKE1hcmNo4oCZMTgpIGFuZCBhbm90aGVyIG9u
ZSB1cGNvbWluZyBPQ1Agc3VtbWl0IGluIE9jdOKAmTE4Lg0KDQo+Pi0gQXMgYSB0aG91Z2h0IGV4
cGVyaW1lbnQsIGhvdyBtdWNoIG9mIHlvdXIgcHJlc2VudGF0aW9ucyBjYW4geW91IGdpdmUgYnkg
c2ltcGx5IHJlZmVycmluZyB0byBleGlzdGluZyBPcGVuQk1DIGRvY3VtZW50YXRpb24sIHN1Y2gg
YXMgaXMgaW4gdGhlIHJlcG9zIHVuZGVyIGdpdGh1Yi5jb20vb3BlbmJtYz8gIElmIHlvdSBuZWVk
IHRvIGV4cGxhaW4gbW9yZSwgY2FuIHRoYXQgaW5mb3JtYXRpb24gYmUgYWRkZWQgdG8gdGhlIE9w
ZW5CTUMgZG9jcz8NClNvbWUgb2YgdGhlIHByZXNlbnRhdGlvbiBtYXRlcmlhbCBpcyBlc3NlbnRp
YWwgYmFja2dyb3VuZC9jb250ZXh0IG9uIEJNQ+KAmXMgdXNlIGNhc2VzLiBCZXNpZGVzIHRoYXQg
dGhlIGNvbnRlbnQgc2hvdWxkIHJlZmxlY3QgdGhlIG9wZW5ibWMgY29tbXVuaXR5IHdvcmsgaS5l
LiBleGlzdGluZyBkZXNpZ24vaW1wbGVtZW50YXRpb24sICBkZXNjcmliaW5nIHdvcmtncm91cCwg
ZmVhdHVyZXMgcGxhbm5lZCBmb3IgbmV4dCByZWxlYXNlLCBmZWF0dXJlcyBwZW5kaW5nIGV0Yy4N
Cg0KDQoNCg0KDQo=

--_000_F14EC3A33D10481C965F86006FA6AD6Dfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <B4CDA19273692B409218DE2DE9D6D782@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOmJsdWU7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQph
OnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9yaXR5
Ojk5Ow0KCWNvbG9yOnB1cnBsZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5lO30NCnAubXNv
bm9ybWFsMCwgbGkubXNvbm9ybWFsMCwgZGl2Lm1zb25vcm1hbDANCgl7bXNvLXN0eWxlLW5hbWU6
bXNvbm9ybWFsOw0KCW1zby1tYXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47
DQoJbXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQt
c2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5F
bWFpbFN0eWxlMTgNCgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtcmVwbHk7DQoJZm9udC1mYW1p
bHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2luZG93dGV4dDt9DQouTXNvQ2hwRGVm
YXVsdA0KCXttc28tc3R5bGUtdHlwZTpleHBvcnQtb25seTsNCglmb250LXNpemU6MTAuMHB0O30N
CkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4g
MS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9ImJsdWUi
IHZsaW5rPSJwdXJwbGUiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0O2ZvbnQtZmFtaWx5OiZxdW90
O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYiPiZndDsmZ3Q7LSBDYW4gc29tZSB0aGUgcHJlc2VudGF0
aW9ucyBvciBzZXNzaW9ucyBiZSB3cml0dGVuIHVwIGFuZCBhZGRlZCB0byB0aGUgb3BlbmJtYy9k
b2NzIHJlcG8/Jm5ic3A7IEl0IGlzIHNvbWV0aW1lcyBoYXJkIHRvIGZpbmQgcHJlc2VudGF0aW9u
cyBhZnRlciB0aGV5IGFyZSBkb25lLiZuYnNwOyBJdCBpcyBhbHNvIG11Y2gNCiBlYXNpZXIgdG8g
a2VlcCBkZXRhaWxzIHVwIHRvIGRhdGUgd2hlbiB0aGV5IGFyZSBpbiBhIHBsYWluIHRleHQgZm9y
bWF0IChjb21wYXJlZCB0byBwb3dlcnBvaW50KS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkdyZWF0IGlkZWEhIE1vc3Qgb2YgdGhlIHByZXNlbnRhdGlvbnMgd2UgZG8gYXJlIGluIHBv
d2VycG9pbnQgKG9yIGNvbnZlcnRlZCB0byBwZGYgZm9yIGRpc3RyaWJ1dGlvbikuIElzIHRoZXJl
IGEgc3RhbmRhcmQgcHJhY3RpY2Ugb24gaG93IHRvIHNoYXJlIHRoZXNlIGluIG9wZW5ibWMvZG9j
cyByZXBvPyBpLmUgb3BlbiBhIGdlcnJpdCByZXF1ZXN0IGZvciByZXZpZXcgYW5kIGFkZD8gV2Ug
aGF2ZSBmZXcgcHJlc2VudGF0aW9ucw0KIGZyb20gbGFzdCBPQ1Agc3VtbWl0IChNYXJjaOKAmTE4
KSBhbmQgYW5vdGhlciBvbmUgdXBjb21pbmcgT0NQIHN1bW1pdCBpbiBPY3TigJkxOC4gPG86cD4N
CjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTAuNXB0
O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7LHNhbnMtc2VyaWYiPiZndDsmZ3Q7LSBBcyBh
IHRob3VnaHQgZXhwZXJpbWVudCwgaG93IG11Y2ggb2YgeW91ciBwcmVzZW50YXRpb25zIGNhbiB5
b3UgZ2l2ZSBieSBzaW1wbHkgcmVmZXJyaW5nIHRvIGV4aXN0aW5nIE9wZW5CTUMgZG9jdW1lbnRh
dGlvbiwgc3VjaCBhcyBpcyBpbiB0aGUgcmVwb3MgdW5kZXIgZ2l0aHViLmNvbS9vcGVuYm1jPyZu
YnNwOw0KIElmIHlvdSBuZWVkIHRvIGV4cGxhaW4gbW9yZSwgY2FuIHRoYXQgaW5mb3JtYXRpb24g
YmUgYWRkZWQgdG8gdGhlIE9wZW5CTUMgZG9jcz88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5Tb21lIG9mIHRoZSBwcmVzZW50YXRpb24gbWF0ZXJpYWwgaXMgZXNz
ZW50aWFsIGJhY2tncm91bmQvY29udGV4dCBvbiBCTUPigJlzIHVzZSBjYXNlcy4gQmVzaWRlcyB0
aGF0IHRoZSBjb250ZW50IHNob3VsZCByZWZsZWN0IHRoZSBvcGVuYm1jIGNvbW11bml0eSB3b3Jr
IGkuZS4gZXhpc3RpbmcgZGVzaWduL2ltcGxlbWVudGF0aW9uLCAmbmJzcDtkZXNjcmliaW5nIHdv
cmtncm91cCwgZmVhdHVyZXMgcGxhbm5lZCBmb3IgbmV4dA0KIHJlbGVhc2UsIGZlYXR1cmVzIHBl
bmRpbmcgZXRjLjxvOnA+PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJp
YWwmcXVvdDssc2Fucy1zZXJpZiI+Jm5ic3A7PGJyPg0KJm5ic3A7PG86cD48L286cD48L3NwYW4+
PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMC41cHQ7Zm9udC1mYW1pbHk6JnF1b3Q7QXJpYWwmcXVvdDssc2Fucy1zZXJpZiI+
Jm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48YnI+DQo8YnI+DQo8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_F14EC3A33D10481C965F86006FA6AD6Dfbcom_--
