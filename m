Return-Path: <prvs=9016753e1d=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=9016753e1d=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="b2ZTl8qr"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Kb3P6XGe"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44pXs764MNzDqNd
 for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2019 05:02:59 +1000 (AEST)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3NJ08Iu030467
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 12:02:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=ACXQW0WpK2zygL51vr6UymvqmiG9D4hVZHEzbuumZ9Y=;
 b=b2ZTl8qr9BkkEVpwZYt/0jlOHi1HOMe0ROKRziZKYJT5UI3dqQr1Q16iOCiWup4SjwiK
 Zw8F+9Yk+BsH4PYsiMlxCeEjQd40ty7QKksAM8JlBmMX3zwCiuKa0dOsEognWpzsn6Jt
 8n2FBYoZVgInTgt9231kox78bJoH93h0RaM= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2s23d2srda-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Apr 2019 12:02:53 -0700
Received: from frc-mbx07.TheFacebook.com (2620:10d:c0a1:f82::31) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 23 Apr 2019 12:02:48 -0700
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-mbx07.TheFacebook.com (2620:10d:c0a1:f82::31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 23 Apr 2019 12:02:47 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.72) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 23 Apr 2019 12:02:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ACXQW0WpK2zygL51vr6UymvqmiG9D4hVZHEzbuumZ9Y=;
 b=Kb3P6XGeC3lAPYKYk4nmxl/YRH8JsZGpfIz6NlYpMAEE0mp62IYg5vFmnSz/v2bvqlDEyHUhCzWlnfsSHvXF/BXXKeE0ra9cUA1rvI5S+AQp2hR96P13atoUUjWI1bSqMDxWo7llZLlsJruiDY16WfLhqagxKj9MBVRsBMuDpdo=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1840.namprd15.prod.outlook.com (10.174.255.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.12; Tue, 23 Apr 2019 19:02:46 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::40b7:3dba:5bd6:52fa]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::40b7:3dba:5bd6:52fa%5]) with mapi id 15.20.1813.017; Tue, 23 Apr 2019
 19:02:46 +0000
From: Sai Dasari <sdasari@fb.com>
To: Openbmc <openbmc@lists.ozlabs.org>
Subject: OpenBMC Track @ OSFC
Thread-Topic: OpenBMC Track @ OSFC
Thread-Index: AQHU+gcjl083PIoH70KrMEGI74Slaw==
Date: Tue, 23 Apr 2019 19:02:46 +0000
Message-ID: <C80BF19D-BEEE-499C-AEC3-56DB2FA12734@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:1507]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e34fa7a-e708-4fe1-5c77-08d6c81e45bc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MWHPR15MB1840; 
x-ms-traffictypediagnostic: MWHPR15MB1840:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <MWHPR15MB184076E77A0F45007BAEAA57CE230@MWHPR15MB1840.namprd15.prod.outlook.com>
x-forefront-prvs: 0016DEFF96
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(39860400002)(396003)(366004)(346002)(189003)(199004)(86362001)(410100003)(76116006)(6916009)(6486002)(316002)(66946007)(8676002)(71190400001)(66476007)(66446008)(36756003)(66556008)(606006)(83716004)(81166006)(71200400001)(7736002)(64756008)(82746002)(73956011)(81156014)(14444005)(8936002)(25786009)(97736004)(256004)(2906002)(236005)(6512007)(2616005)(6306002)(186003)(68736007)(6506007)(53936002)(6116002)(6436002)(102836004)(54896002)(486006)(99286004)(476003)(478600001)(14454004)(966005)(4744005)(33656002)(5660300002)(46003)(15940465004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1840;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2t4unxX5wY0Fwudd3HQxMnI87ekrdLSoToRNsRklZZZTBHlD4ykr755RAce5zH7BC8wQ8Dc5+8o5hR1Joj3GrXleqQEuz6XKAN2qNOt9SeKYL+pLFAhV+gwQGIAeLVQ8gL1/uh8X83mkOQTzdHBefN103ITQ/qoIAH3TTWPLcmv4cR+0B5OPf5ZdeEfZwpnuwgJNVkFSz0svNnkhwv26hyl5kGo45QCFlgcR3l1G4fl2OdjFU2jGHocFv74ctHRgaJQLQ4T0VkNjSORWfY+/44NutaXUwB+N79R9W26qIn2XSDQHbJvF+3vl2Nic6Hx0JtONjZwjoBXz08YcjwowNIJHZ9wlZTMAeW45kB64tgIOkorI1+yiuWc3iuQOt+uFFyLqWM2blqrXRkpAljVPuEHZ4taeG4Xj1lXtKbkpPxU=
Content-Type: multipart/alternative;
 boundary="_000_C80BF19DBEEE499CAEC356DB2FA12734fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e34fa7a-e708-4fe1-5c77-08d6c81e45bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2019 19:02:46.2799 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1840
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-23_06:, , signatures=0
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
X-List-Received-Date: Tue, 23 Apr 2019 19:03:09 -0000

--_000_C80BF19DBEEE499CAEC356DB2FA12734fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCg0KVGhlIE9wZW4gU291cmNlIEZpcm13YXJlIENvbmZlcmVuY2UgKE9TRkMpIGlzIGhh
cHBlbmluZyA5LzMg4oCTIDkvNiBpbiBCYXkgQXJlYSwgQ0EsIFVTQS4gVGhlIGRldGFpbHMgb2Yg
dGhlIGNvbmZlcmVuY2UgY2FuIGJlIGZvdW5kIEAgaHR0cHM6Ly9vc2ZjLmlvLyBhbmQgRllJLCB0
aGlzIGlzIGEgKnBhaWQqIGV2ZW50IHdpdGggcHJpY2luZyBpbmZvIEAgaHR0cHM6Ly9vc2ZjLmlv
L3RpY2tldHMNCg0KVGhlIGNvbmZlcmVuY2UgZm9ybWF0IHdpbGwgYmUgMi1kYXkgb2YgcHJlc2Vu
dGF0aW9ucyAoOS8zLCA5LzQpIGZvbGxvd2VkIGJ5IDItZGF5IGhhY2thdGhvbiAoOS81LCA5LzYp
Lg0KDQpUaGUgb3JnYW5pemVycyBhcmUgb3BlbiB0byBwcm92aWRlIGEgc2VwYXJhdGUgT3BlbkJN
QyB0cmFjayBpZiB0aGVyZSBpcyBlbm91Z2ggYXR0ZW5kYW5jZSBmcm9tIG91ciBPcGVuQk1DIGNv
bW11bml0eSBwcm9qZWN0LiBJZiB5b3UgYXJlIHBsYW5uaW5nIHRvIGF0dGVuZCwgcmVxdWVzdCBh
ZGRpbmcgeW91cnNlbGYgdG8gdGhlIHNoYXJlZCBkb2NADQpodHRwczovL2RvY3MuZ29vZ2xlLmNv
bS9zcHJlYWRzaGVldHMvZC8xSFczSVRfRm5mQW13LUtpTWN1TFpVczdLVlpQU3pKaXBRdzVKVFNL
R2dyOC9lZGl0P3VzcD1zaGFyaW5nDQoNClBsZWFzZSBmaWxsIHRoaXMgYmVmb3JlIG5leHQgVHVl
c2RheSAqNC8zMCogdG8gcGxhbiBmb3IgYWRkaW5nIE9wZW5CTUMgdHJhY2sgdG8gdGhlIE9TRkMg
c2NoZWR1bGUsIGlmIGVub3VnaCBjb21tdW5pdHkgaW50ZXJlc3QuDQoNClRoYW5rcywNClNhaS4N
Cg0KDQoNCg0K

--_000_C80BF19DBEEE499CAEC356DB2FA12734fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <50AF3396A7D294428946DE39B06A2230@namprd15.prod.outlook.com>
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
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5UZWFtLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+VGhlIE9wZW4gU291cmNlIEZpcm13YXJlIENvbmZlcmVuY2UgKE9TRkMpIGlzIGhhcHBlbmlu
ZyA5LzMg4oCTIDkvNiBpbiBCYXkgQXJlYSwgQ0EsIFVTQS4gVGhlIGRldGFpbHMgb2YgdGhlIGNv
bmZlcmVuY2UgY2FuIGJlIGZvdW5kIEANCjwvc3Bhbj48YSBocmVmPSJodHRwczovL29zZmMuaW8v
Ij5odHRwczovL29zZmMuaW8vPC9hPiBhbmQgRllJLCB0aGlzIGlzIGEgKjxiPnBhaWQ8L2I+KiBl
dmVudCB3aXRoIHByaWNpbmcgaW5mbyBADQo8YSBocmVmPSJodHRwczovL29zZmMuaW8vdGlja2V0
cyI+aHR0cHM6Ly9vc2ZjLmlvL3RpY2tldHM8L2E+PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0i
TXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPlRoZSBjb25mZXJlbmNlIGZvcm1hdCB3aWxsIGJlIDItZGF5IG9mIHByZXNlbnRh
dGlvbnMgKDkvMywgOS80KSBmb2xsb3dlZCBieSAyLWRheSBoYWNrYXRob24gKDkvNSwgOS82KS4N
CjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhlIG9yZ2FuaXpl
cnMgYXJlIG9wZW4gdG8gcHJvdmlkZSBhIHNlcGFyYXRlIE9wZW5CTUMgdHJhY2sgaWYgdGhlcmUg
aXMgZW5vdWdoIGF0dGVuZGFuY2UgZnJvbSBvdXIgT3BlbkJNQyBjb21tdW5pdHkgcHJvamVjdC4g
SWYgeW91IGFyZSBwbGFubmluZyB0byBhdHRlbmQsIHJlcXVlc3QgYWRkaW5nIHlvdXJzZWxmIHRv
IHRoZSBzaGFyZWQgZG9jQDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48YSBocmVmPSJodHRwczovL2RvY3Mu
Z29vZ2xlLmNvbS9zcHJlYWRzaGVldHMvZC8xSFczSVRfRm5mQW13LUtpTWN1TFpVczdLVlpQU3pK
aXBRdzVKVFNLR2dyOC9lZGl0P3VzcD1zaGFyaW5nIj5odHRwczovL2RvY3MuZ29vZ2xlLmNvbS9z
cHJlYWRzaGVldHMvZC8xSFczSVRfRm5mQW13LUtpTWN1TFpVczdLVlpQU3pKaXBRdzVKVFNLR2dy
OC9lZGl0P3VzcD1zaGFyaW5nPC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+UGxlYXNlIGZpbGwgdGhpcyBiZWZvcmUgbmV4dCBUdWVzZGF5ICo8Yj40LzMwPC9i
PiogdG8gcGxhbiBmb3IgYWRkaW5nIE9wZW5CTUMgdHJhY2sgdG8gdGhlIE9TRkMgc2NoZWR1bGUs
IGlmIGVub3VnaCBjb21tdW5pdHkgaW50ZXJlc3QuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5UaGFua3MsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlNhaS48bzpwPjwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_C80BF19DBEEE499CAEC356DB2FA12734fbcom_--
