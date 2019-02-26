Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=2a01:111:f400:fe1f::618;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="kJUJS4/H";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448FW06kV9zDqJq
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 10:33:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCpIkiSjdq9nXVQFwAsuchmgkrREg6yHIgqqCTp1xZU=;
 b=kJUJS4/Hc3aQuYvB5fpCyf6+ArZ76wlBA9M29XSfrS/yGOAgFa8UQO8iKjAUwwsweekMqYDzzX/Ils4chTStG0mi2/rB7kfzTrcq3eYLwlUPTenPSnoFFzkzMUV7qWpQjU/lq+Fp4+3/2FAkKAg1GEe9AxuwxqLzuGsmt/4cmOs=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3632.eurprd05.prod.outlook.com (52.134.7.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1643.16; Tue, 26 Feb 2019 23:33:20 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::2127:2c98:9e0f:ca16%3]) with mapi id 15.20.1643.019; Tue, 26 Feb 2019
 23:33:20 +0000
From: David Thompson <dthompson@mellanox.com>
To: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Subject: RE: Patches for U-Boot v2016.07-aspeed-openbmc?
Thread-Topic: Patches for U-Boot v2016.07-aspeed-openbmc?
Thread-Index: AdTNNjIaoC4ZejI8S82DncCGrScAWAAK8KAAADIcYQA=
Date: Tue, 26 Feb 2019 23:33:19 +0000
Message-ID: <VI1PR0502MB3869BAA419AF15A98BAB340DDD7B0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <VI1PR0502MB38692DFF848268A3BB778560DD7A0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
 <60aeb06f-9885-4b17-bbfc-4071bce56276@www.fastmail.com>
In-Reply-To: <60aeb06f-9885-4b17-bbfc-4071bce56276@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [108.20.21.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 360073f8-0a60-4965-e214-08d69c42ca94
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3632; 
x-ms-traffictypediagnostic: VI1PR0502MB3632:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtWSTFQUjA1MDJNQjM2MzI7MjM6YUY5ZE1SaUZHM0hYTmJuSVFEZnlWRnNG?=
 =?utf-8?B?dldrTFlraWtNSmZJaWJMZFA2QmVlMStyaVJxdmorOUNpbUlHRHhOYkdRbEMy?=
 =?utf-8?B?TW5wQ254ZnNYTTVGZmM4dzVDa0p3SFlMZjYxTzFBd3QxMW5xa0daWVBPVEdi?=
 =?utf-8?B?QkRlOTd2a3NoYkdxQ2NpYzRrSWdxZlNxaXEyZU00UWFCMWI0Lzdkaml4UzFL?=
 =?utf-8?B?VFVsdEtDajBscVdiNzY3RXhVSkVYK1hlcklwZ3BCTlJnZ3BOMldTOHRZem9F?=
 =?utf-8?B?UVJ1em0rVlhHUjdOM1N3MVJUTXFvQnZrdDJZSGdEaHBETFd3TVZGRDFXbHB3?=
 =?utf-8?B?OEtKdVNFYTFuQzBScWkvWDZWVFZUbC9XTGNqYmJleS84cDVjTGFNVnRrRlp1?=
 =?utf-8?B?bm1UeEtpMEF3dS9tN2R5SmswaUsyWks3MVQzc0d1RWozOGpkWGV4RllmVExD?=
 =?utf-8?B?Q1k2dk1qUUtVY1FTbHFzTXAvUmVjeHE4dUxSSVpwUlVnQyt5b1hyODM5SG4w?=
 =?utf-8?B?TVRHa0VLZGlxVnBOc2ZjT2NBQkNmZUVkNHdtc2pMRklJWWdtNktmMmxUVXpW?=
 =?utf-8?B?NVBIUVZmL2JScmhaR2lrcXhVdUFMZXlCN0JsSFBWSENlNVVKTUFrYzJEazZV?=
 =?utf-8?B?Vmx6RFliWWI1OWVmN1JYVGhvYmRsTWxhaVAyZ0xuSXEvTXhCQ1Y2NWpGRmRy?=
 =?utf-8?B?TThqQVpGSEMzVzhpMjc3VWdEelZzRVhpL0tuMkd3TkMzYUxWVHlwQUxKSWF0?=
 =?utf-8?B?Qm8zcHRXR1ZXQzd0RVZMTXlHempISWVqOUhhZUIyUkFEcWgrWFR6enJrSmxm?=
 =?utf-8?B?K0p4ajYyeXo2NFhwMjVld1lyWnI0dUdMYWJTUlRVaXh0YUd3ZG04VGRvU1RT?=
 =?utf-8?B?Qm5yY1U0VE15UnpTZFkxclVuOEVRdmxRL3JQQzlvZUJKL0JNM2FpcU1lS044?=
 =?utf-8?B?U1VJSDZWaXd0a0ZhTEM0OUJMOWlONjZvMlJyd05keTFjb0VXTXEzcXg5MGdC?=
 =?utf-8?B?TzRaVEdCVEhPTnZrckxBKzkySlhNQ1Y1NFR4QWMzS0dYekxPM2RpbFA4ZVJk?=
 =?utf-8?B?M3kycm1ldkUzdmpOaUFBdnlTbTU3ZGJEa2pFNGVGS3BONWhEaVhaWGpxTGxQ?=
 =?utf-8?B?M3FIYzF6ZGd5RFBwV1cwVWJkeTRXZ1RQTThpOU1CSzN2WmttVHAyRkVuTGhV?=
 =?utf-8?B?U0ZOWW5wRlZlT3VSVzROYzFzbjF0WXU4VXBJaHQ5eHhENXBzOWJCcm1lTVlO?=
 =?utf-8?B?YnFJRzYxcFM1NlhqUDB2eVdhc3lKNjVEVXU5RnE0MG5WRFdNNExJZUNvVE5V?=
 =?utf-8?B?ei9UdmcvWnNwekt0aE10ZzljN2h6Nk14ODN4VmxrV3dtQmwrYnNKTUhzR0tQ?=
 =?utf-8?B?Q1ZxSVJ1QTVNYy9wcUF3TUI0TVhhVEs3YWZ4b1NhSW5LU1FoUWtYc0lMU0pH?=
 =?utf-8?B?ejhoYnc4a2VBY3NudXFkU015cHBqNjJlRTB4Sk1PdlVtWEhIdDVZSHJWdkNW?=
 =?utf-8?B?SHFOTGptOHNTTnQ1VnpYaitkNjhKeFRiS1hnOXJlU0lZeUxyN1J4SGtoQ3NZ?=
 =?utf-8?B?eWdEMDhoREdQL1pjQ3BkL1NsenMvcE9VcUJvd0J3YVYzTzQ3cXVJUlpVYjl5?=
 =?utf-8?B?bXl2VHdadEQzbDhkc3MwdVlWWVZTblN3Y3RGUXJyTTJNdXlpVHU2dFNiRlkz?=
 =?utf-8?Q?qG+KkG7MXZFVtggkHu6M=3D?=
x-microsoft-antispam-prvs: <VI1PR0502MB3632AE8DB1225F713B36FCF1DD7B0@VI1PR0502MB3632.eurprd05.prod.outlook.com>
x-forefront-prvs: 096029FF66
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(366004)(136003)(396003)(51874003)(199004)(189003)(13464003)(74316002)(486006)(7696005)(305945005)(97736004)(33656002)(105586002)(76176011)(106356001)(446003)(11346002)(256004)(53936002)(476003)(14454004)(2906002)(68736007)(25786009)(55016002)(9686003)(6116002)(3846002)(186003)(478600001)(26005)(6436002)(53546011)(6506007)(102836004)(99286004)(71190400001)(71200400001)(8676002)(86362001)(66066001)(229853002)(110136005)(5660300002)(81156014)(81166006)(8936002)(7736002)(316002)(52536013)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3632;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3EkgGYAPgmqEMvGY+eiowNaSgCPU3jNwY3bM4ftwpXGWwuVK6ssLwH+GBgq2AerUH5oLgv5/N0y/Kk8RE3ds6EPSZE00J7a6adasxKuXqphlT2GrbE9Q4k3LBs97YigSSpZSUk62YbPY5k+SJbyhHkRDQHBN2GT5J3ffhAHIbIJbmbGcbqk6u4+D8s7xNlz0fY5Tc5ocu4QNT/eN1LhdRSMkyrFZW3e+TXw8cobwolgBjp43XWBMeU+UtRxnUI20qOwlGih2eEkOkwU8I+M+bhg/MpWKNTHuAkc+4IRcRFvVMUBX0P+powinZ2/DjzIbyDSKEvQfHb2004yaDgD2FS6leX/khYty3tfIf1B6gICWRe45yRxeT+QvdxHmvALvN7Ho2LRHe46MbCbUATHhaJXxn44DlVWN+N+TTiUCTm8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360073f8-0a60-4965-e214-08d69c42ca94
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2019 23:33:19.8512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3632
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
X-List-Received-Date: Tue, 26 Feb 2019 23:33:35 -0000

Q29ycmVjdCwgZm9yIG15IEJNQyBwcm9qZWN0IEkgaGF2ZSBtYWRlIGNoYW5nZXMgdG8gT3BlbkJN
QydzIFUtQm9vdCBpbWFnZSAodjIwMTYuMDctYXNwZWVkLW9wZW5ibWMgYnJhbmNoKS4NCg0KTXkg
Z29hbCBpcyB0byAidXBzdHJlYW0iIHRoZXNlIGNoYW5nZXMgdG8gT3BlbkJNQyBzbyB0aGF0DQpJ
IGRvbid0IG5lZWQgdG8gY2FycnkgdGhlbSBhcm91bmQgaW4gbXkgcHJpdmF0ZSByZXBvLg0KDQpJ
IGhhZCBhbHJlYWR5IHNlbnQgaW4gb25lIHBhdGNoIGZvciByZXZpZXcsIGFkZHJlc3NlZCB0byBK
b2VsLg0KSSB3aWxsIGFkZCB5b3UgQW5kcmV3IHRvIHRoYXQgc2FtZSBlbWFpbCwgc2luY2UgSSBk
aWQgbm90IGtub3cgSm9lbCB3YXMgb24gbGVhdmUuDQoNClRoYW5rIHlvdSwNCi0gRGF2ZQ0KDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PiANClNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMjUsIDIwMTkgNjozMCBQTQ0KVG86
IERhdmlkIFRob21wc29uIDxkdGhvbXBzb25AbWVsbGFub3guY29tPjsgT3BlbkJNQyBNYWlsbGlz
dCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5h
dT4NClN1YmplY3Q6IFJlOiBQYXRjaGVzIGZvciBVLUJvb3QgdjIwMTYuMDctYXNwZWVkLW9wZW5i
bWM/DQoNCg0KDQpPbiBUdWUsIDI2IEZlYiAyMDE5LCBhdCAwNDo1OSwgRGF2aWQgVGhvbXBzb24g
d3JvdGU6DQo+ICANCj4gVGhlIGxhdGVzdCBPcGVuQk1DIDIuNiBpcyBiYXNlZCBvbiBVLUJvb3Qg
djIwMTYuMDctYXNwZWVkLW9wZW5ibWMuDQo+IA0KPiANCj4gSSBoYXZlIGEgZmV3IHBhdGNoZXMg
SeKAmW0gY29uc2lkZXJpbmcgdXBzdHJlYW1pbmcsDQoNCiJVcHN0cmVhbSIgaW4gdGhpcyBjYXNl
IGJlaW5nIE9wZW5CTUMsIG9yIHRvIHRoZSBhY3R1YWwgdS1ib290IHByb2plY3Q/DQoNCj4gb25l
IG9mIHdoaWNoIGlzIGEgbmV3DQo+IA0KPiBVLUJvb3QgbWFjaGluZS9ib2FyZC4gU2hvdWxkIEkg
c2VuZCBpbiBwYXRjaGVzIGJhc2VkIG9mZiB0aGlzIG9sZGVyLA0KPiANCj4gYnV0IGN1cnJlbnRs
eSB1c2VkLCBVLUJvb3QgYnJhbmNoPw0KDQpJZiB5b3UncmUgcGxhbm5pbmcgdG8gc2VuZCB0byB0
aGUgdS1ib290IHByb2plY3QgeW91IGNlcnRhaW5seSBjYW4ndCBiYXNlIGl0IG9uIE9wZW5CTUMn
cyBmb3JrIDopDQoNCj4gT3IsIHNob3VsZCBJIGp1c3QgYmUgc2VuZGluZyBpbg0KPiANCj4gcGF0
Y2hlcyBiYXNlZCBvbiBsYXRlc3QgdXBzdHJlYW0gVS1Cb290LCB3aXRoIHRoZSBpbnRlbnQgdGhh
dA0KPiANCj4gZXZlbnR1YWxseSBPcGVuQk1DIHdpbGwgYmUgcGlja2luZyB1cCBhIG5ld2VyIHZl
cnNpb24gb2YgVS1Cb290Pw0KDQpPdXIgdS1ib290IGlzIGluIGEgcHJldHR5IGJhZCBzdGF0ZSBh
dCB0aGUgbW9tZW50LCBhbmQgbm8tb25lIHJlYWxseSBzZWVtcyB0byBoYXZlIHRoZSB0aW1lIHRv
IGltcHJvdmUgaXQuIFNldmVyYWwgZmFjdG9ycyBtYWtlIGl0IGEgYml0IG9mIGEgcGFpbjoNCg0K
KiBBc3BlZWQncyBjaGlwIHRlYW0gcHJvZHVjZXMgYSBtb25vbGl0aGljIHBsYXRmb3JtLlMgZmls
ZSB0byBpbml0aWFsaXNlIGhhcmR3YXJlIGFuZCB3b3JrIGFyb3VuZCBjaGlwIGJ1Z3Mgd2hlcmUg
dGhleSBjYW4NCiogcGxhdGZvcm0uUyBpbmNsdWRlcyBEUkFNIGluaXRpYWxpc2F0aW9uDQoqIHVw
c3RyZWFtIHUtYm9vdCBpbmNsdWRlcyBhIEMgaW1wbGVtZW50YXRpb24gb2YgRFJBTSBpbml0aWFs
aXNhdGlvbiB0aGF0IGlzIGFsbW9zdCBidXQgbm90IHF1aXRlIGVudGlyZWx5IHVubGlrZSB0aGUg
c3RyYXRlZ3kgdXNlZCBpbiBwbGF0Zm9ybS5TDQoNCkFuIGVhc3kgd2F5IGZvcndhcmQgd291bGQg
YmUgdG8gZHVtcCBwbGF0Zm9ybS5TIGZvciBlYWNoIGdlbmVyYXRpb24gaW50byB1cHN0cmVhbSwg
YnV0IHRoZSBzdXNwaWNpb24gaXMgd2UnZCBuZWVkIGEgcHJldHR5IGRhbW4gY29udmluY2luZyBh
cmd1bWVudCBmb3IgaXQgYW5kIGZvciB0aGUgcmVtb3ZhbCBvZiB0aGUgQy1iYXNlZCBEUkFNIGlu
aXRpYWxpc2F0aW9uLiBDb252ZXJ0aW5nIGl0IGFsbCB0byBDIGRvZXNuJ3QgcmVhbGx5IHNlZW0g
ZmVhc2libGUgZWl0aGVyLCBhcyB3ZSdkIG5lZWQgdG8gYW5hbHlzZSBhbGwgdGhlIGFzc2VtYmx5
IGZvciBlYWNoIHJlbGVhc2Ugb2YgdGhlIFNESyBhbmQgcG9ydCB0aGUgbmV3IGZpeGVzIG9uIGVh
Y2ggcmVsZWFzZS4NClRoYXQncyBhIHByZXR0eSB0ZWRpb3VzIHRhc2suIE1heWJlIHNvbWUgbWlk
ZGxlIGdyb3VuZCBjYW4gYmUgZm91bmQgdGhvdWdoPw0KDQpJIGRvIGtub3cgdGhhdCBKb2VsIGlz
IGtlZW4gdG8gdHVybiB0aGUgc2l0dWF0aW9uIGFyb3VuZCBhbmRtYXkgaGF2ZSBzb21lIGZlZWRi
YWNrIHdoZW4gaGUgY29tZXMgYmFjayBmcm9tIGxlYXZlLg0KDQpJbiB0aGUgbWVhbiB0aW1lIEkg
Z3Vlc3MgeW91IGNhbiBzZW5kIHRoZSBwYXRjaGVzIGhlcmU/IEF0IGxlYXN0IHRoYXQgd2F5IHlv
dSB3b24ndCBiZSBjYXJyeWluZyB0aGVtIGluIHRoZSB5b2N0byB0cmVlLg0KDQpBbmRyZXcNCg0K
PiANCj4gDQo+IFRoYW5rcyBpbiBhZHZhbmNlLA0KPiANCj4gICogRGF2ZQ0KPiANCj4gDQo+IERh
dmlkIFRob21wc29uDQo+IA0KPiBTci4gU3RhZmYgRW5naW5lZXIsIFN5c3RlbSBTVw0KPiANCj4g
TWVsbGFub3ggVGVjaG5vbG9naWVzDQo+IA0KPiAxOTAwIFdlc3QgUGFyayBEcml2ZSwgU3VpdGUg
MjkwDQo+IA0KPiBXZXN0Ym9yb3VnaCBNQSBVU0EgMDE1ODENCj4gDQo+IERpcmVjdDogKzEgNTA4
LTQ3NS02Mzc1DQo+IA0KPiANCj4NCg==
