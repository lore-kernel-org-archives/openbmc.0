Return-Path: <dthompson@mellanox.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mellanox.com
 (client-ip=40.107.4.83; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=dthompson@mellanox.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mellanox.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Mellanox.com header.i=@Mellanox.com header.b="Vh8LpAI1";
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40083.outbound.protection.outlook.com [40.107.4.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4386Q94B1rzDqfG
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 14:13:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7vj/6IGc4h56eZSeLFg+PpyAWDVF434xCl0HjwwefM=;
 b=Vh8LpAI19FdlriAok9xQ5Y4MrhTDA3gMobQwgtFQ9PNh1DXGO6qhjgQtWHhpaox68EH5jT6hmKo6deUSMd71K3s1wxIyF1Ikp2fUNn6/VnRMuJIWYoiLnOU8BdzJwy/vtEIZmdsivu8M5Plyj+SzWa/T7SLCGmZH4GJM0V+tEJI=
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com (52.134.4.15) by
 VI1PR0502MB3661.eurprd05.prod.outlook.com (52.134.7.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1382.22; Tue, 4 Dec 2018 03:13:30 +0000
Received: from VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::89d4:2367:d83e:f7c4]) by VI1PR0502MB3869.eurprd05.prod.outlook.com
 ([fe80::89d4:2367:d83e:f7c4%5]) with mapi id 15.20.1382.023; Tue, 4 Dec 2018
 03:13:30 +0000
From: David Thompson <dthompson@mellanox.com>
To: Joel Stanley <joel@jms.id.au>, Amithash Prasad <amithash@fb.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "vijaykhemka@fb.com"
 <vijaykhemka@fb.com>
Subject: RE: Linux dev-4.19
Thread-Topic: Linux dev-4.19
Thread-Index: AQHUh32PMKeYyOi6SE6in0SrBddM/6VskECAgADYwYCAAB0GgIAAE2wAgABVX7A=
Date: Tue, 4 Dec 2018 03:13:30 +0000
Message-ID: <VI1PR0502MB38692985438ED8BA1E4FACFFDDAF0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
 <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
 <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
In-Reply-To: <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dthompson@mellanox.com; 
x-originating-ip: [71.174.237.81]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0502MB3661;
 6:yWbpz0wIyd0uCPCkRJ7XSUDfdcqbwu5OZWCQnNoG6Q2yYIRGsbgX0EU9bGAhpTL/NhP3bahAJfCKM3HQOPzPev0OON4QE13lfLYHfw2i+axNOTOP+uzLwPGMo0SU4IFmimYMQvSTOn5ZYnFUsxgG4JJk35jrCNMl98hTNLdeZRrDpgFyQkQ2TBD/1fVOCT8uM/X3YqEKRqqpIlTuPhhEcUsoIZaZSxcwNklmE/A2RcFx2Hwymh1B/aOnPw6CYxGyDeAOxTz4CJzxWmBp1cjG6BkNXgKWn7rZzDhrPnhr6ibfPVTcNgVfFcTtBAmhAUjVs/mH6HJYyvUjVhMcvM1i9LxbYhxIbyYQ6HaAHsNe4Cq2XkhlO6YluEzTxpGJlR9XzIIu+2jhaLVOIgbHm2wLr4Ib5WSsBk0RkTVfpv62K9pafHQBEtVy7+YYWW75CWWbILlbdr7UJy05qSHAwx77nA==;
 5:a9iaHxNPZ9BEOr9k9HIk+eb/zjS6dZ9TTcsby42qZiZNIyfcoQr3GuP0edphN1c83NIayTOGp+OENrXUM6t8m9Km3rfsz1yfeYbAO2xig9bgwWZAu9l2ch0Ar5tt0SVWtzIIxCemZ9/aYX3stDK58vyPlE0Bh5XxCTmaa6arguE=;
 7:AbnQV5BhV39qEXVKEQ/1eI2X0JsiiOYuf0x/wVqq+qxO091SkTpcBXuvbG8s+2NWSDySL2SCHq9Jh6qFJkpOngsh1kNwpdYCIDGd4eM7N4PNyASSaI5vpy9Ks/weyfFez8i7yczWBqXoDGU2h/C5KQ==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 665221e4-151d-45a3-dd31-08d659967771
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR0502MB3661; 
x-ms-traffictypediagnostic: VI1PR0502MB3661:
x-microsoft-antispam-prvs: <VI1PR0502MB3661543D045E5D4912F4509ADDAF0@VI1PR0502MB3661.eurprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501493)(52105112)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
 SRVR:VI1PR0502MB3661; BCL:0; PCL:0; RULEID:; SRVR:VI1PR0502MB3661; 
x-forefront-prvs: 0876988AF0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(376002)(396003)(366004)(13464003)(189003)(199004)(71190400001)(186003)(71200400001)(14454004)(53936002)(9686003)(68736007)(93886005)(26005)(102836004)(6506007)(53546011)(446003)(106356001)(66066001)(7696005)(6246003)(99286004)(2906002)(76176011)(5660300001)(316002)(6306002)(55016002)(478600001)(6116002)(110136005)(3846002)(54906003)(966005)(305945005)(8676002)(6436002)(25786009)(74316002)(97736004)(81166006)(14444005)(81156014)(8936002)(256004)(4326008)(33656002)(7736002)(86362001)(476003)(105586002)(229853002)(11346002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0502MB3661;
 H:VI1PR0502MB3869.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: glUwsB9Hlwjv55w7wDYXsg6V1VgAqTIwakaZvYu/FFM+rqwqiw5IVC78/uupPJSMiibE0nU9rnDk90u0SwBHyHIcDaVr4qd6E2r7PZM4Zk1M5di0nPCzXFgk8YhksFvXzk8ZsdJlcTS3i+nW/zDqQN2drt+SKjNlCImH72Sv7Ur6s6dO1Ib/OeXfEP/mz57+H98qiMGrPKQCFciBBnkS+BoxHBk1A0JEGzab0exMrPVFXP5Y8hz0e1hO94pvNWEmiszjpLmX0MV53BdwgZos072RW/SiMMDj3+vr2YMtbBUY7KMOPJV1Bj2fDGBsVr7R7GJQvNhZDbu7520rtA0tucQFpbEx7Dbq4BDc9QApmNo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665221e4-151d-45a3-dd31-08d659967771
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2018 03:13:30.2190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0502MB3661
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
X-List-Received-Date: Tue, 04 Dec 2018 03:13:39 -0000

U2luY2UgNC4xOSBrZXJuZWwgaXMgZGVlbWVkICJsb25ndGVybSIgd2l0aCBhIHByb2plY3RlZCBF
T0wgb2YgRGVjIDIwMjAsIGlzIHRoZSBwbGFuIHRvIGtlZXAgT3BlbkJNQyBvbiB0aGlzIGtlcm5l
bCB2ZXJzaW9uIGZvciBhIHdoaWxlPyAgDQoNCkkndmUgeWV0IHRvIHVwc3RyZWFtIGFueSBvZiBt
eSBjaGFuZ2VzLCBteSBiYWQsIGFuZCBhcyBhIA0KcmVzdWx0IEkndmUgZ29uZSB0aHJvdWdoIGZv
dXIga2VybmVsIHVwZ3JhZGVzIHRoaXMgeWVhcg0KezQuMTMsIDQuMTcsIDQuMTgsIGFuZCBub3cg
NC4xOX0uDQoNCkknbSBjdXJpb3VzIGFib3V0IHRoZSBPcGVuQk1DIGtlcm5lbCB1cGdyYWRlIHN0
cmF0ZWd5LA0KZXNwLiBhZnRlciA0LjE5Lg0KDQpSZWdhcmRzLA0KLSBEYXZlDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1jIDxvcGVuYm1jLWJvdW5jZXMrZHRob21w
c29uPW1lbGxhbm94LmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2YgSm9lbCBTdGFu
bGV5DQpTZW50OiBNb25kYXksIERlY2VtYmVyIDMsIDIwMTggNTowNSBQTQ0KVG86IEFtaXRoYXNo
IFByYXNhZCA8YW1pdGhhc2hAZmIuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz47IHZpamF5a2hlbWthQGZiLmNvbQ0KU3ViamVjdDogUmU6IExpbnV4
IGRldi00LjE5DQoNCk9uIFR1ZSwgNCBEZWMgMjAxOCBhdCAwNzoyNSwgQW1pdGhhc2ggUHJhc2Fk
IDxhbWl0aGFzaEBmYi5jb20+IHdyb3RlOg0KPg0KPiA+PiBJIGhhdmUgY291cGxlIG9mIE5DU0kg
cGF0Y2ggd2hpY2ggd2VyZSB1cCBzdHJlYW1lZCBsYXN0IHdlZWsgaW4gbGludXgtbmV4dCBrZXJu
ZWwuIFdpbGwgdGhvc2UgYmUgcGFydCBvZiB0aGlzIDQuMTkga2VybmVsIGluIG9wZW5ibWMgb3Ig
d2hhdCBpcyBwcm9jZWR1cmUgdG8gcHVsbCB0aG9zZSBwYXRjaGVzIGluIG9wZW5ibWMgYnVpbGQu
IEFzIHRoZXNlIGFyZSByZXF1aXJlZCBmb3IgTWV0YS1mYWNlYm9vayBidWlsZCB3aXRoIG5ldHdv
cmtpbmcgd29ya2luZy4NCj4gSm9lbCwNCj4NCj4gVGhhbmtzIGZvciBjaGVycnktcGlja2luZyBh
IGZldyBvZiB0aGUgTkNTSSBjaGFuZ2VzIGludG8gZGV2LTQuMTkhIEFsb25nIHdpdGggdGhlc2Us
IGNhbiB3ZSBnZXQgYSBjb3VwbGUgbW9yZSBjaGVycnktcGlja2VkIGludG8gZGV2LTQuMTk/DQo+
DQo+IE9uZSBwYXRjaCBmcm9tIGxpbnV4LW5leHQ6DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY28NCj4gbW1pdC9u
ZXQvbmNzaT9oPW5leHQtMjAxODEyMDMmaWQ9MTZlOGM0Y2EyMWEyMzhjZGYwMzU1NDc1YmYxNWJk
NzJlOTJmZQ0KPiBiOGYNCj4NCj4gT25lIG1lcmdlZCBwYXRjaCB0byBicmluZyBpbiB0aGUgVGlv
Z2FwYXNzIGRldmljZSB0cmVlOg0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pDQo+IHQvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWJtYy1mYWNlYm9vay10aW9nYXBhc3MuZHRzP2lkPTMzNjhlMDZlMmE5MWENCj4g
NjVjZmY1OWU1MjBhY2M1MWI5YWRmNDkwMGJmDQoNCk5pY2Ugd29yay4gVGhpcyBpcyBhIGdyZWF0
IHdheSB0byByZXF1ZXN0IHRoZSBwYXRjaGVzIGdldCBtZXJnZWQuIEknbSBoYXBweSBiZWNhdXNl
IHRoZXkncmUgYWxyZWFkeSBvbiB0aGVpciB3YXkgdXBzdHJlYW0sIGFuZCB0aGUgVVJMcyB3aXRo
IFNIQXMgbWFrZSBpdCBlYXN5IGZvciBtZSB0byBjaGVycnkgcGljay4NCg0KTWVyZ2VkIQ0KDQpD
aGVlcnMsDQoNCkpvZWwNCg==
