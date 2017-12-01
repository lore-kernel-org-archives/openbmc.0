Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.3.80; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="F7yoEG1D";
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30080.outbound.protection.outlook.com [40.107.3.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ypBRD0BQvzDrvM
 for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2017 22:11:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0xdOMSPuV0lp2lIQzstFty7OxqN7+oxVaS1Lcb8silQ=;
 b=F7yoEG1DCW8p6JQF8lgegzvLyuXmKBLN99t5Vn+qjDItnpqtgMwlH0wnT9K3DGnGLwnuKkcduyDUuvWBCVAPiC6UnH9nw08tSowunznW5bGfOMjFbJLorTec3kBIPNsUK6BqJ8cPWcMX/5SWFQNUxBRaazao+U8ddWKyM8K2OPQ=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 VI1PR05MB3342.eurprd05.prod.outlook.com (10.170.238.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.260.4; Fri, 1 Dec 2017 11:11:03 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::a17d:e2e6:2095:d246]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::a17d:e2e6:2095:d246%17]) with mapi id 15.20.0282.006; Fri, 1 Dec 2017
 11:11:04 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: 'Kun Yi' <kunyi@google.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "arnd@arndb.de"
 <arnd@arndb.de>, system-sw-low-level <system-sw-low-level@mellanox.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "jiri@resnulli.us"
 <jiri@resnulli.us>, Vadim Pasternak <vadimp@mellanox.com>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "mec@shout.net" <mec@shout.net>, 
 Jiri Pirko <jiri@mellanox.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "tklauser@distanz.ch" <tklauser@distanz.ch>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [patch v12 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
Thread-Topic: [patch v12 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
Thread-Index: AQHTXWmOxItJNl+A6E2rCoN3qQNgbaMsDkYAgAJRjSA=
Date: Fri, 1 Dec 2017 11:11:03 +0000
Message-ID: <AM4PR0501MB21946528385296CCEEBFEB1AB1390@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1510675867-24276-1-git-send-email-oleksandrs@mellanox.com>
 <1510675867-24276-3-git-send-email-oleksandrs@mellanox.com>
 <CAGMNF6XRwU5QEJhkg-mVwE5zpPigtcGJtRUupZHtcWRdedcsxg@mail.gmail.com>
In-Reply-To: <CAGMNF6XRwU5QEJhkg-mVwE5zpPigtcGJtRUupZHtcWRdedcsxg@mail.gmail.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [82.166.227.17]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3342;
 6:v2MXQolWbFEAPlL/FrDJVX69OM5QUzQhLLL5Ji++10iMrol1v3ACfqwhYQ0CaX9OB8/FE8Qf6UMcgt8djxxb+1rwNi7kQ2cEKy5X1+DBbwOymJfJcggq75SF0LI6ZAQN47ePOILDT7BVv68cGeJQUg0OoMsQfiBbhrQj8MOO+2XfxXuLPCJlrCNSpkz61Qw9NnsB45/Tqx14idEqItAlbHj7ItmyskwiBfHsEMaWcdIuAnwfWlLdfKnBIC8wFgSR0awvEEfNdMTibZwmj+vWytif+zY+kRll4DZStPYP6hXR7HvxaQkOWFia3H4xyY8ml+z/UAx2fFn/ZTQsFMJgTryGHKbZMpshlUaHidVkNYs=;
 5:fq0S+WUDecvfScpfnGAHRLarAZ61ODuaHD2yDbIHHURFFDerJu07RthNqZFw1e9QVN7jxd71CCEHjYTqVofH8YrWCvjezlZhjRxreHgJgGv2ZlHcMv/bO3A9EZ7yXYtPDEoRaRVlD0yTRTj08uvVWJOB5Fzon2FgcvDvackPPdQ=;
 24:ZsBGnh4z6UHiGaH2cuF3P0whuQqYyxZCidc646EZfoXmD000ce2eYEHQtTpMzVrpJNrrxelmrW4q8Amo0j9E3wEiW6J3JevEPmtY1E4z7lY=;
 7:zA9niZWZ2w2tOQRnNX9BZCk9NFoubZvbuLMppPCZctY/vuytyA0kIYbobsQyTFFWhx4EOVleKYUzT6GvWgBjmNrsitooQ/kV7GRvBT+9nLpi9jenyx7hGukDS4n6e74/4T+fC2/0e6738FfR6rl0qLjoEj7DtVg4609iYR0+e/OjBHMy9g05TeoFMtp85f0ILG8JAL0ZqP3bmCt/qGqH+qwMyoVUFSDNH3ndoIzK+eUNx4CKXwg3JJbuOvEtSD56
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f035c66a-8549-4ddc-a553-08d538ac365c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(48565401081)(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603286);
 SRVR:VI1PR05MB3342; 
x-ms-traffictypediagnostic: VI1PR05MB3342:
x-microsoft-antispam-prvs: <VI1PR05MB33428F5517DD0133B32B64F2B1390@VI1PR05MB3342.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(211936372134217)(42262312472803);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231022)(920507027)(6055026)(6041248)(20161123560025)(20161123562025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123558100)(20161123564025)(20161123555025)(6072148)(201708071742011);
 SRVR:VI1PR05MB3342; BCL:0; PCL:0; RULEID:(100000803101)(100110400095);
 SRVR:VI1PR05MB3342; 
x-forefront-prvs: 05087F0C24
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(7966004)(376002)(366004)(346002)(39860400002)(199003)(13464003)(24454002)(189002)(34040400001)(7696005)(53546010)(66066001)(2950100002)(6436002)(5660300001)(14454004)(7416002)(229853002)(6506006)(2906002)(68736007)(99286004)(76176011)(9686003)(97736004)(25786009)(6916009)(54906003)(2900100001)(6246003)(3280700002)(305945005)(86362001)(4326008)(81156014)(105586002)(102836003)(316002)(74316002)(8676002)(189998001)(53936002)(33656002)(7736002)(81166006)(6116002)(3660700001)(55016002)(106356001)(101416001)(508600001)(8936002)(54356011)(3846002)(5250100002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3342;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f035c66a-8549-4ddc-a553-08d538ac365c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2017 11:11:03.9271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3342
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
X-List-Received-Date: Fri, 01 Dec 2017 11:11:24 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLdW4gWWkgW21haWx0bzprdW55
aUBnb29nbGUuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgMzAsIDIwMTcgMTI6NTEg
QU0NCj4gVG86IE9sZWtzYW5kciBTaGFtcmF5IDxvbGVrc2FuZHJzQG1lbGxhbm94LmNvbT4NCj4g
Q2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBhcm5kQGFybmRiLmRlOyBzeXN0ZW0tc3ct
bG93LWxldmVsDQo+IDxzeXN0ZW0tc3ctbG93LWxldmVsQG1lbGxhbm94LmNvbT47IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOw0KPiBqaXJpQHJlc251bGxpLnVzOyBWYWRpbSBQYXN0ZXJuYWsg
PHZhZGltcEBtZWxsYW5veC5jb20+OyBsaW51eC0NCj4gYXBpQHZnZXIua2VybmVsLm9yZzsgT3Bl
bkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IG9wZW5vY2QtZGV2ZWwtb3duZXJAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Ow0KPiBtZWNAc2hvdXQubmV0OyBKaXJpIFBpcmtvIDxqaXJpQG1lbGxhbm94LmNvbT47IHJv
YmgrZHRAa2VybmVsLm9yZzsgbGludXgtDQo+IHNlcmlhbEB2Z2VyLmtlcm5lbC5vcmc7IHRrbGF1
c2VyQGRpc3RhbnouY2g7IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gZGF2ZW1AZGF2ZW1sb2Z0Lm5l
dDsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
cGF0Y2ggdjEyIDIvNF0gZHJpdmVyczoganRhZzogQWRkIEFzcGVlZCBTb0MgMjR4eCBhbmQgMjV4
eA0KPiBmYW1pbGllcyBKVEFHIG1hc3RlciBkcml2ZXINCj4gDQo+IFRoYW5rcyBmb3Igd29ya2lu
ZyBvbiB0aGUgZHJpdmVyLCBPbGVrc2FuZHIuIEkgZ2F2ZSB0aGlzIGEgdHJ5IG9uIGEgYm9hcmQg
d2l0aA0KPiBBc3BlZWQgMjUyMC4gT25lIHF1ZXN0aW9uIGJlbG93Og0KPiANCj4gT24gVHVlLCBO
b3YgMTQsIDIwMTcgYXQgODoxMSBBTSwgT2xla3NhbmRyIFNoYW1yYXkNCj4gPG9sZWtzYW5kcnNA
bWVsbGFub3guY29tPiB3cm90ZToNCj4gPiBEcml2ZXIgYWRkcyBzdXBwb3J0IG9mIEFzcGVlZCAy
NTAwLzI0MDAgc2VyaWVzIFNPQyBKVEFHIG1hc3RlciBjb250cm9sbGVyLg0KPiA+DQo+ID4gRHJp
dmVyIGltcGxlbWVudHMgdGhlIGZvbGxvd2luZyBqdGFnIG9wczoNCj4gPiAtIGZyZXFfZ2V0Ow0K
PiA+IC0gZnJlcV9zZXQ7DQo+ID4gLSBzdGF0dXNfZ2V0Ow0KPiA+IC0gaWRsZTsNCj4gPiAtIHhm
ZXI7DQo+ID4NCg0KWy4uXQ0KDQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGp0YWdf
b3BzIGFzcGVlZF9qdGFnX29wcyA9IHsNCj4gPiArICAgICAgIC5mcmVxX2dldCA9IGFzcGVlZF9q
dGFnX2ZyZXFfZ2V0LA0KPiA+ICsgICAgICAgLmZyZXFfc2V0ID0gYXNwZWVkX2p0YWdfZnJlcV9z
ZXQsDQo+ID4gKyAgICAgICAuc3RhdHVzX2dldCA9IGFzcGVlZF9qdGFnX3N0YXR1c19nZXQsDQo+
ID4gKyAgICAgICAuaWRsZSA9IGFzcGVlZF9qdGFnX2lkbGUsDQo+ID4gKyAgICAgICAueGZlciA9
IGFzcGVlZF9qdGFnX3hmZXIsDQo+ID4gKyAgICAgICAubW9kZV9zZXQgPSBhc3BlZWRfanRhZ19t
b2RlX3NldCB9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGludCBhc3BlZWRfanRhZ19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSB7DQo+ID4gKyAgICAgICBzdHJ1Y3QgYXNwZWVkX2p0
YWcgKmFzcGVlZF9qdGFnOw0KPiA+ICsgICAgICAgc3RydWN0IGp0YWcgKmp0YWc7DQo+ID4gKyAg
ICAgICBpbnQgZXJyOw0KPiA+ICsNCj4gPiArICAgICAgIGlmICghb2ZfZGV2aWNlX2lzX2NvbXBh
dGlibGUocGRldi0+ZGV2Lm9mX25vZGUsDQo+ID4gKyAiYXNwZWVkLGFzcGVlZC1qdGFnIikpDQo+
IA0KPiBTaG91bGQgdGhpcyBiZSAiYXNwZWVkLGFzdDI0MDAtanRhZyIvImFzcGVlZCxhc3QyNTAw
LWp0YWciIGFzIHNwZWNpZmllZCBpbiB0aGUNCj4gY29tcGF0aWJsZSBzdHJpbmcgYmVsb3c/DQo+
IA0KDQpZZXMNCg0KDQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsN
Cj4gPiArICAgICAgIGp0YWcgPSBqdGFnX2FsbG9jKHNpemVvZigqYXNwZWVkX2p0YWcpLCAmYXNw
ZWVkX2p0YWdfb3BzKTsNCj4gPiArICAgICAgIGlmICghanRhZykNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9ERVY7DQo+ID4gKw0KPiA+ICsgICAgICAgcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwganRhZyk7DQo+ID4gKyAgICAgICBhc3BlZWRfanRhZyA9IGp0YWdfcHJpdihqdGFn
KTsNCj4gPiArICAgICAgIGFzcGVlZF9qdGFnLT5kZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICsNCiAN
ClsuLl0NCg0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiT2xla3NhbmRyIFNoYW1yYXkgPG9s
ZWtzYW5kcnNAbWVsbGFub3guY29tPiIpOw0KPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkFTUEVF
RCBKVEFHIGRyaXZlciIpOyBNT0RVTEVfTElDRU5TRSgiR1BMDQo+IHYyIik7DQo+ID4gLS0NCj4g
PiAxLjcuMQ0KPiA+DQo+IC0tDQo+IFJlZ2FyZHMsDQo+IEt1bg0KDQpUaGFua3MuDQoNCkJSDQpP
bGVrc2FuZHIgU2hhbXJheQ0K
