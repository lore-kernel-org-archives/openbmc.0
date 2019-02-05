Return-Path: <prvs=793966644b=sdasari@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=793966644b=sdasari@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="C1sIvODw"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="aHx6UPkc"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43tqS837rbzDqF5
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 14:14:28 +1100 (AEDT)
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1535Iof005029; Mon, 4 Feb 2019 19:14:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=PDRdPVpBFeqw1mOx+MUJhJTJo7Rxpz/h34NgB9pc24s=;
 b=C1sIvODww19oEdFUEngiJTyH2zXnw1Si2C3wO+8RvFsdEiehRmf3SLEd+fw3FMVIkSEn
 cxaWiyqsOn5oTzKUK1kKaMM04EP+COn8IjnmMSA8Rwu8Hr/CxQfOFrUMxVssyS4ptQsR
 316SttR1IwrbWRVVpTmtyqGMr+hJlnT5rUQ= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qey67rgja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 04 Feb 2019 19:14:21 -0800
Received: from prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) by
 prn-hub05.TheFacebook.com (2620:10d:c081:35::129) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 4 Feb 2019 19:14:21 -0800
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx06.TheFacebook.com (2620:10d:c081:6::20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Mon, 4 Feb 2019 19:14:20 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Mon, 4 Feb 2019 19:14:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDRdPVpBFeqw1mOx+MUJhJTJo7Rxpz/h34NgB9pc24s=;
 b=aHx6UPkc5HfSBATsqOIx/36TVLV6TfFEmmKIYSXyXBYWXx6wok/vVDrzXyirHK8PNOf9iNbfbLli4lY9C/h2Q5tPkJ8qm/kKkv8o+46JGTI1SsXs80Q1TRdNP8aFGmGzF8fUSGYdERx+sOy0ht9Ne/aNMFDb8SZLeN70P+N4oQg=
Received: from MWHPR15MB1789.namprd15.prod.outlook.com (10.174.255.18) by
 MWHPR15MB1405.namprd15.prod.outlook.com (10.173.234.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.16; Tue, 5 Feb 2019 03:14:19 +0000
Received: from MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::5:127b:7ae1:c758]) by MWHPR15MB1789.namprd15.prod.outlook.com
 ([fe80::5:127b:7ae1:c758%11]) with mapi id 15.20.1558.025; Tue, 5 Feb 2019
 03:14:19 +0000
From: Sai Dasari <sdasari@fb.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: OpenBMC at the 2019 OCP Summit Hardware Management track
Thread-Topic: OpenBMC at the 2019 OCP Summit Hardware Management track
Thread-Index: AQHUrtQVO5PgGUHZtkGMVuISUP7DTqW1hneAgBqXhoA=
Date: Tue, 5 Feb 2019 03:14:18 +0000
Message-ID: <CBF1753C-3D13-438F-8394-A8CB3961A4DD@fb.com>
References: <20190118021802.752bcjgc7oxa33m4@thinkpad>
 <20190118210913.a4kynzggtesqln5g@thinkpad>
In-Reply-To: <20190118210913.a4kynzggtesqln5g@thinkpad>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:380::2:656b]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1405;
 20:NA+y1jjgvqdIO+CdQwZOoDtm0HC2MfpNnTTz8O662DcUvsM6t6o+SF/KOVaXSIqakAgB8yyVNJwcpD8o66XurhxKBdHatInEV72VIt+vzRswZWXkPy9zBWPO6Yine4gPGxYFula0mSv6d3kYbDwthRaZKnBj8KLpJQCdvpJH+2A=
x-ms-office365-filtering-correlation-id: f1aa96ae-fac8-4981-7b54-08d68b180499
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1405; 
x-ms-traffictypediagnostic: MWHPR15MB1405:
x-microsoft-antispam-prvs: <MWHPR15MB140508D7AB4524135DCAFD49CE6E0@MWHPR15MB1405.namprd15.prod.outlook.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(346002)(136003)(39860400002)(396003)(189003)(199004)(53754006)(71190400001)(446003)(6116002)(6306002)(14454004)(36756003)(97736004)(99286004)(186003)(229853002)(82746002)(68736007)(6512007)(83716004)(6436002)(478600001)(486006)(102836004)(46003)(71200400001)(106356001)(6486002)(2501003)(14444005)(6506007)(76176011)(25786009)(316002)(256004)(86362001)(105586002)(110136005)(476003)(81166006)(81156014)(33656002)(305945005)(6246003)(53936002)(2906002)(11346002)(8936002)(7736002)(2616005)(966005)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1405;
 H:MWHPR15MB1789.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0s28VjLLlGZUdVCSDag/R/+LRi4iIkkMAeekwz7at/cdvMiCvo/XQ8767JIcJcUMdiaDGSCBGcfmeEl9Mol2/mQcsgq492J21gvCyEcqjvvOmNsXJG45K2t28vvLt4S3khBze3bM5gpyH/Q2o2X1nrnd9hD2dweWzvhsldSTWrABPzkGY8lm80WmP3FgHGWfmkBMOlXGH/wX+MrCXiy0rotvUqm5dRAn8kbBIO0QZPYM8mefF6+wT/gEQkUhnU48pyWcSBfKLhNiwKuUkZCpVfv927brh0Ih0eJqYJnbadP8RBoXLYtfzQcDg6JpkEvsySfJfRXmJA6wPHT0GC3rNA7YLNy79nzhdb2vUBAf+6Z5ZnvFfO6nOyQxnjonn4k8l2RQRINLLwjLBTEAydeRuCTakJYA6r2HuQQR5/j7X2A=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D316303D10DBC94DA9122536F962D1C9@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f1aa96ae-fac8-4981-7b54-08d68b180499
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 03:14:19.0385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1405
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-05_01:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-FB-Internal: Safe
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
X-List-Received-Date: Tue, 05 Feb 2019 03:14:33 -0000

DQrvu79PbiAxLzE4LzE5LCAxOjA5IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgQnJhZCBCaXNo
b3AiIDxvcGVuYm1jLWJvdW5jZXMrc2Rhc2FyaT1mYi5jb21AbGlzdHMub3psYWJzLm9yZyBvbiBi
ZWhhbGYgb2YgYnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPiB3cm90ZToNCg0KICAgIE9uIFRo
dSwgSmFuIDE3LCAyMDE5IGF0IDA5OjE4OjAyUE0gLTA1MDAsIEJyYWQgQmlzaG9wIHdyb3RlOg0K
ICAgID4gSGkgRXZlcnlvbmUNCiAgICA+IA0KICAgID4gVGhlIFRTQyBoYXMgYXNrZWQgbWUgdG8g
cHJlc2VudCBhdCB0aGUgMjAxOSBPQ1AgU3VtbWl0IG9uIGJlaGFsZiBvZiB0aGUNCiAgICA+IE9w
ZW5CTUMgY29tbXVuaXR5LiAgWW91IGNhbiBzZWUgdGhlIGFic3RyYWN0IGhlcmU6DQogICAgPiAN
CiAgICA+IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0z
QV9fMjAxOW9jcGdsb2JhbHN1bW1pdC5zY2hlZC5jb21fZXZlbnRfSmlsM19vcGVuYm1jLTJEcHJv
amVjdC0yRHVwZGF0ZS0zRmlmcmFtZS0zRG5vLTI2dy0zRDEwMC0yNS0yNnNpZGViYXItM0R5ZXMt
MjZiZy0zRG5vJmQ9RHdJQkFnJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPUQ4MDRCYl9nOEZr
SWFDampiX3JnN0EmbT1FS3ZQSmdyb0RBc2dRVlo4eFJEaHZGbUdsVTRaZ3V0NUJ4S0ZRemdfR2hn
JnM9WWRNQi1WbmZPTHBvSGlTeElYekNxNkw5TEJMNUNOLTcwYW1lZFZGS0VHbyZlPQ0KICAgID4g
DQogICAgPiBJIHdpbGwgYmUgaGFzaGluZyB0aGUgcHJlc2VudGF0aW9uIG91dCBpbiB0aGUgbmV4
dCBkYXkgb3IgdHdvLiBJZiB5b3UNCiAgICA+IGhhdmUgYW55dGhpbmcgeW91IHRoaW5rIG1pZ2h0
IG1ha2Ugc2Vuc2UgdG8gdGFsayBhYm91dCB0aGVyZSwgSSdkIGxvdmUNCiAgICA+IHRvIGhlYXIg
YWJvdXQgaXQuDQogICAgPiANCiAgICA+IEFsc28sIEkgaW50ZW5kIHRvIHB1Ymxpc2ggYSBkcmFm
dCBvbmNlIEkgaGF2ZSBjb21wb3NlZCBpdCwgaWYgeW91J2QNCiAgICA+IHByZWZlciB0byBsZWF2
ZSBmZWVkYmFjayB0aGF0IHdheSBhcyB3ZWxsIChvciBpbnN0ZWFkKS4gIFN0YXkgdHVuZWQuDQog
ICAgPiANCiAgICA+IHRoeCAtIGJyYWQNCiAgICANCiAgICBJJ3ZlIHB1dCBhIGRyYWZ0IGhlcmU6
DQogICAgDQogICAgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy93aWtpL2ZpbGVz
L09DUEdMTzE5X09wZW5CTUNfUHJvamVjdF9VcGRhdGUtZHJhZnQucGRmDQpUaGFua3MgZm9yIHB1
dHRpbmcgdGhlIHNsaWRlcyB0b2dldGhlci4gVGhlIGNvbnRlbnQgb3V0bGluZSBsb29rcyBwcmV0
dHkgZ29vZC4gSSBjYW1lIGFjcm9zcyB0aGUga2VybmVsIHJlcG9ydEAgaHR0cHM6Ly93d3cubGlu
dXhmb3VuZGF0aW9uLm9yZy8yMDE3LWxpbnV4LWtlcm5lbC1yZXBvcnQtbGFuZGluZy1wYWdlLyBh
bmQgd29uZGVyaW5nIGlmIHdlIGNhbiBzaG93IHNvbWUgc2ltaWxhciBtZXRyaWNzIGZvciBvdXIg
cHJvamVjdCBzaW5jZSB0aGUgaW5jZXB0aW9uIHRvIHNob3cgdGhlIGdyb3d0aCBvZiBwcm9qZWN0
LiBUaGFua3MhDQogICAgDQogICAgSXQgaXMgc3RpbGwgdmVyeSBkcmFmdC15LCBidXQgeW91IGNh
biBnZXQgYSBzZW5zZSBvZiB0aGUgb3V0bGluZSBhbmQNCiAgICBoaWdoIGxldmVsIGZsb3cuICBJ
IGNvdWxkIHVzZSBoZWxwIGNhbGxpbmcgb3V0IGFueSBmdW5jdGlvbiBpbXBsZW1lbnRlZA0KICAg
IGluIDIuNiBhbmQgYW55IGZ1bmN0aW9uIHBsYW5uZWQgZm9yIDIuNy4NCiAgICANCiAgICB0aHgg
LSBicmFkDQogICAgDQoNCg==
