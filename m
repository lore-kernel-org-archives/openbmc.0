Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0075.outbound.protection.outlook.com [104.47.1.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYPZf4b3qzDqj2
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 19:47:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="FdTiuKG9";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=L8+5Y1gZorMLA2zCvmiCgzxAIakchign+jyjTRhb7AY=;
 b=FdTiuKG9knQAEoMwct4dEOF3hiA2Dj0aYMIHFmbyQ9I3jQiv8nx71VHId6Wa530itSv1TPErqLeYekO9wvQua8OeOF5OQF7oHDotOnB1Zun6/bQqeQEBrLOlZmBkI5n4eMfNsWTSiv2BYn3qEi55cnAe4VfRhBi5tbmZLCGa4bk=
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) by
 VI1PR05MB3245.eurprd05.prod.outlook.com (10.170.238.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1101.14; Thu, 25 May 2017 09:47:45 +0000
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::c68:af38:3f49:5157]) by VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::c68:af38:3f49:5157%13]) with mapi id 15.01.1101.022; Thu, 25 May 2017
 09:47:45 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: 'Simon Glass' <sjg@chromium.org>, Mykola Kostenok <c_mykolak@mellanox.com>
CC: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2016.07-aspeed-openbmc] Add extended configuration
 for ast-g5 board
Thread-Topic: [PATCH u-boot v2016.07-aspeed-openbmc] Add extended
 configuration for ast-g5 board
Thread-Index: AQHS07jOqQyHJ3GajUS3KJCCxjdhcKIELdAAgACg5HA=
Date: Thu, 25 May 2017 09:47:45 +0000
Message-ID: <VI1PR05MB3247DE753A7F2D1E598D3314EFFF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170523113410.192036-1-c_mykolak@mellanox.com>
 <CAPnjgZ3aBHLDd9AXSpy5PZVnY9WAstFjGCpMSCLfCx7su7_bRA@mail.gmail.com>
In-Reply-To: <CAPnjgZ3aBHLDd9AXSpy5PZVnY9WAstFjGCpMSCLfCx7su7_bRA@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=mellanox.com;
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3245;
 7:syhI8HIRMKHQXdZwPrG4W+PiXpWKfEYTMC0AbiHtW9yeJmzbdxIK0c8XPTfJ+7QzeAmPA3FHfiIf/EAuJt1+Xa11AV8h5ioPcZzxPGrGTSdWn5YmNYHy8kYUqAb76OY+ZO9RMURkspuLxiUx0LsjIcVLQPPDNGT+CWm5bZJ106qJ3Qk3J5qbUiMNaduY7KCs+iHSusPVTWGREoIZAJ7Nu14kfEO4YS9B5ygH/cdTOTz2rjg+XMUAUd/DPrcgV5ewOibAMkgHOPpYHRzNiK3N8tG2ZrN3wqjj4ztNeQ8eLopjcZlLun0m/aisuEXLQa+5PQ3XrCAfSd69zi6o3lYKVg==
x-ms-traffictypediagnostic: VI1PR05MB3245:
x-ms-office365-filtering-correlation-id: 78234de2-163d-441a-9316-08d4a35318a4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
 SRVR:VI1PR05MB3245; 
x-microsoft-antispam-prvs: <VI1PR05MB32454F6DF518F5D1BCD2F624EFFF0@VI1PR05MB3245.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(211936372134217);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123562025)(20161123560025)(6072148);
 SRVR:VI1PR05MB3245; BCL:0; PCL:0; RULEID:; SRVR:VI1PR05MB3245; 
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(6009001)(39450400003)(39860400002)(39400400002)(39410400002)(39840400002)(39850400002)(13464003)(24454002)(377454003)(7696004)(3660700001)(53936002)(6246003)(3280700002)(74316002)(305945005)(86362001)(229853002)(2900100001)(478600001)(7736002)(2906002)(99286003)(9686003)(5250100002)(54906002)(55016002)(6436002)(53546009)(54356999)(6116002)(230783001)(102836003)(8936002)(76176999)(5660300001)(50986999)(81166006)(66066001)(38730400002)(33656002)(8676002)(2950100002)(6506006)(3846002)(25786009)(189998001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3245;
 H:VI1PR05MB3247.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2017 09:47:45.4842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3245
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
X-List-Received-Date: Thu, 25 May 2017 09:47:55 -0000

SGksIFNpbW9uLg0KVGhhbmsgeW91IHZlcnkgbWF0Y2ggZm9yIHJlZmVyZW5jZS4gDQpXZSB3aWxs
IGxvb2sgYXQgdGhpcy4gDQoNCkJlc3QgcmVnYXJkcywgTXlrb2xhIEtvc3Rlbm9rLg0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHNqZ0Bnb29nbGUuY29tIFttYWlsdG86
c2pnQGdvb2dsZS5jb21dIE9uIEJlaGFsZiBPZiBTaW1vbiBHbGFzcw0KPiBTZW50OiBUaHVyc2Rh
eSwgTWF5IDI1LCAyMDE3IDM6MDYgQU0NCj4gVG86IE15a29sYSBLb3N0ZW5vayA8Y19teWtvbGFr
QG1lbGxhbm94LmNvbT4NCj4gQ2M6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBPcGVu
Qk1DIE1haWxsaXN0DQo+IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdS1ib290IHYyMDE2LjA3LWFzcGVlZC1vcGVuYm1jXSBBZGQgZXh0ZW5kZWQNCj4g
Y29uZmlndXJhdGlvbiBmb3IgYXN0LWc1IGJvYXJkDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDIzIE1h
eSAyMDE3IGF0IDA1OjM0LCBNeWtvbGEgS29zdGVub2sgPGNfbXlrb2xha0BtZWxsYW5veC5jb20+
DQo+IHdyb3RlOg0KPiA+IEFkZCBkZWZjb25maWcgZXh0ZW5kcyBhc3RfZzVfbmNzaV9kZWZjb25m
aWcgd2l0aCB0aGUgbnVtYmVyIG9mIG9wdGlvbnM6DQo+ID4gSXQgYWxsb3dzIDItbmQgIGJvb3Qg
cGFydGl0aW9uLCBtZW1vcnkgdGVzdGluZywgYm9vdCwgaW1hZ2UgaW5mbw0KPiA+IG9wdGlvbiwg
ZXh0cmEgZmlsZXN5c3RlbSBhbmQgZW52aXJvbm1lbnQgY29tbWFuZHMuDQo+ID4gQWRkIFdBVENI
RE9HX1JFU0VUIG1hY3JvIHN1cHBvcnQgZm9yIGFzcGVlZCBnNSBib2FyZHMgZm9yIGNhc2VzDQo+
IHdoZW4NCj4gPiBIVyB3YXRjaGRvZyBpcyBjb25maWd1cmVkLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogTXlrb2xhIEtvc3Rlbm9rIDxjX215a29sYWtAbWVsbGFub3guY29tPg0KPiA+IC0tLQ0K
PiA+ICBib2FyZC9hc3BlZWQvYXN0LWc1L0tjb25maWcgICAgICAgICB8ICAxICsNCj4gPiAgYm9h
cmQvYXNwZWVkL2FzdC1nNS9hc3QtZzUuYyAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKw0K
PiA+ICBjb25maWdzL2FzdF9nNV9uY3NpXzJib290X2RlZmNvbmZpZyB8IDM2DQo+ID4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNTQg
aW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9hc3RfZzVfbmNz
aV8yYm9vdF9kZWZjb25maWcNCj4gDQo+IEFyZSB5b3UgdGFyZ2V0aW5nIG1haW5saW5lIFUtQm9v
dCB3aXRoIGFueSBvZiB0aGVzZSBjaGFuZ2VzPyBUaGVyZSBpcyBhDQo+IHdhdGNoZG9nIHVjbGFz
cyBpbiBtYWlubGluZSB0aGF0IHByb2JhYmx5IHNob3VsZCBiZSB1c2VkIGhlcmUuDQo+IA0KPiBS
ZWdhcmRzLA0KPiBTaW1vbg0K
