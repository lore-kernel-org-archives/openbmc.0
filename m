Return-Path: <c_mykolak@mellanox.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0040.outbound.protection.outlook.com [104.47.2.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wx9Lm1rRLzDr1p
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 23:46:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="fWP8N+id";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=G06hNiKryDtaZzH0gWtcwHziVFjx60+ERx2KzXWxfAs=;
 b=fWP8N+idWEgcOtwS58ZKJ2aWgOFKQ4cEjFQtq06sz50zizS6p3iL/7H7M5Hv+4KliKd1OO49toYWYd6OReoba4zzAAQpaOt/M0b/AzzbZ9IjIpNCWA7SmKiEF8ryTrtxx/IjQD1BRtMRhheP7br/c4AR4Kr9dTodttkEw/D83LE=
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com (10.170.238.16) by
 VI1PR05MB3246.eurprd05.prod.outlook.com (10.170.238.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1199.15; Mon, 26 Jun 2017 13:46:02 +0000
Received: from VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2]) by VI1PR05MB3247.eurprd05.prod.outlook.com
 ([fe80::91da:b346:569d:26a2%13]) with mapi id 15.01.1199.017; Mon, 26 Jun
 2017 13:46:02 +0000
From: Mykola Kostenok <c_mykolak@mellanox.com>
To: Joel Stanley <joel@jms.id.au>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
Thread-Topic: [PATCH u-boot v2016.07-aspeed-openbmc] Aspeed: ast-g5 change
 configuration order to allow 2-nd boot
Thread-Index: AQHS7mUw/ziBzfga1kq1DTSu9XbTlKI3HNxg
Date: Mon, 26 Jun 2017 13:46:01 +0000
Message-ID: <VI1PR05MB3247D186793DAD7F1CB37EEDEFDF0@VI1PR05MB3247.eurprd05.prod.outlook.com>
References: <20170602091701.189794-1-c_mykolak@mellanox.com>
 <CACPK8Xc4PJ-NmZfN=vi4t4Tc6yauZ=wp3vfkbNWiB4RdSWgEVg@mail.gmail.com>
In-Reply-To: <CACPK8Xc4PJ-NmZfN=vi4t4Tc6yauZ=wp3vfkbNWiB4RdSWgEVg@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=c_mykolak@mellanox.com; 
x-originating-ip: [80.90.224.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR05MB3246;
 7:evZLM+xvVG9ONop0u0Q66JkKA/6MD6kOruTE9IJx/EkJdoz9Jer5s8LoyAh7iV4XmMpvylvOl95I9VNXzvt3/fN4mLnn3f1h+m5WjhwaxVa1+tKfVNlMqbCVDVb1MlN/93/HSRBiLyvNOtepcjLu4CdvdCeiROgpZOoScAaQRpkq6xWRRsgzUgvzmgz9MXi0GPw/rVG224Zk2ZFRDdyE0zo8Agp2vAjPjy0b1z/d5fh9iiNfvBdNuE5D5ANDrEnTtLVmydhzoOvSehWAJdUiMJQo956PYvmzNZVR9newwnFc8u/1ZAlarxj07E1xa6heJsLN6WDFl6HYXkQ529qkCAZEXe8YQqdFtKsjLuO4cMoAU/HDkIABcyVyCaA8nhOe/Bm1t1NzHed0KX2itxLHLKCg6gKLdjXUPZB91l9ywbYy3HaFz+NDsN3fu7LU+Kpnct3ix/vtjlThk7f/UZvGaTXlSoTEIz9PvckO2oIpWyGTu6ZdnLYKZyZcklMLHoiDv/Y4BKWVyEV/OAAy8fJ3WN19HQ+1VCxnBiigoxFY2WBx5vFhLcEICfBznoyIi7KzJPQ+SgIANuxEju9PQCVA696TZhvqfCRevXLafRFsQIYMAG6mxzcwd1ZaEgzj9b+SJ7knRJ8Vhza3+JSpBbfag9skO0yM0vcnycZH4o1hdWlkE0h6ipMwAl3JcdwB3wZhPxeTcU29/22WKaEnfUhEdgjeGxJJ39hgzfbLsR0SYm3mXclpGkOhirOX4z+nuCKNlJlH8IKjdTDUKdMvQOOPC6pLmpLzyCDD7owoRkcTNYA=
x-ms-office365-filtering-correlation-id: b64c317e-0a19-480c-0a1a-08d4bc99af31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(48565401081)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506067)(300135500095);
 SRVR:VI1PR05MB3246; 
x-ms-traffictypediagnostic: VI1PR05MB3246:
x-microsoft-antispam-prvs: <VI1PR05MB32460530B5C6BBD97E43B80EEFDF0@VI1PR05MB3246.eurprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(133145235818549)(236129657087228)(65623756079841)(48057245064654); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(3002001)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123564025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
 SRVR:VI1PR05MB3246; BCL:0; PCL:0;
 RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
 SRVR:VI1PR05MB3246; 
x-forefront-prvs: 0350D7A55D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(6009001)(39850400002)(39860400002)(39840400002)(39450400003)(39410400002)(39400400002)(24454002)(377454003)(13464003)(101416001)(305945005)(33656002)(53546010)(76176999)(50986999)(54356999)(5250100002)(189998001)(230783001)(7736002)(110136004)(2950100002)(229853002)(99286003)(55016002)(6506006)(4326008)(6436002)(102836003)(14454004)(74316002)(8676002)(81166006)(8936002)(3280700002)(66066001)(38730400002)(3660700001)(6116002)(478600001)(3846002)(2906002)(2900100001)(53936002)(86362001)(5660300001)(9686003)(6246003)(7696004)(6916009)(25786009)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3246;
 H:VI1PR05MB3247.eurprd05.prod.outlook.com; FPR:; SPF:None; MLV:ovrnspm;
 PTR:InfoNoRecords; LANG:en; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2017 13:46:01.8514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3246
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
X-List-Received-Date: Mon, 26 Jun 2017 13:46:09 -0000

VGhhbmtzIGZvciB5b3VyIGF0dGVudGlvbi4NCg0KQmVzdCByZWdhcmRzLiBNeWtvbGEgS29zdGVu
b2suDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogam9lbC5zdGFuQGdt
YWlsLmNvbSBbbWFpbHRvOmpvZWwuc3RhbkBnbWFpbC5jb21dIE9uIEJlaGFsZiBPZiBKb2VsDQo+
IFN0YW5sZXkNCj4gU2VudDogTW9uZGF5LCBKdW5lIDI2LCAyMDE3IDE6MTUgUE0NCj4gVG86IE15
a29sYSBLb3N0ZW5vayA8Y19teWtvbGFrQG1lbGxhbm94LmNvbT4NCj4gQ2M6IE9wZW5CTUMgTWFp
bGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB1
LWJvb3QgdjIwMTYuMDctYXNwZWVkLW9wZW5ibWNdIEFzcGVlZDogYXN0LWc1DQo+IGNoYW5nZSBj
b25maWd1cmF0aW9uIG9yZGVyIHRvIGFsbG93IDItbmQgYm9vdA0KPiANCj4gT24gRnJpLCBKdW4g
MiwgMjAxNyBhdCA2OjQ3IFBNLCBNeWtvbGEgS29zdGVub2sNCj4gPGNfbXlrb2xha0BtZWxsYW5v
eC5jb20+IHdyb3RlOg0KPiA+ICtjb25maWcgRklSTVdBUkVfMk5EX0JPT1QNCj4gPiArICAgICAg
IGJvb2wgIkZpcm13YXJlIHNlY29uZCBib290IFdEMiBlbmFibGUuIg0KPiA+ICsgICAgICAgZGVm
YXVsdCBuDQo+IA0KPiBMb29raW5nIGF0IHRoZSBtb3N0IHJlY2VudCBwbGF0Zm9ybS5TIGZvciB0
aGUgRzU6DQo+IA0KPiAvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKg0KPiAqKioqKioqKioqKioqKioqKioqKg0KPiAgRGlzYWJsZSBXRFQy
IGZvciAybmQgYm9vdCBmdW5jdGlvbg0KPiANCj4gKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiAqKioqKioqKioqKioqKioqKioqKi8N
Cj4gLyoNCj4gI2lmbmRlZiBDT05GSUdfRklSTVdBUkVfMk5EX0JPT1QNCj4gICAgIGxkciAgIHIw
LCA9MHgxZTc4NTAyYw0KPiAgICAgbW92ICAgcjEsICMwDQo+ICAgICBzdHIgICByMSwgW3IwXQ0K
PiAjZW5kaWYNCj4gDQo+IEJ5IHNldHRpbmcgdGhpcyBvcHRpb24gd2UgZGlzYWJsZSB0aGlzIGNv
ZGUsIHNvIHdlIGRvIG5vdCBjbGVhciB0aGUNCj4gV0RUMiBzdGF0dXMgcmVnaXN0ZXIuDQo+IA0K
PiBUaGUgaGVscCB0ZXh0IGZvciB5b3VyIEtjb25maWcgb3B0aW9uIGlzIGNvbmZ1c2luZzsgSSB3
b3VsZCB0aGluayB0aGF0IGl0IG1lYW5zDQo+IHdlIGVuYWJsZSBXRFQyLg0KPiANCj4gQ2FuIHlv
dSBjbGFyaWZ5Pw0KPg0KDQpXZSBjYW4gY2hhbmdlIGhlbHAgdGV4dCB0byAiRmlybXdhcmUgc2Vj
b25kIGJvb3Qgc3VwcG9ydCBlbmFibGUiLg0KQnkgZGVmYXVsdCBhZnRlciBwb3dlciB1cCBXRFQy
IGVuYWJsZWQuIFRoaXMgY29kZSBkaXNhYmxlIFdEVDIgaW4gdS1ib290Lg0KU28gd2hlbiBDT05G
SUdfRklSTVdBUkVfMk5EX0JPT1QgZGVmaW5lZCAtIFdEVDIgbm90IGRpc2FibGVkIGluIHUtYm9v
dC4NCg0KIA0KPiBDaGVlcnMsDQo+IA0KPiBKb2VsDQo=
