Return-Path: <prvs=8973e91d95=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=8973e91d95=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="gJ6WL/DT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="i9EI2C2c"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44J4Kt2SSvzDqD1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2019 04:07:41 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x2BGvpG5013003;
 Mon, 11 Mar 2019 10:07:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=n7s0HZLGPsHZEqeRlGXEJHAOVsDdPU7pyu4OzB9TgeQ=;
 b=gJ6WL/DTI0a2dGuVKBlpo43HGCf+ppK+kWyBQo45F1UHTQ2bPo92l+Bmnv6+0Ai1VT0f
 9jLo1Zm9URPalnscExqzF0TkAZkMTMkc5GJ0sZaQ9PuAVPWl56Hitco0HwQ3AZNz3a2E
 cv8fXS3t7maBAM5rRfrjJ6kaJyC6q8PwC68= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2r5t5u0d1d-16
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 11 Mar 2019 10:07:37 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 11 Mar 2019 10:07:36 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Mar 2019 10:07:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7s0HZLGPsHZEqeRlGXEJHAOVsDdPU7pyu4OzB9TgeQ=;
 b=i9EI2C2c13gij7kavZjEYjCK2o1nbRmuRsIskD8MSA55I/T20jsvR6B5KkNWMPd313YJ3hvv2NtmnXbAQWscxPEey80z887ySXbKrbm8bvc1UBmAAYNRlcOoF7IkZzSQOt/jUjHFrBvvBi6qLvrV3uWgPWBQHgzYOY97fHpO6c4=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1839.namprd15.prod.outlook.com (10.174.255.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.19; Mon, 11 Mar 2019 17:07:34 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f076:5b71:62a6:2f47]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f076:5b71:62a6:2f47%8]) with mapi id 15.20.1686.021; Mon, 11 Mar 2019
 17:07:34 +0000
From: Sai Dasari <sdasari@fb.com>
To: "OCP-HWmgt@OCP-All.groups.io" <OCP-HWmgt@OCP-All.groups.io>,
 "OCP-OSF@OCP-All.groups.io" <OCP-OSF@OCP-All.groups.io>,
 "OCP-Security@OCP-All.groups.io" <OCP-Security@OCP-All.groups.io>,
 "OpenRMC@OCP-All.groups.io" <OpenRMC@OCP-All.groups.io>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [OCP] Open Source Firmware Meetup@OCP Global Summit
Thread-Topic: [OCP] Open Source Firmware Meetup@OCP Global Summit
Thread-Index: AQHU2CzrHVo2iE+KiECQaaJu6g7qbA==
Date: Mon, 11 Mar 2019 17:07:34 +0000
Message-ID: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.201.64.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e501b17-6eb8-4cf1-f533-08d6a6440e2e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1839; 
x-ms-traffictypediagnostic: MWHPR15MB1839:
x-ms-exchange-purlcount: 3
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1839;
 20:vLXbKaUthY4lshHUAp44FOElBZ5UEu2NIfifvpkIxBiF76r7sRQNhNo0+d/ninJVXO96t1ngolSHpL6W/kubGAsHMr2Sq+BS00nDYchH1XcMiwdBfg57DF74PyKTtNqCesSmB1yXJlWuNd07kx0pVtL2pX62FhSoxm4238tKxbI=
x-microsoft-antispam-prvs: <MWHPR15MB183929EB4F6D5623F0ECC8DFCE480@MWHPR15MB1839.namprd15.prod.outlook.com>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(366004)(39860400002)(346002)(376002)(199004)(189003)(71200400001)(71190400001)(53936002)(26005)(83716004)(8936002)(86362001)(186003)(110136005)(486006)(99286004)(82746002)(6506007)(2906002)(2616005)(8676002)(476003)(66066001)(256004)(81156014)(81166006)(6436002)(2201001)(36756003)(68736007)(6486002)(102836004)(478600001)(4744005)(966005)(606006)(25786009)(97736004)(2501003)(5660300002)(33656002)(236005)(6512007)(54896002)(105586002)(14454004)(410100003)(7736002)(6306002)(316002)(3846002)(6116002)(790700001)(106356001)(15940465004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1839;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6jK6ujYiLNRwAWxIVXRAgjanWm/TUpOkFP0XIRpNBoBPXIoMLnuWCvfZzctajGXcsWZy06BxIJWvuuyzf6r2llLKWEP0BCSP6iKA9bH2jXfB2odlyj0sFPxqXvq9/QpKB0pk7DDy6ocK0hQiKLUwQJucXitAK1w6VbsKXggjhnUsz1snyPphscIoyL/Y37+cFaLZ+k6ypQxsfViA8GyxFNFi0UFdo4DeMqH4NtORp1C2dVxJ4VwVAImUBNJNeRoNn4RF/m6bHZ7bw0ay2O8eE2oYtx7lztxyvwdxpdw8NuC2dtOsBvV9H+yEbeZ8YH9Ls5h98Fk/sX/rY39nRCkfwdszxgRpOVuleh+ySEA+6WMVc+kmnLSA7foDCwDo+CG7eqdf+pyFFu62FyAxGLEIxq41XzLl27GC3yjfMUhwex8=
Content-Type: multipart/alternative;
 boundary="_000_9D7F779090A44312B714F948FD6251F7fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e501b17-6eb8-4cf1-f533-08d6a6440e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 17:07:34.3177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1839
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-11_12:, , signatures=0
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
X-List-Received-Date: Mon, 11 Mar 2019 17:07:48 -0000

--_000_9D7F779090A44312B714F948FD6251F7fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCg0KRm9yIHRob3NlIG9mIHlvdSBwbGFubmluZyB0byBhdHRlbmQgT0NQIEdsb2JhbCBz
dW1taXQgKnRoaXMqIHdlZWsgQCAyMDE5IE9DUCBHbG9iYWwgU3VtbWl0PGh0dHBzOi8vd3d3Lm9w
ZW5jb21wdXRlLm9yZy9zdW1taXQvZ2xvYmFsLXN1bW1pdD4sIHBsZWFzZSBjaGVjayBvdXQgdGhl
IHBvc3QgYWJvdXQgdGhlIG1lZXR1cCBADQpodHRwczovL3d3dy5vcGVuY29tcHV0ZS5vcmcvbmV3
cy9vcGVuLXNvdXJjZS1maXJtd2FyZS1tZWV0dXAtYXQtdGhlLTIwMTktb2NwLWdsb2JhbC1zdW1t
aXQtY2FsbC1mb3ItcGFydGljaXBhdGlvbi4NCg0KQ29tbXVuaXR5IG1lbWJlcnMgY2FtZSB1cCB3
aXRoIGZldyB0b3BpYyBzdHJlYW1zIGZvciB0aGlzIG1lZXR1cCBvcHBvcnR1bml0eSBhcmUgY2Fw
dHVyZWQgQCBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9zcHJlYWRzaGVldHMvZC8xY0tBWUZQMmZF
aGdCb0VCakdyQ3JPQXE2LTAxbnlYNTNNOXJyTGFKeGxrNC9lZGl0I2dpZD0wDQoNCldpbGwgbG9v
ayBmb3J3YXJkIHRvIG1lZXRpbmcgeW91IGF0IHRoaXMgbWVldHVwIHRvIGFjY2VsZXJhdGUgZWZm
b3J0cyBpbiBvcGVuIHNvdXJjZSBmaXJtd2FyZS4gUGxlYXNlIHJlYWNoIG91dCB0byBtZSBhbmQv
b3IgcHJvamVjdCBsZWFkcyBmb3IgbW9yZSBpbmZvLg0KDQpUaGFua3MsDQpTYWkuDQoNCg0K

--_000_9D7F779090A44312B714F948FD6251F7fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <F1150C555BA8FA47BD65879F9187DC19@namprd15.prod.outlook.com>
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
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBsaS5Nc29Ob3JtYWws
IGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9tOi4wMDAxcHQ7DQoJ
Zm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcN
Cgl7bXNvLXN0eWxlLXR5cGU6cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJy
aSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21z
by1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNl
cmlmO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46
MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRT
ZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVk
ZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1sPjwhW2VuZGlmXS0t
PjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpleHQ9ImVkaXQiPg0K
PG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVsYXlvdXQ+PC94bWw+
PCFbZW5kaWZdLS0+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIg
dmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UZWFtLDxvOnA+PC9vOnA+
PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Rm9yIHRob3NlIG9mIHlvdSBwbGFubmlu
ZyB0byBhdHRlbmQgT0NQIEdsb2JhbCBzdW1taXQgKjxiPnRoaXM8L2I+KiB3ZWVrIEANCjxhIGhy
ZWY9Imh0dHBzOi8vd3d3Lm9wZW5jb21wdXRlLm9yZy9zdW1taXQvZ2xvYmFsLXN1bW1pdCI+MjAx
OSBPQ1AgR2xvYmFsIFN1bW1pdDwvYT4sIHBsZWFzZSBjaGVjayBvdXQgdGhlIHBvc3QgYWJvdXQg
dGhlIG1lZXR1cCBADQo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PGEgaHJlZj0iaHR0cHM6Ly93d3cub3Bl
bmNvbXB1dGUub3JnL25ld3Mvb3Blbi1zb3VyY2UtZmlybXdhcmUtbWVldHVwLWF0LXRoZS0yMDE5
LW9jcC1nbG9iYWwtc3VtbWl0LWNhbGwtZm9yLXBhcnRpY2lwYXRpb24iPmh0dHBzOi8vd3d3Lm9w
ZW5jb21wdXRlLm9yZy9uZXdzL29wZW4tc291cmNlLWZpcm13YXJlLW1lZXR1cC1hdC10aGUtMjAx
OS1vY3AtZ2xvYmFsLXN1bW1pdC1jYWxsLWZvci1wYXJ0aWNpcGF0aW9uPC9hPi48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNvbW11bml0eSBtZW1iZXJzIGNhbWUg
dXAgd2l0aCBmZXcgdG9waWMgc3RyZWFtcyBmb3IgdGhpcyBtZWV0dXAgb3Bwb3J0dW5pdHkgYXJl
IGNhcHR1cmVkIEANCjxhIGhyZWY9Imh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3NwcmVhZHNoZWV0
cy9kLzFjS0FZRlAyZkVoZ0JvRUJqR3JDck9BcTYtMDFueVg1M005cnJMYUp4bGs0L2VkaXQjZ2lk
PTAiPg0KaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vc3ByZWFkc2hlZXRzL2QvMWNLQVlGUDJmRWhn
Qm9FQmpHckNyT0FxNi0wMW55WDUzTTlyckxhSnhsazQvZWRpdCNnaWQ9MDwvYT4NCjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+V2lsbCBsb29rIGZvcndhcmQgdG8g
bWVldGluZyB5b3UgYXQgdGhpcyBtZWV0dXAgdG8gYWNjZWxlcmF0ZSBlZmZvcnRzIGluIG9wZW4g
c291cmNlIGZpcm13YXJlLiBQbGVhc2UgcmVhY2ggb3V0IHRvIG1lIGFuZC9vciBwcm9qZWN0IGxl
YWRzIGZvciBtb3JlIGluZm8uPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij5UaGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlNhaS48bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86
cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_9D7F779090A44312B714F948FD6251F7fbcom_--
