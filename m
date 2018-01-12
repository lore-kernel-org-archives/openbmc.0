Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.0.68; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="ElJdzLvK";
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0068.outbound.protection.outlook.com [104.47.0.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zJ7pD0lzCzF0VL
 for <openbmc@lists.ozlabs.org>; Sat, 13 Jan 2018 03:42:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=pkS3bvIJyXcMrTDqaPzEJZcLnNxuWA7CPy5GcA3coYY=;
 b=ElJdzLvKjRzVCzf13JUTuDJky4jE8JBuk8Zj0Kv0PW6SnOSzdOU0RkmPXC26L294gSEwq4KL+d9kX4quS44f4l4KbTEQ+/zqTOigHw9/q/CjiJqGS9JMTWRQpWdIW3m7hJgn7SrDNipbN61XOGTV6gShaMOTiALlNOk2aQ2qIUo=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 AM4PR0501MB2340.eurprd05.prod.outlook.com (10.167.123.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.407.7; Fri, 12 Jan 2018 16:42:35 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::bca2:72f5:8623:b9b6]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::bca2:72f5:8623:b9b6%18]) with mapi id 15.20.0386.005; Fri, 12 Jan
 2018 16:42:35 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Florian Fainelli <f.fainelli@gmail.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "arnd@arndb.de" <arnd@arndb.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "tklauser@distanz.ch"
 <tklauser@distanz.ch>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, Vadim Pasternak <vadimp@mellanox.com>,
 system-sw-low-level <system-sw-low-level@mellanox.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "mchehab@kernel.org" <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Subject: RE: [patch v15 1/4] drivers: jtag: Add JTAG core driver
Thread-Topic: [patch v15 1/4] drivers: jtag: Add JTAG core driver
Thread-Index: AQHTfXcJYDm1w6usvESRR+honO/XmKNUr80AgBvBXiA=
Date: Fri, 12 Jan 2018 16:42:35 +0000
Message-ID: <AM4PR0501MB2194A5EF09E5F3140F2C211CB1170@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1514202808-29747-1-git-send-email-oleksandrs@mellanox.com>
 <1514202808-29747-2-git-send-email-oleksandrs@mellanox.com>
 <13433849-cb7d-e2c0-4ce9-d91a6012d7d7@gmail.com>
In-Reply-To: <13433849-cb7d-e2c0-4ce9-d91a6012d7d7@gmail.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [79.135.198.29]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR0501MB2340;
 7:IpBCQ1Cydmgo2yb7OxWLP1dfWE93EYt1+sPY8M6lJKapfmgsWtUVVvCKURuswwXpKVq08jwmFzu1wxgajoTrQTSqkDOI+cI9WSglcy6mwmYEgXqVTjxA4hSFZOJEcCQr0HOaHkT9w1ClRHFgqKXwKyEnDM7FxwTW8VvSKzfwbbudKWFf0UTm6V5Ma0BTGgOaMEh6VM5ebS/5fb3UIo9mlb7UmFNgAs6WmgCy9kIx8aGcoFgG16b4ysiZVdPUd2k0
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 968811ee-93c0-4b21-0955-08d559db7c0e
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
 SRVR:AM4PR0501MB2340; 
x-ms-traffictypediagnostic: AM4PR0501MB2340:
x-microsoft-antispam-prvs: <AM4PR0501MB2340076753582F95B284DC1CB1170@AM4PR0501MB2340.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(85827821059158)(258649278758335)(42262312472803)(155532106045638);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501075)(93006095)(93001095)(3002001)(10201501046)(6055026)(6041268)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
 SRVR:AM4PR0501MB2340; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:AM4PR0501MB2340; 
x-forefront-prvs: 0550778858
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(39380400002)(396003)(39860400002)(13464003)(189003)(199004)(2906002)(81166006)(5250100002)(2501003)(8936002)(81156014)(3280700002)(33656002)(8676002)(3660700001)(3846002)(6116002)(14454004)(478600001)(2900100001)(2950100002)(7736002)(74316002)(7416002)(5660300001)(53546011)(7696005)(59450400001)(305945005)(6506007)(76176011)(102836004)(105586002)(25786009)(316002)(110136005)(54906003)(68736007)(99286004)(106356001)(86362001)(107886003)(39060400002)(6246003)(66066001)(9686003)(2201001)(6436002)(55016002)(4326008)(97736004)(229853002)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0501MB2340;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: KtzxI9mWv+4X6+XeCdXFRNHcIHDyiaYCB4Puxnrhhw4S/mOEztQrDcpaVB2XSiYNybmrSepTyO4Wi9I1gvM5mw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968811ee-93c0-4b21-0955-08d559db7c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2018 16:42:35.6016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0501MB2340
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jan 2018 16:42:45 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRmxvcmlhbiBGYWluZWxs
aSBbbWFpbHRvOmYuZmFpbmVsbGlAZ21haWwuY29tXQ0KPiBTZW50OiAyNiDQtNC10LrQsNCx0YDR
jyAyMDE3INCzLiAxOjA5DQo+IFRvOiBPbGVrc2FuZHIgU2hhbXJheSA8b2xla3NhbmRyc0BtZWxs
YW5veC5jb20+Ow0KPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgYXJuZEBhcm5kYi5kZQ0K
PiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgb3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnOyBqb2VsQGptcy5pZC5hdTsNCj4gamlyaUByZXNudWxsaS51czsgdGts
YXVzZXJAZGlzdGFuei5jaDsgbGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZzsgVmFkaW0NCj4g
UGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPjsgc3lzdGVtLXN3LWxvdy1sZXZlbCA8c3lz
dGVtLXN3LWxvdy0NCj4gbGV2ZWxAbWVsbGFub3guY29tPjsgcm9iaCtkdEBrZXJuZWwub3JnOyBv
cGVub2NkLWRldmVsLQ0KPiBvd25lckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LWFwaUB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGRhdmVtQGRhdmVtbG9mdC5uZXQ7IG1jaGVoYWJAa2VybmVsLm9y
ZzsgSmlyaSBQaXJrbw0KPiA8amlyaUBtZWxsYW5veC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbcGF0
Y2ggdjE1IDEvNF0gZHJpdmVyczoganRhZzogQWRkIEpUQUcgY29yZSBkcml2ZXINCj4gDQo+IA0K
DQpbc25pcF0NCg0KPiA+ICsNCj4gPiArCWNhc2UgSlRBR19JT0NYRkVSOg0KPiA+ICsJCWlmIChj
b3B5X2Zyb21fdXNlcigmeGZlciwgKHZvaWQgKilhcmcsDQo+ID4gKwkJCQkgICBzaXplb2Yoc3Ry
dWN0IGp0YWdfeGZlcikpKQ0KPiA+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4gPiArDQo+ID4gKwkJ
aWYgKHhmZXIubGVuZ3RoID49IEpUQUdfTUFYX1hGRVJfREFUQV9MRU4pDQo+ID4gKwkJCXJldHVy
biAtRUlOVkFMOw0KPiA+ICsNCj4gPiArCQlpZiAoeGZlci50eXBlID4gSlRBR19TRFJfWEZFUikN
Cj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsJCWlmICh4ZmVyLmRpcmVjdGlv
biA+IEpUQUdfV1JJVEVfWEZFUikNCj4gPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+
ICsJCWlmICh4ZmVyLmVuZHN0YXRlID4gSlRBR19TVEFURV9QQVVTRURSKQ0KPiA+ICsJCQlyZXR1
cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwkJZGF0YV9zaXplID0gRElWX1JPVU5EX1VQKHhmZXIu
bGVuZ3RoLCBCSVRTX1BFUl9CWVRFKTsNCj4gPiArCQl4ZmVyX2RhdGEgPSBtZW1kdXBfdXNlcih1
NjRfdG9fdXNlcl9wdHIoeGZlci50ZGlvKSwNCj4gZGF0YV9zaXplKTsNCj4gPiArDQo+ID4gKwkJ
aWYgKCF4ZmVyX2RhdGEpDQo+ID4gKwkJCXJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4gPiArCQlp
ZiAoanRhZy0+b3BzLT54ZmVyKSB7DQo+ID4gKwkJCWVyciA9IGp0YWctPm9wcy0+eGZlcihqdGFn
LCAmeGZlciwgeGZlcl9kYXRhKTsNCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQlrZnJlZSh4ZmVy
X2RhdGEpOw0KPiA+ICsJCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gKwkJfQ0KPiANCj4gV2h5
IGRvbid0IHlvdSBtb3ZlIGFsbCBvZiB0aGUgY29kZSBoZXJlIGludG8gYSBmdW5jdGlvbiB3aGlj
aCB3aWxsIG1ha2UgdGhlDQo+IGVycm9yIGhhbmRsaW5nIGNvbnNpc3RlbnQ/IEFsc28sIGNoZWNr
aW5nIHdoZXRoZXIgdGhlIGp0YWcgYWRhcHRlcg0KDQpHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gU2F5IHRvIG1vdmUgYWxsIG9mIHRoaXMgaW5zaWdodCBpb2N0bCANCg0KPiBp
bXBsZW1lbnRzIG9wcy0+eGZlciBzaG91bGQgcHJvYmFibHkgYmUgZG9uZSBiZWZvcmUgeW91IGRv
IHRoZQ0KPiBtZW1kdXBfdXNlcigpLg0KDQpZZXMNCg0KPiA+ICsJCWlmIChlcnIpIHsNCj4gPiAr
CQkJa2ZyZWUoeGZlcl9kYXRhKTsNCj4gPiArCQkJcmV0dXJuIC1FRkFVTFQ7DQo+ID4gKwkJfQ0K
PiA+ICsNCj4gPiArCQlpZiAoanRhZy0+b3BzLT5tb2RlX3NldCkNCj4gPiArCQkJZXJyID0ganRh
Zy0+b3BzLT5tb2RlX3NldChqdGFnLCB2YWx1ZSk7DQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQllcnIg
PSAtRU9QTk9UU1VQUDsNCj4gPiArCQlicmVhazsNCj4gDQo+IFNhbWUgaGVyZSwgdGhpcyBjYW4g
YmUgY2hlY2tlZCBiZWZvcmUgZ2V0X3VzZXIoKS4NCj4gDQoNClllcw0KDQo+ID4gKwlpZiAoanRh
Zy0+b3BlbmVkKSB7DQo+ID4gKwkJbXV0ZXhfdW5sb2NrKCZqdGFnLT5vcGVuX2xvY2spOw0KPiA+
ICsJCXJldHVybiAtRUlOVkFMOw0KPiANCj4gLUVCVVNZIG1heWJlPw0KPiANCg0KWWVzDQoNCg0K
PiA+ICsNCj4gPiArCWp0YWcgPSBremFsbG9jKHNpemVvZigqanRhZykgKyByb3VuZF91cChwcml2
X3NpemUsDQo+IEFSQ0hfRE1BX01JTkFMSUdOKSwNCj4gPiArCQkgICAgICAgR0ZQX0tFUk5FTCk7
DQo+ID4gKwlpZiAoIWp0YWcpDQo+ID4gKwkJcmV0dXJuIE5VTEw7DQo+IA0KPiBJZiB5b3Ugc2V0
IEFSQ0hfRE1BX01JTkFMSUdOIHRvIDEgd2hlbiBub3QgZGVmaW5lZCwgd2hhdCBpcyB0aGlzDQo+
IGFjaGlldmluZyB0aGF0IGttYWxsb2MoKSBpcyBub3QgYWxyZWFkeSBkb2luZz8NCj4gDQoNClJl
bW92ZWQgQVJDSF9ETUFfTUlOQUxJR04NCg0KPiA+ICsNCj4gPiArCWp0YWctPm9wcyA9IG9wczsN
Cj4gPiArCXJldHVybiBqdGFnOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKGp0YWdf
YWxsb2MpOw0KPiA+ICsNCj4gPiArdm9pZCBqdGFnX2ZyZWUoc3RydWN0IGp0YWcgKmp0YWcpDQo+
ID4gK3sNCj4gPiArCWtmcmVlKGp0YWcpOw0KPiA+ICt9DQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BM
KGp0YWdfZnJlZSk7DQo+ID4gKw0KPiA+ICtpbnQganRhZ19yZWdpc3RlcihzdHJ1Y3QganRhZyAq
anRhZykNCj4gPiArew0KPiA+ICsJY2hhciAqbmFtZTsNCj4gPiArCWludCBlcnI7DQo+ID4gKwlp
bnQgaWQ7DQo+ID4gKw0KPiA+ICsJaWQgPSBpZGFfc2ltcGxlX2dldCgmanRhZ19pZGEsIDAsIDAs
IEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKGlkIDwgMCkNCj4gPiArCQlyZXR1cm4gaWQ7DQo+ID4g
Kw0KPiA+ICsJanRhZy0+aWQgPSBpZDsNCj4gPiArDQo+ID4gKwluYW1lID0ga3phbGxvYyhNQVhf
SlRBR19OQU1FX0xFTiwgR0ZQX0tFUk5FTCk7DQo+ID4gKwlpZiAoIW5hbWUpIHsNCj4gPiArCQll
cnIgPSAtRU5PTUVNOw0KPiA+ICsJCWdvdG8gZXJyX2p0YWdfYWxsb2M7DQo+ID4gKwl9DQo+IA0K
PiBDYW4ndCB5b3UgdXNlIGp0YWctPm1pc2NkZXYuZGV2IGhlcmUgdG8gc2ltcGxpZnkgdGhlIGFs
bG9jYXRpb24gZXJyb3INCj4gaGFuZGxpbmc/DQo+IA0KDQpIb3csIHdoYXQgeW91IG1lYW4/DQoN
Cj4gPiArI2lmbmRlZiBBUkNIX0RNQV9NSU5BTElHTg0KPiA+ICsjZGVmaW5lIEFSQ0hfRE1BX01J
TkFMSUdOIDENCj4gPiArI2VuZGlmDQo+IA0KPiBXaHk/DQo+IA0KDQpOb3QgdXNlZCBub3csIERl
bGV0ZWQNCg0KPiA+ICsjZW5kaWYgLyogX19KVEFHX0ggKi8NCj4gPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2xpbnV4L2p0YWcuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9qdGFnLmggbmV3DQo+
ID4gZmlsZSBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwLi5jZGEyNTIwDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9qdGFnLmgNCj4gDQo+IFtzbmlwXQ0K
PiANCj4gPiArc3RydWN0IGp0YWdfeGZlciB7DQo+ID4gKwlfX3U4CXR5cGU7DQo+ID4gKwlfX3U4
CWRpcmVjdGlvbjsNCj4gDQo+IENhbiB0aGVzZSB0d28gYmUgYW4gZW51bSByZWZlcnJpbmcgdG8g
d2hhdCB5b3UgZGVmaW5lZCBlYXJsaWVyPw0KPiANCg0KR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+IHNheToNCg0KIkFsbCBzdHJ1Y3R1cmVzIHRoYXQgY3Jvc3MgdGhlIHVzZXIv
a2VybmVsIGJvdW5kcnkgaGF2ZSB0byB1c2UgdGhlIF9fIHR5cGUgdmFyaWFibGVzLg0KTm8gInVu
c2lnbmVkIGNoYXIiLCBpdCBoYXMgdG8gYmUgIl9fdTgiLCBubyAidW5zaWduZWQgc2hvcnQiLCBp
dCBoYXMgdG8gYmUgIl9fdTE2IiwgYW5kIHNvIG9uLg0KQWxzbywgd2F0Y2ggb3V0IGZvciB5b3Vy
IGVudW1lcmF0ZWQgdHlwZXMsIHdoYXQncyB0aGUgcGFja2luZyBlbmQgdXAgbG9va2luZyBsaWtl
IG9uIHRoZXNlIHN0cnVjdHVyZXM/ICBIYXZlIHlvdSB2ZXJpZmllZCBpdCB3b3JrcyB3aXRoIGEg
NjRiaXQga2VybmVsIGFuZCAzMmJpdCB1c2Vyc3BhY2UgYWxsIGNvcnJlY3RseT8iDQoNClNvIEkg
dXNlIF9fdTggdHlwZSBpbnN0ZWFkIG9mIGVudW0gdG8gYXZvaWQgZXJyb3JzIHdoaWxlIGNyb3Nz
aW5nIDY0Yml0IGtlcm5lbCBhbmQgMzJiaXQgdXNlcnNwYWNlLg0KDQo+ID4gKwlfX3U4CWVuZHN0
YXRlOw0KPiA+ICsJX191MzIJbGVuZ3RoOw0KPiA+ICsJX191NjQJdGRpbzsNCj4gPiArfTsNCj4g
LS0NCj4gRmxvcmlhbg0KDQpUaGFrcy4NCg0K
