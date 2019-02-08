Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=40.107.2.62; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="dzl3XJBw"; dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20062.outbound.protection.outlook.com [40.107.2.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43x0C922FxzDqb9
 for <openbmc@lists.ozlabs.org>; Sat,  9 Feb 2019 02:55:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDgAWyuwo8umhBGSPC001o8yfFIk3xGQbUW3c2IcOl4=;
 b=dzl3XJBwgzU9r6SsNqNl9MIJnBecJ60q2zyJwbQ2J1hmi3HoMaAh61zqRSECd0aMOw+4cBKmvPYAvjFep/ja60NW8R20KWEtmBLhphox3GVmaTH+idAVIUDzInq7xU63uydxPClmx/3IUrOPy5sofO3Qj2EGDi0KtcVBpY/iNIs=
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com (10.171.191.18) by
 AM4PR08MB2866.eurprd08.prod.outlook.com (10.171.191.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1601.19; Fri, 8 Feb 2019 15:55:43 +0000
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::f8f8:9441:9bdf:a4b9]) by AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::f8f8:9441:9bdf:a4b9%4]) with mapi id 15.20.1601.016; Fri, 8 Feb 2019
 15:55:43 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: Jeremy Kerr <jk@ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: openbmc <openbmc@lists.ozlabs.org>, Emily Shaffer
 <emilyshaffer@google.com>, David Thompson <dthompson@mellanox.com>, Dong Wei
 <Dong.Wei@arm.com>, "Naidoo, Nilan" <nilan.naidoo@intel.com>, Deepak
 Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: RE: Initial MCTP design proposal
Thread-Topic: Initial MCTP design proposal
Thread-Index: AQHUjdZUZHgpeKmdsEWUnZms7RjaM6XU3lCAgAD6f4CAAJe2IA==
Date: Fri, 8 Feb 2019 15:55:43 +0000
Message-ID: <AM4PR08MB27880C633DDB02D3E29A08DE80690@AM4PR08MB2788.eurprd08.prod.outlook.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <20190207155131.gzntyqoflqfw5vld@thinkpad>
 <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
In-Reply-To: <2159944d88eadddab4e7dfa5b50c85a4fc0ca234.camel@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [2600:1700:8c61:400:a463:96f6:447f:4cfb]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR08MB2866;
 20:p/PN9ymlMIlssBY9hFHi0p7wQ8bDNnxY7NLd7kaeWXlbjANJAXmzAwaWfvSJUBLb7rCKJmApP9wAvuhjlO/TOLVxGlcIJxcCyE5xK22gQW54dkK5BqQBPKlFWcbAsTaKiSu73W7guwBvQBOlRasGSooCfnBQPlqwdO/C7jCi+pw=
x-ms-office365-filtering-correlation-id: 028e4131-f95b-442a-c784-08d68ddde1b1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:AM4PR08MB2866; 
x-ms-traffictypediagnostic: AM4PR08MB2866:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <AM4PR08MB2866C642BE30F014ED4A9E4E80690@AM4PR08MB2866.eurprd08.prod.outlook.com>
x-forefront-prvs: 094213BFEA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(366004)(39860400002)(55674003)(13464003)(189003)(199004)(40434004)(2906002)(476003)(256004)(5024004)(86362001)(14454004)(102836004)(14444005)(561944003)(106356001)(316002)(105586002)(46003)(186003)(11346002)(446003)(3480700005)(71200400001)(71190400001)(486006)(33656002)(4326008)(53546011)(68736007)(478600001)(966005)(6306002)(6506007)(9686003)(7696005)(25786009)(53936002)(76176011)(72206003)(229853002)(74316002)(53376002)(7736002)(6436002)(305945005)(6246003)(55016002)(54906003)(110136005)(8676002)(8936002)(99286004)(81156014)(81166006)(97736004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB2866;
 H:AM4PR08MB2788.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qwn+1t8BERT2rDuSRxSi5asTLiv/PgMgxRbnxXcliec0S7DxdhzIzhV865XH/PJLiDdl3wrHYUvb1Tfu+QLCyBSWkFIyO9SiGwq4yLQF1JC1qlqkTPxT8q2IRY9v08hSA+0EHnbFMEtS9xDpGMQq3Q3VnCoyahVgPMCbvd3rXipFbkgYUfFQ9+ICMDLz98k0b1nFheaRHtUpJjWHg53vSEy198LKVb7mipP24ZNjsqT+BqMHbIYFNxlYBBaZ9Bb32MYYTgbSuRJY3ysOGxeltSDs+OtBVRELQLvlE+Ei9T6N/4u1JukmolHoSk6E7xqlbmFQZSXAnO1X9YycF6Q+X+mmxVy6M07hGd4zCMJ8CLC4nOfeHA83o0SItKiy32sMEO0ba9sz8/Pftdrlh8xVTnebAa+4FWbWHTp8uDZzsGQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e4131-f95b-442a-c784-08d68ddde1b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2019 15:55:43.1836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2866
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
X-List-Received-Date: Fri, 08 Feb 2019 15:55:51 -0000

SmVyZW15LA0KDQpUaGFua3MgZm9yIHBvc3RpbmcgdGhlIHJldmlldy4NCk1heSBJIHN1Z2dlc3Qg
cmVxdWVzdGluZyBNQ1RQIHJlcG9zaXRvcnkgaW4gT3BlbkJNQyBnaXRodWIgZm9yIGVmZmVjdGl2
ZSBjb2xsYWJvcmF0aW9uIHNpbWlsYXIgdG8gUExETSByYXRoZXIgdGhhbiB1c2luZyBwZXJzb25h
bCBnaXRodWIgcmVwbz8NClRoaXMgd2lsbCBhbHNvIGF2b2lkIGR1cGxpY2F0aW5nIGVmZm9ydCBh
bmQgd2lsbCBhbHNvIGVuY291cmFnZSBwYXJ0aWNpcGF0aW9uIGZyb20gbXVsdGlwbGUgY29udHJp
YnV0b3JzLg0KDQpUaGFua3MsDQpTdXByZWV0aA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogSmVyZW15IEtlcnIgPGprQG96bGFicy5vcmc+DQpTZW50OiBGcmlkYXksIEZlYnJ1
YXJ5IDgsIDIwMTkgMTI6NDggQU0NClRvOiBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1
aXJyZWwuY29tPg0KQ2M6IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IEVtaWx5
IFNoYWZmZXIgPGVtaWx5c2hhZmZlckBnb29nbGUuY29tPjsgRGF2aWQgVGhvbXBzb24gPGR0aG9t
cHNvbkBtZWxsYW5veC5jb20+OyBEb25nIFdlaSA8RG9uZy5XZWlAYXJtLmNvbT47IFN1cHJlZXRo
IFZlbmthdGVzaCA8U3VwcmVldGguVmVua2F0ZXNoQGFybS5jb20+OyBOYWlkb28sIE5pbGFuIDxu
aWxhbi5uYWlkb29AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IEluaXRpYWwgTUNUUCBkZXNpZ24g
cHJvcG9zYWwNCg0KSGkgQnJhZCwNCg0KPiBXZXJlIHlvdSBwbGFubmluZyBvbiBzdWJtaXR0aW5n
IHRoaXMgdG8gdGhlIGRvY3MgcmVwb3NpdG9yeSBhcyBhDQo+IGRlc2lnbj8NCg0KWWVzISA6KQ0K
DQo+IERvIHlvdSBuZWVkIHNvbWUgaGVscCB3aXRoIHRoYXQ/DQoNCkp1c3QgYSBudWRnZSBpbnRv
IGRvaW5nIHNvLCB3aGljaCB5b3VyIGVtYWlsIHByb3ZpZGVkIQ0KDQpJJ3ZlIGp1c3QgcHVzaGVk
IHRvIGdlcnJpdDoNCg0KICBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3Bl
bmJtYy9kb2NzLysvMTgwODkNCg0KLSB0aGlzIGlzIHRoZSBkb2MgdGhhdCBJJ2Qgb3JpZ2luYWxs
eSBzZW50IG91dCAodG9wIG9mIHRoaXMgdGhyZWFkKSwgYW5kIGluY29ycG9yYXRpbmcgc3VnZ2Vz
dGlvbnMgZGlzY3Vzc2VkIHRoZXJlLg0KDQpJbiB0aGUgbWVhbnRpbWUsIEkndmUgbWFpbmx5IGJl
ZW4gd29ya2luZyBvbiB0aGUgcHJvdG90eXBlIHNrZXRjaGVzIGZvciB0aGUgTUNUUCBsaWJyYXJ5
LCBhbmQgSSd2ZSBqdXN0IHB1c2hlZCB0aGF0IHRvbzoNCg0KICBodHRwOi8vZ2l0aHViLmNvbS9q
ay1vemxhYnMvbGlibWN0cA0KDQpJdCdzIHZlcnkgcHJvdG90eXBleSBhdCB0aGlzIHN0YWdlLCBh
bmQgSSdtIG9wZW4gdG8gaW5wdXQgYW5kIHB1bGwgcmVxdWVzdHMuIEknbSBnb2luZyB0byBiZSBx
dWl0ZSBwZXJtaXNzaXZlIHdpdGggYWNjZXB0aW5nIGNoYW5nZXMgYXQgdGhpcyBlYXJseSBzdGFn
ZS4uLg0KDQpJZiB3ZSBnbyBhaGVhZCB3aXRoIHRoZSBNQ1RQIGRlc2lnbnMsIGFuZCB3YW50IHRv
IHVzZSB0aGlzLCBJJ2QgcHJvcG9zZSBtb3ZpbmcgaXQgZnJvbSBteSBwZXJzb25hbCBnaXRodWIg
cmVwbyBpbnRvIC9vcGVuYm1jLyAoYWZ0ZXIgc3VpdGFibGUgdXBkYXRlcyB0byBnZXQgaXQgaW50
byBPcGVuQk1DIHN0YW5kYXJkcywgb2YgY291cnNlKS4gUGF0Y2hlcyB3ZWxjb21lIQ0KDQpDaGVl
cnMsDQoNCg0KSmVyZW15DQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlz
IGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28g
YmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhl
IGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9y
IHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4N
Cg==
