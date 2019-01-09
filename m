Return-Path: <prvs=6912b1a310=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=6912b1a310=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Dq3pcao1"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="gZ+iM0PX"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZkN43xV9zDqWw
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 09:30:11 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x09MU9J1007536
 for <openbmc@lists.ozlabs.org>; Wed, 9 Jan 2019 14:30:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=DPHOo5SAhY3lLCXpIALa26ZheWL+Bz71TiB38+RVW/Y=;
 b=Dq3pcao1QiWST8UAqhoMm17Wy8dwOwBqy9tKdS5KB1S+B6x5/KsROplwX/+gHnyajSY5
 uPVCO3rHn1OvXWmqrJlKgnwHUnUMdVrNcq6JDwjNE2sYhGdYDP7haPOMfJT0j+uHr1Cu
 Qgj32f0PHuMHuEUPLN1285GVXu1bo4hqumQ= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2pwqc0ghgm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 14:30:09 -0800
Received: from prn-hub02.TheFacebook.com (2620:10d:c081:35::126) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 9 Jan 2019 14:30:08 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Wed, 9 Jan 2019 14:30:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPHOo5SAhY3lLCXpIALa26ZheWL+Bz71TiB38+RVW/Y=;
 b=gZ+iM0PXaG8MvTMqz0s2+jqtM/0qHMwNz2ijLC/N9HsPYefKHxF7qFosYx6BFnuH40pBDgTnH5ZffKKgeGbwE3hiarhKyFm19Efb4gkF8t48mR1fbheucBW3YAPEYJW3bp2EgbZOsRlWHy0AwTw+oK346CDU+eHnmNrl3yU5clQ=
Received: from MWHPR15MB1280.namprd15.prod.outlook.com (10.175.3.18) by
 MWHPR15MB1807.namprd15.prod.outlook.com (10.174.255.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.13; Wed, 9 Jan 2019 22:30:06 +0000
Received: from MWHPR15MB1280.namprd15.prod.outlook.com
 ([fe80::5026:fb57:b212:f3ad]) by MWHPR15MB1280.namprd15.prod.outlook.com
 ([fe80::5026:fb57:b212:f3ad%3]) with mapi id 15.20.1516.010; Wed, 9 Jan 2019
 22:30:06 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: phosphor-ipmi-host.service broken
Thread-Topic: phosphor-ipmi-host.service broken
Thread-Index: AQHUqGreM2oAq00o80afMg8OKyh4pw==
Date: Wed, 9 Jan 2019 22:30:05 +0000
Message-ID: <648E9D06-170B-489A-A423-FA5E7C71D6FF@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::4:e5ed]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1807;
 20:2z7cdGNVRiRKGnQQgBCx/Bf40Mr6vYf3AxolhbK1nOzDyAX6LZbHJUHZ2fiC3fp1bGfG89kIKcsS6DQjcoVYShGo9bqiOvnshQaEZx40e33sm5YKydhE+M0q0zsdkcqfQSXZdIbK2VxI/GRWHrIH6SSNwsDDE0odJYIYDNRi+4A=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: ed97a774-f39d-4d5b-92cc-08d67682017e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1807; 
x-ms-traffictypediagnostic: MWHPR15MB1807:
x-microsoft-antispam-prvs: <MWHPR15MB180782B96EC6F6A37CEFBAF3DD8B0@MWHPR15MB1807.namprd15.prod.outlook.com>
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(396003)(39860400002)(136003)(189003)(199004)(6506007)(486006)(256004)(46003)(5660300001)(6116002)(316002)(102836004)(186003)(6512007)(82746002)(6306002)(54896002)(53936002)(6916009)(7736002)(99286004)(476003)(33656002)(2616005)(86362001)(25786009)(478600001)(97736004)(8936002)(6486002)(81156014)(81166006)(71200400001)(71190400001)(83716004)(6436002)(106356001)(36756003)(105586002)(68736007)(14454004)(8676002)(3480700005)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1807;
 H:MWHPR15MB1280.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BwILUgVLwUS6Bdl5OIIJeJXVQP3UEegzb0kOQ7lPJP6ASnkcFCgT5PX3MkjqpzqP7GJC84v2LQnqYPLsfoPOdevtriIP+z0HC+oYhQ/T2tjdnKfP1bfBLSbpmC3y6QONuaPUpGtN13j/dm5ZhbDVzEFPVifcvxGZTqEJQ4bdiwp7QW7jKz93F7UT34yo7akFhfCLIly53XxuGuOkUVRGhw4x7JXQBzWaDNHlcf95qx5ckRhccBVRg2ODXBzn0gaycHHxkOsnbOo+RzNc/iSIxVUSOEcabibb5NHDC66kQOKRyg3wL84J6L4xJ7EIfI3k
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_648E9D06170B489AA423FA5E7C71D6FFfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed97a774-f39d-4d5b-92cc-08d67682017e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 22:30:06.0170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1807
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-09_11:, , signatures=0
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
X-List-Received-Date: Wed, 09 Jan 2019 22:30:13 -0000

--_000_648E9D06170B489AA423FA5E7C71D6FFfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBzZWUgbmV3IGNoYW5nZXMgaW4gdGhpcyBwaG9zcGhvci1pcG1pLWhvc3Quc2VydmljZSBmaWxl
IHdoZXJlIGl0IG5lZWRzIG9yZy5vcGVuYm1jLkhvc3RJcG1pLnNlcnZpY2Ugc2VydmljZSB0byBi
ZSBydW5uaW5nIGFuZCB0aGlzIG9yZy5vcGVuYm1jLkhvc3RJcG1pLnNlcnZpY2Ugc2VydmljZSBk
ZXBlbmRzIG9uIHBob3NwaG9yLWlwbWktaG9zdC5zZXJ2aWNlIGZpbGUuIFNvIGl0IGlzIGN5Y2xp
YyBkZXBlbmRlbmN5IHdoaWNoIGluIHR1cm4gbm90IGxldHRpbmcgcnVuIGFueSBvZiB0aGVzZSBz
ZXJ2aWNlLg0KDQoNCg0KUmVnYXJkcw0KDQotVmlqYXkNCg0K

--_000_648E9D06170B489AA423FA5E7C71D6FFfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <95CF5B0C72EE4D42BCE45641C75E6432@namprd15.prod.outlook.com>
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
dGV4dDt9DQpwLnAxLCBsaS5wMSwgZGl2LnAxDQoJe21zby1zdHlsZS1uYW1lOnAxOw0KCW1zby1t
YXJnaW4tdG9wLWFsdDphdXRvOw0KCW1hcmdpbi1yaWdodDowaW47DQoJbXNvLW1hcmdpbi1ib3R0
b20tYWx0OmF1dG87DQoJbWFyZ2luLWxlZnQ6MGluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9u
dC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5hcHBsZS1jb252ZXJ0ZWQtc3Bh
Y2UNCgl7bXNvLXN0eWxlLW5hbWU6YXBwbGUtY29udmVydGVkLXNwYWNlO30NCnNwYW4uczENCgl7
bXNvLXN0eWxlLW5hbWU6czE7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhw
b3J0LW9ubHk7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1h
cmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6
V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIg
bGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24x
Ij4NCjxwIGNsYXNzPSJwMSIgc3R5bGU9Im1hcmdpbjowaW47bWFyZ2luLWJvdHRvbTouMDAwMXB0
O2JhY2tncm91bmQ6d2hpdGUiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpNZW5sbztjb2xvcjpi
bGFjayI+SSBzZWUgbmV3IGNoYW5nZXMgaW4gdGhpczwvc3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUt
Y29udmVydGVkLXNwYWNlIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG87Y29sb3I6Ymxh
Y2siPiZuYnNwOzwvc3Bhbj48L3NwYW4+PHNwYW4gY2xhc3M9InMxIj48Yj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOmJsYWNrIj5waG9zcGhvci1p
cG1pLWhvc3Quc2VydmljZTwvc3Bhbj48L2I+PC9zcGFuPjxzcGFuIGNsYXNzPSJhcHBsZS1jb252
ZXJ0ZWQtc3BhY2UiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpNZW5sbztjb2xvcjpibGFjayI+
Jm5ic3A7PC9zcGFuPjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG87Y29sb3I6
YmxhY2siPmZpbGUNCiB3aGVyZSBpdCBuZWVkczwvc3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUtY29u
dmVydGVkLXNwYWNlIj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG87Y29sb3I6YmxhY2si
PiZuYnNwOzwvc3Bhbj48L3NwYW4+PHNwYW4gY2xhc3M9InMxIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOmJsYWNrIj5vcmcub3BlbmJtYy5Ib3N0
SXBtaS5zZXJ2aWNlPC9zcGFuPjwvc3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNw
YWNlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9y
OmJsYWNrIj4mbmJzcDs8L3NwYW4+PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTpNZW5s
bztjb2xvcjpibGFjayI+c2VydmljZQ0KIHRvIGJlIHJ1bm5pbmcgYW5kIHRoaXM8L3NwYW4+PHNw
YW4gY2xhc3M9ImFwcGxlLWNvbnZlcnRlZC1zcGFjZSI+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5
Ok1lbmxvO2NvbG9yOmJsYWNrIj4mbmJzcDs8L3NwYW4+PC9zcGFuPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6OC41cHQ7Zm9udC1mYW1pbHk6TWVubG87Y29sb3I6IzM0QkMyNiI+b3JnLm9wZW5ibWMu
SG9zdElwbWkuc2VydmljZTwvc3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNl
Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG87Y29sb3I6YmxhY2siPiZuYnNwOzwvc3Bh
bj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOmJsYWNrIj5zZXJ2
aWNlDQogZGVwZW5kcyBvbjwvc3Bhbj48c3BhbiBjbGFzcz0iYXBwbGUtY29udmVydGVkLXNwYWNl
Ij48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6TWVubG87Y29sb3I6YmxhY2siPiZuYnNwOzwvc3Bh
bj48L3NwYW4+PHNwYW4gY2xhc3M9InMxIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjguNXB0
O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOmJsYWNrIj5waG9zcGhvci1pcG1pLWhvc3Quc2Vydmlj
ZSBmaWxlPC9zcGFuPjwvYj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Ok1lbmxvO2Nv
bG9yOmJsYWNrIj4uDQogU28gaXQgaXMgY3ljbGljIGRlcGVuZGVuY3kgd2hpY2ggaW4gdHVybiBu
b3QgbGV0dGluZyBydW4gYW55IG9mIHRoZXNlIHNlcnZpY2UuPC9zcGFuPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6OC41cHQ7Zm9udC1mYW1pbHk6TWVubG87Y29sb3I6YmxhY2siPjxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJwMSIgc3R5bGU9Im1hcmdpbjowaW47bWFyZ2luLWJvdHRv
bTouMDAwMXB0O2JhY2tncm91bmQ6d2hpdGU7Y2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTtmb250
LXZhcmlhbnQtY2Fwczogbm9ybWFsO29ycGhhbnM6IGF1dG87dGV4dC1hbGlnbjpzdGFydDt3aWRv
d3M6IGF1dG87LXdlYmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOy13ZWJraXQtdGV4dC1zdHJv
a2Utd2lkdGg6IDBweDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWwgaW5pdGlhbDtiYWNrZ3Jv
dW5kLXJlcGVhdDppbml0aWFsIGluaXRpYWw7d29yZC1zcGFjaW5nOjBweCI+DQo8c3BhbiBzdHls
ZT0iZm9udC1zaXplOjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOiMzNEJDMjYiPiZuYnNw
Ozwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2Nv
bG9yOmJsYWNrIj48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0icDEiIHN0eWxlPSJt
YXJnaW46MGluO21hcmdpbi1ib3R0b206LjAwMDFwdDtiYWNrZ3JvdW5kOndoaXRlO2NhcmV0LWNv
bG9yOiByZ2IoMCwgMCwgMCk7Zm9udC12YXJpYW50LWNhcHM6IG5vcm1hbDtvcnBoYW5zOiBhdXRv
O3RleHQtYWxpZ246c3RhcnQ7d2lkb3dzOiBhdXRvOy13ZWJraXQtdGV4dC1zaXplLWFkanVzdDog
YXV0bzstd2Via2l0LXRleHQtc3Ryb2tlLXdpZHRoOiAwcHg7YmFja2dyb3VuZC1wb3NpdGlvbjpp
bml0aWFsIGluaXRpYWw7YmFja2dyb3VuZC1yZXBlYXQ6aW5pdGlhbCBpbml0aWFsO3dvcmQtc3Bh
Y2luZzowcHgiPg0KPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo4LjVwdDtmb250LWZhbWlseTpNZW5s
bztjb2xvcjojMzRCQzI2Ij5SZWdhcmRzPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OC41
cHQ7Zm9udC1mYW1pbHk6TWVubG87Y29sb3I6YmxhY2siPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJwMSIgc3R5bGU9Im1hcmdpbjowaW47bWFyZ2luLWJvdHRvbTouMDAwMXB0O2Jh
Y2tncm91bmQ6d2hpdGU7Y2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTtmb250LXZhcmlhbnQtY2Fw
czogbm9ybWFsO29ycGhhbnM6IGF1dG87dGV4dC1hbGlnbjpzdGFydDt3aWRvd3M6IGF1dG87LXdl
YmtpdC10ZXh0LXNpemUtYWRqdXN0OiBhdXRvOy13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBw
eDtiYWNrZ3JvdW5kLXBvc2l0aW9uOmluaXRpYWwgaW5pdGlhbDtiYWNrZ3JvdW5kLXJlcGVhdDpp
bml0aWFsIGluaXRpYWw7d29yZC1zcGFjaW5nOjBweCI+DQo8c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOiMzNEJDMjYiPi1WaWpheTwvc3Bhbj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjguNXB0O2ZvbnQtZmFtaWx5Ok1lbmxvO2NvbG9yOmJsYWNrIj48
bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8
L2JvZHk+DQo8L2h0bWw+DQo=

--_000_648E9D06170B489AA423FA5E7C71D6FFfbcom_--
