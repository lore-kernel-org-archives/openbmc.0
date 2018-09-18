Return-Path: <prvs=2799d38cdb=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=2799d38cdb=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="m3TklZES"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="NrYUo9Zr"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42FDJC68RnzF3JR
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 05:55:48 +1000 (AEST)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w8IJoJvc011820
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 12:55:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=zL0N3hux1qKbrMM8SshFGaUGc7GcVtVHAD6bxvoIXCk=;
 b=m3TklZESOWwGFZmfaVWD9A4QV+8gtHDB2p+csoniVhyPEwV9+IWkwr3cktAFggH3jyfx
 3xr7PBfp2Xl4oIIbEOWiw/anwTsxi2KTKi3J3tGTYgfe/SvEsA4BCDG5RmQyB8mtHiYa
 WozyrrJq8/nz9MOAdTsmtZpNx8rTo9Aw4j0= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2mk524sc7g-8
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 12:55:46 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.22) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Tue, 18 Sep 2018 12:55:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zL0N3hux1qKbrMM8SshFGaUGc7GcVtVHAD6bxvoIXCk=;
 b=NrYUo9ZrQVU0px7Q0BuNy2/5P8lsk2y1mbFnl7di8MD2aIixb8KQL5a0mj4P86/66A4GL+q4t/ChOrVajAOvJDCU2hNWosYBdNqV2epyhG6Jde8SSoA8ptd4L2rj6ukyo9XNPpP6Lb2bTAZCOF8ZBw4Weuc0XEgGAqn8oRQntsU=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1535.namprd15.prod.outlook.com (10.173.235.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1143.17; Tue, 18 Sep 2018 19:55:26 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::853e:9e1f:97d1:71d6%7]) with mapi id 15.20.1143.017; Tue, 18 Sep 2018
 19:55:26 +0000
From: Sai Dasari <sdasari@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: OpenBMC Hackathon @ OpenPower Summit?
Thread-Topic: OpenBMC Hackathon @ OpenPower Summit?
Thread-Index: AQHUT4mLT0VpDUCnykiHSSnL3y5CKw==
Date: Tue, 18 Sep 2018 19:55:26 +0000
Message-ID: <E434E069-640B-40A5-A08D-6FF893B41182@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:bc75]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1535;
 20:9dr6g5+Csp9HVD53Tqk79p2Min2cC0kmb/69H9eh08+scXI9O4VVdqsDwGb0xzSiDEVVRf0HaW7IAC2COq2aZqTxijuRmnbHx8y7bYoa77M6IwU8o6sH7alku+nlgdXYoE+liuKnZFk7EpfmbKOZ5vC74G3gPH9/+yO+UCrf+kI=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: f860f955-27a0-4197-a5c9-08d61da0adc9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1535; 
x-ms-traffictypediagnostic: MWHPR15MB1535:
x-microsoft-antispam-prvs: <MWHPR15MB15358D3FB2F8ADFE86309E12CE1D0@MWHPR15MB1535.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(28532068793085)(21748063052155);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(11241501184)(944501410)(52105095)(93006095)(93001095)(10201501046)(149027)(150027)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(201708071742011)(7699050);
 SRVR:MWHPR15MB1535; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1535; 
x-forefront-prvs: 0799B1B2D7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(346002)(366004)(136003)(199004)(189003)(316002)(83716003)(99286004)(236005)(14454004)(6512007)(7736002)(46003)(6916009)(53936002)(5250100002)(82746002)(102836004)(5660300001)(86362001)(36756003)(256004)(8676002)(54896002)(558084003)(68736007)(6306002)(81166006)(2906002)(2616005)(81156014)(478600001)(8936002)(105586002)(476003)(106356001)(966005)(6436002)(25786009)(97736004)(6506007)(790700001)(6486002)(6116002)(33656002)(186003)(606006)(486006)(2900100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1535;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: KJZFaoroYBujxvpB7GEoXV9R2NeSSgQ4RFOZoIP9clXnZZXEatSp2izozGjVXbCJpf9X0BlyBijWr0N149ZSqj82sTeMohQKjNlESRt+BSVCbULAwAtPaRLjeFw1PP+ij1QippK05ia9nKlIFGLS5EjnGAzq7P7C3q5nk7sUF3gq+3PHJhf93M6hOeK9ZskBWf+iNePTXzLn1L6fCMUYLnfULDtlUt8dMFOf8qJsM5xpqvN+wklk/D1ldzm4cLg5UDNBdrgAu2H4R1oLa1nkUOGrwKzWCIFsQ/NZciGEbbp0fowmAN3RbJs/lgO9jTy5OCYjz4pYN7826XQvFGpTRHNR6PetMc94kYsZeE5lg4g=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_E434E069640B40A5A08D6FF893B41182fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f860f955-27a0-4197-a5c9-08d61da0adc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2018 19:55:26.5348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1535
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
X-List-Received-Date: Tue, 18 Sep 2018 19:55:57 -0000

--_000_E434E069640B40A5A08D6FF893B41182fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aHR0cHM6Ly9vcGVucG93ZXJmb3VuZGF0aW9uLm9yZy9zdW1taXQtMjAxOC0xMC1ldS8NCg0KVGVh
bSwNCg0KU2F3IGFib3ZlIGFnZW5kYSBtZW50aW9uaW5nIOKAnE9wZW5CTUMgSGFja2F0aG9u4oCd
IGFuZCB3b25kZXJpbmcgYW55IGZ1cnRoZXIgZGV0YWlscyBvbiB3aG8gZnJvbSB0aGlzIHRlYW0g
aXMgcGxhbm5pbmcgdG8gYXR0ZW5kLg0KDQpUaGFua3MsDQpTYWkuDQo=

--_000_E434E069640B40A5A08D6FF893B41182fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <DBF209C82E0725429E8FE3B7170CEB02@namprd15.prod.outlook.com>
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
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48YSBocmVmPSJodHRwczov
L29wZW5wb3dlcmZvdW5kYXRpb24ub3JnL3N1bW1pdC0yMDE4LTEwLWV1LyI+aHR0cHM6Ly9vcGVu
cG93ZXJmb3VuZGF0aW9uLm9yZy9zdW1taXQtMjAxOC0xMC1ldS88L2E+PG86cD48L286cD48L3Nw
YW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4w
cHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UZWFtLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpw
PiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHls
ZT0iZm9udC1zaXplOjExLjBwdCI+U2F3IGFib3ZlIGFnZW5kYSBtZW50aW9uaW5nIOKAnE9wZW5C
TUMgSGFja2F0aG9u4oCdIGFuZCB3b25kZXJpbmcgYW55IGZ1cnRoZXIgZGV0YWlscyBvbiB3aG8g
ZnJvbSB0aGlzIHRlYW0gaXMgcGxhbm5pbmcgdG8gYXR0ZW5kLjxvOnA+PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48
bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxw
IGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5TYWkuPG86
cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_E434E069640B40A5A08D6FF893B41182fbcom_--
