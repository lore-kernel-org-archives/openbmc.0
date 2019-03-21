Return-Path: <prvs=898379357d=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=898379357d=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="lnbxkSWw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ORfBJxz0"; dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44QD7m4GTNzDqTk
 for <openbmc@lists.ozlabs.org>; Fri, 22 Mar 2019 04:20:15 +1100 (AEDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2LHD7I9020531; Thu, 21 Mar 2019 10:20:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=22Bzw0GUCu9dNeevKpYPf+MjReioz174MfNXcJYy3tw=;
 b=lnbxkSWw2NmUeuvl1LpZldVlCFOGbu/Af1vTOiKmUAhHMyRYD8PhN5oCVVRPtWEFYKWY
 6YhzjPOc4QwEs9HXYUukZd5DQZ6ggXgqCLsLX4uYtscGpjQW7w2d/qwBojKl4w2IKOB0
 3suMwVnVOel10gMKehXOwG7JgDQ1Np8FJvc= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rcepfr24k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 21 Mar 2019 10:20:12 -0700
Received: from prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 21 Mar 2019 10:20:11 -0700
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-mbx04.TheFacebook.com (2620:10d:c081:6::18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Thu, 21 Mar 2019 10:20:11 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Thu, 21 Mar 2019 10:20:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22Bzw0GUCu9dNeevKpYPf+MjReioz174MfNXcJYy3tw=;
 b=ORfBJxz0D4MUVYpMJr570Bigp/SG2ReidsKs57CgNKgQqVouGC2x2IEWpF/QrjKvR7uPLEe9tOQQ+mszL4NCZh42tZx/ZWuHO5FbrguJ2BzJfy5S8+Cau0yJ3uJ4YGwSTuY+0XhkiCupsjjhI2mHotdLl3CnzpgnoXjMPKj3ya0=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1598.namprd15.prod.outlook.com (10.173.235.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Thu, 21 Mar 2019 17:20:10 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f076:5b71:62a6:2f47]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::f076:5b71:62a6:2f47%8]) with mapi id 15.20.1730.013; Thu, 21 Mar 2019
 17:20:09 +0000
From: Sai Dasari <sdasari@fb.com>
To: "jainmjo@gmail.com" <jainmjo@gmail.com>, Openbmc <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC Development Kit
Thread-Topic: OpenBMC Development Kit
Thread-Index: AQHU3/qC2n6pMJMV4kuFFW2xGmbJOqYV31wA
Date: Thu, 21 Mar 2019 17:20:09 +0000
Message-ID: <4A255327-67C2-4F1F-A8C4-7795CE7F9C47@fb.com>
References: <CADc45smtLBVn9vSh3uEcMWEwcnUo+asYZR5pXgFKP+5xkuK7vw@mail.gmail.com>
In-Reply-To: <CADc45smtLBVn9vSh3uEcMWEwcnUo+asYZR5pXgFKP+5xkuK7vw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::3:d463]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8162db6-9413-419a-cda0-08d6ae217893
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1598; 
x-ms-traffictypediagnostic: MWHPR15MB1598:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR15MB1598FACC183EFEE815A10877CE420@MWHPR15MB1598.namprd15.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(396003)(366004)(39860400002)(136003)(129404003)(53754006)(189003)(199004)(53546011)(476003)(99286004)(110136005)(256004)(316002)(33656002)(6116002)(97736004)(606006)(8676002)(36756003)(81166006)(81156014)(82746002)(25786009)(102836004)(186003)(7736002)(8936002)(2501003)(6506007)(76176011)(478600001)(68736007)(229853002)(2906002)(53936002)(6246003)(3480700005)(11346002)(71190400001)(7116003)(790700001)(2616005)(83716004)(6436002)(966005)(4744005)(46003)(14454004)(71200400001)(5660300002)(106356001)(6306002)(6512007)(86362001)(236005)(6486002)(446003)(54896002)(486006)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1598;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jdG/zQyoBxzjpC5T4ZJph2PCl7WwQTWdrlX4uXS2dmdhy6DYZ+fZcL+e6WR+o0aS39eowRQcgixA0+tGp4s+wqmikQa/hJdRwmqKSktjvQUU5X1XMfsRFDEBHZl+onrRdiiY8WyxhmFdyA8uaDEyZApoDsB3rxfBT9WvkRLHOvGTtDWXPPIAzKXpYudE4LF+ykXI2ZyNNa54haidLwBRWrAZACgw4ADm6ArCUe7bhhxZ2Ne6tcRiqe0wewXw6unAK9y791ddXOBljzMj0TeTCVlOJTYgw1HwFh028u1QMon0+Yc5AbllM0yvnO21Ilzg+FGbNlGO+at+EmkFRNK3qA/nzSwqyUWdzeMEscLi4wv8HDn1AY0piwRmmdi5W3QY4+44eRyYEQx/+nFH7w08W9r6YrxNwiH1HoaAaZuotas=
Content-Type: multipart/alternative;
 boundary="_000_4A25532767C24F1FA8C47795CE7F9C47fbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8162db6-9413-419a-cda0-08d6ae217893
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 17:20:09.7478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1598
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-21_07:, , signatures=0
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
X-List-Received-Date: Thu, 21 Mar 2019 17:20:21 -0000

--_000_4A25532767C24F1FA8C47795CE7F9C47fbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytzZGFzYXJpPWZiLmNvbUBsaXN0cy5v
emxhYnMub3JnPiBvbiBiZWhhbGYgb2YgImphaW5tam9AZ21haWwuY29tIiA8amFpbm1qb0BnbWFp
bC5jb20+DQpEYXRlOiBUaHVyc2RheSwgTWFyY2ggMjEsIDIwMTkgYXQgODoyNiBBTQ0KVG86IE9w
ZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IE9wZW5CTUMgRGV2ZWxv
cG1lbnQgS2l0DQoNCkhpIGFsbCwNCg0KTXkgdGVhbSBhdCBGbGlwa2FydCBpcyB3b3JraW5nIG9u
IHBvcnRpbmcgT3BlbkJNQyB0byBvdXIgc2VydmVycy4NCkphaW4sIFdlbGNvbWUgRmxpcGthcnQg
dG8gT3BlbkJNQyBjb21tdW5pdHkgcHJvamVjdC4NCg0KRG8geW91IHJlY29tbWVuZCBnZXR0aW5n
IFBvcnR3ZWxsJ3MgTmVwdHVuZSBBbHBoYSBPcGVuQk1DIGRldiBraXQgdG8gcGxheSBhcm91bmQg
d2l0aCBPcGVuQk1DIGFuZCBnZXQgZmFtaWxpYXJpc2VkIHdpdGggaXQgYmVmb3JlIGp1bXBpbmcg
dG8gYWN0dWFsIHNlcnZlcnM/DQpIb3BlIHlvdSBoYXZlIHRha2VuIGEgbG9vayBhdCBodHRwczov
L2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL3RyZWUvbWFzdGVyL2RldmVsb3BtZW50LiBXb3VsZCBz
dWdnZXN0IHRvIHRyeSBPcGVuQk1DIFNESyB1c2luZyBRRU1VIGZvbGxvd2VkIGJ5IGZldyBFVkJz
IGZyb20gQk1DIFNvQyB2ZW5kb3JzIEAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJt
Yy90cmVlL21hc3Rlci9tZXRhLWV2Yi4gSG9wZSB0aGlzIGhlbHBzIQ0KDQpUaGFua3MNCkphaW4N
Cg0K

--_000_4A25532767C24F1FA8C47795CE7F9C47fbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <0F5D9173517D684ABDB75A685952DB6A@namprd15.prod.outlook.com>
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
Zm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQph
OmxpbmssIHNwYW4uTXNvSHlwZXJsaW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xv
cjojMDU2M0MxOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KYTp2aXNpdGVkLCBzcGFu
Lk1zb0h5cGVybGlua0ZvbGxvd2VkDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjoj
OTU0RjcyOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5t
c29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXttc28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJ
bXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFyZ2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2lu
LWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVmdDowaW47DQoJZm9udC1zaXplOjExLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0K
CXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBseTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIs
c2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1z
dHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNl
Y3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAx
LjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5
bGU+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0
IiBzcGlkbWF4PSIxMDI2IiAvPg0KPC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDld
Pjx4bWw+DQo8bzpzaGFwZWxheW91dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRp
dCIgZGF0YT0iMSIgLz4NCjwvbzpzaGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVh
ZD4NCjxib2R5IGxhbmc9IkVOLVVTIiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiI+DQo8
ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJz
cDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4N
CjxkaXYgc3R5bGU9ImJvcmRlcjpub25lO2JvcmRlci10b3A6c29saWQgI0I1QzRERiAxLjBwdDtw
YWRkaW5nOjMuMHB0IDBpbiAwaW4gMGluIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5Gcm9tOiA8L3NwYW4+PC9iPjxz
cGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj5vcGVuYm1jICZsdDtvcGVu
Ym1jLWJvdW5jZXMmIzQzO3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IG9uIGJl
aGFsZiBvZiAmcXVvdDtqYWlubWpvQGdtYWlsLmNvbSZxdW90OyAmbHQ7amFpbm1qb0BnbWFpbC5j
b20mZ3Q7PGJyPg0KPGI+RGF0ZTogPC9iPlRodXJzZGF5LCBNYXJjaCAyMSwgMjAxOSBhdCA4OjI2
IEFNPGJyPg0KPGI+VG86IDwvYj5PcGVuYm1jICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcm
Z3Q7PGJyPg0KPGI+U3ViamVjdDogPC9iPk9wZW5CTUMgRGV2ZWxvcG1lbnQgS2l0PG86cD48L286
cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4m
bmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5IaSBh
bGwsIDxvOnA+PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9wPg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPk15IHRlYW0gYXQgRmxp
cGthcnQgaXMgd29ya2luZyBvbiBwb3J0aW5nIE9wZW5CTUMgdG8gb3VyIHNlcnZlcnMuPG86cD48
L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5KYWluLCBXZWxj
b21lIEZsaXBrYXJ0IHRvIE9wZW5CTUMgY29tbXVuaXR5IHByb2plY3QuPG86cD48L286cD48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5EbyB5b3UgcmVjb21tZW5kIGdldHRpbmcgUG9ydHdlbGwncyBOZXB0
dW5lIEFscGhhIE9wZW5CTUMgZGV2IGtpdCB0byBwbGF5IGFyb3VuZCB3aXRoIE9wZW5CTUMgYW5k
IGdldCBmYW1pbGlhcmlzZWQgd2l0aCBpdCBiZWZvcmUganVtcGluZyB0byBhY3R1YWwgc2VydmVy
cz88bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05v
cm1hbCI+SG9wZSB5b3UgaGF2ZSB0YWtlbiBhIGxvb2sgYXQgPGEgaHJlZj0iaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvZG9jcy90cmVlL21hc3Rlci9kZXZlbG9wbWVudCI+DQpodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9kb2NzL3RyZWUvbWFzdGVyL2RldmVsb3BtZW50PC9hPi4gV291bGQg
c3VnZ2VzdCB0byB0cnkgT3BlbkJNQyBTREsgdXNpbmcgUUVNVSBmb2xsb3dlZCBieSBmZXcgRVZC
cyBmcm9tIEJNQyBTb0MgdmVuZG9ycyBADQo8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtZXZiIj5odHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtZXZiPC9hPi4gSG9wZSB0aGlzIGhlbHBzITxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+
DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5UaGFua3M8bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkphaW48bzpwPjwvbzpwPjwv
cD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+
PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_4A25532767C24F1FA8C47795CE7F9C47fbcom_--
