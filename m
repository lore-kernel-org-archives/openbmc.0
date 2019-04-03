Return-Path: <prvs=999640231c=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=999640231c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="UrK8W+5s"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Eg2mZLfU"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ZMlP2XXGzDqJT
 for <openbmc@lists.ozlabs.org>; Thu,  4 Apr 2019 10:30:55 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x33NT3XB025644
 for <openbmc@lists.ozlabs.org>; Wed, 3 Apr 2019 16:30:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=99RFJnKxvNzLCoPWMHAwagaPU1uI8pOor/uzYn3hxd4=;
 b=UrK8W+5s7PqEFU4lYopiHmxQKWdyZCqDyWcejQxHX8+VOVtNwwSKFgMLNeSa5U6YJzhS
 LInP+U7T960OpgWdvkEih8DAZCEX4anvrDwOdnnTg4QkvIHgN38zBT+Xmgn535rMIyV6
 0Av1trwnxeKysPD9qUDzomLV87qQ/Hqi9rc= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rn4ycra67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 03 Apr 2019 16:30:52 -0700
Received: from frc-hub03.TheFacebook.com (2620:10d:c021:18::173) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 3 Apr 2019 16:30:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.73) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 3 Apr 2019 16:30:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99RFJnKxvNzLCoPWMHAwagaPU1uI8pOor/uzYn3hxd4=;
 b=Eg2mZLfUiLcPe5dItStCTHOf3qL770xNNcd3ZbS/Yt4yUP1ibrq1Cb/pW8+9RWx4G6MF+Ui+bmTOOYKA18gnbEi54LvB+QQeWzgUSJkIVLUkXTt57yYfgnrd1KlEVZoMq1kG+9j754LjpxqhvvfPHbnD2oaOLh4tFx1C0iAz3iY=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1896.namprd15.prod.outlook.com (10.172.78.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Wed, 3 Apr 2019 23:30:50 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1750.017; Wed, 3 Apr 2019
 23:30:49 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: persistent storage
Thread-Topic: persistent storage
Thread-Index: AQHU6nVFORxGSnW7j0C0dlMlVs4xQw==
Date: Wed, 3 Apr 2019 23:30:49 +0000
Message-ID: <7D170914-3A20-47F5-A66D-774B51CFF076@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::1:b663]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceca413c-e42d-4793-db0e-08d6b88c680a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CY4PR15MB1896; 
x-ms-traffictypediagnostic: CY4PR15MB1896:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CY4PR15MB18961F37124644ABC7FF6A21DD570@CY4PR15MB1896.namprd15.prod.outlook.com>
x-forefront-prvs: 0996D1900D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(39860400002)(346002)(396003)(189003)(199004)(106356001)(54896002)(36756003)(6506007)(3480700005)(53936002)(6306002)(82746002)(186003)(256004)(476003)(25786009)(6916009)(97736004)(558084003)(8676002)(33656002)(221733001)(14454004)(46003)(478600001)(6116002)(5660300002)(2906002)(2616005)(99286004)(105586002)(6436002)(6512007)(7736002)(102836004)(81166006)(81156014)(8936002)(86362001)(486006)(7116003)(6486002)(316002)(83716004)(71190400001)(71200400001)(9326002)(68736007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1896;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NunXwyF44lF4UFAuZVz0k6b1k1CHy5zGBMwVgw1fRoes+ZDITzwl5NsJPnOBBMqx1bPHSEtE/jyOOkvQyiDqUnubV9JCHIe2UeMccPLZgvC84WpzuwztKOGG/s1APTJ2ExFZDAIVb0pj+miq7posz3S+nWPWPTHSi24CdziKdVFmCrpJS+Fz3BQqNTUUKvfnaR2Qabf47ibNXf7wNYScUzRjnYCMtJLINkwaOkr1J9C3ZVN9QmN/nSvIV3kVxmMf3yC+N/FgXJ0CaQA4mkmaglV3FDAzTRfJm8NUYSEEoQAvh9gGLFRXfDaLFMFY8Yaq2wCQFxmBw41i8JjJD3h6G6tqYDEBMyZx8+7jESWStx+D1YgksYcqEeQh/yF+Uu1tNHUMouILMF3qPKb+BXxqu5E15RC1kADA8a1yEMFiTW0=
Content-Type: multipart/alternative;
 boundary="_000_7D1709143A2047F5A66D774B51CFF076fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ceca413c-e42d-4793-db0e-08d6b88c680a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2019 23:30:49.9597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1896
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-03_14:, , signatures=0
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
X-List-Received-Date: Wed, 03 Apr 2019 23:30:58 -0000

--_000_7D1709143A2047F5A66D774B51CFF076fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQpIb3cgYXJlIHdlIHN0b3JpbmcgcGVyc2lzdGVudCBkYXRhIGluIG9wZW5ibWMuIEFueSBk
YXRhIGxpa2UgQmlvcyB2ZXJzaW9uIG9yIHNvbWV0aGluZyB3ZSBuZWVkIHRvIHNhdmUgYWNyb3Nz
IHJlYm9vdC4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_7D1709143A2047F5A66D774B51CFF076fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <66E34B996AB1794593E69433644EE65E@namprd15.prod.outlook.com>
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
emU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SG93IGFyZSB3ZSBzdG9yaW5nIHBlcnNp
c3RlbnQgZGF0YSBpbiBvcGVuYm1jLiBBbnkgZGF0YSBsaWtlIEJpb3MgdmVyc2lvbiBvciBzb21l
dGhpbmcgd2UgbmVlZCB0byBzYXZlIGFjcm9zcyByZWJvb3QuPG86cD48L286cD48L3NwYW4+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPi1WaWpheTxv
OnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_7D1709143A2047F5A66D774B51CFF076fbcom_--
