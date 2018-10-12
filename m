Return-Path: <Supreeth.Venkatesh@arm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=40.107.8.73; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="ab97oFoQ"; dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42WvJS0Pt7zF3Fv
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 04:01:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsuc0mK+7dZYVxxYrf8C+KU7h7vqJE6avcZl1rOIz/o=;
 b=ab97oFoQTJfGC9FafZzsRo9xIyAd/yzchfQ5BBBiFScwlnn2qxr2f4nkN6labSRotRZ/yNUah8sR4b7Wp1XBmgBicZ5Yf45iku3ykiHP5tQMXnQ0PREpdTFMEazxf4VX7OjpNVqTVGb1+Kbrfe43tPe9n2K4KHsTwFzgPmlmGtE=
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com (10.171.191.18) by
 AM4PR08MB0850.eurprd08.prod.outlook.com (10.164.83.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Fri, 12 Oct 2018 17:01:49 +0000
Received: from AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::21fa:7fba:c6fb:19ac]) by AM4PR08MB2788.eurprd08.prod.outlook.com
 ([fe80::21fa:7fba:c6fb:19ac%4]) with mapi id 15.20.1207.024; Fri, 12 Oct 2018
 17:01:48 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: Sai Dasari <sdasari@fb.com>, "Mihm, James" <James.Mihm@Intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC Hackathon Day 3 Updated Agenda 
Thread-Topic: OpenBMC Hackathon Day 3 Updated Agenda 
Thread-Index: AdRheOrZUXjgaJ8PTAula+e84EUcTgAmGVYAAA7TO7A=
Date: Fri, 12 Oct 2018 17:01:48 +0000
Message-ID: <AM4PR08MB27885B5D04A8BB6475404E4F80E20@AM4PR08MB2788.eurprd08.prod.outlook.com>
References: <C599FC839619124CAC44E062ABB7DFE2D700ED41@ORSMSX101.amr.corp.intel.com>
 <5DD7F79F-1899-41EB-9733-AFEFFC424C53@fb.com>
In-Reply-To: <5DD7F79F-1899-41EB-9733-AFEFFC424C53@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [217.140.111.135]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM4PR08MB0850;
 6:d9gqB4JOe8DBNCzXfs/ikNb+TqWGOkLwM7M1nTv/0YFPW55FZtx9Jpl3eKV6updt5iAMrP98wMag9WhehCXDMX6Id7Qh2Ll2Mfs7VYV2jnDygZv4oBxYcKLWpUxNc5dqksf9Apy5lTIw3nRzrH6obphK+dB83KUJHLApbn4hIG7Zp/3fN/KgEYrjX2oRVr6uaoWZlFxso+v9O5CknpSXk/Sih7sfsK3qR/ZrkiphAWQgNykcqi2/uWXihxofgLZd4qvKq0Q+H37OUvPjFOkwphdlM5SvvtMY4D36tmWU0FdtQjmAFwPZVRSQjG6+2i0KiNhMY8jLNUI9JC/vmMAhOnbBiui012i+8BYdX6zgwUcc+nln08LGNDANM+j36j9mUuaRsY5CqMH/Gziw86axxtPv5+0srB/abMnpE/Z2b3SeZLziHl29dtDPKbGkS9eO0tQPuJ3A+uLNiJ8+WbxZZw==;
 5:y5JlMXkBeRokTlfSZyDaIm+G3PTMqGgxnM2OjFc68fdMKpG5c0qkHbBIbkjtz26BC5RN75VxPUEUcGU6XPMPakJW0KKGOiUcXzQROP4ulEd9EWCvUCSigHSkIFS676M8lk+v1Pp+EMkKU4VKnkKExYYgat1RG/KFMlQtOFhua2I=;
 7:gJICqASEd5yqJQ18rhSCd6wWjlKFnzxHN7G1KMkjN91herd6e3IWGe2OsyN4WMeThzyx2ntB4gfV81+wkWEDaIcbrpHukZMAjr3WhFP6RPiYZFLIOc+HAhYStb/ZX2vM1+am32rBVuZt44twJEfhJ2ET/xZQcfCy9ZtJBTAgO5H/LqwgV0nhsLJptkINj3xNo15v6dq3YDG0CEHu1F8pjVE2Z3rKYdnNWihffZwtA/kepoFAI8xaBo3pqnZoK9SH
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 44e6d52e-40e3-4f6f-d8da-08d63064663f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
 SRVR:AM4PR08MB0850; 
x-ms-traffictypediagnostic: AM4PR08MB0850:
x-microsoft-antispam-prvs: <AM4PR08MB0850B70862B578B3CDFD5B8080E20@AM4PR08MB0850.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(65623756079841)(192374486261705)(228905959029699); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051);
 SRVR:AM4PR08MB0850; BCL:0; PCL:0; RULEID:; SRVR:AM4PR08MB0850; 
x-forefront-prvs: 0823A5777B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(366004)(136003)(39860400002)(13464003)(199004)(189003)(40434004)(14444005)(5024004)(74316002)(256004)(71200400001)(71190400001)(8676002)(102836004)(53546011)(81166006)(81156014)(6506007)(15650500001)(7736002)(2900100001)(5660300001)(97736004)(7696005)(6116002)(3846002)(14454004)(5250100002)(106356001)(68736007)(2501003)(305945005)(105586002)(86362001)(76176011)(110136005)(446003)(33656002)(4743002)(486006)(229853002)(72206003)(478600001)(66066001)(476003)(11346002)(316002)(2906002)(53936002)(186003)(6246003)(26005)(8936002)(55016002)(25786009)(6436002)(9686003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR08MB0850;
 H:AM4PR08MB2788.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: +U0TQUQKCX7qPiMj2Rf8T2C9z5WVouHe4oIToirNA7SCtblMShUK/B6/MFT1ghx0TLWw5xAcczqsD2ShfGUpn+ZnTEnen16E0fLgh+fChxOLJHRMjYchHtiySWTEMJWENi7SMMBgFyqGp/SFBG5k3/mW39yrqL8d+C8p6jzIdq2rY1a5PEFZMORIPRqO143Pf7x9fSk9zb73kgPo1BSfA47YXZq6zb2r2Yly5VdpevlinIumhrAkAb++i5tC9TmeyYbTvFH3xX1wqAwTSexejCQxSJFOJ4+JYbUqrGeVw1Gsnw6ce5iOcbEvjYE8l4Ykkkg2pPUECcIESZ+P5Apd+E/NmclLjN9oX2fxFkxkfhw=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e6d52e-40e3-4f6f-d8da-08d63064663f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2018 17:01:48.9076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB0850
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
X-List-Received-Date: Fri, 12 Oct 2018 17:02:01 -0000

WWVzLiBUaGFuayB5b3UgSmFtZXMgYW5kIEludGVsIHRlYW0gZm9yIG9yZ2FuaXppbmcgdGhpcy4N
CkJlaW5nIGEgZmlyc3QgdGltZSBPcGVuQk1DIEhhY2thdGhvbiBhdHRlbmRlZSwgSXQgd2FzIG5p
Y2UgbWVldGluZyBhbWF6aW5nIE9wZW5CTUMgZGV2ZWxvcGVycy9UU0MgdGVhbSBhbmQgZ2V0dGlu
ZyBhY3F1YWludGVkIHdpdGggbW9zdCBvZiB0aGVtIEZhY2UgdG8gRmFjZS4NCg0KU3VwcmVldGgN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91
bmNlcytzdXByZWV0aC52ZW5rYXRlc2g9YXJtLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhh
bGYgT2YgU2FpIERhc2FyaQ0KU2VudDogRnJpZGF5LCBPY3RvYmVyIDEyLCAyMDE4IDExOjUzIEFN
DQpUbzogTWlobSwgSmFtZXMgPEphbWVzLk1paG1ASW50ZWwuY29tPjsgb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnDQpTdWJqZWN0OiBSZTogT3BlbkJNQyBIYWNrYXRob24gRGF5IDMgVXBkYXRlZCBB
Z2VuZGENCg0KVGhhbmtzIGEgbG90IEphbWVzIChhbmQgSW50ZWwgbGVhZGVyc2hpcCB0ZWFtKSBm
b3IgaG9zdGluZyBPcGVuQk1DIEhhY2thdGhvbiBldmVudCBzdWNjZXNzZnVsbHkuDQoNCkl0IHdh
cyBodW1ibGluZyBleHBlcmllbmNlIHRvIG1lZXQgYW1hemluZyAoYW5kIHJlc3BlY3RmdWwpIGRl
dmVsb3BlcnMgYWNyb3NzIGRpdmVyc2UgaW5kdXN0cnkgcGFydG5lcnMgd2l0aCBzb2xlIGZvY3Vz
IG9uIHByb3ZpZGluZyBiZXR0ZXIgQk1DIHNvbHV0aW9uIQ0KDQrvu79PbiAxMC8xMS8xOCwgODo1
OCBBTSwgIm9wZW5ibWMgb24gYmVoYWxmIG9mIE1paG0sIEphbWVzIiA8b3BlbmJtYy1ib3VuY2Vz
K3NkYXNhcmk9ZmIuY29tQGxpc3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGphbWVzLm1paG1A
aW50ZWwuY29tPiB3cm90ZToNCg0KICAgIERheSAzICAgICBUZWNoIFRhbGtzICBUaHVyc2RheSwg
T2N0b2JlciAxMXRoLCAyMDE4DQogICAgICAgICAgICAgICAgICAgICAgICBEaXNjdXNzaW9uIExl
YWRlciAgICAgICAgIFRvcGljDQogICAgICA5OjAwIEFNICAgU3VwcmVldGggVmVua2F0ZXNoICAg
ICBPcGVuQk1DIGVuYWJsZW1lbnQgb24gQXJtIFJlZmVyZW5jZSBQbGF0Zm9ybXMgUm9hZG1hcC9Q
bGFuIHdpdGggZW1waGFzaXMgb24gUExETS9NQ1RQLg0KICAgICAgOTo0NSBBTSAgIE5pbGFuIE5h
aWRvbyAgICAgICAgICAgICAgICAgTUNUUCBTdXBwb3J0DQogICAgMTA6MzAgQU0gICBTdXJ5YWth
bnRoIFNla2FyICAgICAgICAgIE9PQiBCSU9TIENvbmZpZ3VyYXRpb24gYW5kIHVwZGF0ZXMNCiAg
ICAxMToxNSBBTSAgIFNoYXJhZCBLaGV0YW4gICAgICAgICAgICAgICBQZXJzcGVjdGl2ZXMgb24g
T3BlbkJNQw0KICAgIDEyOjAwIFBNICAgTHVuY2ggQnJlYWsgICAgICAgICAgICAgICAgICAgUmVs
YXggYW5kIGVuam95DQogICAgICAxOjAwIFBNICAgSm9zZXBoIFJleW5vbGRzIChyZW1vdGUpDQog
ICAgICAgICAgICAgICAgICAgICAgICBKYW1lcyBNaWhtICAgICAgICAgICAgICAgICAgIFNlY3Vy
aXR5IHdvcmtpbmcgZ3JvdXAgdXBkYXRlLCBpbmNpZGVudCByZXBvbnNlLCBzcHkgY2hpcHMsIHRo
cmVhdCBtb2RlbCwgaGFyZHdhcmUgZ3VpZGFuY2UNCiAgICAgMTo0NSBQTSAgIEVkIFRhbm91cyAg
ICAgICAgICAgICAgICAgICAgICAgIEtWTSAmIFZpcnR1YWwgTWVkaWENCiAgICAgMjozMCBQTSAg
ICAtLSBvcGVuIC0tICAgICAgICAgICAgICAgICAgICAgICAgIEJNQyBEZXZpY2UgRW5hYmxlbWVu
dCAtIGZ1dHVyZSByZXF1aXJlbWVudHMgKGUuZy4sIGkzYyBzdXBwb3J0LCBjcnlwdG8sIGZ1c2Vz
LCBmdyBtZWFzdXJlbWVudHMpDQogICAgIDM6MDAgUE0gICAgLS0gb3BlbiAtLSAgICAgICAgICAg
ICAgICAgICAgICAgICBSZXNwb25zaXZlbmVzcyBhbmQgcGVyZm9ybWFuY2UgbGltaXRhdGlvbnMg
b2YgdGhlIGN1cnJlbnQgYXJjaGl0ZWN0dXJlIGFuZCBpbXBsZW1lbnRhdGlvbg0KICAgICAzOjMw
IFBNICAgIC0tIG9wZW4gLS0gICAgICAgICAgICAgICAgICAgICAgICAgSG93IHRvIGltcHJvdmUg
b3ZlcmFsbCBwZXJmb3JtYW5jZSBvZiBCTUMgYW5kIHJlZHVjZSBib290IHRpbWUNCiAgICAgNDow
MCBQTSAgIEphbWVzIE1paG0gLw0KICAgICAgICAgICAgICAgICAgICAgICBTYWkgRGFzYXJpICAg
ICAgICAgICAgICAgICAgICAgICAgRW5nYWdlbWVudHMgd2l0aCBPQ1AgLSBIYXJkd2FyZSBNYW5h
Z2VhYmlsaXR5LCBTZWN1cml0eQ0KICAgICA0OjMwIFBNICAgSmFtZXMgTWlobSAgICAgICAgICAg
ICAgICAgICAgV3JhcC11cA0KICAgICA0OjQ1IFBNICAgRmluIGRlbCBkaWENCg0KDQogICAgSGFj
a2luZyBTZXNzaW9ucw0KICAgICAgICBjb250aW51YXRpb24gZnJvbSBkYXkgMg0KICAgICAgICBO
dXZvdG9uIERlbW8gb2YgT3BlbkJNQyBvbiBQb2xlZyAobnBjbTd4eCkgY2hpcA0KICAgICAgICBG
cmVlLWZvcm0gZGVtb25zdHJhdGlvbiBvZiB3b3JrIGFjY29tcGxpc2hlZCBkdXJpbmcgaGFja2F0
aG9uDQoNCg0KICAgIEphbWVzIE1paG0NCiAgICBJbnRlbCAtIEludGVsIERDRyBCTUMgQ29yZSBG
aXJtd2FyZQ0KICAgICg1MDMpIDI2NC01MTI5DQoNCg0KDQoNCklNUE9SVEFOVCBOT1RJQ0U6IFRo
ZSBjb250ZW50cyBvZiB0aGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVu
dGlhbCBhbmQgbWF5IGFsc28gYmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVu
ZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBk
byBub3QgZGlzY2xvc2UgdGhlIGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBm
b3IgYW55IHB1cnBvc2UsIG9yIHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBt
ZWRpdW0uIFRoYW5rIHlvdS4NCg==
