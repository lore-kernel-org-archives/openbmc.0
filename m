Return-Path: <shays@mellanox.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
 (mail-am1on0069.outbound.protection.outlook.com [157.56.112.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rKxWG07WdzDqgZ
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2016 16:04:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b=GOeV3gKG; 
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Yr5cezFSotk3des8cvdjteadyLdrqF3DF/mNdyA9eDw=;
 b=GOeV3gKGWph+C+pzs4iokKSEBcUJmtqB0WVjHNwk4ESxNNWGZyK3meCA+lAxehbgSZWThCq9nj0gQpVc6hqWFOVWJkoPSDYVKeBfUyiGl8HSH6ioeaR4A1/oOa5KDcSaJz9ILuPrlocr2QPahyixiv684E+uSz4cNvMDfnwcLxo=
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com (10.161.249.145) by
 DB4PR05MB0943.eurprd05.prod.outlook.com (10.161.249.147) with Microsoft SMTP
 Server (TLS) id 15.1.506.9; Thu, 2 Jun 2016 06:03:48 +0000
Received: from DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) by
 DB4PR05MB0941.eurprd05.prod.outlook.com ([10.161.249.145]) with mapi id
 15.01.0506.013; Thu, 2 Jun 2016 06:03:48 +0000
From: Shay Slobodkin <shays@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: NC-SI support
Thread-Topic: NC-SI support
Thread-Index: AdG8BKUCQId+Fd6kT5icrdrQxnOJTQADh/uAACBqJnA=
Date: Thu, 2 Jun 2016 06:03:48 +0000
Message-ID: <DB4PR05MB0941E9847F6E98F3F5654436D5580@DB4PR05MB0941.eurprd05.prod.outlook.com>
References: <AM3PR05MB093469618BEB77BB50C8C2AED5470@AM3PR05MB0934.eurprd05.prod.outlook.com>
 <CACPK8Xd44CZJ47wj_2hhQ2DCS+N+ddnx87wVrdVfWFg+gWmvhQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd44CZJ47wj_2hhQ2DCS+N+ddnx87wVrdVfWFg+gWmvhQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [193.47.165.251]
x-ms-office365-filtering-correlation-id: 085c83f2-9bbb-493c-86de-08d38aaba9ee
x-microsoft-exchange-diagnostics: 1; DB4PR05MB0943;
 5:XjC7YuxbBQuMmXX557WZoLru5AdWIxZFJnlzZDXr6tg/e7TNIEF1eAIGZJ1Dzbj/UeVTHhembsgmWQPWU0f8bHB9cfW8dY+iWAeBNEUh08nk8AWXh+0+mGQI5hOQU28fqtLf5CNGihCMSNm8Cxx+aA==;
 24:gfgNndplZkXAmeY7dVQwkzviZ1gSlFp/QkWQ+6nytbawtyfZl3n0undxVHLXGd6PecxhJDbpg5Q6tQL7pfdYq6VreDd+4p4H2Te5EwuRW+Q=;
 7:lGZHQ4K1Cq7GBB4DTP+klfV3UMeA0d6T4xcgaNIgcthtYDRLR9qOrm769pF+6LLa+Ux0aeqC5ltIFn6SXc1Y+T42zeVItD3h4GU8MC9bZfS19/zl28mPz7okSzlVHa4Xa5ZwKGXcnHBfZYHOM+shKX5WcA4jfwbRaAjzLzyYwg9z+vgQ9O+XbQ1BuGmyAkH5
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB4PR05MB0943;
x-microsoft-antispam-prvs: <DB4PR05MB094302075633C7EE2CAADE47D5580@DB4PR05MB0943.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(65623756079841);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
 SRVR:DB4PR05MB0943; BCL:0; PCL:0; RULEID:; SRVR:DB4PR05MB0943; 
x-forefront-prvs: 0961DF5286
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(13464003)(24454002)(377454003)(92566002)(50986999)(86362001)(54356999)(19580395003)(19580405001)(2950100001)(15975445007)(87936001)(77096005)(2900100001)(8676002)(110136002)(76176999)(189998001)(6116002)(9686002)(3846002)(102836003)(10400500002)(3480700004)(586003)(11100500001)(5004730100002)(76576001)(81166006)(122556002)(5003600100002)(5002640100001)(74316001)(3660700001)(3280700002)(2906002)(5008740100001)(4326007)(33656002)(8936002)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB4PR05MB0943;
 H:DB4PR05MB0941.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2016 06:03:48.2831 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR05MB0943
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2016 06:04:11 -0000

VGhhbmsgeW91IEpvZWwuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
am9lbC5zdGFuQGdtYWlsLmNvbSBbbWFpbHRvOmpvZWwuc3RhbkBnbWFpbC5jb21dIE9uIEJlaGFs
ZiBPZiBKb2VsDQo+IFN0YW5sZXkNCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDAxLCAyMDE2IDU6
MzUgUE0NCj4gVG86IFNoYXkgU2xvYm9ka2luIDxzaGF5c0BtZWxsYW5veC5jb20+DQo+IENjOiBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IE5DLVNJIHN1cHBvcnQNCj4g
DQo+IEhlbGxvIFNoYXksDQo+IA0KPiBPbiBXZWQsIEp1biAxLCAyMDE2IGF0IDc6NTggQU0sIFNo
YXkgU2xvYm9ka2luIDxzaGF5c0BtZWxsYW5veC5jb20+DQo+IHdyb3RlOg0KPiA+IFdlIGZvdW5k
IE5DLVNJIHN1cHBvcnQgZm9yIEFTUEVFRCBTb0MgaW4gdS1ib290IGNvZGUuDQo+ID4NCj4gPiBX
ZSBkb27igJl0IHNlZSBOQy1TSSBzdXBwb3J0IGluIGtlcm5lbC4NCj4gDQo+IFdlIGRvIGhhdmUg
c3VwcG9ydCBpbiBvdXIga2VybmVsIHRyZWU6DQo+IA0KPiAgaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvbGludXgvdHJlZS9kZXYtNC40L25ldC9uY3NpDQoNCldlIGNvdWxkIGhhdmUgbWlzc2Vk
IGl0Lg0KSSB3aWxsIGNoZWNrIGl0IG91dC4NCg0KPiANCj4gV2UgaW50ZW5kIHRvIHN1Ym1pdCB0
aGlzIHVwc3RyZWFtLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSm9lbA0K
