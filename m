Return-Path: <prvs=69266c3e89=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69266c3e89=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="FIt3ZQjR"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="BrFm4F9G"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43lFbN068HzDqH6
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jan 2019 06:24:31 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0NJNeSY019184; Wed, 23 Jan 2019 11:24:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=facebook;
 bh=sqRyzJT2DvMnSzpzij66BtS/y9cu2w3l6rlKPgJIWF8=;
 b=FIt3ZQjRKI6mdHZf/4LG9nvI9KYZYI/0DRb8z/07gcKsBPCWNf/++4UR1Qpdk6e0VkLd
 Jv8aJAsQzTh46AuP3ObD6hoAlIC8U2IITTJRib5oD4z2yg7fqBE6H/kOVrHgh6yltrBF
 igThNT36kI3H0EcU366UaE0J0na3hI2h2GE= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2q6w68899b-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 23 Jan 2019 11:24:14 -0800
Received: from frc-hub02.TheFacebook.com (2620:10d:c021:18::172) by
 frc-hub02.TheFacebook.com (2620:10d:c021:18::172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 23 Jan 2019 11:23:29 -0800
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.72) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Wed, 23 Jan 2019 11:23:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqRyzJT2DvMnSzpzij66BtS/y9cu2w3l6rlKPgJIWF8=;
 b=BrFm4F9GIocnb9GFD0IJUMOTppLtKkiBeMKxY24sUjRHSTS+/c0G6Zw8OEoj0v1Or1HcuZtUe/EikNt2kn48ebAPSQGK2XLEyjBT67O8waRqcfLdgDIS5r9ngz9c5tr2/ezxmnS19PxbPodqYgexnfqoa4h3UOsUxpPamOxGCps=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1349.namprd15.prod.outlook.com (10.172.157.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.29; Wed, 23 Jan 2019 19:23:14 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b4e4:1e1f:8c5d:9a8c%4]) with mapi id 15.20.1537.031; Wed, 23 Jan 2019
 19:23:14 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "james.feist@linux.intel.com" <james.feist@linux.intel.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Ed Tanous <ed.tanous@intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, Amithash Prasad <amithash@fb.com>
Subject: dbus sensors workaround for ADC
Thread-Topic: dbus sensors workaround for ADC
Thread-Index: AQHUs1EWFIrKtWTq8kKtfJA1NbG8wQ==
Date: Wed, 23 Jan 2019 19:23:14 +0000
Message-ID: <CC84A2B4-B1BD-417E-998F-F0178FED2569@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:90a4]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1349;
 20:xgSsCH7md6AS2O1VSYHin2bLhp48XEKYcw21rxXrVB6LXwJUv3nSrZHkvJOdP9ORBqi+LeGMHJxFEM2AqOvY+5ZDE/N8KamO6QQR3IMUo76SfvYST1beG/YVN9bKCdlXQIOlfRdSYoGy6KC4yUu7Q2n84jodplX3sRf/2IqAUic=
x-ms-office365-filtering-correlation-id: ebaef518-32ff-4484-d876-08d681683893
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1349; 
x-ms-traffictypediagnostic: CY4PR15MB1349:
x-microsoft-antispam-prvs: <CY4PR15MB1349B234C41CBD1BA366ADF2DD990@CY4PR15MB1349.namprd15.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(71190400001)(71200400001)(83716004)(25786009)(68736007)(8676002)(105586002)(102836004)(106356001)(33656002)(256004)(82746002)(6486002)(6436002)(2906002)(14454004)(36756003)(6116002)(4326008)(558084003)(478600001)(316002)(110136005)(99286004)(53936002)(6306002)(9326002)(7736002)(54896002)(8936002)(486006)(46003)(86362001)(6506007)(97736004)(81156014)(81166006)(2501003)(476003)(54906003)(2616005)(186003)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1349;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8kHABzrT8QaIMnsUzSqB7wu0G5YIp+WNgaZoTEg61rGPYzg0VxGE8SK+69cIym3a8rpMPiYgkHzsfGpuAtNwaVGYbpYfSsFCAOF/WoJw4w+7pmR1GJ/jE8uhkml1/ackJCIYZinkkjaGJO8vh9BG7+kCR1Z2tV+ZBcuwaPBJpzh7P2sL2SvY57wjXm5hlV9QyquCJRAJeMTqppfVlfWu8Hy9/S05sWmYBgz5TcYI6bpQVv3aka1hhftGdD3XovOmoM59mJ7LSTl3D1wShpM9N/Ci7DNzAPfelSc4UwhqgMj5GakLpIgpb3xy8W0w5HdDlKVT3bJejVHggCbiySEy5RN6ESGxNimBp4CwkIXQiYrBK1xAwsqj6RYRN3H+0AQaFWZZQjTKN4fgLiSISK6W+2WzR98DeG9YLQmbDLxW4W4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_CC84A2B4B1BD417E998FF0178FED2569fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ebaef518-32ff-4484-d876-08d681683893
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 19:23:14.3892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1349
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-23_10:, , signatures=0
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
X-List-Received-Date: Wed, 23 Jan 2019 19:24:33 -0000

--_000_CC84A2B4B1BD417E998FF0178FED2569fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSmFtZXMsDQpBbnkgcGxhbiBmb3IgZml4aW5nIHdvcmthcm91bmQgbGlrZSBvZW1uYW1lIGZv
ciBBREMgc2Vuc29ycy4gQmVjYXVzZSBJIGFtIHVzaW5nIGludGVybmFsbHkgb2VtbmFtZXMgaW4g
bXkgZGV2aWNlIHRyZWUgYXMgYSB3b3JrYXJvdW5kIGJ1dCB1cHN0cmVhbSBpbWFnZSB3b27igJl0
IHdvcmsgZm9yIHVzLg0KDQpSZWdhcmRzDQotVmlqYXkNCg==

--_000_CC84A2B4B1BD417E998FF0178FED2569fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <EF2CEDAFC0ED6A49BD7CB100CAEDB3CA@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSBKYW1lcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+QW55IHBsYW4gZm9yIGZpeGlu
ZyB3b3JrYXJvdW5kIGxpa2Ugb2VtbmFtZSBmb3IgQURDIHNlbnNvcnMuIEJlY2F1c2UgSSBhbSB1
c2luZyBpbnRlcm5hbGx5IG9lbW5hbWVzIGluIG15IGRldmljZSB0cmVlIGFzIGEgd29ya2Fyb3Vu
ZCBidXQgdXBzdHJlYW0gaW1hZ2Ugd29u4oCZdCB3b3JrIGZvciB1cy48bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZp
amF5PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_CC84A2B4B1BD417E998FF0178FED2569fbcom_--
