Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=104.47.1.86; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="RkJXnhJu";
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0086.outbound.protection.outlook.com [104.47.1.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2sTP4ZBFzDsPp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 21:11:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=x0nmrw6G39mJ5AFWSCC0hEmoEzScp7LObaJLgCsRl8I=;
 b=RkJXnhJu0FiNvzi9Df5KoPKI7hOsrGjfCYjh+MczJG7UrnW6laB/3dLobLhMjNzMsq3F+eqf1OMBhYbfW8e1lT29WsRjaioKwTuy1VoetoGhENUmFVPuodM5OnQahzbSTMEqgAT3VALpYm3/vXTX+MMzlN3OQJNSrMB+lKW4WHI=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 VI1PR05MB3343.eurprd05.prod.outlook.com (10.170.238.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.77.7; Thu, 28 Sep 2017 11:11:42 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::c1dc:8bea:a5cb:bcb6]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::c1dc:8bea:a5cb:bcb6%18]) with mapi id 15.20.0077.016; Thu, 28 Sep
 2017 11:11:42 +0000
From: Oleksandr Shamray <oleksandrs@mellanox.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Jiri Pirko
 <jiri@resnulli.us>, Tobias Klauser <tklauser@distanz.ch>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "mec@shout.net" <mec@shout.net>, Vadim Pasternak <vadimp@mellanox.com>,
 system-sw-low-level <system-sw-low-level@mellanox.com>, Rob Herring
 <robh+dt@kernel.org>, "openocd-devel-owner@lists.sourceforge.net"
 <openocd-devel-owner@lists.sourceforge.net>, "linux-api@vger.kernel.org"
 <linux-api@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>
Subject: RE: [patch v9 0/4] JTAG driver introduction
Thread-Topic: [patch v9 0/4] JTAG driver introduction
Thread-Index: AQHTMru4M5azt7XbqEuLkdSxxS/sN6LKA2cAgAAE/MCAAAMUAIAAIqNQ
Date: Thu, 28 Sep 2017 11:11:42 +0000
Message-ID: <AM4PR0501MB219466B15EB1314E3AF8413FB1790@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
 <CAMuHMdWfoYzWPJYaGOhF8qshKhvngwFKs=kvuH62PYif9q9+0g@mail.gmail.com>
 <AM4PR0501MB2194D67623C640E20B3A7FABB1790@AM4PR0501MB2194.eurprd05.prod.outlook.com>
 <CAMuHMdX1HNym4n67y2VbZqFDLHFGunfRp-LPn0g2K4qhya_w9g@mail.gmail.com>
In-Reply-To: <CAMuHMdX1HNym4n67y2VbZqFDLHFGunfRp-LPn0g2K4qhya_w9g@mail.gmail.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3343;
 6:no5mxZ/+rBgQR4VUQ9EIsDKHlGLze6N9DQ9neeKWeCAjkm1GQK44xulUH2kOr9pQG5ZAXWQTERvbGV0gQ9eUftrmm7PvEF3fwGw4bHqar0QvDWtG9Tst9SrLlM5D5WNaDweBzyr46n55RAoY/g0CBjwxWhqBRCgJ9HUiRJnr/T8iTsE9MZQExViCwPqQ4c4YviMJ/Coz5oz9Cl03OpwO/m/GIqmkqc55PIC+uDdLHw3OjA52p3sLWc3kph0Gn/d9TyqWcAJq1QeDSXTXXMBmqkpUXhi+L1gFviSo+TcqfFJF93NWpZRW/xUQPnVd0nFrCDShDpj4EDirliny18ZjfA==;
 5:bSeEanLLST/NB8olvOlpyz3Jz2kAklRfiU5bmNiIJi0aA9Ma9Auf/XqNqlY31gJMMkf96R5tJD1X4DMu4xhe3tGntJieYkHJbXit+q8xbaZa7NwPyf9J7fmhqOsiUsOsoCfjrw/pJc3uWvs2/ZRA/w==;
 24:S8LdIrYUnF/LZ4jm2BIzpHAe2Ev2Cs9AbEwTzy1BawX7MN8sGwaH6Po5NtVLRBOwqTSFvfHLl18ujGuojsF2JBwRZFSoXVN6pb/M13A4+vo=;
 7:ObfCEA2lL3SNjvnn1TEJtf0N6nE+DTSV+SH+IXGflSnkgVLG8xUBn1MFD2kF1CCpVNT7AH8uUXuXasBHBFC1YnS3M9uBnO+FikzzoVgSsvfElxjGoEf1Ib/Bw7XdRTMLUNUdXiWG4K2n/dd4CDCHpK96dvKOujROZq00omPZVWpMsJrKUpeg9Q1lOOd39N4lf2D3C8WxdlCseL79DdTpkJ4h91Q/QnPBuhaaM8ueBGk=
x-ms-office365-filtering-correlation-id: 79a4c72b-661c-4866-8de8-08d50661b2ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
 SRVR:VI1PR05MB3343; 
x-ms-traffictypediagnostic: VI1PR05MB3343:
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(189930954265078)(65623756079841)(258649278758335)(42262312472803)(45079756050767);
x-microsoft-antispam-prvs: <VI1PR05MB3343A04C54FF9E810D1D50A5B1790@VI1PR05MB3343.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3343; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3343; 
x-forefront-prvs: 0444EB1997
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(376002)(346002)(39860400002)(189002)(13464003)(377454003)(199003)(24454002)(6306002)(2906002)(3660700001)(86362001)(14454004)(93886005)(55016002)(8676002)(8936002)(33656002)(3280700002)(25786009)(99286003)(81166006)(966005)(68736007)(81156014)(478600001)(229853002)(189998001)(4326008)(45080400002)(54906003)(5250100002)(53936002)(316002)(6506006)(97736004)(6436002)(3846002)(7736002)(53546010)(50986999)(5660300001)(7696004)(2950100002)(106356001)(105586002)(2900100001)(6246003)(9686003)(74316002)(101416001)(76176999)(6916009)(7416002)(305945005)(66066001)(54356999)(6116002)(102836003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3343;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2017 11:11:42.4581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3343
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
X-List-Received-Date: Thu, 28 Sep 2017 11:11:56 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBnZWVydC51eXR0ZXJob2V2ZW5A
Z21haWwuY29tIFttYWlsdG86Z2VlcnQudXl0dGVyaG9ldmVuQGdtYWlsLmNvbV0NCj4gT24gQmVo
YWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI4
LCAyMDE3IDEyOjAyIFBNDQo+IFRvOiBPbGVrc2FuZHIgU2hhbXJheSA8b2xla3NhbmRyc0BtZWxs
YW5veC5jb20+DQo+IENjOiBHcmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz47IEFy
bmQgQmVyZ21hbm4NCj4gPGFybmRAYXJuZGIuZGU+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZzsNCj4gb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBKb2VsIFN0YW5s
ZXkgPGpvZWxAam1zLmlkLmF1PjsgSmlyaSBQaXJrbw0KPiA8amlyaUByZXNudWxsaS51cz47IFRv
YmlhcyBLbGF1c2VyIDx0a2xhdXNlckBkaXN0YW56LmNoPjsgbGludXgtDQo+IHNlcmlhbEB2Z2Vy
Lmtlcm5lbC5vcmc7IG1lY0BzaG91dC5uZXQ7IFZhZGltIFBhc3Rlcm5haw0KPiA8dmFkaW1wQG1l
bGxhbm94LmNvbT47IHN5c3RlbS1zdy1sb3ctbGV2ZWwgPHN5c3RlbS1zdy1sb3ctDQo+IGxldmVs
QG1lbGxhbm94LmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBvcGVub2Nk
LWRldmVsLQ0KPiBvd25lckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ7IGxpbnV4LWFwaUB2Z2VyLmtl
cm5lbC5vcmc7IERhdmlkIFMuIE1pbGxlcg0KPiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD47IE1hdXJv
IENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsNCj4gbGludXgtc3BpIDxsaW51
eC1zcGlAdmdlci5rZXJuZWwub3JnPjsgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0K
PiBTdWJqZWN0OiBSZTogW3BhdGNoIHY5IDAvNF0gSlRBRyBkcml2ZXIgaW50cm9kdWN0aW9uDQo+
IA0KPiBIaSBPbGVrc2FuZHIsDQo+IA0KPiBPbiBUaHUsIFNlcCAyOCwgMjAxNyBhdCAxMDo1MyBB
TSwgT2xla3NhbmRyIFNoYW1yYXkNCj4gPG9sZWtzYW5kcnNAbWVsbGFub3guY29tPiB3cm90ZToN
Cj4gPj4gW015IGF0dGVudGlvbiB3YXMgZHJhd24gYnkNCj4gPj4gaHR0cHM6Ly9lbWVhMDEuc2Fm
ZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmx3DQo+ID4+
IG4ubmV0DQo+ID4+DQo+ICUyRkFydGljbGVzJTJGNzM0NDQwJTJGJmRhdGE9MDIlN0MwMSU3Q29s
ZWtzYW5kcnMlNDBtZWxsYW5veC5jb20lNw0KPiA+Pg0KPiBDOTdiOGJhODg2ODZhNDJkYWFhY2Uw
OGQ1MDY0YjkyZWIlN0NhNjUyOTcxYzdkMmU0ZDliYTZhNGQxNDkyNTZmDQo+ID4+DQo+IDQ2MWIl
N0MwJTdDMCU3QzYzNjQyMTg0NDAyNjg1NDIxNiZzZGF0YT1UZUhENGEzJTJGQk42YTVYRzNKaXpm
NQ0KPiA+PiBwbXN5SkhKanprRXprcG5xc1hDNlMwJTNEJnJlc2VydmVkPTBdDQo+ID4+IFtDQyBs
aW51eC1zcGksIHdoaWNoIHdhcyBuZXZlciBpbmNsdWRlZCwgd2hpbGUgbGludXgtc2VyaWFsIHdh
c10NCj4gPj4NCj4gPj4gT24gVGh1LCBTZXAgMjEsIDIwMTcgYXQgMTE6MjUgQU0sIE9sZWtzYW5k
ciBTaGFtcmF5DQo+ID4+IDxvbGVrc2FuZHJzQG1lbGxhbm94LmNvbT4gd3JvdGU6DQo+ID4+ID4g
V2hlbiBhIG5lZWQgcmFpc2UgdXAgdG8gdXNlIEpUQUcgaW50ZXJmYWNlIGZvciBzeXN0ZW0ncyBk
ZXZpY2VzDQo+ID4+ID4gcHJvZ3JhbW1pbmcgb3IgQ1BVIGRlYnVnZ2luZywgdXN1YWxseSB0aGUg
dXNlciBsYXllciBhcHBsaWNhdGlvbg0KPiA+PiA+IGltcGxlbWVudHMganRhZyBwcm90b2NvbCBi
eSBiaXQtYmFuZyBvciB1c2luZyBhIHByb3ByaWV0YXJ5DQo+ID4+ID4gY29ubmVjdGlvbiB0byB2
ZW5kb3IgaGFyZHdhcmUuDQo+ID4+ID4gVGhpcyBtZXRob2QgY2FuIGJlIHNsb3cgYW5kIG5vdCBn
ZW5lcmljLg0KPiA+PiA+DQo+ID4NCj4gPg0KPiA+IFsuLl0NCj4gPg0KPiA+PiA+DQo+ID4+ID4g
SW5pdGlhbCB2ZXJzaW9uIHByb3ZpZGVzIHRoZSBzeXN0ZW0gY2FsbHMgc2V0IGZvcjoNCj4gPj4g
PiAtIFNJUiAoU2NhbiBJbnN0cnVjdGlvbiBSZWdpc3RlciwgSUVFRSAxMTQ5LjEgRGF0YSBSZWdp
c3RlciBzY2FuKTsNCj4gPj4gPiAtIFNEUiAoU2NhbiBEYXRhIFJlZ2lzdGVyLCBJRUVFIDExNDku
MSBJbnN0cnVjdGlvbiBSZWdpc3RlciBzY2FuKTsNCj4gPj4gPiAtIFJVTlRFU1QgKEZvcmNlcyB0
aGUgSUVFRSAxMTQ5LjEgYnVzIHRvIGEgcnVuIHN0YXRlIGZvciBhIHNwZWNpZmllZA0KPiA+PiA+
ICAgbnVtYmVyIG9mIGNsb2Nrcy4NCj4gPj4gPg0KPiA+PiA+IFNvQyB3aGljaCBhcmUgbm90IGVx
dWlwcGVkIHdpdGggSlRBRyBtYXN0ZXIgaW50ZXJmYWNlLCBjYW4gYmUgYnVpbHQNCj4gPj4gPiBv
biB0b3Agb2YgSlRBRyBjb3JlIGRyaXZlciBpbmZyYXN0cnVjdHVyZSwgYnkgYXBwbHlpbmcgYml0
LWJhbmdpbmcNCj4gPj4gPiBvZiBUREksIFRETywgVENLIGFuZCBUTVMgcGlucyB3aXRoaW4gdGhl
IGhhcmR3YXJlIHNwZWNpZmljIGRyaXZlci4NCj4gPj4NCj4gPj4gT3IgYnkgdXNpbmcgYW4gU1BJ
IG1hc3Rlcj8NCj4gPj4NCj4gPg0KPiA+IEkgdGhpbmsgaXQgZGVwZW5kcyBvbiBob3cgZmxleGli
bGUgdGhlIFNQSSBpbnRlcmZhY2UgaXMuIElmIHlvdSBjYW4NCj4gPiBzZXQgaXQgdG8gdHJhbnNm
ZXIgZnJvbSAxIHRvIG4gYml0cyBhdCBhIHRpbWUsIGFuZCB5b3UgY29udHJvbCB0aGUgVE1TDQo+
ID4gbGluZSBpbiBzb2Z0d2FyZSwgeW91IHNob3VsZCBiZSBhYmxlIHRvIHVzZSBpdC4gSWYgdGhl
IFNQSSBpbnRlcmZhY2UNCj4gPiBjYW4gb25seSB0cmFuc2ZlciBhIG11bHRpcGxlIG9mIDggYml0
cyBhdCBhIHRpbWUsIHRoZW4gaW4gZ2VuZXJhbCBpdCB3b3VsZCBub3QgYmUNCj4gc3VpdGFibGUg
Zm9yIEpUQUcuDQo+IA0KPiBTdXJlLCB0aGF0IGRlcGVuZHMgb24gdGhlIGFjdHVhbCBTUEkgbWFz
dGVyIGludGVyZmFjZS4NCj4gQnV0IEkgZ3Vlc3MgeW91IGNhbiB3cml0ZSBhIGdlbmVyaWMgSlRB
Ry1vdmVyLVNQSSBkcml2ZXIsIGFuZCB1c2UgYSB0bXMtZ3Bpb3MNCj4gcHJvcGVydHkgaW4gRFQg
dG8gc3BlY2lmeSBob3cgdG8gY29udHJvbCBUTVMuDQo+IA0KDQpZZXMsIHRoaXMgaXMgYSBnb29k
IGlkZWEgZm9yIFNvQyB3aGljaCBhcmUgbm90IGVxdWlwcGVkIHdpdGggSlRBRyBoYXJkd2FyZS4N
Cg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIEdl
ZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiANCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
