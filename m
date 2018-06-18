Return-Path: <prvs=970797624d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=970797624d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="DKA8jqot"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ApCDhpRt"; dkim-atps=neutral
X-Greylist: delayed 2445 seconds by postgrey-1.36 at bilbo;
 Mon, 18 Jun 2018 22:32:56 AEST
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418VqX46F3zF0jn
 for <openbmc@lists.ozlabs.org>; Mon, 18 Jun 2018 22:32:55 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5IBlNcc025576; Mon, 18 Jun 2018 04:51:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=1b0MRK5QcihuH8p/ZKs84NRcNZs8MDFvmGfSDfSktiE=;
 b=DKA8jqotYDDf/36wCjxR8bBeeQ3iL5EbkccQrGeAE/g3y2BjYMBd3e5gLftGcCT3RbSW
 goHp3XAJqZycPCqsNKE1k49PvDBYSAnU/YkALcvGCHRE1/2oJf5/2cWW+qGrZQPmW1EW
 7W5xO/dQXOyFUGTlMCrFQzDNz3be1I/9hfM= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2jpa4408c6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 18 Jun 2018 04:51:59 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.25) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Mon, 18 Jun 2018 07:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b0MRK5QcihuH8p/ZKs84NRcNZs8MDFvmGfSDfSktiE=;
 b=ApCDhpRthQt5xGwVkDubTc94gKC5NmUNDZTdamIW81pTciiTLllG7f6m1lPTnPJ4dAu49LLdQf7H75bbzJvnbqwLVdVmPZ/oUM9ftGNFKYchCTNtk26hghbKC2StGLr89w6faDUSQUvvTIv9AMRzw/yuyu3HyKMsHARRk0QBZIU=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1645.namprd15.prod.outlook.com (10.175.135.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.863.16; Mon, 18 Jun 2018 11:51:57 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ed33:380d:2f64:d615]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ed33:380d:2f64:d615%3]) with mapi id 15.20.0863.016; Mon, 18 Jun 2018
 11:51:57 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: move to 4.17-based kernel?
Thread-Topic: move to 4.17-based kernel?
Thread-Index: AQHUBvrCZvKKqprHIEeZ54ztAAztjQ==
Date: Mon, 18 Jun 2018 11:51:57 +0000
Message-ID: <0BBFBB96-82ED-4623-A820-EC08A819BFFA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:180::1:560c]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1645;
 7:gUJKzCPo1B9DA7oyi4lhEpOoYDZzpRCLUUDDUDsG4B+pV7/IHbug2V1vu44eL5QG/LD7dlYYhYp2pGqzyBw6f5K/GS5IFbmUqx0ytI1SW+dKiFdIXq1tTpA/Grx7jVONQIO2HMuLXvxBc7Rt67tKR37AxZGW5LlBLeDqtprQ9ocS2gFJ3i446goT0LSKjfIW+OVKF4VCYt7jPK+XSbbA7U0g/YSoHlfsMvcH7BUaZ4FZN4ERr8LaeNdMsR6148zS;
 20:G1YR0+U2u2L5K7tHIocsES4ezsBD9l9YkRE1dlyjRnsEZUiProsBUtLqraVE32DNs3zqnB+NaQItX31REGZEfoMyn73jSltZUWwlbiD22VtY2XW5ZXecCvJJJTANA+mlmAvK4g7HN4vCWLVNQkOQbZvcHGfkWvJqXVJB7Yu0yR8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 35061d92-3169-40ff-0283-08d5d511e4f0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1645; 
x-ms-traffictypediagnostic: MWHPR15MB1645:
x-microsoft-antispam-prvs: <MWHPR15MB1645E7E77E90868A63951008B2710@MWHPR15MB1645.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(166708455590820)(21748063052155); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231254)(11241501184)(944501410)(52105095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(6072148)(201708071742011)(7699016);
 SRVR:MWHPR15MB1645; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1645; 
x-forefront-prvs: 0707248B64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39380400002)(39860400002)(366004)(396003)(376002)(346002)(189003)(199004)(3280700002)(558084003)(68736007)(36756003)(4326008)(86362001)(3660700001)(97736004)(6916009)(5660300001)(6436002)(83716003)(99286004)(6486002)(82746002)(33656002)(316002)(6506007)(2616005)(25786009)(476003)(81166006)(7736002)(9326002)(8936002)(14454004)(102836004)(6512007)(105586002)(106356001)(790700001)(486006)(46003)(478600001)(2906002)(5250100002)(53936002)(6306002)(54896002)(8676002)(2900100001)(81156014)(6116002)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1645;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Iu08JAtlYdEh+rtgF3VNhwIgh4FWWHPBl4auQ9YrmS9XZabVRYTxI1lxIzbV7v62JlaYkPjE/NT77jHDHNDtI/NcbBkiFX6+fzHm0ZqI8cWJW+B4TViCAsumjicwX5ax10YtPW7x3plRCpl2A4PoTNYPWre3JAVeJDYH0qnlhuwmpyBnoHN3OL8p3X5soQbc
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_0BBFBB9682ED4623A820EC08A819BFFAfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 35061d92-3169-40ff-0283-08d5d511e4f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 11:51:57.3727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1645
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-18_04:, , signatures=0
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
X-List-Received-Date: Mon, 18 Jun 2018 12:32:58 -0000

--_000_0BBFBB9682ED4623A820EC08A819BFFAfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCg0KTm90IHN1cmUgaWYgSSBtaXNzZWQgYW55dGhpbmcgZHVyaW5nIGNvbW11bmlj
YXRpb24sIGJ1dCBJIGp1c3Qgd2FudCB0byBrbm93IGlmIHdlIGhhdmUgYWxyZWFkeSBtb3ZlZCB0
byA0LjE3LWJhc2VkIGtlcm5lbCBvciB3ZSBhcmUgc3RpbGwgd29ya2luZyBvbiBpdD8gSSBjaGVj
a2VkIGdpdGh1Yi5jb206b3BlbmJtYy9saW51eC5naXQgYW5kIGRpZG7igJl0IGZpbmQgNC4xNyBi
cmFuY2gsIGFuZCB0aGF04oCZcyB3aHkgSeKAmW0gYXNraW5nLg0KDQoNClRoYW5rcywNCg0KVGFv
DQo=

--_000_0BBFBB9682ED4623A820EC08A819BFFAfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8F0A2019DF3A48459F363E09348EB98F@namprd15.prod.outlook.com>
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
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSBKb2VsLDxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Tm90IHN1cmUgaWYgSSBtaXNzZWQg
YW55dGhpbmcgZHVyaW5nIGNvbW11bmljYXRpb24sIGJ1dCBJIGp1c3Qgd2FudCB0byBrbm93IGlm
IHdlIGhhdmUgYWxyZWFkeSBtb3ZlZCB0byA0LjE3LWJhc2VkIGtlcm5lbCBvciB3ZSBhcmUgc3Rp
bGwgd29ya2luZyBvbiBpdD8gSSBjaGVja2VkIGdpdGh1Yi5jb206b3BlbmJtYy9saW51eC5naXQg
YW5kIGRpZG7igJl0IGZpbmQNCiA0LjE3IGJyYW5jaCwgYW5kIHRoYXTigJlzIHdoeSBJ4oCZbSBh
c2tpbmcuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZu
YnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExLjBwdCI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+VGFvPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8
L2h0bWw+DQo=

--_000_0BBFBB9682ED4623A820EC08A819BFFAfbcom_--
