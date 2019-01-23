Return-Path: <Brenden_Lai@jabil.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=jabil.com
 (client-ip=40.107.80.91; helo=nam03-dm3-obe.outbound.protection.outlook.com;
 envelope-from=brenden_lai@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jabil.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.onmicrosoft.com header.i=@jabil.onmicrosoft.com
 header.b="Hs9CuNPv"; dkim-atps=neutral
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800091.outbound.protection.outlook.com [40.107.80.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kxBp4ChczDqLG
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jan 2019 18:05:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.onmicrosoft.com; 
 s=selector1-jabil-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii2mBBK7mbvIX/snDuzsIOVpFPYk7dPSIsiCj4zeC5I=;
 b=Hs9CuNPvxBvzwMBqOwp4xOk8TfcgB+GKJCuKgdWlouMGT4tmJwT2K2PX75uV17jEhlrWwkQsQw975zdwbp/QhIMo7I5F9Kt894aAIAoFxu+I0IlruuNg25uC5x1QUI01eDZjDF1Z7ZARaIhTMRIYRvo7zsr2+VSPRJ+STOoEfsk=
Received: from SN6PR02MB5693.namprd02.prod.outlook.com (20.177.252.17) by
 SN6PR02MB5599.namprd02.prod.outlook.com (20.177.251.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Wed, 23 Jan 2019 07:05:32 +0000
Received: from SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f]) by SN6PR02MB5693.namprd02.prod.outlook.com
 ([fe80::59f9:194e:34f4:584f%4]) with mapi id 15.20.1537.031; Wed, 23 Jan 2019
 07:05:32 +0000
From: Brenden Lai <Brenden_Lai@jabil.com>
To: Andrew Geissler <geissonator@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: couple OpenBMC image build and update questions
Thread-Topic: couple OpenBMC image build and update questions
Thread-Index: AQHUslaRrN8ZSd96rUemxcSwYZ7rIqW8aqMQ
Date: Wed, 23 Jan 2019 07:05:32 +0000
Message-ID: <SN6PR02MB56934CFFE714BCE4A15B095096990@SN6PR02MB5693.namprd02.prod.outlook.com>
References: <SN6PR02MB56937EE5CC255D9D877300A4969F0@SN6PR02MB5693.namprd02.prod.outlook.com>
 <CALLMt=o1wqtaGLKRxLS6Hj5obFUFMaZNZHxc9VZ+=_PLCQdUEQ@mail.gmail.com>
In-Reply-To: <CALLMt=o1wqtaGLKRxLS6Hj5obFUFMaZNZHxc9VZ+=_PLCQdUEQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMTUzMjE0OFxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTQ0MDI0YmZlLTFlZGQtMTFlOS04Nzk2LWI4OGE2MGEzMDY5MVxhbWUtdGVzdFw0NDAyNGJmZi0xZWRkLTExZTktODc5Ni1iODhhNjBhMzA2OTFib2R5LnR4dCIgc3o9IjQxMTMiIHQ9IjEzMTkyNzAwNzI5OTYyNDAyNiIgaD0iNjlGMnFQZ0VLMWlxSGY4YlYxYnFNUUJUNldJPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: =?utf-8?B?5IyA5r2s5pWz5LWJ5p2z5pWT542z5r2p5IGuNA==?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brenden_Lai@jabil.com; 
x-originating-ip: [165.225.102.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; SN6PR02MB5599;
 20:gu1PZzdF4cN+xeN7xpMt3eoKMa7lFNsXcaapKPqNWqADMjRNVohkXB0F3UUlIy4WNkFxa43PY5DuyTYzb6118HKR1CgJH69j6hBL+ufLvNbRUvOPA8a4TGdePFC9cu+okqPN7Azdz7kW6aOjZZLPVna1OgU2vEbtavo4S9XXx3g=
x-ms-office365-filtering-correlation-id: cca6c4fd-0532-443b-8583-08d681012a92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:SN6PR02MB5599; 
x-ms-traffictypediagnostic: SN6PR02MB5599:
x-microsoft-antispam-prvs: <SN6PR02MB55997D395CBCEF44E161E2C696990@SN6PR02MB5599.namprd02.prod.outlook.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(396003)(39860400002)(136003)(189003)(199004)(13464003)(53754006)(66574012)(8936002)(74316002)(3846002)(97736004)(446003)(86362001)(316002)(6506007)(6116002)(7736002)(8676002)(81156014)(81166006)(66066001)(14444005)(5024004)(305945005)(478600001)(1411001)(6916009)(80792005)(256004)(71200400001)(53936002)(71190400001)(25786009)(105586002)(6246003)(55236004)(6436002)(2906002)(53546011)(55016002)(15650500001)(68736007)(102836004)(476003)(6306002)(106356001)(186003)(11346002)(9686003)(33656002)(14454004)(229853002)(486006)(72206003)(26005)(99286004)(4326008)(966005)(39060400002)(76176011)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR02MB5599;
 H:SN6PR02MB5693.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: jabil.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lUkCZCSpggPSx1pu1adL6UQBCjwWPZyJXUz2lScMWS7Z1Y516W1IZdGHf1roiltljD37L+2zoKhn0tlPTkDs496IxIzTWRdVR7Y/QNRqp2hvti/zm+DwgTtlk1y3EaFvu8a3SgxwxOVyjtfis+hc9g9mWgn96Stb1KdGV5xtcELAYFpRdHPjV0cgnvWJAEDvpYg7mCUqyLDskNzLRHlB6zuUdSqjbvE7/PqnpKWe1USqy5HBnhhHWQOJMz9KRVJmP2wiLz1kO3lEZym84eG6kulH2jQBm1ygWHJyYMJaDb2c8aAPWQT98iFibgKx1SnkXjq4OGk26un6sxRoE/UK+1J3xaCuMtHAiG3v21Roa9jMTfuGbcuqpfLZn/cXzuYSoK2qs87pcWeiRBz3DRt9FEyhOLViZ1p1GpJSIELMrAg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca6c4fd-0532-443b-8583-08d681012a92
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 07:05:32.7268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5599
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
X-List-Received-Date: Wed, 23 Jan 2019 07:05:40 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IEdlaXNzbGVy
IDxnZWlzc29uYXRvckBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMjIsIDIw
MTkgOTozMCBQTQ0KPiBUbzogQnJlbmRlbiBMYWkgPEJyZW5kZW5fTGFpQGphYmlsLmNvbT4NCj4g
Q2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogY291cGxlIE9wZW5C
TUMgaW1hZ2UgYnVpbGQgYW5kIHVwZGF0ZSBxdWVzdGlvbnMNCj4gDQo+IE9uIE1vbiwgSmFuIDIx
LCAyMDE5IGF0IDE6MDUgQU0gQnJlbmRlbiBMYWkgPEJyZW5kZW5fTGFpQGphYmlsLmNvbT4NCj4g
d3JvdGU6DQo+ID4NCj4gPiBIaSBhbGwgLA0KPiA+DQo+ID4gICAgICAgICAgICAgICAgSSBoYXZl
IGRvbmUgbXkgZmlyc3QgT3BlbkJNQyBidWlsZCB3aXRoIHZlciAyLjYgLCBpdCBkbyB0YWtlIGEg
bG9uZw0KPiB0aW1lIC4NCj4gPiAgICAgICAgICAgICAgICBIZXJlIGlzIG15IHF1ZXN0aW9ucyAu
DQo+ID4NCj4gPiBBdHRhY2ggc2NyZWVuc2hvdCAsIFdoaWNoIG9uZSBpcyB0aGUgQk1DIEZXIGlt
YWdlICBhZnRlciBidWlsZGluZz8NCj4gDQo+IEkgaGF2ZW4ndCBidWlsdCB0aGUgZGVmYXVsdCBx
ZW11YXJtIGltYWdlIGluIGEgbG9uZyB0aW1lLiBJIGJlbGlldmUNCj4gb2JtYy1waG9zcGhvci1p
bWFnZS1xZW11YXJtLmV4dDQgaXMgdGhlIEZXIGltYWdlLg0KVGhlIFFFTVUgaGFuZyBhZnRlciBp
bnN0YWxsaW5nIGltYWdlICwgc2VlIGJlbG93LiANCg0KYnJlbmRlbkBicmVuZGVuLVZpcnR1YWxC
b3g6fi9vcGVuYm1jJCAuL3FlbXUtc3lzdGVtLWFybSAtbSAyNTYgLU0gcm9tdWx1cy1ibWMgLW5v
Z3JhcGhpYyAtZHJpdmUgZmlsZT1+L09DUC9vcGVuYm1jL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2Vz
L3FlbXVhcm0vb2JtYy1waG9zcGhvci1pbWFnZS1xZW11YXJtLTIwMTkwMTE5MTIwNjMwLnJvb3Rm
cy5leHQ0LGZvcm1hdD1yYXcsaWY9bXRkIC1uZXQgbmljIC1uZXQgdXNlcixob3N0ZndkPToxMjcu
MC4wLjE6MjIyMi06MjIsaG9zdGZ3ZD06MTI3LjAuMC4xOjI0NDMtOjQ0Myxob3N0bmFtZT1xZW11
DQpxZW11LXN5c3RlbS1hcm06IEFzcGVlZCBpQlQgaGFzIG5vIGNoYXJkZXYgYmFja2VuZA0KDQpB
cmUgdGhlcmUgYW55IGNoZWNrcG9pbnQgdG8gY2xhcmlmeSB0aGlzIGlzc3VlID8NCj4gDQo+ID4g
RG9lcyB0aGUgaW1hZ2UgZm9yIGJvdGggUUVNVSBhbmQgcmVhbCBtYWNoaW5lID8NCj4gDQo+IEkg
YmVsaWV2ZSB0aGlzIGRlZmF1bHQgaW1hZ2Ugd291bGQgb25seSBzdXBwb3J0IFFFTVUuDQo+IA0K
PiA+IEhvdyB0byB1cGRhdGUgaXQgYnkgcHJvZ3JhbW1pbmcgdG9vbCBsaWtlIFNGNjAwPw0KPiAN
Cj4gWWVzLCB3ZSB1c2UgdGhlIGRlZGlwcm9nIHRvb2wgaW50ZXJuYWxseSB0byBmbGFzaCBmcmVz
aCBjaGlwcy4NCklmIEkgaGF2ZSAyIFNQSSBmbGFzaCBmb3IgcmVkdW5kYW50IHB1cnBvc2UgLCAN
CkhvdyBkbyBsaW51eCBrZXJuZWwga25vdyB3aGVyZSAgdG8gYm9vdCBmcm9tID8NCkFyZSB0aGVy
ZSBhbnkgY29uZmlndXJhdGlvbiBmaWxlIGRlc2NyaWJlZCB0aGUgb2Zmc2V0IG9mIHVib290ICwg
a2VybmFsICxmaWxlc3lzdGVtIGluIFNQSSBmbGFzaCAgDQoNCj4gDQo+ID4gRG9lcyBpdCBzdXBw
b3J0IG9ubGluZSB1cGRhdGUgc3VjaCBhcyBBTUkgWUFGVSBmbGFzaCA/DQo+IA0KPiBOb3QgZmFt
aWxpYXIgd2l0aCB0aGlzIGJ1dCBvbmNlIHlvdSBnZXQgT3BlbkJNQyBvbiBhIHN5c3RlbXMsIGl0
IGRvZXMNCj4gcHJvdmlkZSBpbnRlcmZhY2VzIHRvIHVwZGF0ZSB0aGUgZmlybXdhcmUgdmlhIGEg
bmV0d29yayBjb25uZWN0aW9uLg0KPiANCj4gVGhlIHN5c3RlbSB3ZSB1c2UgZm9yIG91ciBDSSB3
b3JrIGlzIFJvbXVsdXMuIFRoaXMgc3lzdGVtIGlzIHN1cHBvcnRlZCBpbg0KPiBRRU1VIGFuZCBv
biByZWFsIGhhcmR3YXJlIGlmIHlvdSdkIGxpa2UgdG8gZ2l2ZSBpdCBhIHNob3QuDQo+IA0KPiBo
dHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2Jsb2IvbWFzdGVyL1JFQURNRS5tZCMz
LXRhcmdldC0NCj4geW91ci1oYXJkd2FyZQ0KPiB0YWxrcyBhYm91dCBzZXR0aW5nIHVwIHlvdXIg
VEVNUExBVEVDT05GIGZvciBhIHN5c3RlbSBhbmQNCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvZG9jcy9ibG9iL21hc3Rlci9kZXZlbG9wbWVudC9kZXYtDQo+IGVudmlyb25tZW50Lm1kI2Rv
d25sb2FkLWFuZC1zdGFydC1xZW11LXNlc3Npb24NCj4gaGFzIHNvbWUgcG9pbnRlcnMgb24gc3Rh
cnRpbmcgeW91ciBRRU1VIHNlc3Npb24uIFlvdSdkIG9mIGNvdXJzZSBuZWVkIGENCj4gUm9tdWx1
cyBzeXN0ZW0gdG8gZmxhc2ggb24gcmVhbCBoYXJkd2FyZSBidXQgaG9wZWZ1bGx5IGl0IHdvdWxk
IGhlbHAgeW91DQo+IGdldCBjb21mb3J0YWJsZSB3aXRoIGJ1aWxkaW5nIHRoZSBpbWFnZSBhbmQg
dGVzdGluZyBpbiBRRU1VLg0KPiANCj4gT3BlbkJNQyBpbWFnZXMgYXJlIHZlcnkgc3BlY2lmaWMg
dG8gdGhlIGhhcmR3YXJlIHNvIGJlZm9yZSBmbGFzaGluZyBvbg0KPiB5b3VyIHN5c3RlbSAgeW91
J2QgbmVlZCB0byBlbnN1cmUgeW91J3ZlIGdvdCBhbGwgb2YgdGhlIGRpZmZlcmVudCBjb25maWcN
Cj4gb3B0aW9ucyBzZXR1cC4NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9i
L21hc3Rlci9kZXZlbG9wbWVudC9hZGQtbmV3LQ0KPiBzeXN0ZW0ubWQNCj4gaXMgYSByZWZlcmVu
Y2UgZm9yIGhvdyB0byBhZGQgYSBuZXcgc3lzdGVtLg0KPiANCj4gPg0KPiA+DQo+ID4gSGVyZSBp
cyB0aGUgb3V0cHV0IG9mIG15ICBidWlsZA0KPiA+IGJyZW5kZW5AYnJlbmRlbi0NCj4gVmlydHVh
bEJveDp+L09DUC9vcGVuYm1jL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzL3FlbXVhDQo+ID4gcm0k
IGxzIG9ibWMqDQo+ID4gb2JtYy1waG9zcGhvci1kZWJ1Zy10YXJiYWxsLXFlbXVhcm0tMjAxOTAx
MTkxMjA2MzAucWVtdWJvb3QuY29uZg0KPiA+IG9ibWMtcGhvc3Bob3ItZGVidWctdGFyYmFsbC1x
ZW11YXJtLTIwMTkwMTE5MTIwNjMwLnJvb3Rmcy5tYW5pZmVzdA0KPiA+IG9ibWMtcGhvc3Bob3It
ZGVidWctdGFyYmFsbC1xZW11YXJtLTIwMTkwMTE5MTIwNjMwLnJvb3Rmcy50YXIueHoNCj4gPiBv
Ym1jLXBob3NwaG9yLWRlYnVnLXRhcmJhbGwtcWVtdWFybS0yMDE5MDExOTEyMDYzMC50ZXN0ZGF0
YS5qc29uDQo+ID4gb2JtYy1waG9zcGhvci1kZWJ1Zy10YXJiYWxsLXFlbXVhcm0ubWFuaWZlc3QN
Cj4gPiBvYm1jLXBob3NwaG9yLWRlYnVnLXRhcmJhbGwtcWVtdWFybS5xZW11Ym9vdC5jb25mDQo+
ID4gb2JtYy1waG9zcGhvci1kZWJ1Zy10YXJiYWxsLXFlbXVhcm0udGFyLnh6DQo+ID4gb2JtYy1w
aG9zcGhvci1kZWJ1Zy10YXJiYWxsLXFlbXVhcm0udGVzdGRhdGEuanNvbg0KPiA+IG9ibWMtcGhv
c3Bob3ItaW1hZ2UtcWVtdWFybS0yMDE5MDExOTEyMDYzMC5xZW11Ym9vdC5jb25mDQo+ID4gb2Jt
Yy1waG9zcGhvci1pbWFnZS1xZW11YXJtLTIwMTkwMTE5MTIwNjMwLnJvb3Rmcy5leHQ0DQo+ID4g
b2JtYy1waG9zcGhvci1pbWFnZS1xZW11YXJtLTIwMTkwMTE5MTIwNjMwLnJvb3Rmcy5tYW5pZmVz
dA0KPiA+IG9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS0yMDE5MDExOTEyMDYzMC5yb290ZnMu
dGFyLmJ6Mg0KPiA+IG9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFybS0yMDE5MDExOTEyMDYzMC50
ZXN0ZGF0YS5qc29uDQo+ID4gb2JtYy1waG9zcGhvci1pbWFnZS1xZW11YXJtLmV4dDQNCj4gPiBv
Ym1jLXBob3NwaG9yLWltYWdlLXFlbXVhcm0ubWFuaWZlc3QNCj4gPiBvYm1jLXBob3NwaG9yLWlt
YWdlLXFlbXVhcm0ucWVtdWJvb3QuY29uZg0KPiA+IG9ibWMtcGhvc3Bob3ItaW1hZ2UtcWVtdWFy
bS50YXIuYnoyDQo+ID4gb2JtYy1waG9zcGhvci1pbWFnZS1xZW11YXJtLnRlc3RkYXRhLmpzb24N
Cj4gPg0KPiA+DQo+ID4gQnJlbmRlbiBMYWkNCj4gPiBTUi4gQk1DIERlc2lnbiBFbmdpbmVlcg0K
PiA+IEUmSSwgSmFiaWwgRGVzaWduIFNlcnZpY2VzDQo+ID4NCj4gPg0K
