Return-Path: <c_mykolak@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.2.65; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=c_mykolak@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="aC8D7Vie";
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnGxT6QPYzDrJL
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 18:30:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=I/Z6Q1/HEqGmk+30X2MI/eqAbPfhrkaW9T+XGB273/Y=;
 b=aC8D7ViexB5h1Iq57JM37w9oOL9GkIKKVbZ6gIjAQM15f+nkfWe4Goo4RjUlaM7B7KQsB4qaY3sZVEDSlYXOeP323BkYfz8g6QXDwV7RE4PNrayrLc7bn2fqy8H9k7TKuHcSRP0X6Ht1bqWEIqAtSXMLgN8LfnrbLYfVZR4+crg=
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com (10.161.245.11) by
 DB5PR05MB1847.eurprd05.prod.outlook.com (10.166.173.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.13.10; Wed, 6 Sep 2017 08:30:30 +0000
Received: from DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::b0d6:9a5e:4b00:b7ed]) by DB5PR05MB1224.eurprd05.prod.outlook.com
 ([fe80::b0d6:9a5e:4b00:b7ed%13]) with mapi id 15.20.0013.018; Wed, 6 Sep 2017
 08:30:30 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Vadim Pasternak
 <vadimp@mellanox.com>, Ohad Oz <ohado@mellanox.com>
Subject: RE: Mellanox ipmi daemon discussion
Thread-Topic: Mellanox ipmi daemon discussion
Thread-Index: AdMgEhQatmPGhqKFRnqY7Yj+iiQazwGvUNGAAAU2GtA=
Date: Wed, 6 Sep 2017 08:30:30 +0000
Message-ID: <DB5PR05MB122454E0BB4BB0CB38F0B6E4EF970@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <DB5PR05MB1224502182F8C6EAF62E17C9EF9E0@DB5PR05MB1224.eurprd05.prod.outlook.com>
 <CACPK8XcBWbdKQruu5wdAP2xo6xmxQ867fP41SUU+0d38H7O-Wg@mail.gmail.com>
In-Reply-To: <CACPK8XcBWbdKQruu5wdAP2xo6xmxQ867fP41SUU+0d38H7O-Wg@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=c_mykolak@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR05MB1847;
 6:he0Qj59JJ6UD8kCiGQn/qNenxwCBBwItzdQM3aS0PcaCdNwngdyhy1SPVSsxhkr23asn+Gek0JWhwIBdpeAIRQUx7/UBGZbCleePGllB0QVCGZy1vEFpv6w0rLPaVrQyghsBn4/wedTe64VdP+916iYiogErnF2GufN7gHLgJ4eW54QiE/eQoitDAi86MmGZs6b0bz6wZePwneUcNJGLoDgjlsu1iRxcmAxydxOLwvOWStHQ7n+XWvdFlmMTr7Fhow/C/X0LApjAmazmLSwgWXSsMm2PtQYGmgBJ8cEXX3BIWQN1I9iuQjjoZ/ctcNGNyJAJLFQ7/F+7qo2tlXKWjw==;
 5:LgfxxJJKNW6CInNI12m9dVy7oiE+6w47hgav/B8ezzXROzZrnxPS8rjS4g3xO/I0Q5FjoMtFvOkNpZudybH4O80ybW9zqYngjvRTOuvaieDgoDPlmOZNvnXJIQRhXR4zytdxhvGhJ2OG54TUHcCEkQ==;
 24:95FacZpS1cRy9csM9nJIwBlZDP/kT8VaXqGGk1ECIWfcbgYExrojTZUddlwhob1BVi0Tftq842c4HjHGooCaBVvu7pGDyNTovpi1lI4iED8=;
 7:cixinS1UlRPk38ZSHI5ysDjYsRYltJHC5rVDX5pCe395mQtqnJ9uTlg0SWgRE4NOahKM3A+uraPt5JwTNNgtOtIaM016JEZbnh7FcF2dptdyFu0fEOoLqO2XMXIY1MyrpxfA1olfGIxW+WWz1g0KrOv7Dpf2t4jFmEmrccHXl0fGiA+iq6MukkFsFL27lHvYFUuI5pQWYNXU0bg9zqmNd7WspFXE015gghblfDFuOj0=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: c27efbc8-d4f5-4c6f-504d-08d4f50188d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:DB5PR05MB1847; 
x-ms-traffictypediagnostic: DB5PR05MB1847:
x-exchange-antispam-report-test: UriScan:(189930954265078)(65623756079841)(45079756050767); 
x-microsoft-antispam-prvs: <DB5PR05MB1847219822FAC870CA561878EF970@DB5PR05MB1847.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:DB5PR05MB1847; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:DB5PR05MB1847; 
x-forefront-prvs: 0422860ED4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39860400002)(377454003)(24454002)(199003)(13464003)(189002)(110136004)(68736007)(33656002)(8936002)(478600001)(6246003)(74316002)(3480700004)(9686003)(25786009)(45080400002)(107886003)(4326008)(2906002)(50986999)(76176999)(54356999)(966005)(97736004)(53936002)(66066001)(2900100001)(14454004)(101416001)(575784001)(106356001)(6116002)(3846002)(102836003)(86362001)(105586002)(5250100002)(3280700002)(53546010)(55016002)(3660700001)(6436002)(81156014)(7736002)(8676002)(5660300001)(6916009)(7696004)(81166006)(6306002)(305945005)(2950100002)(6506006)(99286003)(229853002)(54906002)(189998001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR05MB1847;
 H:DB5PR05MB1224.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2017 08:30:30.3751 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR05MB1847
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 08:30:40 -0000

SGksIEpvZWwuDQpUaGFua3MgZm9yIHJlcGx5IQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IGpvZWwuc3RhbkBnbWFpbC5jb20gW21haWx0bzpqb2VsLnN0YW5AZ21haWwu
Y29tXSBPbiBCZWhhbGYgT2YgSm9lbA0KPiBTdGFubGV5DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2Vw
dGVtYmVyIDYsIDIwMTcgODoxNyBBTQ0KPiBUbzogTXlrb2xhIEtvc3Rlbm9rIDxjX215a29sYWtA
bWVsbGFub3guY29tPg0KPiBDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPg0KPiBTdWJqZWN0OiBSZTogTWVsbGFub3ggaXBtaSBkYWVtb24gZGlzY3Vzc2lvbg0K
PiANCj4gSGVsbG8gTXlrb2xhLA0KPiANCj4gT24gVHVlLCBBdWcgMjksIDIwMTcgYXQgMTI6NTcg
QU0sIE15a29sYSBLb3N0ZW5vaw0KPiA8Y19teWtvbGFrQG1lbGxhbm94LmNvbT4gd3JvdGU6DQo+
ID4NCj4gPiBXZSdkIGxpa2UgdG8gYWRkIE1lbGxhbm94IGlwbWkgZGFlbW9uIHJlY2lwZSB0byBt
ZWxsYW5veCBtc24gcGxhdGZvcm0uDQo+IEl0J3MgYmFzZWQgb24gb3BlbmlwbWkgcHJvamVjdC4N
Cj4gPiBDb2RlIHJldmlldzoNCj4gaHR0cHM6Ly9lbWVhMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdlcg0KPiByaXQub3BlbmJtYy0NCj4gcHJv
amVjdC54eXolMkYlMjMlMkZjJTJGNTY5NCUyRiZkYXRhPTAyJTdDMDElN0NjX215a29sYWslNDBt
ZWxsDQo+IGFub3guY29tJTdDZGMxMjg1NWFjNWE3NDY0ODUyYzMwOGQ0ZjRlNjg3NzElN0NhNjUy
OTcxYzdkMmU0ZDliYTZhDQo+IDRkMTQ5MjU2ZjQ2MWIlN0MwJTdDMCU3QzYzNjQwMjcxODMzNTA1
NjE4OSZzZGF0YT1RZnMySVRrRzVUSmdQNW0NCj4gU1ZUME5IT3pRcVZrSERGTlJwZ1ZvYzhZb2Ry
USUzRCZyZXNlcnZlZD0wLg0KPiA+DQo+ID4gV2UgYWRkZWQgc29tZSBob29rcyBpbiBvcGVuaXBt
aSBjb2RlIGFuZCBhbHNvIG91ciBzcGVjaWZpYyBtb2R1bGUuDQo+ID4gV2UgdXNlIGl0IGZvciBT
b0wsIFNFTCwgc2VyaWFsIGNvbnNvbGUgcmVkaXJlY3Rpb24sIGNvbnNvbGUgc3dpdGNoaW5nDQo+
IGJldHdlZW4gdGhlIGhvc3QgYW5kIEJNQywgUEVUL1BFRiwgTEFOIHJlbGF0ZWQgY29tbWFuZHMs
IHRpbWUgc2V0dGluZywsDQo+IGFuZCBhbHNvIGEgbG90IG9mIE9FTSBjb21tYW5kcyBmb3IgTEVE
LCBGQU4gY29udHJvbCwgcmVzZXQgc2lnbmFscywgcmVzZXQNCj4gY2F1c2VzLCBCVCBjb25uZWN0
aW9uIHdpdGggQ1BVLCBldGMuDQo+IA0KPiBUaGUgcmV1c2Ugb2YgZXhpc3RpbmcgY29kZSBpcyBh
IGdvb2QgYWNoaWV2ZW1lbnQuIFdlbGwgZG9uZS4NCj4gDQo+IEhvdyBkaWQgeW91IGZpbmQgdGhl
IHVzZSBvZiBPcGVuSVBNSSBmb3IgeW91ciBuZWVkcz8NCj4gDQoNCkl0J3MgZ29vZCB0byB1cy4g
SXQncyBhbHJlYWR5IGhhZCBtYW55IGZlYXR1cmVzIGZyb20gdGhlIGJveCBhbmQNCkl0IGhhcyBp
bmZyYXN0cnVjdHVyZSBmb3IgYWRkaW5nIHZlbmRvciBzcGVjaWZpYyBjb2RlLiBJdCBoYXMgInNp
bXVsYXRvciIgYW5kIE1hcnZlbGwgbW9kdWxlcy4NCkFuZCB3ZSBhZGRlZCBNZWxsYW5veC4NCg0K
V2hlbiB3ZSBzdGFydGVkIHRvIHVzZSBvcGVuYm1jIGl0cyBpcG1pIGRlbW9uIGhhcyB2ZXJ5IGxp
bWl0ZWQgZmVhdHVyZXMgc3VwcG9ydC4NCldlIGhhZCBjb21taXRtZW50IHRvIHByb3ZpZGUgZW5n
aW5lZXJpbmcgc2FtcGxlIHRvIG91ciBwb3RlbnRpYWwgY3VzdG9tZXIgdHdvIG1vbnRocyBhZnRl
ciBIVyBhcnJpdmluZy4gQW5kIHdlIHdlcmUgdmVyeSBsaW1pdGVkIGluIHJlc291cmNlcy4NClNv
IHdlIHdhbnRlZCB0byBmaW5kIHNvbWUgcXVpY2stYW5kLWRpcnR5IHNvbHV0aW9uIGluIG9yZGVy
IHRvIGJlIGFibGUgdG8gc3VwcG9ydCBTb0wsIHNlcmlhbCByZWRpcmVjdGlvbiwgU0VMLCBTRFIs
IExBTiwgUEVUL1BFRiBhbmQgbW9yZS4NCldlIGJ1aWx0IHNvbWUgd2lyZS11cCBtb2RlbCBjb25u
ZWN0aW5nIG9uZSBvZiBvdXIgZXhpc3Rpbmcgc3lzdGVtIHRvIEFzcGVlZCBFVkIgKHdpdGggc2Vy
aWFsLCBJMkMgY29ubmVjdGlvbnMgdG8gRkFOLCBQU1UsIExQQyBjb25uZWN0aW9ucyBmcm9tIGhv
c3QgdG8gQk1DKS4NCk9uIHRoaXMgbW9kZWwgd2Ugd2VyZSBhYmxlIHRvIGRlYnVnIHJlYWwgc3lz
dGVtIGludGVyZmFjZSAoTFBDL0JUKSwgcGFydGlhbGx5IFNEUiwgU0VMLCBTT0wuDQoNCldoZW4g
c3lzdGVtIGlzIGFycml2ZWQgd2Ugd2VyZSBhYmxlIHRvIGNvbWUgdXAgZnJvbSB0aGUgZmlyc3Qg
cnVuLg0KQW5kIGFsbCB0aGUgYWJvdmUgZmVhdHVyZXMgd29ya2VkIG1vcmUgb3IgbGVzcyBmaW5l
Lg0KVGhlbiB3ZSBoYWQgdG8gZGVidWcgc2hhcmVkIE5JQy9OQy1TSSwgdGhlcm1hbCBhbGdvcml0
aG0sIExFRCBjb250cm9sLCByZXNldHMgYW5kIG90aGVyIHN0dWZmLg0KQnV0IGJhc2ljYWxseSB3
ZSBtYW5hZ2VkIHRvIHByb3ZpZGUgZW5naW5lZXJpbmcgc2FtcGxlIGFjY29yZGluZyB0byBvdXIg
Y29tbWl0bWVudC4NCg0KPiA+IEl0IGRvZXNuJ3QgdXNlIERCVVMgaW50ZXJmYWNlLg0KPiANCj4g
VGhpcyBpcyBhIGRvd25zaWRlLiBUaGUgdXNlIG9mIGRidXMgYXMgYW4gaW50ZXItcHJvY2VzcyBj
b21tdW5pY2F0aW9uDQo+IG1lY2hhbmlzbSBpcyBzb21ldGhpbmcgdGhhdCBkZWZpbmVzIE9wZW5C
TUMgYXQgdGhlIG1vbWVudC4NCj4gDQo+IENvdWxkIHlvdSBhZGQgZGJ1cyBJUEMgdG8gdGhlIGV4
aXN0aW5nIGNvZGViYXNlPw0KPiANCg0KSSdsbCBhZGQgZGJ1cyBJUEMgdG8gdGhlIGV4aXN0aW5n
IGNvZGViYXNlLCBtYXliZSBJIHdpbGwgbmVlZCBzb21lIGd1aWRlbGluZXMgb24gdGhpcyBtYXR0
ZXIuDQoNCj4gPg0KPiA+IFdlIGFyZSBwbGFubmluZyB0cmFuc2l0aW9uIHRvIE9wZW5CTUMgaXBt
aSBkZW1vbiwgYWZ0ZXIgd2UgYXJlIGRvbmUNCj4gd2l0aCBhbGwga2VybmVsIHJlbGF0ZWQgcGF0
Y2hlcy4gT3VyIHBsYW4gaXMgdG8gc3RhcnQgdHJhbnNpdGlvbiBpbiB0aGUgZm9sbG93aW5nDQo+
IG9yZGVyIFNvTCwgU0RSLCBTRUwsIExBTiwgTEVEIGFuZCBzbyBvbi4NCj4gDQo+IFdoYXQgbGVh
ZCB0byB0aGlzIGRlY2lzaW9uPyBXaGF0IGFyZSB0aGUgdXAgYW5kIGRvd24gc2lkZXMgb2YgdGhl
IHBob3NwaG9yDQo+IGlwbWkgZGFlbW9uIGNvbXBhcmVkIHRvIE9wZW5JUE1JPw0KPiANCg0KQXQg
dGhlIG1vbWVudCBpdCdzIG5vdCBzbyBlYXN5IGZvciBtZSB0byBjb21wYXJlIHRoZSBvcGVuaXBt
aSBmZWF0dXJlIHZlcnN1cyBvcGVuYm1jLg0KSSBzaG91bGQgbGVhcm4gbW9yZSB0aGUgY3VycmVu
dCBjb250ZW50IG9mIHRoZSBsYXN0Lg0KDQpBY3R1YWxseSB3ZSBhcmUgT0sgd2l0aCBvcGVuaXBt
aSwgYnV0IHdlIHdhbnRlZCB0byBiZSBhbGlnbmVkIHdpdGggb3BlbmJtYywgc2luY2UgYWxsIHRo
ZSBvdGhlcnMgc3lzdGVtcyBhcmUgdXNpbmcgaXQuDQpNYXliZSBhZnRlciB3ZSdsbCBhZGQgZGJ1
cyBJUEMsIGl0IGNvdWxkIGJlIHNvbWUgY29tcHJvbWlzZSBiZXR3ZWVuIHRoZXNlIHR3byBwcm9j
ZXNzZXMuDQpNYXliZSBzb21lYm9keSBlbHNlIHdvdWxkIGxpa2UgdG8gZXh0ZW5kZWQgb3VyIHdv
cmsgaW4gb3BlbmlwbWkgZm9yIHVzaW5nIGl0Lg0KDQpCZXN0IHJlZ2FyZHMsIE15a29sYSBLb3N0
ZW5vay4NCg0KPiA+IEF0IGhpcyBtb21lbnQgd2UnZCBsaWtlIHRvIGhhdmUgZnVuY3Rpb25hbCBp
bWFnZSwgd2hpY2ggY2FuIGJlIGJ1aWx0IGZyb20NCj4gT3BlbkJNQyB3aXRoIG5vIGFueSBwYXRj
aGVzLg0KPiA+IFdlIGFsc28gaGF2ZSBvbmUgY3VzdG9tZXIgYW5kIGl0J3MgaW1wb3J0YW50IGZv
ciB1cyB0byBoYXZlIGEgZnVuY3Rpb25hbA0KPiBpbWFnZSwgd2hpY2ggaGUgY2FuIGJ1aWxkIGJ5
IGhpbXNlbGYuDQo+IA0KPiBBZ3JlZWQuIEkndmUgKzEnZCB5b3VyIHBhdGNoLCBhbmQgd291bGQg
bGlrZSB0byBzZWUgaXQgbWVyZ2VkLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSm9lbA0K
