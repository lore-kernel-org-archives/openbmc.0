Return-Path: <prvs=38137a6502=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38137a6502=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="TtSL/XtJ"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="R559d3X4"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Pt1D2d2zzDrYb;
 Wed,  3 Oct 2018 07:42:54 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w92Lf06W027062; Tue, 2 Oct 2018 14:42:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=YIqT6yoq0zgcU5umsUPafwiSWu5mE8swsq19OLdjWB4=;
 b=TtSL/XtJUM15Bx0wnZhnTB7p4jym0CuDnO3zG/MNQ7oskAcKM+CCi5vYhn5ppYGWuQTs
 TzhlaYzKw7DvXrNMItOPNZF7q+AUKeF/AasU8lSzmj331/zTJbUT8N5bW1D06aEwZ23u
 U+Cj6CnaebwyNVlXI4TAHozbSFRBW/mrcIM= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2mvcud8x44-2
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Oct 2018 14:41:42 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.34) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Tue, 2 Oct 2018 17:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIqT6yoq0zgcU5umsUPafwiSWu5mE8swsq19OLdjWB4=;
 b=R559d3X43L6AJi9r0f+jlE+2tdCZy9amcDPuIflxFc+zK5hy6gzm5SB2eTzurl1oetlZtlV8zV4lWWMLDoW6+dmB0gH3Qv2/w+lgW86Z/unsn0LTYTg2ow3Uzn479VpjZy+eqTBdFhskCPpQsPOX6Y0T+5jau4nUL/SERubs2NM=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1574.namprd15.prod.outlook.com (10.172.162.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1164.22; Tue, 2 Oct 2018 21:34:59 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%2]) with mapi id 15.20.1185.024; Tue, 2 Oct 2018
 21:34:57 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>, "sam@mendozajonas.com"
 <sam@mendozajonas.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "christian@cmd.nu" <christian@cmd.nu>
Subject: Re: [PATCH v2] net/ncsi: Add NCSI OEM command support
Thread-Topic: [PATCH v2] net/ncsi: Add NCSI OEM command support
Thread-Index: AQHUV5C7fVatiN9l9keL8qJvh+/Fp6ULLQ2AgAEEz4D//6zcgIAAljMA//+WIoA=
Date: Tue, 2 Oct 2018 21:34:57 +0000
Message-ID: <4F2DCF80-A0D8-4475-9777-72CFCA037BEC@fb.com>
References: <20180929010602.1025909-1-vijaykhemka@fb.com>
 <1004987ef0ab138e772ed5740a0d839bffe39910.camel@mendozajonas.com>
 <4876838166d140bab331280efcfd771d@AUSX13MPS306.AMER.DELL.COM>
 <F932552B-5751-48E9-BC8B-6F9D7841C7FA@fb.com>
 <3dc1e3c74a864c3da7aaf19c3ca9edfa@AUSX13MPS306.AMER.DELL.COM>
In-Reply-To: <3dc1e3c74a864c3da7aaf19c3ca9edfa@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:5d6d]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1574;
 20:Zpe9eaXuKH3hF809lX2GAlE+oYFqnJMRUqkBJjJ5TF3oT9Sz8/ZFwFZNA58kM/SnJWx4QfBB+8P23rUTCSPYVcDe1SG0EaCCAc20+vRqc2h7plkh2dd/zStwKCDCuv7fCwzxAoPW8raCQL+f+n3nlbZ9mevX74n1L/K83DqBEao=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(136003)(366004)(396003)(346002)(39860400002)(376002)(189003)(199004)(46003)(76176011)(476003)(6116002)(2616005)(11346002)(6486002)(8936002)(6506007)(2906002)(81156014)(99286004)(2501003)(81166006)(106356001)(86362001)(93886005)(486006)(2201001)(14454004)(2900100001)(82746002)(6436002)(446003)(6246003)(229853002)(7736002)(14444005)(102836004)(6512007)(33656002)(5660300001)(68736007)(305945005)(217873002)(105586002)(8676002)(36756003)(478600001)(110136005)(25786009)(71200400001)(71190400001)(83716004)(186003)(316002)(97736004)(5250100002)(53936002)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1574;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-correlation-id: ca5a8f3f-0bbd-4cf0-1d19-08d628aee6b2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1574; 
x-ms-traffictypediagnostic: CY4PR15MB1574:
x-microsoft-antispam-prvs: <CY4PR15MB1574A86122FC5BDB432238D7DDE80@CY4PR15MB1574.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231355)(11241501184)(944501410)(52105095)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
 SRVR:CY4PR15MB1574; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1574; 
x-forefront-prvs: 0813C68E65
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: Ygchsvad2c8G9/J6Fs5ed+DH36FXqAL7ij841gtHzVNphRvS3BXTsYFomdRXIqvGc6EQSyJ8N/yqAm/07rI+3kxITS1oQbe6eYFwrlmLdyJjC/X3pywsSGNTiizCtRF7227l4DShESojq7bzdAdqB/flUYdvPlZx7R+zpLxfQezougsRuwadzvWfhxPBN9Y6rzjdqWtPKVJth7dMJjou5W5sUxEjJoFIkoPRbuszxqlDRCcPIQTg4Oak4qq4F3SWr6d8iLE0TINSH8v+HckVj3Z+dyHw2v9w6wdb9CyqU5bVc3AXR2DCrsdHPeilkT4YRKbfKYe70IMff3LcvcAwuKbX/42FO3QfQZI1QfKpHdA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <588F0335EA04074BA45B0A2D8841BCD0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5a8f3f-0bbd-4cf0-1d19-08d628aee6b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2018 21:34:57.7325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1574
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-02_09:, , signatures=0
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
X-List-Received-Date: Tue, 02 Oct 2018 21:42:57 -0000

SGkgSnVzdGluLA0KUGxlYXNlIHNlZSBjb21tZW50cyBiZWxvdw0KDQotVmlqYXkNCiANCiAgICA+
ID4gPiBkaWZmIC0tZ2l0IGEvbmV0L25jc2kvbmNzaS1jbWQuYyBiL25ldC9uY3NpL25jc2ktY21k
LmMNCiAgICA+ID4gPiBpbmRleCA3NTY3Y2E2M2FhZTIuLjJmOTg1MzNlYmE0NiAxMDA2NDQNCiAg
ICA+ID4gPiAtLS0gYS9uZXQvbmNzaS9uY3NpLWNtZC5jDQogICAgPiA+ID4gKysrIGIvbmV0L25j
c2kvbmNzaS1jbWQuYw0KICAgID4gPiA+IEBAIC0yMTEsNiArMjExLDI2IEBAIHN0YXRpYyBpbnQg
bmNzaV9jbWRfaGFuZGxlcl9zbmZjKHN0cnVjdCBza19idWZmICpza2IsDQogICAgPiA+ID4gIAly
ZXR1cm4gMDsNCiAgICA+ID4gPiAgfQ0KICAgID4gPiA+ICANCiAgICA+ID4gPiArc3RhdGljIGlu
dCBuY3NpX2NtZF9oYW5kbGVyX29lbShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLA0KICAgID4gPiA+ICsJ
CQkJc3RydWN0IG5jc2lfY21kX2FyZyAqbmNhKQ0KICAgID4gPiA+ICt7DQogICAgPiA+ID4gKwlz
dHJ1Y3QgbmNzaV9jbWRfb2VtX3BrdCAqY21kOw0KICAgID4gDQogICAgPiA+T0VNIGNvbW1hbmQg
ZG9lc24ndCBub3QgaGF2ZSB0aGUgZml4ZWQgZGF0YSBzaXplLiBTaG91bGQgd2UgdXNlIHBvaW50
ZXIgaW5zdGVhZD8NCiAgICA+ID5zdHJ1Y3QgbmNzaV9jbWRfb2VtX3BrdCB7DQogICAgPiA+CXN0
cnVjdCBuY3NpX2NtZF9wa3RfaGRyIGNtZDsgICAgICAgICAvKiBDb21tYW5kIGhlYWRlciAgICAq
Lw0KICAgID4gPglfX2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFudWZh
Y3R1cmUgSUQgICAgKi8NCiAgICA+ID4JdW5zaWduZWQgY2hhciAgICAgICAgICAgKmRhdGE7ICAg
ICAgIC8qIE9FTSBQYXlsb2FkIERhdGEgICovDQogICAgPiA+fTsNCiAgICA+IFllcywgSSBhZ3Jl
ZSB0aGF0IE9FTSBjb21tYW5kIGRvZXNuJ3QgaGF2ZSBmaXhlZCBkYXRhIGJ1dCB0byBtYXAgdG8g
c2tidWZmIHN0cnVjdHVyZSwgDQogICAgPiBJIGhhdmUgZGVmaW5lZCBhYm92ZSBzdHJ1Y3R1cmUg
YXMgcGVyIE5DU0kgc3BlYywgV2UgY2FuIGNlcnRhaW5seSBoYXZlIGEgTUFYX0RBVEFfTEVOIGRl
ZmluZS4NCiAgICANCiAgICBUaGUgc3BlYyBvbmx5IGRlZmluZXMgbWFudWZhY3R1cmUgSUQgZmll
bGQgYW5kIHRoZSBzdGFydCBvZmZzZXQgb2YgdmVuZG9yIGRhdGEuIA0KICAgIElmIHdlIGp1c3Qg
d2FudCB0byBwb2ludCB0byB0aGUgdmVuZG9yIGRhdGEsIHdlIGRvbid0IG5lZWQgdG8gc3BlY2lm
eSB0aGUgbWF4IGxlbmd0aCBhbmQNCiAgICB3ZSBjYW4gdXNlIGZsZXhpYmxlIGFycmF5IGFzIHRo
ZSBsYXN0IG1lbWJlciAoY29ycmVjdCB0aGUgdHlwbyBhYm92ZSkuDQogICAgDQogICAgc3RydWN0
IG5jc2lfY21kX29lbV9wa3Qgew0KICAgIAlzdHJ1Y3QgbmNzaV9jbWRfcGt0X2hkciBjbWQ7ICAg
ICAgICAgLyogQ29tbWFuZCBoZWFkZXIgICAgKi8NCiAgICAJX19iZTMyICAgICAgICAgICAgICAg
ICAgbWZyX2lkOyAgICAgIC8qIE1hbnVmYWN0dXJlIElEICAgICovDQogICAgCXVuc2lnbmVkIGNo
YXIgICAgICAgICAgIGRhdGFbXTsgICAgICAgLyogT0VNIFBheWxvYWQgRGF0YSAgKi8NCiAgICB9
Ow0KDQpJIGFncmVlIGFuZCB3aWxsIGFkZCB0aGlzIGNoYW5nZS4NCiAgICAgDQogICAgPiA+ID4g
Kwl1bnNpZ25lZCBpbnQgbGVuOw0KICAgID4gPiA+ICsNCiAgICA+ID4gPiArCWxlbiA9IHNpemVv
ZihzdHJ1Y3QgbmNzaV9jbWRfcGt0X2hkcikgKyA0Ow0KICAgID4gPiA+ICsJaWYgKG5jYS0+cGF5
bG9hZCA8IDI2KQ0KICAgID4gPiA+ICsJCWxlbiArPSAyNjsNCiAgICA+IA0KICAgID4gPldoeSBk
b2VzIGl0IGFkZCAyNj8gSSBrbmV3IHRoZSBvdGhlciBwbGFjZSBpbiBuY3NpX2FsbG9jX2NvbW1h
bmQoKSBpcyBhbHNvIGFkZCAyNi4NCiAgICA+ID5JZiBpdCBpcyBsZXNzIHRoYW4gMjYsIHRoZW4g
aXQgc2hvdWxkIGJlIGEgZml4ZWQgc2l6ZSBvZiBzdHJ1Y3R1cmUgbmNzaV9jbWRfcGt0ICg0Niks
IHJpZ2h0Pw0KICAgID4gSXQgYWRkcyAyNiBiZWNhdXNlIEl0IGhhcyBhbHJlYWR5IGFzc2lnbmVk
IGxlbiB0byBoZHIrNCB3aGljaCBpcyAxNis0ID0gMjAgYnl0ZXMuIEJ5IA0KICAgID4gYWRkaW5n
IDI2IGl0IG1ha2VzIGl0IHRvIDQ2LiBJIGFtIGp1c3QgYmVpbmcgY29uc2lzdGVudCB3aXRoIG90
aGVyIHBvcnRpb24gb2YgY29kZS4NCiAgICA+IA0KICAgID4gPiA+ICsJZWxzZQ0KICAgID4gPiA+
ICsJCWxlbiArPSBuY2EtPnBheWxvYWQ7DQogICAgPiA+ID4gKw0KICAgID4gPiA+ICsJY21kID0g
c2tiX3B1dF96ZXJvKHNrYiwgbGVuKTsNCiAgICA+ID4gPiArCWNtZC0+bWZyX2lkID0gbmNhLT5k
d29yZHNbMF07DQogICAgPiA+ID4gKwltZW1jcHkoY21kLT5kYXRhLCAmbmNhLT5kd29yZHNbMV0s
IG5jYS0+cGF5bG9hZCAtIDQpOw0KICAgID4gDQogICAgPiA+TmV0bGluayByZXF1ZXN0IGlzIHVz
aW5nIHRoZSBuZXcgbmNhLT5kYXRhIHBvaW50ZXIgdG8gcGFzcyB0aGUgZGF0YSBhcyB0aGUgcmVx
dWVzdCBwYXlsb2FkDQogICAgPiA+aXMgbm90IHRoZSBzYW1lIHNpemUgYW5kIHNvbWUgY29tbWFu
ZCBwYXlsb2FkIGlzIGJpZ2dlciB0aGFuIDE2IGJ5dGVzLg0KICAgID4gPldpbGwgeW91IGNvbnNp
ZGVyIHRvIHVzZSB0aGUgc2FtZSBkYXRhIHBvaW50ZXI/IFNvLCB3ZSBkb24ndCBuZWVkIHRvIGhh
dmUgYSBjaGVja2luZyBoZXJlLg0KICAgID4gPklmIHRoZSBjb21tYW5kIGlzIHVzZWQgbGVzcyB0
aGFuIDE2IGJ5dGVzLCB3ZSBjYW4gc2ltcGx5IGFzc2lnbmVkICZuY2EtPmJ5dGVzWzBdIHRvIGl0
Lg0KICAgID4gVG8ga2VlcCBvcmlnaW5hbCBzdHJ1Y3R1cmUsIHdlIGNhbiBjaGFuZ2UgMTYgYnl0
ZXMgdG8gTUFYX0RBVEFfTEVOLiBPciBJIGRvbid0IHNlZSBhbnkgaXNzdWUgaW4gDQogICAgPiBD
b3B5aW5nIGRhdGEgZnJvbSBkYXRhIHBvaW50ZXIgZnJvbSBuY2EgYnV0IHVzZXIgbmVlZHMgdG8g
YmUgYXdhcmUgaWYgaXQgaXMgbGVzcyB0aGFuIDE2IGJ5dGVzIHRoZW4gDQogICAgPiB1c2UgYnl0
ZXMgb3IgdXNlIGRhdGEgcG9pbnRlci4gVG8ga2VlcCBpdCBzaW1wbGUsIHdlIHNob3VsZCBzaW1w
bHkgZGVmaW5lIE1BWF9MRU4uDQogICAgDQogICAgSSB1c2UgdGhlIHBvaW50ZXIgdG8gYXZvaWQg
Y29weWluZyB0aGUgZGF0YSBhZ2Fpbi4gT0VNIGhhbmRsZXIgY2FuIGFsd2F5cyBwcm9jZXNzIHRo
ZSBmbGV4aWJsZSBwYXlsb2FkDQogICAgdGhyb3VnaCB0aGUgZGF0YSBwb2ludGVyLiBJdCBjYW4g
ZGVwZW5kIG9uIHRoZSBjYWxsZXIgdG8gdXNlIHN0YWNrL2FsbG9jYXRlZCBidWZmZXIvbmNhIGJ1
ZmZlciBhbmQNCiAgICBpdCB3aWxsIGJlIHN0cmFpZ2h0IGZvcndhcmQgaWYgYWxsIE9FTSBzdHVm
ZiBpcyB1c2luZyB0aGUgZGF0YSBwb2ludGVyIHRvIHByb2Nlc3MgdGhlIGZsZXhpYmxlDQogICAg
cGF5bG9hZC4NCg0KRG8gd2UgdXNlIGRhdGEgcG9pbnRlciBmb3IgcGF5bG9hZCBsZXNzIHRoYW4g
MTYgYnl0ZXMgYXMgd2VsbCBpbiBPRU0uIFdlIGNvcHkgZGF0YSBvbmx5IG9uY2Ugd2hpbGUgYWRk
aW5nIHRvIHNrYnVmZi4gDQpJIGhhdmUgbm8gaXNzdWUsIEkgd2lsbCBtYWtlIHRoaXMgY2hhbmdl
IGJ1dCB3YWl0IGZvciBvdGhlciBjb21tZW50cy4NCiAgICANCiAgICA+IA0KICAgID4gPiA+IGRp
ZmYgLS1naXQgYS9uZXQvbmNzaS9uY3NpLXBrdC5oIGIvbmV0L25jc2kvbmNzaS1wa3QuaA0KICAg
ID4gPiA+IGluZGV4IDkxYjRiNjY0MzhkZi4uMWYzMzgzODY4MTBkIDEwMDY0NA0KICAgID4gPiA+
IC0tLSBhL25ldC9uY3NpL25jc2ktcGt0LmgNCiAgICA+ID4gPiArKysgYi9uZXQvbmNzaS9uY3Np
LXBrdC5oDQogICAgPiA+ID4gQEAgLTE1MSw2ICsxNTEsMjIgQEAgc3RydWN0IG5jc2lfY21kX3Nu
ZmNfcGt0IHsNCiAgICA+ID4gPiAgCXVuc2lnbmVkIGNoYXIgICAgICAgICAgIHBhZFsyMl07DQog
ICAgPiA+ID4gIH07DQogICAgPiA+ID4gIA0KICAgID4gPiA+ICsvKiBPRU0gUmVxdWVzdCBDb21t
YW5kIGFzIHBlciBOQ1NJIFNwZWNpZmljYXRpb24gKi8NCiAgICA+ID4gPiArc3RydWN0IG5jc2lf
Y21kX29lbV9wa3Qgew0KICAgID4gPiA+ICsJc3RydWN0IG5jc2lfY21kX3BrdF9oZHIgY21kOyAg
ICAgICAgIC8qIENvbW1hbmQgaGVhZGVyICAgICovDQogICAgPiA+ID4gKwlfX2JlMzIgICAgICAg
ICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFudWZhY3R1cmUgSUQgICAgKi8NCiAgICA+ID4g
PiArCXVuc2lnbmVkIGNoYXIgICAgICAgICAgIGRhdGFbNjRdOyAgICAvKiBPRU0gUGF5bG9hZCBE
YXRhICAqLw0KICAgID4gPiA+ICsJX19iZTMyICAgICAgICAgICAgICAgICAgY2hlY2tzdW07ICAg
IC8qIENoZWNrc3VtICAgICAgICAgICovDQogICAgPiA+ID4gK307DQogICAgPiA+ID4gKw0KICAg
ID4gPiA+ICsvKiBPRU0gUmVzcG9uc2UgUGFja2V0IGFzIHBlciBOQ1NJIFNwZWNpZmljYXRpb24g
Ki8NCiAgICA+ID4gPiArc3RydWN0IG5jc2lfcnNwX29lbV9wa3Qgew0KICAgID4gPiA+ICsJc3Ry
dWN0IG5jc2lfcnNwX3BrdF9oZHIgcnNwOyAgICAgICAgIC8qIENvbW1hbmQgaGVhZGVyICAgICov
DQogICAgPiA+ID4gKwlfX2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFu
dWZhY3R1cmUgSUQgICAgKi8NCiAgICA+ID4gPiArCXVuc2lnbmVkIGNoYXIgICAgICAgICAgIGRh
dGFbNjRdOyAgICAvKiBQYXlsb2FkIGRhdGEgICAgICAqLw0KICAgID4gPiA+ICsJX19iZTMyICAg
ICAgICAgICAgICAgICAgY2hlY2tzdW07ICAgIC8qIENoZWNrc3VtICAgICAgICAgICovDQogICAg
PiA+ID4gK307DQogICAgPiA+ID4gKw0KICAgID4gDQogICAgPiA+T0VNIGNvbW1hbmQgZG9lc24n
dCBub3QgaGF2ZSB0aGUgZml4ZWQgcmVzcG9uc2UgZGF0YSBzaXplIHRvby4NCiAgICA+ID5TaG91
bGQgd2UgdXNlIHBvaW50ZXIgaW5zdGVhZD8NCiAgICA+IA0KICAgID4gSGVyZSBhbHNvIHdlIGNh
biBkZWZpbmUgTUFYX0RBVEFfTEVOIGJlY2F1c2UgZGF0YSBwb2ludGVyIHdvbid0IG1hcCB0byBz
a2IgZGlyZWN0bHkuDQogICAgDQogICAgU3VnZ2VzdCB0byBjaGFuZ2UgYXMgYmVsb3cgZHVlIHRv
IHRoZSBmbGV4aWJsZSByZXNwb25zZS4NCiAgICBzdHJ1Y3QgbmNzaV9yc3Bfb2VtX3BrdCB7DQog
ICAgCXN0cnVjdCBuY3NpX3JzcF9wa3RfaGRyIHJzcDsgICAgICAgICAvKiBDb21tYW5kIGhlYWRl
ciAgICAqLw0KICAgIAlfX2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFu
dWZhY3R1cmUgSUQgICAgKi8NCiAgICAJdW5zaWduZWQgY2hhciAgICAgICAgICAgZGF0YVtdOyAg
ICAvKiBQYXlsb2FkIGRhdGEgICAgICAqLw0KICAgIH07DQogICAgDQpTdXJlIGRvbmUuDQoNCg==
