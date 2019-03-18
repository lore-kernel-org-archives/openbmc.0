Return-Path: <prvs=89807634cc=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=89807634cc=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="G319u7b0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ArnaYfw+"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44NXFb3BDczDqJX
 for <openbmc@lists.ozlabs.org>; Tue, 19 Mar 2019 10:19:26 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2INJA5Y013725; Mon, 18 Mar 2019 16:19:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=9YT4FsICQvTVREu4rCCZI9PSiXuBZJZx0FPGsWQ3TWs=;
 b=G319u7b0QQAtqOnHhnZM6qIQtrI9MOqKFtfZbijp5tSLeS88mo7eebWVKo5E0aHVipiZ
 5eCsallYkMPdTrFR5pg+UpvQEkajp4hF1sMrlkTWe8fV0jzLf2l5ygQJd/tmuzYfVJSA
 fmNPIsSo1HSzhiW7yKpqyttgVePNxJfhktk= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rak3b8cav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 18 Mar 2019 16:19:23 -0700
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub05.TheFacebook.com (2620:10d:c021:18::175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Mon, 18 Mar 2019 16:19:22 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Mon, 18 Mar 2019 16:19:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YT4FsICQvTVREu4rCCZI9PSiXuBZJZx0FPGsWQ3TWs=;
 b=ArnaYfw+r627+9wJmWP3zkFIKlCG7CLVcaQHBcbL25Ez3/Nn/L3m54D0yL5si7CwjD8i4dT6aCFSbWRVynjeIhhPvUUZiHxGrxeeGcju+430K1xk930TD7/XmPwKjzRIbXDHu6urQGPUqFxRlEozwWdrQDtPpohBgobSOsmImGU=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1741.namprd15.prod.outlook.com (10.174.254.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Mon, 18 Mar 2019 23:19:21 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f076:5b71:62a6:2f47]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f076:5b71:62a6:2f47%8]) with mapi id 15.20.1709.015; Mon, 18 Mar 2019
 23:19:21 +0000
From: Sai Dasari <sdasari@fb.com>
To: "OCP-HWmgt@OCP-All.groups.io" <OCP-HWmgt@OCP-All.groups.io>,
 "OCP-OSF@OCP-All.groups.io" <OCP-OSF@OCP-All.groups.io>,
 "OCP-Security@OCP-All.groups.io" <OCP-Security@OCP-All.groups.io>,
 "OpenRMC@OCP-All.groups.io" <OpenRMC@OCP-All.groups.io>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [OCP] Open Source Firmware Meetup@OCP Global Summit
Thread-Topic: [OCP] Open Source Firmware Meetup@OCP Global Summit
Thread-Index: AQHU2CzrHVo2iE+KiECQaaJu6g7qbKYRnFQA
Date: Mon, 18 Mar 2019 23:19:20 +0000
Message-ID: <C837774E-CE47-4E78-8401-50DBA0CA97FA@fb.com>
References: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
In-Reply-To: <9D7F7790-90A4-4312-B714-F948FD6251F7@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:e110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f2133ac-e081-477a-c611-08d6abf826cc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1741; 
x-ms-traffictypediagnostic: MWHPR15MB1741:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <MWHPR15MB1741E451FB97DE508C1AD5E8CE470@MWHPR15MB1741.namprd15.prod.outlook.com>
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(76176011)(316002)(33656002)(8676002)(2906002)(966005)(99286004)(14454004)(606006)(8936002)(6506007)(81166006)(81156014)(53546011)(102836004)(82746002)(7736002)(6246003)(25786009)(106356001)(110136005)(6116002)(790700001)(36756003)(410100003)(105586002)(478600001)(14444005)(486006)(256004)(5660300002)(2616005)(2501003)(2201001)(476003)(86362001)(53936002)(54896002)(71190400001)(236005)(6512007)(446003)(186003)(83716004)(6306002)(229853002)(6486002)(6436002)(46003)(11346002)(71200400001)(68736007)(97736004)(15940465004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1741;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RxbjrqjBjgAhYgP3J8MoRSXJZzCfMEqkHCLhMoYXGiujxOSbmYuQb6RAfB67guhV+U7LcGwtZYw640W3dkIsJhR9tXB9+SALJ+HyF6Xgb96Nc67cW2N5H/8+q9SsppbV1a7PPFC0Bc/4AQCHsp7xbSt4Xwz0D/hW8mTzf7Cn3TXTVNy9KmdWrAk4zxy1wEXkDF1zE7w0gCJ0q/XsYAGD/JZ4++OxOxg0GwiiSBDP2Gru3mzWv2qZXTKwvw5b2rZokwn7oWYPlQmiQoRennqEuV17/ixGQ3bLPEbX/JFeJq8PlmfT1YmXOpe50hN2/Tiyhxs5swGgFvQVooZzUQVvVjiFngKnpMaNXb8oxDRULSXEKs10Z0cYJzj2ULXuJ+ERMPOJN3Acj0enSVh14UNM+HtWC+vF/2EUAMfFf9FxxrQ=
Content-Type: multipart/alternative;
 boundary="_000_C837774ECE474E78840150DBA0CA97FAfbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2133ac-e081-477a-c611-08d6abf826cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2019 23:19:21.0036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1741
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-18_13:, , signatures=0
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
X-List-Received-Date: Mon, 18 Mar 2019 23:19:32 -0000

--_000_C837774ECE474E78840150DBA0CA97FAfbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCg0KRm9yIHRob3NlIG9mIHlvdSB3aG8gd2VyZSBhYmxlIHRvIGF0dGVuZCB0aGlzIG1l
ZXR1cCwgSSByZXF1ZXN0IHRvIHRha2UgYSBzbWFsbCBzdXJ2ZXkgQCBodHRwczovL3d3dy5zdXJ2
ZXltb25rZXkuY29tL3IvT1NGLU1lZXR1cC1PQ1AxOS4gQXBwcmVjaWF0ZSB5b3VyIHRpbWUgZmls
bGluZyB0aGlzIHN1cnZleSENCg0KVGhhbmtzLA0KU2FpDQpGcm9tOiBTYWkgRGFzYXJpIDxzZGFz
YXJpQGZiLmNvbT4NCkRhdGU6IE1vbmRheSwgTWFyY2ggMTEsIDIwMTkgYXQgMTA6MDcgQU0NClRv
OiAiT0NQLUhXbWd0QE9DUC1BbGwuZ3JvdXBzLmlvIiA8T0NQLUhXbWd0QE9DUC1BbGwuZ3JvdXBz
LmlvPiwgIk9DUC1PU0ZAT0NQLUFsbC5ncm91cHMuaW8iIDxPQ1AtT1NGQE9DUC1BbGwuZ3JvdXBz
LmlvPiwgIk9DUC1TZWN1cml0eUBPQ1AtQWxsLmdyb3Vwcy5pbyIgPE9DUC1TZWN1cml0eUBPQ1At
QWxsLmdyb3Vwcy5pbz4sICJPcGVuUk1DQE9DUC1BbGwuZ3JvdXBzLmlvIiA8T3BlblJNQ0BPQ1At
QWxsLmdyb3Vwcy5pbz4sICJvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIDxvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+DQpTdWJqZWN0OiBbT0NQXSBPcGVuIFNvdXJjZSBGaXJtd2FyZSBNZWV0dXBA
T0NQIEdsb2JhbCBTdW1taXQNCg0KVGVhbSwNCg0KRm9yIHRob3NlIG9mIHlvdSBwbGFubmluZyB0
byBhdHRlbmQgT0NQIEdsb2JhbCBzdW1taXQgKnRoaXMqIHdlZWsgQCAyMDE5IE9DUCBHbG9iYWwg
U3VtbWl0PGh0dHBzOi8vd3d3Lm9wZW5jb21wdXRlLm9yZy9zdW1taXQvZ2xvYmFsLXN1bW1pdD4s
IHBsZWFzZSBjaGVjayBvdXQgdGhlIHBvc3QgYWJvdXQgdGhlIG1lZXR1cCBADQpodHRwczovL3d3
dy5vcGVuY29tcHV0ZS5vcmcvbmV3cy9vcGVuLXNvdXJjZS1maXJtd2FyZS1tZWV0dXAtYXQtdGhl
LTIwMTktb2NwLWdsb2JhbC1zdW1taXQtY2FsbC1mb3ItcGFydGljaXBhdGlvbi4NCg0KQ29tbXVu
aXR5IG1lbWJlcnMgY2FtZSB1cCB3aXRoIGZldyB0b3BpYyBzdHJlYW1zIGZvciB0aGlzIG1lZXR1
cCBvcHBvcnR1bml0eSBhcmUgY2FwdHVyZWQgQCBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9zcHJl
YWRzaGVldHMvZC8xY0tBWUZQMmZFaGdCb0VCakdyQ3JPQXE2LTAxbnlYNTNNOXJyTGFKeGxrNC9l
ZGl0I2dpZD0wDQoNCldpbGwgbG9vayBmb3J3YXJkIHRvIG1lZXRpbmcgeW91IGF0IHRoaXMgbWVl
dHVwIHRvIGFjY2VsZXJhdGUgZWZmb3J0cyBpbiBvcGVuIHNvdXJjZSBmaXJtd2FyZS4gUGxlYXNl
IHJlYWNoIG91dCB0byBtZSBhbmQvb3IgcHJvamVjdCBsZWFkcyBmb3IgbW9yZSBpbmZvLg0KDQpU
aGFua3MsDQpTYWkuDQoNCg0K

--_000_C837774ECE474E78840150DBA0CA97FAfbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <95F1AAD45619684DABBDB3A8D179320A@namprd15.prod.outlook.com>
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
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5t
c29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjExLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1z
ZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHls
ZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlm
Ow0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6
ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXplOjEwLjBwdDt9DQpAcGFnZSBXb3JkU2VjdGlvbjENCgl7
c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGluO30NCmRp
di5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLS0+PC9zdHlsZT48IS0tW2lm
IGd0ZSBtc28gOV0+PHhtbD4NCjxvOnNoYXBlZGVmYXVsdHMgdjpleHQ9ImVkaXQiIHNwaWRtYXg9
IjEwMjYiIC8+DQo8L3htbD48IVtlbmRpZl0tLT48IS0tW2lmIGd0ZSBtc28gOV0+PHhtbD4NCjxv
OnNoYXBlbGF5b3V0IHY6ZXh0PSJlZGl0Ij4NCjxvOmlkbWFwIHY6ZXh0PSJlZGl0IiBkYXRhPSIx
IiAvPg0KPC9vOnNoYXBlbGF5b3V0PjwveG1sPjwhW2VuZGlmXS0tPg0KPC9oZWFkPg0KPGJvZHkg
bGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIj4NCjxkaXYgY2xhc3M9
IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+VGVhbSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPkZvciB0aG9zZSBvZiB5b3Ugd2hvIHdlcmUgYWJsZSB0byBhdHRlbmQgdGhpcyBtZWV0dXAs
IEkgcmVxdWVzdCB0byB0YWtlIGEgc21hbGwgc3VydmV5IEANCjxhIGhyZWY9Imh0dHBzOi8vd3d3
LnN1cnZleW1vbmtleS5jb20vci9PU0YtTWVldHVwLU9DUDE5Ij5odHRwczovL3d3dy5zdXJ2ZXlt
b25rZXkuY29tL3IvT1NGLU1lZXR1cC1PQ1AxOTwvYT4uIEFwcHJlY2lhdGUgeW91ciB0aW1lIGZp
bGxpbmcgdGhpcyBzdXJ2ZXkhPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij5UaGFua3MsPGJyPg0KU2FpPG86cD48L286cD48L3NwYW4+PC9wPg0KPGRpdiBzdHlsZT0i
Ym9yZGVyOm5vbmU7Ym9yZGVyLXRvcDpzb2xpZCAjQjVDNERGIDEuMHB0O3BhZGRpbmc6My4wcHQg
MGluIDBpbiAwaW4iPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PGI+PHNwYW4gc3R5bGU9ImNvbG9y
OmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJjb2xvcjpibGFjayI+U2FpIERh
c2FyaSAmbHQ7c2Rhc2FyaUBmYi5jb20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPk1vbmRheSwgTWFy
Y2ggMTEsIDIwMTkgYXQgMTA6MDcgQU08YnI+DQo8Yj5UbzogPC9iPiZxdW90O09DUC1IV21ndEBP
Q1AtQWxsLmdyb3Vwcy5pbyZxdW90OyAmbHQ7T0NQLUhXbWd0QE9DUC1BbGwuZ3JvdXBzLmlvJmd0
OywgJnF1b3Q7T0NQLU9TRkBPQ1AtQWxsLmdyb3Vwcy5pbyZxdW90OyAmbHQ7T0NQLU9TRkBPQ1At
QWxsLmdyb3Vwcy5pbyZndDssICZxdW90O09DUC1TZWN1cml0eUBPQ1AtQWxsLmdyb3Vwcy5pbyZx
dW90OyAmbHQ7T0NQLVNlY3VyaXR5QE9DUC1BbGwuZ3JvdXBzLmlvJmd0OywgJnF1b3Q7T3BlblJN
Q0BPQ1AtQWxsLmdyb3Vwcy5pbyZxdW90OyAmbHQ7T3BlblJNQ0BPQ1AtQWxsLmdyb3Vwcy5pbyZn
dDssICZxdW90O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZxdW90Ow0KICZsdDtvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmcmZ3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPltPQ1BdIE9wZW4gU291cmNl
IEZpcm13YXJlIE1lZXR1cEBPQ1AgR2xvYmFsIFN1bW1pdDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UZWFtLDwvc3Bhbj48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+Rm9yIHRob3NlIG9mIHlvdSBwbGFu
bmluZyB0byBhdHRlbmQgT0NQIEdsb2JhbCBzdW1taXQgKjxiPnRoaXM8L2I+KiB3ZWVrIEANCjxh
IGhyZWY9Imh0dHBzOi8vd3d3Lm9wZW5jb21wdXRlLm9yZy9zdW1taXQvZ2xvYmFsLXN1bW1pdCI+
MjAxOSBPQ1AgR2xvYmFsIFN1bW1pdDwvYT4sIHBsZWFzZSBjaGVjayBvdXQgdGhlIHBvc3QgYWJv
dXQgdGhlIG1lZXR1cCBADQo8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PGEgaHJlZj0iaHR0cHM6Ly93d3cu
b3BlbmNvbXB1dGUub3JnL25ld3Mvb3Blbi1zb3VyY2UtZmlybXdhcmUtbWVldHVwLWF0LXRoZS0y
MDE5LW9jcC1nbG9iYWwtc3VtbWl0LWNhbGwtZm9yLXBhcnRpY2lwYXRpb24iPmh0dHBzOi8vd3d3
Lm9wZW5jb21wdXRlLm9yZy9uZXdzL29wZW4tc291cmNlLWZpcm13YXJlLW1lZXR1cC1hdC10aGUt
MjAxOS1vY3AtZ2xvYmFsLXN1bW1pdC1jYWxsLWZvci1wYXJ0aWNpcGF0aW9uPC9hPi48L3NwYW4+
PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjExLjBwdCI+Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNvbW11bml0eSBtZW1iZXJzIGNh
bWUgdXAgd2l0aCBmZXcgdG9waWMgc3RyZWFtcyBmb3IgdGhpcyBtZWV0dXAgb3Bwb3J0dW5pdHkg
YXJlIGNhcHR1cmVkIEANCjxhIGhyZWY9Imh0dHBzOi8vZG9jcy5nb29nbGUuY29tL3NwcmVhZHNo
ZWV0cy9kLzFjS0FZRlAyZkVoZ0JvRUJqR3JDck9BcTYtMDFueVg1M005cnJMYUp4bGs0L2VkaXQj
Z2lkPTAiPg0KaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vc3ByZWFkc2hlZXRzL2QvMWNLQVlGUDJm
RWhnQm9FQmpHckNyT0FxNi0wMW55WDUzTTlyckxhSnhsazQvZWRpdCNnaWQ9MDwvYT4NCjwvc3Bh
bj48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250
LXNpemU6MTEuMHB0Ij4mbmJzcDs8L3NwYW4+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+V2lsbCBsb29rIGZvcndhcmQg
dG8gbWVldGluZyB5b3UgYXQgdGhpcyBtZWV0dXAgdG8gYWNjZWxlcmF0ZSBlZmZvcnRzIGluIG9w
ZW4gc291cmNlIGZpcm13YXJlLiBQbGVhc2UgcmVhY2ggb3V0IHRvIG1lIGFuZC9vciBwcm9qZWN0
IGxlYWRzIGZvciBtb3JlIGluZm8uPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzwvc3Bhbj48bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6
MTEuMHB0Ij5UaGFua3MsPC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlNhaS48L3NwYW4+PG86cD48L286cD48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
Jm5ic3A7PC9zcGFuPjxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPiZuYnNwOzwvc3Bhbj48bzpwPjwvbzpwPjwvcD4NCjwv
ZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_C837774ECE474E78840150DBA0CA97FAfbcom_--
