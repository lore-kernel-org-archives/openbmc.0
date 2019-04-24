Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=40.107.3.89; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="koiW/Xuz"; dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30089.outbound.protection.outlook.com [40.107.3.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44qCrJ30DGzDqGp
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 07:19:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oxs/pzDpc0m3zRAqFtcx6P7UHQODtmM5Hn4igm4axw0=;
 b=koiW/Xuz9QCBPB6T+TkYXfCfOx6Xz3HKigU3f7xiUS6smMfQlOHTWla4lOMyvbWuFqWtDxyMfDIuExaxXAAxj2og8acj/0WMK+QxqDcWlwYy+ubJ50oShv/tC+/opXPrcGyhs3NULrXtvFjPK5ruhQL82YpVFNGvGnXFGoE+XZE=
Received: from VE1PR08MB5165.eurprd08.prod.outlook.com (20.179.30.215) by
 VE1PR08MB4702.eurprd08.prod.outlook.com (10.255.114.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Wed, 24 Apr 2019 21:19:35 +0000
Received: from VE1PR08MB5165.eurprd08.prod.outlook.com
 ([fe80::79a9:1f16:48e8:2c28]) by VE1PR08MB5165.eurprd08.prod.outlook.com
 ([fe80::79a9:1f16:48e8:2c28%4]) with mapi id 15.20.1835.010; Wed, 24 Apr 2019
 21:19:35 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: Kurt Taylor <kurt.r.taylor@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: TSC announcement
Thread-Topic: TSC announcement
Thread-Index: AQHU+tCyZ2AIfqbjwkW4mq5a1ccn2qZLyl+AgAAGrFA=
Date: Wed, 24 Apr 2019 21:19:35 +0000
Message-ID: <VE1PR08MB51658129395B9B4D30DC33D8803C0@VE1PR08MB5165.eurprd08.prod.outlook.com>
References: <20190424184012.ivtlh3ikvwkcc6j4@thinkpad.dyn.fuzziesquirrel.com>
 <CAG5OiwhRSjqGfQZei+7HtCgfMMWpdS4pmvSzCHXdXAm3mQNicw@mail.gmail.com>
In-Reply-To: <CAG5OiwhRSjqGfQZei+7HtCgfMMWpdS4pmvSzCHXdXAm3mQNicw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [2600:1700:8c61:400:45c1:3c29:d732:f5ca]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2856c2a4-06bb-42b9-29d4-08d6c8fa8d4f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4702; 
x-ms-traffictypediagnostic: VE1PR08MB4702:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR08MB4702864BDB68B714C0A663CB803C0@VE1PR08MB4702.eurprd08.prod.outlook.com>
x-forefront-prvs: 00179089FD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(366004)(136003)(53754006)(13464003)(199004)(189003)(40434004)(99286004)(25786009)(71190400001)(71200400001)(7696005)(68736007)(2906002)(53936002)(6306002)(221733001)(110136005)(7736002)(305945005)(3480700005)(74316002)(9686003)(5660300002)(7116003)(76176011)(316002)(86362001)(4744005)(97736004)(76116006)(81156014)(66946007)(72206003)(81166006)(53546011)(6436002)(8676002)(966005)(229853002)(66556008)(64756008)(66446008)(66476007)(476003)(73956011)(102836004)(8936002)(478600001)(46003)(446003)(6246003)(5024004)(256004)(14444005)(33656002)(55016002)(52536014)(14454004)(186003)(6116002)(6506007)(486006)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4702;
 H:VE1PR08MB5165.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ySXf/NX0Gs8Qk3GKEa6au6nkYPPEuVcib1Y37ZS4qhpEHcUNmqY5gP+ZOoN44UXvt1/MURq9/mza5eli9aKoYxPcoDM8Qf9ISGPud/hltsdSEKXqFCc0acWrPJzc6zDnpkD5dkUxjqTimoldSOKA0BhH1L1AcNCOCiQVZaW5IoBm25/uh4xcN/xou3VexgFHH118GIMPVTj0OnNoW1Og6KJ3ZzyBika/7JhxNBTpJQgXqZa0J0sYbICLZHo21mdHuJBsjbDrYu5ACwW/6sg1v1P9abV1CQLnaa6xO+WoZSZjO8fTgbEo1F+pxi0x3U7mnioBJpVp2DfiVkq5FpD61YPiImYbaz/dPjVjZac0KHc+iYBoOaNjINBhK3ea1b6RwiEotQvOFWYOjTIfdBDJuU0w6mbL8232NOEKF/BwF78=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2856c2a4-06bb-42b9-29d4-08d6c8fa8d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2019 21:19:35.6837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4702
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
X-List-Received-Date: Wed, 24 Apr 2019 21:19:45 -0000

VGhhbmtzIEt1cnQuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBvcGVuYm1j
IDxvcGVuYm1jLWJvdW5jZXMrc3VwcmVldGgudmVua2F0ZXNoPWFybS5jb21AbGlzdHMub3psYWJz
Lm9yZz4gT24gQmVoYWxmIE9mIEt1cnQgVGF5bG9yDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI0
LCAyMDE5IDM6NTUgUE0NClRvOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQpTdWJqZWN0OiBSZTogVFNDIGFubm91bmNlbWVudA0KDQpXZWxjb21lIFN1cHJlZXRo
IChhbmQgQVJNKSENCg0KS3VydCBUYXlsb3IgKGtydGF5bG9yKQ0KDQpPbiBXZWQsIEFwciAyNCwg
MjAxOSBhdCAyOjA1IFBNIEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+
IHdyb3RlOg0KPg0KPiBIaSBFdmVyeW9uZQ0KPg0KPiBKdXN0IGEgcXVpY2sgYW5ub3VuY2VtZW50
IC0gU3VwcmVldGggVmVua2F0ZXNoIGZyb20gQXJtIHdhcw0KPiAodW5hbmltb3VzbHkpIHZvdGVk
IG9udG8gdGhlIE9wZW5CTUMgcHJvamVjdCBUU0MgYXQgdGhlIEFwcmlsIDl0aCBUU0MNCj4gbWVl
dGluZzoNCj4NCj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL1RTQy1N
ZWV0aW5nIzQ5MTkNCj4NCj4gUGxlYXNlIGpvaW4gbWUgaW4gd2VsY29taW5nIFN1cHJlZXRoIGFu
ZCBBcm0gdG8gdGhlIE9wZW5CTUMgcHJvamVjdA0KPiBsZWFkZXJzaGlwLg0KPg0KPiB0aHggLSBi
cmFkDQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55
IGF0dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQu
IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBh
bnkgb3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5
IHRoZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=
