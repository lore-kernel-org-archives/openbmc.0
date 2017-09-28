Return-Path: <oleksandrs@mellanox.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.1.86; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=oleksandrs@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="YhB68n3o";
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10086.outbound.protection.outlook.com [40.107.1.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y2pPb0H74zDsPp
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 18:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZSzKvaLqOB+8JYL84xiGjioh1+Ge986pOVACqDcoF7A=;
 b=YhB68n3oRQmGg9w303lbAsZU7We49vO7GEDff5oF+YcfIRCjA8P7wZNfmSoffUVNHVfPrF6PoClrOTIfrv5ilez84C/1+QRGcWk1UCFiNgq+tJqWObEG/HLeXSBv8bgYpoY3UVk+4Xg08JW+NCkrjGbcfi9LmzY82oeW197SEXk=
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com (10.165.82.13) by
 HE1PR05MB3339.eurprd05.prod.outlook.com (10.170.243.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.77.7; Thu, 28 Sep 2017 08:53:12 +0000
Received: from AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::c1dc:8bea:a5cb:bcb6]) by AM4PR0501MB2194.eurprd05.prod.outlook.com
 ([fe80::c1dc:8bea:a5cb:bcb6%18]) with mapi id 15.20.0077.016; Thu, 28 Sep
 2017 08:53:12 +0000
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
Thread-Index: AQHTMru4M5azt7XbqEuLkdSxxS/sN6LKA2cAgAAE/MA=
Date: Thu, 28 Sep 2017 08:53:12 +0000
Message-ID: <AM4PR0501MB2194D67623C640E20B3A7FABB1790@AM4PR0501MB2194.eurprd05.prod.outlook.com>
References: <1505985932-27568-1-git-send-email-oleksandrs@mellanox.com>
 <CAMuHMdWfoYzWPJYaGOhF8qshKhvngwFKs=kvuH62PYif9q9+0g@mail.gmail.com>
In-Reply-To: <CAMuHMdWfoYzWPJYaGOhF8qshKhvngwFKs=kvuH62PYif9q9+0g@mail.gmail.com>
Accept-Language: en-US, uk-UA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandrs@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR05MB3339;
 6:q+k/swSyvnXMeIADVfddUZ4/QfGRNAJI6qPB0CJ0I1OjU6p82DZm7/vOSHUzBJsUsXxtcNCmKWNUigc977ldy4l1rC0Hou/rok49BXphXP0LbtcYZNpLaNoLxT4+NaHdSCDZcMM1B2BLbRYQQigSepww3O2kCSSgX5HgkTXEu5kEjK+R4I0J4j1VEHCdp9cZjry+fyBkUV7AZZUdDVLgrdqkb4ALvLybuR5ptQ69j33AuCBAsHHNxA9buf2/j2C+9G0VI7+UGUErYnMZ6JegrYyJTLjbMJ2iB1XrBQKaGZMJoCVesukXsDZ5e7QZrziifssW1RFz2Fg1iYbzWWcvyQ==;
 5:ClwoVo+Fk+rAlj2RvFhpZbaZsuDNiVbgp7fgs6CnzzkV/Oh//r39zG6QNMsNgfk0LoE+sqvySpMdYt9K2b0xwnL7qCPatl8LyRCNH07PZMAbddU/oBM8fqsYsYLC7hI2Uj/hRv/vIhrbiNytJX7DGw==;
 24:6LRVj4bt+W3GL5mjMPHnEpIIrfwBHwVxoEJ3nQ8cLhfXrjGlZEyo/XQJZvouI+tQgmIHbaKKrRb658/7w8wM0Di0qyT8MoqIvp2epQwSwjI=;
 7:HuJvL1dSsp07gbzfpDyapcaFWIOPplqDMGWThQvVCREjAd7HK/CWtGnnxH23kGAkDVlz3RUnf9N/BFf0pOZ7sm2YN6W+LtrLMHX6qxitS5BkKxw+pZy/WAEV64Il07X0GUSEG8vQhgH3B6BAoHkUiTDu9PC9wiy63L2IudefHLwnyRWLpAnWa5nMrTeED0pKO9Lm0PogzB+nR+aVHVufPTN0Hmai0ZhDuwCmEeRqKxg=
x-ms-office365-filtering-correlation-id: dee184af-35ab-403f-a408-08d5064e59c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
 SRVR:HE1PR05MB3339; 
x-ms-traffictypediagnostic: HE1PR05MB3339:
x-exchange-antispam-report-test: UriScan:(143289334528602)(9452136761055)(189930954265078)(65623756079841)(258649278758335)(42262312472803)(45079756050767);
x-microsoft-antispam-prvs: <HE1PR05MB333982ADD76CFBB82476A360B1790@HE1PR05MB3339.eurprd05.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:HE1PR05MB3339; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:HE1PR05MB3339; 
x-forefront-prvs: 0444EB1997
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(376002)(346002)(39860400002)(13464003)(24454002)(199003)(189002)(377454003)(55016002)(101416001)(14454004)(7736002)(6246003)(105586002)(7696004)(305945005)(97736004)(106356001)(5250100002)(966005)(3660700001)(6306002)(86362001)(45080400002)(9686003)(3280700002)(2950100002)(6506006)(53546010)(99286003)(189998001)(5660300001)(478600001)(2900100001)(53936002)(8676002)(81156014)(316002)(25786009)(54356999)(50986999)(76176999)(8936002)(81166006)(7416002)(33656002)(68736007)(54906003)(66066001)(6916009)(74316002)(3846002)(6436002)(2906002)(229853002)(4326008)(102836003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR05MB3339;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2017 08:53:12.4284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB3339
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
X-List-Received-Date: Thu, 28 Sep 2017 08:53:24 -0000

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBnZWVydC51eXR0ZXJob2V2ZW5A
Z21haWwuY29tIFttYWlsdG86Z2VlcnQudXl0dGVyaG9ldmVuQGdtYWlsLmNvbV0NCj4gT24gQmVo
YWxmIE9mIEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDI4
LCAyMDE3IDExOjMzIEFNDQo+IFRvOiBPbGVrc2FuZHIgU2hhbXJheSA8b2xla3NhbmRyc0BtZWxs
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
IA0KPiBIaSBPbGVrc2FuZHIsDQo+IA0KPiBbTXkgYXR0ZW50aW9uIHdhcyBkcmF3biBieQ0KPiBo
dHRwczovL2VtZWEwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbHduLm5ldA0KPiAlMkZBcnRpY2xlcyUyRjczNDQ0MCUyRiZkYXRhPTAyJTdDMDEl
N0NvbGVrc2FuZHJzJTQwbWVsbGFub3guY29tJTcNCj4gQzk3YjhiYTg4Njg2YTQyZGFhYWNlMDhk
NTA2NGI5MmViJTdDYTY1Mjk3MWM3ZDJlNGQ5YmE2YTRkMTQ5MjU2Zg0KPiA0NjFiJTdDMCU3QzAl
N0M2MzY0MjE4NDQwMjY4NTQyMTYmc2RhdGE9VGVIRDRhMyUyRkJONmE1WEczSml6ZjUNCj4gcG1z
eUpISmp6a0V6a3BucXNYQzZTMCUzRCZyZXNlcnZlZD0wXQ0KPiBbQ0MgbGludXgtc3BpLCB3aGlj
aCB3YXMgbmV2ZXIgaW5jbHVkZWQsIHdoaWxlIGxpbnV4LXNlcmlhbCB3YXNdDQo+IA0KPiBPbiBU
aHUsIFNlcCAyMSwgMjAxNyBhdCAxMToyNSBBTSwgT2xla3NhbmRyIFNoYW1yYXkNCj4gPG9sZWtz
YW5kcnNAbWVsbGFub3guY29tPiB3cm90ZToNCj4gPiBXaGVuIGEgbmVlZCByYWlzZSB1cCB0byB1
c2UgSlRBRyBpbnRlcmZhY2UgZm9yIHN5c3RlbSdzIGRldmljZXMNCj4gPiBwcm9ncmFtbWluZyBv
ciBDUFUgZGVidWdnaW5nLCB1c3VhbGx5IHRoZSB1c2VyIGxheWVyIGFwcGxpY2F0aW9uDQo+ID4g
aW1wbGVtZW50cyBqdGFnIHByb3RvY29sIGJ5IGJpdC1iYW5nIG9yIHVzaW5nIGEgcHJvcHJpZXRh
cnkgY29ubmVjdGlvbg0KPiA+IHRvIHZlbmRvciBoYXJkd2FyZS4NCj4gPiBUaGlzIG1ldGhvZCBj
YW4gYmUgc2xvdyBhbmQgbm90IGdlbmVyaWMuDQo+ID4NCg0KDQpbLi5dDQoNCj4gPg0KPiA+IElu
aXRpYWwgdmVyc2lvbiBwcm92aWRlcyB0aGUgc3lzdGVtIGNhbGxzIHNldCBmb3I6DQo+ID4gLSBT
SVIgKFNjYW4gSW5zdHJ1Y3Rpb24gUmVnaXN0ZXIsIElFRUUgMTE0OS4xIERhdGEgUmVnaXN0ZXIg
c2Nhbik7DQo+ID4gLSBTRFIgKFNjYW4gRGF0YSBSZWdpc3RlciwgSUVFRSAxMTQ5LjEgSW5zdHJ1
Y3Rpb24gUmVnaXN0ZXIgc2Nhbik7DQo+ID4gLSBSVU5URVNUIChGb3JjZXMgdGhlIElFRUUgMTE0
OS4xIGJ1cyB0byBhIHJ1biBzdGF0ZSBmb3IgYSBzcGVjaWZpZWQNCj4gPiAgIG51bWJlciBvZiBj
bG9ja3MuDQo+ID4NCj4gPiBTb0Mgd2hpY2ggYXJlIG5vdCBlcXVpcHBlZCB3aXRoIEpUQUcgbWFz
dGVyIGludGVyZmFjZSwgY2FuIGJlIGJ1aWx0IG9uDQo+ID4gdG9wIG9mIEpUQUcgY29yZSBkcml2
ZXIgaW5mcmFzdHJ1Y3R1cmUsIGJ5IGFwcGx5aW5nIGJpdC1iYW5naW5nIG9mDQo+ID4gVERJLCBU
RE8sIFRDSyBhbmQgVE1TIHBpbnMgd2l0aGluIHRoZSBoYXJkd2FyZSBzcGVjaWZpYyBkcml2ZXIu
DQo+IA0KPiBPciBieSB1c2luZyBhbiBTUEkgbWFzdGVyPw0KPiANCg0KSSB0aGluayBpdCBkZXBl
bmRzIG9uIGhvdyBmbGV4aWJsZSB0aGUgU1BJIGludGVyZmFjZSBpcy4gSWYgeW91IGNhbiBzZXQg
aXQgdG8gdHJhbnNmZXIgDQpmcm9tIDEgdG8gbiBiaXRzIGF0IGEgdGltZSwgYW5kIHlvdSBjb250
cm9sIHRoZSBUTVMgbGluZSBpbiBzb2Z0d2FyZSwgeW91IHNob3VsZCANCmJlIGFibGUgdG8gdXNl
IGl0LiBJZiB0aGUgU1BJIGludGVyZmFjZSBjYW4gb25seSB0cmFuc2ZlciBhIG11bHRpcGxlIG9m
IDggYml0cyANCmF0IGEgdGltZSwgdGhlbiBpbiBnZW5lcmFsIGl0IHdvdWxkIG5vdCBiZSBzdWl0
YWJsZSBmb3IgSlRBRy4NCg0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9y
Zw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUs
IEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
