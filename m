Return-Path: <oleksandrs@mellanox.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10050.outbound.protection.outlook.com [40.107.1.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXWnN1K6QzDqj4
 for <openbmc@lists.ozlabs.org>; Thu, 17 Aug 2017 00:24:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="chu/d5WJ";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Zs48xtEdTl4OOMloDeaoFgoAI5azflWXuZW2VqSzZ3Y=;
 b=chu/d5WJW8Qe0NX4uNor/REEDvDPaJdjl1RrepxZEEQLTVuwy52yboEFzvSNATLxdRT3lcsQxwzQJB92rekDfd6Yxb+oxtycD7M5dCqF2cI0P8HBHZ1glvbJH8XEmNoxmZe5Prx8sootp8Z4kIFgckJ2hO1cELwrr6okjeoF88c=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 VI1PR05MB1757.eurprd05.prod.outlook.com (10.165.236.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.1362.18; Wed, 16 Aug 2017 14:24:16 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::5922:8a4e:22cb:c1e6]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::5922:8a4e:22cb:c1e6%18]) with mapi id 15.01.1341.020; Wed, 16 Aug
 2017 14:24:16 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: gregkh <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, =?utf-8?B?SmnFmcOtIFDDrXJrbw==?=
 <jiri@resnulli.us>, Tobias Klauser <tklauser@distanz.ch>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "mec@shout.net" <mec@shout.net>, "vadimp@maellanox.com"
 <vadimp@maellanox.com>, system-sw-low-level
 <system-sw-low-level@mellanox.com>, Rob Herring <robh+dt@kernel.org>,
 "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, Jiri Pirko <jiri@mellanox.com>
Subject: RE: [patch v3 1/3] drivers: jtag: Add JTAG core driver
Thread-Topic: [patch v3 1/3] drivers: jtag: Add JTAG core driver
Thread-Index: AQHTFa1XL6LNiNTEHUiQ8rcLbWol1aKFRGsAgAHC42A=
Date: Wed, 16 Aug 2017 14:24:16 +0000
Message-ID: <AM4PR0501MB2194CBCC82F7EB67FE73304AB1820@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1502791207-26951-1-git-send-email-oleksandrs@mellanox.com>
 <1502791207-26951-2-git-send-email-oleksandrs@mellanox.com>
 <CAK8P3a3DutrfhGrd9MnDFbzhfvnZXSyrV2RbTgrFGgpbAs=H0w@mail.gmail.com>
In-Reply-To: <CAK8P3a3DutrfhGrd9MnDFbzhfvnZXSyrV2RbTgrFGgpbAs=H0w@mail.gmail.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB1757;
 6:b5hCOklnRmiA4nfueAtPdz/VJFdJW0PCPIxPy4aYIMMh8t9q+QYFRjHn5FbxdeE+V4XPse+vZJMObNS69cs5aPJAtGq57EHhqsEYhNl+8B4qRUbMJXpzYnayh4cnDywm8ECchEVu+KO78Eh8S94K0MUwMyhcMSQ4Tq8KbTyc2b/X5Bkq7C6SZts2gFb0jN0ZaZNzmWkw3KZp1b0tIUsN4FOWbAVKtNEvq8i20XD6wxjCRhQq0KJGcxdhVo3mOYeK05GVivFUWh3P2qRodf7/MyrQbhb823jKDX+iUtcp7pvKUC4OZsRBCfBFx20+atRoJAVSViYSWe5uVDbsvmL2XQ==;
 5:wZ8Zzn01hXFm+s+L33ho8kD1gHsGcMXaMSylF8ceIy9L91GKz31DqN38U5YdkZkYRkWf9BCGMY1NtxM0jrCpkqsa4TQrvty8crdQ5E8Z9+YnrPlNEh/LFhPoaL4+qYGYtoq0A2YlDqnElH7RUAr+yQ==;
 24:nDXKpgi/yA2SwVQkExT4vVNIDE2xrrY2YYH2tPR2LqQszCqpPpWtISqOC89riqWoDPtAFnDvtNkHM/NrCDAtvfDcROHQ6eiNRn+nJbd+SwE=;
 7:CKIBIdlmrQZX+il3ui7oW1TRWEeR5nwxRnrE4mmrSeGbDOSrjLofHMh9kLR+L/tjstQXZD4p4sIQGgcqNuySPlA8jR2rJ7O1zru6PfxcuQ20NoaFHkAS8Uf7SNC/XlWcScAz3pLnx6d3h5ucuvFuChIPPP8J43QuiZrqoTyIH7kwrWFn7e5sKEyGl2p1s8jFXpuW3D5uOtafk8P2HBFYEcXoAwvqnZD9jJFaSgUfDW8=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 79326eb7-83b2-4a91-8221-08d4e4b279be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
 SRVR:VI1PR05MB1757; 
x-ms-traffictypediagnostic: VI1PR05MB1757:
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(65623756079841)(258649278758335)(42262312472803);
x-microsoft-antispam-prvs: <VI1PR05MB175712C3935A2EB576C9A982B1820@VI1PR05MB1757.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123558100)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB1757; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB1757; 
x-forefront-prvs: 0401647B7F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39860400002)(189002)(13464003)(377454003)(199003)(24454002)(81166006)(2906002)(81156014)(74316002)(8676002)(101416001)(5250100002)(189998001)(50986999)(3846002)(102836003)(3280700002)(8936002)(6116002)(68736007)(33656002)(3660700001)(7416002)(54356999)(76176999)(107886003)(110136004)(53936002)(6246003)(6436002)(7696004)(5660300001)(6506006)(99286003)(55016002)(9686003)(54906002)(105586002)(106356001)(305945005)(229853002)(2950100002)(14454004)(2900100001)(6916009)(7736002)(25786009)(97736004)(4326008)(53546010)(478600001)(66066001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB1757;
 H:AM4PR0501MB2194.eurprd05.prod.outlook.com; FPR:; SPF:None; PTR:InfoNoRecords;
 MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2017 14:24:16.2828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB1757
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
X-List-Received-Date: Wed, 16 Aug 2017 14:24:26 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhcm5kYmVyZ21hbm5AZ21haWwu
Y29tIFttYWlsdG86YXJuZGJlcmdtYW5uQGdtYWlsLmNvbV0gT24NCj4gQmVoYWxmIE9mIEFybmQg
QmVyZ21hbm4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE1LCAyMDE3IDI6MTYgUE0NCj4gVG86
IE9sZWtzYW5kciBTaGFtcmF5IDxvbGVrc2FuZHJzQG1lbGxhbm94LmNvbT4NCj4gQ2M6IGdyZWdr
aCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0
IDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IExpbnV4IEFSTSA8bGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPjsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47DQo+IEpvZWwg
U3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBKacWZw60gUMOtcmtvIDxqaXJpQHJlc251bGxpLnVz
PjsgVG9iaWFzIEtsYXVzZXINCj4gPHRrbGF1c2VyQGRpc3RhbnouY2g+OyBsaW51eC1zZXJpYWxA
dmdlci5rZXJuZWwub3JnOyBtZWNAc2hvdXQubmV0Ow0KPiB2YWRpbXBAbWFlbGxhbm94LmNvbTsg
c3lzdGVtLXN3LWxvdy1sZXZlbCA8c3lzdGVtLXN3LWxvdy0NCj4gbGV2ZWxAbWVsbGFub3guY29t
PjsgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IG9wZW5vY2QtZGV2ZWwtDQo+IG93
bmVyQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgSmlyaSBQaXJrbyA8amlyaUBtZWxsYW5veC5jb20+
DQo+IFN1YmplY3Q6IFJlOiBbcGF0Y2ggdjMgMS8zXSBkcml2ZXJzOiBqdGFnOiBBZGQgSlRBRyBj
b3JlIGRyaXZlcg0KPiANCj4gT24gVHVlLCBBdWcgMTUsIDIwMTcgYXQgMTI6MDAgUE0sIE9sZWtz
YW5kciBTaGFtcmF5DQo+IDxvbGVrc2FuZHJzQG1lbGxhbm94LmNvbT4gd3JvdGU6DQo+IA0KPiA+
ICsgICAgICAgY2FzZSBKVEFHX0lPQ1hGRVI6DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChjb3B5
X2Zyb21fdXNlcigmeGZlciwgdmFyZywgc2l6ZW9mKHN0cnVjdCBqdGFnX3hmZXIpKSkNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVGQVVMVDsNCj4gPiArDQo+ID4gKyAgICAg
ICAgICAgICAgIGlmICh4ZmVyLmxlbmd0aCA+PSBKVEFHX01BWF9YRkVSX0RBVEFfTEVOKQ0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOw0KPiA+ICsNCj4gPiArICAg
ICAgICAgICAgICAgdXNlcl90ZGlvX2RhdGEgPSB4ZmVyLnRkaW87DQo+ID4gKyAgICAgICAgICAg
ICAgIHhmZXIudGRpbyA9IGp0YWdfY29weV9mcm9tX3VzZXIoKHZvaWQgX191c2VyICopdXNlcl90
ZGlvX2RhdGEsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgeGZlci5sZW5ndGgpOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoIXhmZXIudGRpbykN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IFRoaXMg
aXMgbm90IHNhZmUgZm9yIDMyLWJpdCBwcm9jZXNzZXMgb24gNjQtYml0IGtlcm5lbHMsIHNpbmNl
IHRoZSBzdHJ1Y3R1cmUgbGF5b3V0DQo+IGRpZmZlcnMgZm9yIHRoZSBwb2ludGVyIG1lbWJlci4g
SXQncyBiZXR0ZXIgdG8gYWx3YXlzIHVzZSBlaXRoZXIgcmV3b3JrIHRoZQ0KPiBzdHJ1Y3R1cmUg
dG8gYXZvaWQgdGhlIHBvaW50ZXIsIG9yIHRvIHVzZSBhDQo+IF9fdTY0IG1lbWJlciB0byBzdG9y
ZSBpdCwgYW5kIHRoZW4gdXNlIHU2NF90b191c2VyX3B0cigpIHRvIGNvbnZlcnQgaXQgaW4gdGhl
DQo+IGtlcm5lbC4NCg0KVGhhbmtzLCAgSSB0aGluayB1c2luZyBfX3U2NCBpbnN0ZWFkIG9mICBw
b2ludGVyIHdpbGwgYmUgYSBnb29kIHNvbHV0aW9uLg0KDQo+IA0KPiA+ICsgICAgICAgY2FzZSBK
VEFHX0dJT0NTVEFUVVM6DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChqdGFnLT5vcHMtPnN0YXR1
c19nZXQpDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZXJyID0ganRhZy0+b3BzLT5zdGF0
dXNfZ2V0KGp0YWcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKGVudW0ganRhZ19lbmRzdGF0ZQ0KPiA+ICsgKikmdmFsdWUpOw0KPiANCj4gVGhp
cyBwb2ludGVyIGNhc3QgaXMgYWxzbyBub3Qgc2FmZSwgYXMgYW4gZW51bSBtaWdodCBoYXZlIGEg
ZGlmZmVyZW50IHNpemUgdGhhbg0KPiB0aGUgJ3ZhbHVlJyB2YXJpYWJsZSB0aGF0IGlzIG5vdCBh
biBlbnVtLiBJIHRoaW5rIHlvdSBuZWVkIHRvIGNoYW5nZSB0aGUNCj4gYXJndW1lbnQgdHlwZSBm
b3IgdGhlIGNhbGxiYWNrLCBvciBtYXliZSB1c2UgYW5vdGhlciBpbnRlcm1lZGlhdGUuDQo+IA0K
PiA+ICtzdGF0aWMgaW50IGp0YWdfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmls
ZSAqZmlsZSkgew0KPiA+ICsgICAgICAgc3RydWN0IGp0YWcgKmp0YWcgPSBjb250YWluZXJfb2Yo
aW5vZGUtPmlfY2Rldiwgc3RydWN0IGp0YWcsDQo+ID4gK2NkZXYpOw0KPiA+ICsNCj4gPiArICAg
ICAgIHNwaW5fbG9jaygmanRhZy0+bG9jayk7DQo+ID4gKw0KPiA+ICsgICAgICAgaWYgKGp0YWct
PmlzX29wZW4pIHsNCj4gPiArICAgICAgICAgICAgICAgZGV2X2luZm8oTlVMTCwgImp0YWcgYWxy
ZWFkeSBvcGVuZWRcbiIpOw0KPiA+ICsgICAgICAgICAgICAgICBzcGluX3VubG9jaygmanRhZy0+
bG9jayk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7DQo+ID4gKyAgICAgICB9
DQo+ID4gKw0KPiA+ICsgICAgICAganRhZy0+aXNfb3BlbiA9IHRydWU7DQo+ID4gKyAgICAgICBm
aWxlLT5wcml2YXRlX2RhdGEgPSBqdGFnOw0KPiA+ICsgICAgICAgc3Bpbl91bmxvY2soJmp0YWct
PmxvY2spOw0KPiA+ICsgICAgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gDQo+IERvZXMgdGhlICdp
c19vcGVuJyBmbGFnIHByb3RlY3QgeW91IGZyb20gc29tZXRoaW5nIHRoYXQgZG9lc24ndCBhbHNv
IGhhcHBlbg0KPiBhZnRlciBhICdkdXAoKScgY2FsbCBvbiB0aGUgZmlsZSBkZXNjcmlwdG9yPw0K
DQppc19vcGVuIGZsYWcgcHJvdGVjdHMgZnJvbSB0aGUgb3BlbmluZyBmaWxlIG1vcmUgdGhhbiBv
bmUgdGltZS4NCg0KPiANCj4gPiArICogQG1vZGU6IGFjY2VzcyBtb2RlDQo+ID4gKyAqIEB0eXBl
OiB0cmFuc2ZlciB0eXBlDQo+ID4gKyAqIEBkaXJlY3Rpb246IHhmZXIgZGlyZWN0aW9uDQo+ID4g
KyAqIEBsZW5ndGg6IHhmZXIgYml0cyBsZW4NCj4gPiArICogQHRkaW8gOiB4ZmVyIGRhdGEgYXJy
YXkNCj4gPiArICogQGVuZGlyOiB4ZmVyIGVuZCBzdGF0ZQ0KPiA+ICsgKg0KPiA+ICsgKiBTdHJ1
Y3R1cmUgcmVwcmVzZW50cyBpbnRlcmZhY2UgdG8gQXNwZWVkIEpUQUcgZGV2aWNlIGZvciBqdGFn
IHNkcg0KPiA+ICt4ZmVyDQo+ID4gKyAqIGV4ZWN1dGlvbi4NCj4gPiArICovDQo+ID4gK3N0cnVj
dCBqdGFnX3hmZXIgew0KPiA+ICsgICAgICAgX191OCAgICBtb2RlOw0KPiA+ICsgICAgICAgX191
OCAgICB0eXBlOw0KPiA+ICsgICAgICAgX191OCAgICBkaXJlY3Rpb247DQo+ID4gKyAgICAgICBf
X3UzMiAgIGxlbmd0aDsNCj4gPiArICAgICAgIF9fdTggICAgKnRkaW87DQo+ID4gKyAgICAgICBf
X3U4ICAgIGVuZHN0YXRlOw0KPiA+ICt9Ow0KPiANCj4gQXMgbWVudGlvbmVkIGFib3ZlLCB0aGUg
cG9pbnRlciBpbiBoZXJlIG1ha2VzIGl0IGluY29tcGF0aWJsZS4gQWxzbywgeW91DQo+IHNob3Vs
ZCByZW9yZGVyIHRoZSBtZW1iZXJzIHRvIGF2b2lkIHRoZSBpbXBsaWVkIHBhZGRpbmcuDQo+IE1v
dmluZyB0aGUgJ2VuZHN0YXRlJyBiZWZvcmUgJ2xlbmd0aCcgaXMgc3VmZmljaWVudC4NCj4gDQoN
ClRoYW5rLiBJIHdpbGwgZG8gaXQuDQoNCj4gICAgICAgICBBcm5kDQo=
