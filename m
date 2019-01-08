Return-Path: <prvs=69119f982c=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=69119f982c=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="nSB69iwz"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="YkliRogc"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43YbTJ2Ms2zDqNC
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jan 2019 13:15:47 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.27/8.16.0.27) with SMTP id x082803R002573;
 Mon, 7 Jan 2019 18:15:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=facebook; bh=WPZWjJU4sLpZc5tugNM/+ocKAHs/gmlkXVmcdRjCK50=;
 b=nSB69iwzS00MzJa3hD0dec77+1eHgzkeQqxs5cPrgKSFPBoegYTcV2LeIr2NtQbf64B3
 40kOnpesAYqyAT5E2+gu9zmUumr1ZoXgmlg8UP/5QKnhHzNOBX3nyIw5/yXGG5x2z+zH
 0F4GqGgu0N5WGGOGEDE9MdcU1Uwiedmsfv4= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by m0001303.ppops.net with ESMTP id 2pvg37reba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 07 Jan 2019 18:15:44 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-hub02.TheFacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 7 Jan 2019 18:15:43 -0800
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 7 Jan 2019 18:15:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPZWjJU4sLpZc5tugNM/+ocKAHs/gmlkXVmcdRjCK50=;
 b=YkliRogcgGDDrq1HWnj+kWT7q0xr+HZrZVCQAQi93FAWaOhV9XxIoupxlNmyNEi9Ufm+RLmV8SMtOoWQkBT4RbGHMO/PRyWIj1woWprnmD0lPu/eErb87Hcky3l4K+5LnaYqAePjIu8MARziSI3NXzDeCkyZpNA9dtgtfLW7tAg=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1814.namprd15.prod.outlook.com (10.174.54.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.8; Tue, 8 Jan 2019 02:15:27 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::f9c6:952c:8b66:cc9d%10]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 02:15:27 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: qianlihu <wangzhiqiang8906@gmail.com>
CC: "openbmc @ lists . ozlabs . org" <openbmc@lists.ozlabs.org>
Subject: Re: Kernel config
Thread-Topic: Kernel config
Thread-Index: AQHUpupLFvVEKY90jEezonkC9+DcnKWkjeGA//+ONwA=
Date: Tue, 8 Jan 2019 02:15:26 +0000
Message-ID: <3F727858-8949-42B0-A0FD-4DD50328E47F@fb.com>
References: <8B0F0C96-17A3-4649-9CCA-475E5E75685E@fb.com>
 <CAHkHK09QPboyqShmOc5Fe_gvo1=-ahqrWS9qj+ZuLjGKhLHxBQ@mail.gmail.com>
In-Reply-To: <CAHkHK09QPboyqShmOc5Fe_gvo1=-ahqrWS9qj+ZuLjGKhLHxBQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::6:23a]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1814;
 20:avqkI0ImO1ly3a48+48hpsO7cpAYpwdQgGCcAMq5BeoCS/Nzp1eUQn2OmBzPt6wmeaLygrsbRnql/8rCsRVKM4WnIs1jac5fA6CY4ewXeRjRRGNR/aUBgdBZgdmsHRjqsZeTlyGpWiwrFri1ebOLiBK0EDF8Nkfzu8JGZ4/NZ0k=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4b405bb4-1791-4160-13fa-08d6750f27c8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1814; 
x-ms-traffictypediagnostic: CY4PR15MB1814:
x-microsoft-antispam-prvs: <CY4PR15MB18142B6B5B2FD9464B83C777DD8A0@CY4PR15MB1814.namprd15.prod.outlook.com>
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(76176011)(83716004)(68736007)(71200400001)(53546011)(97736004)(236005)(1411001)(6512007)(6306002)(54896002)(86362001)(606006)(2906002)(39060400002)(53936002)(3480700005)(25786009)(4326008)(186003)(82746002)(486006)(102836004)(478600001)(7736002)(229853002)(316002)(2616005)(46003)(36756003)(33656002)(81156014)(81166006)(476003)(6436002)(446003)(8936002)(106356001)(11346002)(8676002)(6116002)(966005)(6486002)(71190400001)(6916009)(256004)(6246003)(105586002)(221733001)(5660300001)(7116003)(14444005)(99286004)(14454004)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1814;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: U+pnw3JiMXd5UtmmlK0gq6I1fZzyHXrz7jtLpKNOoO5ds8BbcHh09Zr1oHK4eJHYVxEMz+/m6gWYh46nZ85HmCXDD5ObgeInklov6oRJadb70j/Ba2Xny1CrKp+5Wue2nR5fUAmmx2gFRejKkjqjTtrhPopGhj5RaxRB7rB7QHvVkAz4e4qrhLMWRsMyKJuyXtUbz2axovcwaz02RIy8uSnaYI4nvKe26wLJN/JQg5tK8H+Cc9fNUT6WbDGJB7N6LNBQwRLHnkGjZpQ1Qhyq67gsd7c8aME7owDfuBilsT7BiHNuuVLmBKQKhwOBaN3q
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
 boundary="_000_3F727858894942B0A0FD4DD50328E47Ffbcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b405bb4-1791-4160-13fa-08d6750f27c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 02:15:27.0265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1814
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-08_01:, , signatures=0
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
X-List-Received-Date: Tue, 08 Jan 2019 02:15:49 -0000

--_000_3F727858894942B0A0FD4DD50328E47Ffbcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIHFpYW4sDQpJIGhhdmUgc2ltaWxhciBiYmFwcGVuZCBidXQgSSBoYXZlIG1pc3Npbmcg
dGlvZ2FwYXNzIGluIEZJTEVTRVhUUkFQQVRIU19wcmVwZW5kLiBMZXQgbWUgdHJ5IHRoaXMuDQoN
ClJlZ2FyZHMNCi1WaWFqeQ0KDQoNCkZyb206IHFpYW5saWh1IDx3YW5nemhpcWlhbmc4OTA2QGdt
YWlsLmNvbT4NCkRhdGU6IE1vbmRheSwgSmFudWFyeSA3LCAyMDE5IGF0IDU6MDMgUE0NClRvOiBW
aWpheSBLaGVta2EgPHZpamF5a2hlbWthQGZiLmNvbT4NCkNjOiAib3BlbmJtYyBAIGxpc3RzIC4g
b3psYWJzIC4gb3JnIiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IEtl
cm5lbCBjb25maWcNCg0KSGkgVmlqYXkNCg0KWW91IGNhbiByZWZlciB0byBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtaWJtL21ldGEtcm9tdWx1cy9y
ZWNpcGVzLWtlcm5lbC9saW51eA0KDQpUaGUgYmJhcHBlbmQgZmlsZSB0ZWxscyB1cyB0aGF0IHRo
ZSBjZmcgZmlsZSB3aWxsIGJlIG1lcmdlZCBpbnRvIHRoZSBrZXJuZWwgY2ZnDQoNCllvdSBjYW4g
dXNlIGRldnRvb2wgdG8gZ2VuZXJhdGUgdGhlc2UgZmlsZSA6DQoNCmRldnRvb2wgdXBkYXRlLXJl
Y2lwZSAgbGludXgtYXNwZWVkIC1hIC9ob21lL3h4eHh4eHgvb3BlbmJtYy9tZXRhLWZhY2Vib29r
L21ldGEtdGlvZ2FwYXNzDQoNCk9uIFR1ZSwgSmFuIDgsIDIwMTkgYXQgODozOCBBTSBWaWpheSBL
aGVta2EgPHZpamF5a2hlbWthQGZiLmNvbTxtYWlsdG86dmlqYXlraGVta2FAZmIuY29tPj4gd3Jv
dGU6DQpIaSwNCkkgbmVlZCB0byBhZGQgZXh0cmEga2VybmVsIGNvbmZpZyBmb3Igb3VyIHRpb2dh
cGFzcyBwbGF0Zm9ybSBhbmQgSSBhZGRlZCBleHRyYSBjb25maWd1cmF0aW9uIGluIHRpb2dhcGFz
cy5jZmcgZmlsZSB1bmRlciBjb25mL21hY2hpbmUuIEkgYW0gbm90IHNlZWluZyB0aGVzZSBnZXR0
aW5nIGFkZGVkIHRvIGtlcm5lbCBjb25maWcgZmlsZS4gUGxlYXNlIHN1Z2dlc3QgcmlnaHQgcGxh
Y2UgdG8gYWRkIG91ciBwbGF0Zm9ybSBzcGVjaWZpYyBleHRyYSBrZXJuZWwgY29uZmlnIG9wdGlv
bnMuDQoNClJlZ2FyZHMNCi1WaWpheQ0K

--_000_3F727858894942B0A0FD4DD50328E47Ffbcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <412D6C106206FD4B9DDAD27B0B25F69B@namprd15.prod.outlook.com>
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
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNvbnNvbGFz
Ow0KCXBhbm9zZS0xOjIgMTEgNiA5IDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25z
ICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjow
aW47DQoJbWFyZ2luLWJvdHRvbTouMDAwMXB0Ow0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1m
YW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0K
CXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246
dW5kZXJsaW5lO30NCmE6dmlzaXRlZCwgc3Bhbi5Nc29IeXBlcmxpbmtGb2xsb3dlZA0KCXttc28t
c3R5bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6cHVycGxlOw0KCXRleHQtZGVjb3JhdGlvbjp1bmRl
cmxpbmU7fQ0KcC5tc29ub3JtYWwwLCBsaS5tc29ub3JtYWwwLCBkaXYubXNvbm9ybWFsMA0KCXtt
c28tc3R5bGUtbmFtZTptc29ub3JtYWw7DQoJbXNvLW1hcmdpbi10b3AtYWx0OmF1dG87DQoJbWFy
Z2luLXJpZ2h0OjBpbjsNCgltc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0bzsNCgltYXJnaW4tbGVm
dDowaW47DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1z
ZXJpZjt9DQpzcGFuLkVtYWlsU3R5bGUxOA0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1yZXBs
eTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgljb2xvcjp3aW5kb3d0ZXh0
O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQt
c2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4gMTEuMGluOw0K
CW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rpb24xDQoJe3Bh
Z2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBsYW5nPSJFTi1V
UyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSI+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEi
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+VGhhbmtzIHFpYW4sPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj5JIGhhdmUgc2ltaWxhciBiYmFwcGVuZCBidXQgSSBoYXZlIG1pc3Np
bmcgdGlvZ2FwYXNzIGluIDxzcGFuIHN0eWxlPSJmb250LXNpemU6OS4wcHQ7Zm9udC1mYW1pbHk6
Q29uc29sYXM7Y29sb3I6IzI0MjkyRTtiYWNrZ3JvdW5kOndoaXRlIj4NCkZJTEVTRVhUUkFQQVRI
U19wcmVwZW5kLiBMZXQgbWUgdHJ5IHRoaXMuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij5SZWdhcmRzPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj4tVmlhank8bzpw
PjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2IHN0eWxlPSJi
b3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzozLjBwdCAw
aW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48Yj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJvbTogPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9u
dC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+cWlhbmxpaHUgJmx0O3dhbmd6aGlxaWFuZzg5MDZA
Z21haWwuY29tJmd0Ozxicj4NCjxiPkRhdGU6IDwvYj5Nb25kYXksIEphbnVhcnkgNywgMjAxOSBh
dCA1OjAzIFBNPGJyPg0KPGI+VG86IDwvYj5WaWpheSBLaGVta2EgJmx0O3ZpamF5a2hlbWthQGZi
LmNvbSZndDs8YnI+DQo8Yj5DYzogPC9iPiZxdW90O29wZW5ibWMgQCBsaXN0cyAuIG96bGFicyAu
IG9yZyZxdW90OyAmbHQ7b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ozxicj4NCjxiPlN1Ympl
Y3Q6IDwvYj5SZTogS2VybmVsIGNvbmZpZzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjwvZGl2Pg0K
PGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+
DQo8ZGl2Pg0KPGRpdj4NCjxkaXY+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PkhpIFZpamF5PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9y
bWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPllvdSBjYW4gcmVmZXIgdG8mbmJzcDs8YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20v
b3BlbmJtYy9vcGVuYm1jL3RyZWUvbWFzdGVyL21ldGEtaWJtL21ldGEtcm9tdWx1cy9yZWNpcGVz
LWtlcm5lbC9saW51eCI+aHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy90cmVlL21h
c3Rlci9tZXRhLWlibS9tZXRhLXJvbXVsdXMvcmVjaXBlcy1rZXJuZWwvbGludXg8L2E+PG86cD48
L286cD48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNw
OzwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPlRoZSBiYmFw
cGVuZCBmaWxlIHRlbGxzIHVzIHRoYXQgdGhlIGNmZyBmaWxlIHdpbGwgYmUgbWVyZ2VkIGludG8g
dGhlIGtlcm5lbCBjZmc8bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+WW91IGNhbiB1c2UgZGV2dG9vbCB0byBnZW5lcmF0ZSB0aGVzZSBmaWxlIDo8
bzpwPjwvbzpwPjwvcD4NCjwvZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+
Jm5ic3A7PC9vOnA+PC9wPg0KPC9kaXY+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+ZGV2
dG9vbCB1cGRhdGUtcmVjaXBlJm5ic3A7IGxpbnV4LWFzcGVlZCAtYSAvaG9tZS94eHh4eHh4L29w
ZW5ibWMvbWV0YS1mYWNlYm9vay9tZXRhLXRpb2dhcGFzcyZuYnNwOzxvOnA+PC9vOnA+PC9wPg0K
PC9kaXY+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxkaXY+
DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+T24gVHVlLCBKYW4gOCwgMjAxOSBhdCA4OjM4
IEFNIFZpamF5IEtoZW1rYSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnZpamF5a2hlbWthQGZiLmNvbSI+
dmlqYXlraGVta2FAZmIuY29tPC9hPiZndDsgd3JvdGU6PG86cD48L286cD48L3A+DQo8L2Rpdj4N
CjxibG9ja3F1b3RlIHN0eWxlPSJib3JkZXI6bm9uZTtib3JkZXItbGVmdDpzb2xpZCAjQ0NDQ0ND
IDEuMHB0O3BhZGRpbmc6MGluIDBpbiAwaW4gNi4wcHQ7bWFyZ2luLWxlZnQ6NC44cHQ7bWFyZ2lu
LXJpZ2h0OjBpbiI+DQo8ZGl2Pg0KPGRpdj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
c28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+SGksPG86
cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3At
YWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1dG8iPkkgbmVlZCB0byBhZGQgZXh0cmEg
a2VybmVsIGNvbmZpZyBmb3Igb3VyIHRpb2dhcGFzcyBwbGF0Zm9ybSBhbmQgSSBhZGRlZCBleHRy
YSBjb25maWd1cmF0aW9uIGluIHRpb2dhcGFzcy5jZmcgZmlsZSB1bmRlciBjb25mL21hY2hpbmUu
IEkgYW0gbm90IHNlZWluZyB0aGVzZSBnZXR0aW5nIGFkZGVkIHRvIGtlcm5lbA0KIGNvbmZpZyBm
aWxlLiBQbGVhc2Ugc3VnZ2VzdCByaWdodCBwbGFjZSB0byBhZGQgb3VyIHBsYXRmb3JtIHNwZWNp
ZmljIGV4dHJhIGtlcm5lbCBjb25maWcgb3B0aW9ucy48bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNz
PSJNc29Ob3JtYWwiIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJv
dHRvbS1hbHQ6YXV0byI+Jm5ic3A7PG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
IiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OmF1dG87bXNvLW1hcmdpbi1ib3R0b20tYWx0OmF1
dG8iPlJlZ2FyZHM8bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJt
c28tbWFyZ2luLXRvcC1hbHQ6YXV0bzttc28tbWFyZ2luLWJvdHRvbS1hbHQ6YXV0byI+LVZpamF5
PG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPC9kaXY+DQo8
L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_3F727858894942B0A0FD4DD50328E47Ffbcom_--
