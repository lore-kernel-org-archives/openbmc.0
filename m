Return-Path: <prvs=588929426e=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=588929426e=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="FssDuBWk"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="Z+iu8ZL8"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43JdL55YNrzDqgB
 for <openbmc@lists.ozlabs.org>; Tue, 18 Dec 2018 10:54:36 +1100 (AEDT)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.27/8.16.0.27) with SMTP id wBHNra5D026082
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 15:54:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=facebook;
 bh=HvstUsz31eeIq5ZDCvTtK9jhBSxh376IQs7VbB9LrvA=;
 b=FssDuBWkQfDxh59C+Yb+bpr9q8jEkTfS+gWh8ZQBh8qqqz+3aiRJBSF3ufUubf4yxdHm
 okVUu07i3WSrhFxfvFASITZOb0jc3YM+J/DOFLlR5MZgHoZnmqKf9T7qyXlfFFNxBivM
 Ir5+4v2YLnN47mqoVWVqt49wSNOedA8P1Kw= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by m0089730.ppops.net with ESMTP id 2pek880k0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Dec 2018 15:54:33 -0800
Received: from frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 17 Dec 2018 15:54:33 -0800
Received: from frc-hub06.TheFacebook.com (2620:10d:c021:18::176) by
 frc-mbx05.TheFacebook.com (2620:10d:c0a1:f82::29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 17 Dec 2018 15:54:32 -0800
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.76) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 17 Dec 2018 15:54:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvstUsz31eeIq5ZDCvTtK9jhBSxh376IQs7VbB9LrvA=;
 b=Z+iu8ZL8bkeDiw4JAXD/2vHWSBK5GOXz5x3YGAMTRjtnkxYpLabPGNPWrwOgwiq4n9LhO+UPG9xPJYjWYfg+8j/nRj7nHkPDxmuXolwqPJrF03E7Yne9HqFawvQAolYS76D5hN9hUXLOgap9AxgX1PZusehUax9KvzGJeLZhGaY=
Received: from BN6PR15MB1265.namprd15.prod.outlook.com (10.172.206.15) by
 BN6PR15MB1522.namprd15.prod.outlook.com (10.172.151.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.22; Mon, 17 Dec 2018 23:54:31 +0000
Received: from BN6PR15MB1265.namprd15.prod.outlook.com
 ([fe80::8d61:e841:76f:2fcd]) by BN6PR15MB1265.namprd15.prod.outlook.com
 ([fe80::8d61:e841:76f:2fcd%8]) with mapi id 15.20.1425.021; Mon, 17 Dec 2018
 23:54:31 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Fan speed control
Thread-Topic: Fan speed control
Thread-Index: AQHUlmPa9RVzvtJvukS7iw8SULIx5w==
Date: Mon, 17 Dec 2018 23:54:31 +0000
Message-ID: <4E117ED9-B492-4197-A66F-45949E3D7178@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::7:ddd7]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR15MB1522;
 20:sNF3P5qAp7UO2gSdiL1aZrNINs0iYyhA496nwvzUMdbFyriEzK+AZCscOzES2tsJhmf2EOg8HK72kFGxuEugBnlsfbVPdSIaEerD8wbewkkLbjk4pAarsYyBcGDtjGbm/VQ1uVO9Jghptlfr1MhQ9xYAjFHPLsQ1Mji1Rox/X08=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: dccb25a5-6311-4318-21a5-08d6647afd3e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR15MB1522; 
x-ms-traffictypediagnostic: BN6PR15MB1522:
x-microsoft-antispam-prvs: <BN6PR15MB1522C63FC3ED3214101A8AA6DDBC0@BN6PR15MB1522.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(3230021)(999002)(11241501185)(5005020)(6040522)(2401047)(8121501046)(3231475)(944501520)(52105112)(93006095)(93001095)(3002001)(10201501046)(148016)(149066)(150057)(6041310)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:BN6PR15MB1522; BCL:0; PCL:0; RULEID:; SRVR:BN6PR15MB1522; 
x-forefront-prvs: 08897B549D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(136003)(346002)(376002)(396003)(39860400002)(366004)(199004)(189003)(105586002)(106356001)(68736007)(46003)(7736002)(186003)(25786009)(99286004)(86362001)(6506007)(8936002)(102836004)(8676002)(33656002)(81156014)(316002)(36756003)(6116002)(5660300001)(7116003)(2616005)(2906002)(71200400001)(3480700005)(554214002)(486006)(558084003)(256004)(476003)(81166006)(71190400001)(83716004)(53936002)(82746002)(6512007)(54896002)(478600001)(6916009)(6306002)(97736004)(6486002)(6436002)(14454004)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR15MB1522;
 H:BN6PR15MB1265.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 6BL1WYsHfdQGrbnz/aGDn8ivT1F67El/L7Wq/0wed87T3qVp/6RHpk83l/B1duGY+BfiJ5xUm0IIfQPjppQHUZ0BvQ1/7y31MfYqE6eU6j3YqVnx5ZAjFxUcHtyqt82W6zwIZD/ky1N/tgjcHftFkmQgp+tDaZXUDC7keEfl46FiCe2Ns+DjamjbY4r8bIycE5T7g3K7jaQ/Yl4y5xs0jl7+bkUvaWyjwNqqn2jHHqJr0eDakZ74ALFfBdM+mAs2RZ7/Pjr3TSMvBurp5GXz91ixHjIVtih1XXsLOjWSR7qhqwxAqPMTuSExOwt2GBkf
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_4E117ED9B4924197A66F45949E3D7178fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dccb25a5-6311-4318-21a5-08d6647afd3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2018 23:54:31.5436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1522
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-17_09:, , signatures=0
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
X-List-Received-Date: Mon, 17 Dec 2018 23:54:40 -0000

--_000_4E117ED9B4924197A66F45949E3D7178fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGVhbSwNCkkgYW0gbG9va2luZyBmb3Ig4oCcZmFuIHNwZWVkIGNvbnRyb2zigJ0gZmVhdHVyZSB0
byBlbmFibGUgZm9yIFRpb2dhcGFzcy4gSSB1bmRlcnN0YW5kIHRoYXQgdGhlcmUgYXJlIG1hbnkg
YXBwcm9hY2hlcyBmb3IgdGhpcy4gUGxlYXNlIHBvaW50IG1lIHRvIGFsbCBpbXBsZW1lbnRhdGlv
biBhbmQgYW55IGRldGFpbHMgYWJvdXQgZWFjaCBhcHByb2FjaCwgbWF5IGJlIHNvbWUgcHJvcyBh
bmQgY29ucy4NCg0KUmVnYXJkcw0KLVZpamF5DQo=

--_000_4E117ED9B4924197A66F45949E3D7178fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <0FC747F65B67C540B82869331A99A5D0@namprd15.prod.outlook.com>
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
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5JIGFtIGxvb2tpbmcgZm9yIOKAnGZh
biBzcGVlZCBjb250cm9s4oCdIGZlYXR1cmUgdG8gZW5hYmxlIGZvciBUaW9nYXBhc3MuIEkgdW5k
ZXJzdGFuZCB0aGF0IHRoZXJlIGFyZSBtYW55IGFwcHJvYWNoZXMgZm9yIHRoaXMuIFBsZWFzZSBw
b2ludCBtZSB0byBhbGwgaW1wbGVtZW50YXRpb24gYW5kIGFueSBkZXRhaWxzIGFib3V0IGVhY2gg
YXBwcm9hY2gsIG1heSBiZQ0KIHNvbWUgcHJvcyBhbmQgY29ucy48bzpwPjwvbzpwPjwvc3Bhbj48
L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4g
c3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPlJlZ2FyZHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+LVZpamF5
PG86cD48L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4E117ED9B4924197A66F45949E3D7178fbcom_--
