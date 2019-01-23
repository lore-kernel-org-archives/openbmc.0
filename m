Return-Path: <prvs=69266c3e89=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69266c3e89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="DmB4/Zy8"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="LkwbbaWP"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43klpV1l9FzDqDf
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 11:02:21 +1100 (AEDT)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0MNtZO6000977
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 16:02:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=9kaq40Mkv+UoBd2QuEcgCyuoyDXIwZw9IaaT/2hoS8I=;
 b=DmB4/Zy8oEntpvn2R8NdVUX4NjQO+o5PayGBxSEvPA1T+rhwPiotg4Lv/Ipt2xVw3Qp/
 bSmHu4qP6Lp5CLpXi937RBs/a/hSttSN0FfzCqsPAjM3UPAPo0r1cvCRtTnVqyNdNTnP
 8k5cSoQQ9zxZBWXA9hyGxbYuoldYV1RVNN4= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q6aut0hb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 16:02:19 -0800
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-hub04.TheFacebook.com (2620:10d:c021:18::174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Tue, 22 Jan 2019 16:02:18 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.73) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Tue, 22 Jan 2019 16:02:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kaq40Mkv+UoBd2QuEcgCyuoyDXIwZw9IaaT/2hoS8I=;
 b=LkwbbaWPWKJPM08iZbMPuo/vTnzymlXDt9GNeizLGR3fRwPAYGLm4/kuvP6ZPruA9674DmzdgNmStQ0tRkJChLhIeoBROCHmd0GsZLq8A5AFjITd+z5CJ6KcZVZULGVIlfbgcJf05Z5u2DheOdvunmnr83DfBjlbOvtmpBkiGkY=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1287.namprd15.prod.outlook.com (10.172.181.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.31; Wed, 23 Jan 2019 00:02:17 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Wed, 23 Jan 2019
 00:02:17 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: configuring lpc register from user space
Thread-Topic: configuring lpc register from user space
Thread-Index: AQHUsq7mJL8Gq6TnZUm014bNCUUaiw==
Date: Wed, 23 Jan 2019 00:02:16 +0000
Message-ID: <898F383C-6AB8-4AF0-91F4-680CA01C2D50@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:5da0]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1287;
 20:5XQsUE13N3mM5Ju6NSx33yoqKyLnAki05A6CBRBZNuiQyJsgW7dy3G61vvo8NkhEK+Jt1rfdlzv0L11TXbSUMRMnz+KVi0XKn6iLyvBZezrNybu6VjTLFaikdbqxKIvK0VeFfEw8Z18+FZ32FWCbet+A9iLNXZ9faXOOwSMIG2M=
x-ms-office365-filtering-correlation-id: 85fa0e96-63c9-4fc8-29ac-08d680c60975
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1287; 
x-ms-traffictypediagnostic: CY4PR15MB1287:
x-microsoft-antispam-prvs: <CY4PR15MB1287B69B1D2DF773D6854DEDDD990@CY4PR15MB1287.namprd15.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(346002)(396003)(39860400002)(376002)(199004)(189003)(102836004)(2906002)(5640700003)(6506007)(81166006)(97736004)(81156014)(82746002)(7736002)(83716004)(6116002)(186003)(71190400001)(71200400001)(99286004)(476003)(36756003)(1730700003)(8676002)(2616005)(558084003)(486006)(6436002)(2351001)(105586002)(256004)(6486002)(2501003)(25786009)(33656002)(316002)(106356001)(8936002)(6916009)(54896002)(86362001)(478600001)(6306002)(6512007)(14454004)(68736007)(53936002)(46003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1287;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ANYlpp5Yhp7l/I5RqAlmmjQ38TORElcQ25yYyKYbXssiM2Kah/g4AEID94LmL5/uVxP2yjF7coZEKyvWwyJG6Wr2hzW5Sg+OnNxq9ccZYHWiKTbksaCA1vc5XmkKSkfRxU1Y1/bvHpEdOVupJEc8x0YzOC2I88/9Um/3qGU7Ij3CkPLvH882AUxBR+iW/b3Qt845VnaIXsoqmMF7qnOWh3h4Y/IbnrV9YwpdNWXr37KGjYlbRxV7V6wJBxKe4Zr+SjTX1+rabkVvRnLu6gCGtgN6LEPZt7n2CtOkNoO1aJlVGnAZDWjClvOamfPxQXv0AFMJQABp4vuPbi5qMB3jMOiw20aeWw/VyFc4kmewQfJW7GPUY6b0BnKTXnj3NzvQ5isoTXDM/ZU25Tu3Mny8LLf4UCy6ODxShgeEypJIAPA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_898F383C6AB84AF091F4680CA01C2D50fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 85fa0e96-63c9-4fc8-29ac-08d680c60975
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 00:02:16.8807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1287
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-22_12:, , signatures=0
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
X-List-Received-Date: Wed, 23 Jan 2019 00:02:26 -0000

--_000_898F383C6AB84AF091F4680CA01C2D50fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkga25vdyAvZGV2L21lbSBpcyBub3Qgc3VwcG9ydGVkIGluIHByb2R1Y3Rpb24sIEkg
bmVlZCB0byBjb25maWd1cmUgc29tZSBscGMgcmVnaXN0ZXIgdG8gcm91dGUgdWFydCBvdXRwdXQs
IHNvIHBsZWFzZSBzdWdnZXN0IHdoYXQgaXMgdGhlIGJlc3Qgd2F5cyB0byBkbyB0aGUgc2FtZS4g
SXMgdGhlcmUgYW55IGFwcGxpY2F0aW9uIG9yIGRyaXZlciBpbnRlcmZhY2UgYXZhaWxhYmxlIHdo
aWNoIGNhbiBiZSB1c2VkIHRvIHNldCBzb21lIGxwYyByZWdpc3RlciBsaWtlIDB4MUU3ODkwOUMu
DQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_898F383C6AB84AF091F4680CA01C2D50fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <86F68C8B6E4FC84082AC352E5F944BB8@namprd15.prod.outlook.com>
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
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGtub3cgL2Rldi9tZW0gaXMgbm90
IHN1cHBvcnRlZCBpbiBwcm9kdWN0aW9uLCBJIG5lZWQgdG8gY29uZmlndXJlIHNvbWUgbHBjIHJl
Z2lzdGVyIHRvIHJvdXRlIHVhcnQgb3V0cHV0LCBzbyBwbGVhc2Ugc3VnZ2VzdCB3aGF0IGlzIHRo
ZSBiZXN0IHdheXMgdG8gZG8gdGhlIHNhbWUuIElzIHRoZXJlIGFueSBhcHBsaWNhdGlvbiBvciBk
cml2ZXIgaW50ZXJmYWNlDQogYXZhaWxhYmxlIHdoaWNoIGNhbiBiZSB1c2VkIHRvIHNldCBzb21l
IGxwYyByZWdpc3RlciBsaWtlIDB4MUU3ODkwOUMuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_898F383C6AB84AF091F4680CA01C2D50fbcom_--
