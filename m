Return-Path: <prvs=38137a6502=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=38137a6502=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="DouPHlPU"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="ZvpoKPwE"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42PpKD06lDzF3BM;
 Wed,  3 Oct 2018 04:56:27 +1000 (AEST)
Received: from pps.filterd (m0001255.ppops.net [127.0.0.1])
 by mx0b-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w92IqT3i003800; Tue, 2 Oct 2018 11:56:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=V+Sb51aO+gl6h29+YIBEb6IuNO6lxwjMs/IWrNL51KI=;
 b=DouPHlPUc6eRIPSTE2s8y19ktHjZXCTNKbshq6pwesJoZ5Fp9fFJQs4v/XRZgoKSLNhQ
 kae+gwELv/MRxfz5QQhZl+f9D/VAliAa4Rt3BD6PlC+xMcBQODrQFic6tqWEUrE/CRye
 R3P0jjrNNHCUUeS5cZG3ZvMuuPFjvMJc3l8= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0b-00082601.pphosted.com with ESMTP id 2mvcud8e99-2
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Oct 2018 11:56:22 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.23) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Tue, 2 Oct 2018 11:56:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+Sb51aO+gl6h29+YIBEb6IuNO6lxwjMs/IWrNL51KI=;
 b=ZvpoKPwEl3V4lVUK8a5es5nsOdjd2CCV8h0bJG40NL/KfIeeHA0wyCo8SJTBkRmsuOv//FIrxloulQucfrCvngKnHKilKDhbxljDIys5avJ/ne7pCuO9Ilb0ZWasdMxNbaMXM1nTeGDz+HOFx6yYES1rxyrh2e3/iEQK3ryy6cs=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1832.namprd15.prod.outlook.com (10.174.54.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1185.25; Tue, 2 Oct 2018 18:56:19 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::2d43:ae9a:18c0:ac8b%2]) with mapi id 15.20.1185.024; Tue, 2 Oct 2018
 18:56:18 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: "Justin.Lee1@Dell.com" <Justin.Lee1@Dell.com>, "sam@mendozajonas.com"
 <sam@mendozajonas.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Sai Dasari
 <sdasari@fb.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "christian@cmd.nu" <christian@cmd.nu>
Subject: Re: [PATCH v2] net/ncsi: Add NCSI OEM command support
Thread-Topic: [PATCH v2] net/ncsi: Add NCSI OEM command support
Thread-Index: AQHUV5C7fVatiN9l9keL8qJvh+/Fp6ULLQ2AgAEEz4D//6zcgA==
Date: Tue, 2 Oct 2018 18:56:18 +0000
Message-ID: <F932552B-5751-48E9-BC8B-6F9D7841C7FA@fb.com>
References: <20180929010602.1025909-1-vijaykhemka@fb.com>
 <1004987ef0ab138e772ed5740a0d839bffe39910.camel@mendozajonas.com>
 <4876838166d140bab331280efcfd771d@AUSX13MPS306.AMER.DELL.COM>
In-Reply-To: <4876838166d140bab331280efcfd771d@AUSX13MPS306.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:5d6d]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1832;
 20:3JqaOVzOGffIs3QLkqj5rkPDqF9UbuE/8WG0LELvulQJ/nXiQ5b9RKOtC95xmHafhEkxOFm9gr68G6hX/QCsmCHPMVJbiziBEqagrC1IrEjRNPA630OAx8t9MFW+80bGiybvYcHd6PrwdMsJuVeg3dcMn19Rj5ttYIk7mx5JeNA=
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
 SFS:(10019020)(136003)(346002)(396003)(366004)(39860400002)(376002)(199004)(189003)(5660300001)(83716004)(68736007)(2906002)(71190400001)(71200400001)(6116002)(2900100001)(110136005)(6506007)(2201001)(81166006)(6512007)(53936002)(305945005)(99286004)(36756003)(217873002)(7736002)(46003)(256004)(102836004)(82746002)(476003)(105586002)(106356001)(86362001)(25786009)(76176011)(2616005)(186003)(486006)(81156014)(6436002)(6246003)(2501003)(5250100002)(229853002)(8936002)(11346002)(316002)(33656002)(478600001)(6486002)(14454004)(446003)(14444005)(8676002)(97736004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1832;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: ea0debe8-8528-41ee-c01c-08d62898bcec
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1832; 
x-ms-traffictypediagnostic: CY4PR15MB1832:
x-microsoft-antispam-prvs: <CY4PR15MB18327AD4CC169FE2296F0A50DDE80@CY4PR15MB1832.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3002001)(10201501046)(3231355)(11241501184)(944501410)(52105095)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
 SRVR:CY4PR15MB1832; BCL:0; PCL:0; RULEID:; SRVR:CY4PR15MB1832; 
x-forefront-prvs: 0813C68E65
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: v/71ogFQsv11S+bJunbGsYeLm6azxpcNzU/iAlmH2PgkNEGGAqMLPyVyVa7J6xtLGfeZqGydvQoRDnBPe9wo8ztw+fQJu/ncqxMYkOnSUnwxOa7pVXcR9LgAz5osEv3jkC0TYKimSmtqgYozn3BeZNIhTfgqDMek6K+v4jfcpS6xR7QWxn7ElqUmBYydDSNikzHt6G9NwOCrQNYN3a3Eo4uHzu1AesGMaVxqzKpsQT5oHLuZHtqMKc1Ue82mYp6CUlmzidqNUTYN31WRpAzO3/NS5RnEZYkTb/zbcNw7IQQl/PmKTtbXQMkTQUgkdscDAZf+4aIAakyy6D4HpnCZkU+iqrbAg7F9MqULINdwVEA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6C9E06FEED8F84F8E761BC14B088ACD@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0debe8-8528-41ee-c01c-08d62898bcec
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2018 18:56:18.7557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1832
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-02_08:, , signatures=0
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
X-List-Received-Date: Tue, 02 Oct 2018 18:56:33 -0000

SGkgSnVzdGluLA0KVGhhbmtzIGZvciByZXNwb25zZS4gUGxlYXNlIHNlZSBteSBjb21tZW50cyBi
ZWxvdy4NCg0KLVZpamF5DQogICAgPiA+IGRpZmYgLS1naXQgYS9uZXQvbmNzaS9uY3NpLWNtZC5j
IGIvbmV0L25jc2kvbmNzaS1jbWQuYw0KICAgID4gPiBpbmRleCA3NTY3Y2E2M2FhZTIuLjJmOTg1
MzNlYmE0NiAxMDA2NDQNCiAgICA+ID4gLS0tIGEvbmV0L25jc2kvbmNzaS1jbWQuYw0KICAgID4g
PiArKysgYi9uZXQvbmNzaS9uY3NpLWNtZC5jDQogICAgPiA+IEBAIC0yMTEsNiArMjExLDI2IEBA
IHN0YXRpYyBpbnQgbmNzaV9jbWRfaGFuZGxlcl9zbmZjKHN0cnVjdCBza19idWZmICpza2IsDQog
ICAgPiA+ICAJcmV0dXJuIDA7DQogICAgPiA+ICB9DQogICAgPiA+ICANCiAgICA+ID4gK3N0YXRp
YyBpbnQgbmNzaV9jbWRfaGFuZGxlcl9vZW0oc3RydWN0IHNrX2J1ZmYgKnNrYiwNCiAgICA+ID4g
KwkJCQlzdHJ1Y3QgbmNzaV9jbWRfYXJnICpuY2EpDQogICAgPiA+ICt7DQogICAgPiA+ICsJc3Ry
dWN0IG5jc2lfY21kX29lbV9wa3QgKmNtZDsNCiAgICANCiAgICA+T0VNIGNvbW1hbmQgZG9lc24n
dCBub3QgaGF2ZSB0aGUgZml4ZWQgZGF0YSBzaXplLiBTaG91bGQgd2UgdXNlIHBvaW50ZXIgaW5z
dGVhZD8NCiAgICA+c3RydWN0IG5jc2lfY21kX29lbV9wa3Qgew0KICAgID4Jc3RydWN0IG5jc2lf
Y21kX3BrdF9oZHIgY21kOyAgICAgICAgIC8qIENvbW1hbmQgaGVhZGVyICAgICovDQogICAgPglf
X2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFudWZhY3R1cmUgSUQgICAg
Ki8NCiAgICA+CXVuc2lnbmVkIGNoYXIgICAgICAgICAgICpkYXRhOyAgICAgICAvKiBPRU0gUGF5
bG9hZCBEYXRhICAqLw0KICAgID59Ow0KICAgIFllcywgSSBhZ3JlZSB0aGF0IE9FTSBjb21tYW5k
IGRvZXNuJ3QgaGF2ZSBmaXhlZCBkYXRhIGJ1dCB0byBtYXAgdG8gc2tidWZmIHN0cnVjdHVyZSwg
DQogICAgSSBoYXZlIGRlZmluZWQgYWJvdmUgc3RydWN0dXJlIGFzIHBlciBOQ1NJIHNwZWMsIFdl
IGNhbiBjZXJ0YWlubHkgaGF2ZSBhIE1BWF9EQVRBX0xFTiBkZWZpbmUuDQoNCiAgICA+ID4gKwl1
bnNpZ25lZCBpbnQgbGVuOw0KICAgID4gPiArDQogICAgPiA+ICsJbGVuID0gc2l6ZW9mKHN0cnVj
dCBuY3NpX2NtZF9wa3RfaGRyKSArIDQ7DQogICAgPiA+ICsJaWYgKG5jYS0+cGF5bG9hZCA8IDI2
KQ0KICAgID4gPiArCQlsZW4gKz0gMjY7DQogICAgDQogICAgPldoeSBkb2VzIGl0IGFkZCAyNj8g
SSBrbmV3IHRoZSBvdGhlciBwbGFjZSBpbiBuY3NpX2FsbG9jX2NvbW1hbmQoKSBpcyBhbHNvIGFk
ZCAyNi4NCiAgICA+SWYgaXQgaXMgbGVzcyB0aGFuIDI2LCB0aGVuIGl0IHNob3VsZCBiZSBhIGZp
eGVkIHNpemUgb2Ygc3RydWN0dXJlIG5jc2lfY21kX3BrdCAoNDYpLCByaWdodD8NCiAgICBJdCBh
ZGRzIDI2IGJlY2F1c2UgSXQgaGFzIGFscmVhZHkgYXNzaWduZWQgbGVuIHRvIGhkcis0IHdoaWNo
IGlzIDE2KzQgPSAyMCBieXRlcy4gQnkgDQogICAgYWRkaW5nIDI2IGl0IG1ha2VzIGl0IHRvIDQ2
LiBJIGFtIGp1c3QgYmVpbmcgY29uc2lzdGVudCB3aXRoIG90aGVyIHBvcnRpb24gb2YgY29kZS4N
Cg0KICAgID4gPiArCWVsc2UNCiAgICA+ID4gKwkJbGVuICs9IG5jYS0+cGF5bG9hZDsNCiAgICA+
ID4gKw0KICAgID4gPiArCWNtZCA9IHNrYl9wdXRfemVybyhza2IsIGxlbik7DQogICAgPiA+ICsJ
Y21kLT5tZnJfaWQgPSBuY2EtPmR3b3Jkc1swXTsNCiAgICA+ID4gKwltZW1jcHkoY21kLT5kYXRh
LCAmbmNhLT5kd29yZHNbMV0sIG5jYS0+cGF5bG9hZCAtIDQpOw0KICAgIA0KICAgID5OZXRsaW5r
IHJlcXVlc3QgaXMgdXNpbmcgdGhlIG5ldyBuY2EtPmRhdGEgcG9pbnRlciB0byBwYXNzIHRoZSBk
YXRhIGFzIHRoZSByZXF1ZXN0IHBheWxvYWQNCiAgICA+aXMgbm90IHRoZSBzYW1lIHNpemUgYW5k
IHNvbWUgY29tbWFuZCBwYXlsb2FkIGlzIGJpZ2dlciB0aGFuIDE2IGJ5dGVzLg0KICAgID5XaWxs
IHlvdSBjb25zaWRlciB0byB1c2UgdGhlIHNhbWUgZGF0YSBwb2ludGVyPyBTbywgd2UgZG9uJ3Qg
bmVlZCB0byBoYXZlIGEgY2hlY2tpbmcgaGVyZS4NCiAgICA+SWYgdGhlIGNvbW1hbmQgaXMgdXNl
ZCBsZXNzIHRoYW4gMTYgYnl0ZXMsIHdlIGNhbiBzaW1wbHkgYXNzaWduZWQgJm5jYS0+Ynl0ZXNb
MF0gdG8gaXQuDQogICAgVG8ga2VlcCBvcmlnaW5hbCBzdHJ1Y3R1cmUsIHdlIGNhbiBjaGFuZ2Ug
MTYgYnl0ZXMgdG8gTUFYX0RBVEFfTEVOLiBPciBJIGRvbid0IHNlZSBhbnkgaXNzdWUgaW4gDQog
ICAgQ29weWluZyBkYXRhIGZyb20gZGF0YSBwb2ludGVyIGZyb20gbmNhIGJ1dCB1c2VyIG5lZWRz
IHRvIGJlIGF3YXJlIGlmIGl0IGlzIGxlc3MgdGhhbiAxNiBieXRlcyB0aGVuIA0KICAgIHVzZSBi
eXRlcyBvciB1c2UgZGF0YSBwb2ludGVyLiBUbyBrZWVwIGl0IHNpbXBsZSwgd2Ugc2hvdWxkIHNp
bXBseSBkZWZpbmUgTUFYX0xFTi4NCiAgICANCiAgICA+ID4gZGlmZiAtLWdpdCBhL25ldC9uY3Np
L25jc2ktcGt0LmggYi9uZXQvbmNzaS9uY3NpLXBrdC5oDQogICAgPiA+IGluZGV4IDkxYjRiNjY0
MzhkZi4uMWYzMzgzODY4MTBkIDEwMDY0NA0KICAgID4gPiAtLS0gYS9uZXQvbmNzaS9uY3NpLXBr
dC5oDQogICAgPiA+ICsrKyBiL25ldC9uY3NpL25jc2ktcGt0LmgNCiAgICA+ID4gQEAgLTE1MSw2
ICsxNTEsMjIgQEAgc3RydWN0IG5jc2lfY21kX3NuZmNfcGt0IHsNCiAgICA+ID4gIAl1bnNpZ25l
ZCBjaGFyICAgICAgICAgICBwYWRbMjJdOw0KICAgID4gPiAgfTsNCiAgICA+ID4gIA0KICAgID4g
PiArLyogT0VNIFJlcXVlc3QgQ29tbWFuZCBhcyBwZXIgTkNTSSBTcGVjaWZpY2F0aW9uICovDQog
ICAgPiA+ICtzdHJ1Y3QgbmNzaV9jbWRfb2VtX3BrdCB7DQogICAgPiA+ICsJc3RydWN0IG5jc2lf
Y21kX3BrdF9oZHIgY21kOyAgICAgICAgIC8qIENvbW1hbmQgaGVhZGVyICAgICovDQogICAgPiA+
ICsJX19iZTMyICAgICAgICAgICAgICAgICAgbWZyX2lkOyAgICAgIC8qIE1hbnVmYWN0dXJlIElE
ICAgICovDQogICAgPiA+ICsJdW5zaWduZWQgY2hhciAgICAgICAgICAgZGF0YVs2NF07ICAgIC8q
IE9FTSBQYXlsb2FkIERhdGEgICovDQogICAgPiA+ICsJX19iZTMyICAgICAgICAgICAgICAgICAg
Y2hlY2tzdW07ICAgIC8qIENoZWNrc3VtICAgICAgICAgICovDQogICAgPiA+ICt9Ow0KICAgID4g
PiArDQogICAgPiA+ICsvKiBPRU0gUmVzcG9uc2UgUGFja2V0IGFzIHBlciBOQ1NJIFNwZWNpZmlj
YXRpb24gKi8NCiAgICA+ID4gK3N0cnVjdCBuY3NpX3JzcF9vZW1fcGt0IHsNCiAgICA+ID4gKwlz
dHJ1Y3QgbmNzaV9yc3BfcGt0X2hkciByc3A7ICAgICAgICAgLyogQ29tbWFuZCBoZWFkZXIgICAg
Ki8NCiAgICA+ID4gKwlfX2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFu
dWZhY3R1cmUgSUQgICAgKi8NCiAgICA+ID4gKwl1bnNpZ25lZCBjaGFyICAgICAgICAgICBkYXRh
WzY0XTsgICAgLyogUGF5bG9hZCBkYXRhICAgICAgKi8NCiAgICA+ID4gKwlfX2JlMzIgICAgICAg
ICAgICAgICAgICBjaGVja3N1bTsgICAgLyogQ2hlY2tzdW0gICAgICAgICAgKi8NCiAgICA+ID4g
K307DQogICAgPiA+ICsNCiAgICANCiAgICA+T0VNIGNvbW1hbmQgZG9lc24ndCBub3QgaGF2ZSB0
aGUgZml4ZWQgcmVzcG9uc2UgZGF0YSBzaXplIHRvby4NCiAgICA+U2hvdWxkIHdlIHVzZSBwb2lu
dGVyIGluc3RlYWQ/DQoNCiAgICBIZXJlIGFsc28gd2UgY2FuIGRlZmluZSBNQVhfREFUQV9MRU4g
YmVjYXVzZSBkYXRhIHBvaW50ZXIgd29uJ3QgbWFwIHRvIHNrYiBkaXJlY3RseS4NCiAgICANCg0K
