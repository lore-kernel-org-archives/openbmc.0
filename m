Return-Path: <prvs=3826bf20df=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3826bf20df=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="ly/uyJET"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="FJrQp5gt"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42YPm65CXbzF26K
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 14:57:41 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9F3uZlC012560; Sun, 14 Oct 2018 20:57:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=VQ3FaAZ2DluPXTJTNauFX3z8k5sL7YjckU5aajY6pVI=;
 b=ly/uyJETyBzPVTaz74fhmYudxynf6lk0ax66ES6Xv0PRzYPIc4vcndSVdt9WiYgMrQEj
 QcBE8IMxmvvUX+pN5PSFT2mnh/0fCOq8p2F5LqGnm6SEe2PkJurptuPnB+d702cdWj3J
 3L1/9W1yeq322lDLoiQOO29is2WOmqrdi/w= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2n4e77hdfj-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Sun, 14 Oct 2018 20:57:35 -0700
Received: from frc-hub01.TheFacebook.com (2620:10d:c021:18::171) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Sun, 14 Oct 2018 20:57:06 -0700
Received: from FRC-CHUB05.TheFacebook.com (2620:10d:c021:18::24) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Sun, 14 Oct 2018 20:57:06 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.25) with Microsoft SMTP
 Server (TLS) id 14.3.361.1; Sun, 14 Oct 2018 23:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQ3FaAZ2DluPXTJTNauFX3z8k5sL7YjckU5aajY6pVI=;
 b=FJrQp5gtbwHm5scfbeXVdkYrORtouuoev9n5RaGRfYtBIHofs0VmADRsRJIkmcwuflaT7KCs1YD3Av00ZSvQoKGdhHMtqaARtv9FinX3LwnxBY5ogQKrnNOh06n6sy+yLLsXf4m6HtA2hhFAOUMx+HMSLQD3mQu7/T+/LobWHwI=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1712.namprd15.prod.outlook.com (10.174.254.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.23; Mon, 15 Oct 2018 03:57:05 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ccb:6fd9:cf17:bfcd]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::ccb:6fd9:cf17:bfcd%11]) with mapi id 15.20.1228.020; Mon, 15 Oct 2018
 03:57:04 +0000
From: Tao Ren <taoren@fb.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH linux dev-4.18] clocksource/drivers/fttmr010: Fix
 set_next_event handler
Thread-Topic: [PATCH linux dev-4.18] clocksource/drivers/fttmr010: Fix
 set_next_event handler
Thread-Index: AQHUZDnGiRO3ttuo1kKebS2Qs0xkQ6UfOHUA
Date: Mon, 15 Oct 2018 03:57:04 +0000
Message-ID: <CCE39525-03B1-40DF-9083-6E5501DC2DF0@fb.com>
References: <20181015034710.3090400-1-taoren@fb.com>
In-Reply-To: <20181015034710.3090400-1-taoren@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.0.180812
x-originating-ip: [2620:10d:c090:180::1:d081]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1712;
 20:CbWh1FbE0whK8wknFu3/cLeJdXtMANswF/G7+SkZo6VJDVSyvFTsQjYLCNdmhiDl0lvuOIliQNPbpoFQ4h0Ab9SSrNGFi8lXx5pJg3snpRzu1BbWQyfr1gStCNdmczXPS2PniizYW6UGYVoAnaFEAn18uAxrf2eeC5IcbccNwvg=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 8ed40eeb-08f6-4283-f5de-08d632524533
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1712; 
x-ms-traffictypediagnostic: MWHPR15MB1712:
x-microsoft-antispam-prvs: <MWHPR15MB171255987FE59A38141050D2B2FD0@MWHPR15MB1712.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(81227570615382)(67672495146484)(85827821059158); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231355)(11241501184)(944501410)(52105095)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051);
 SRVR:MWHPR15MB1712; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1712; 
x-forefront-prvs: 0826B2F01B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(446003)(46003)(229853002)(36756003)(97736004)(53936002)(14454004)(6512007)(102836004)(81156014)(6486002)(8676002)(33656002)(478600001)(106356001)(2616005)(11346002)(486006)(6246003)(186003)(81166006)(476003)(105586002)(7736002)(316002)(305945005)(2906002)(8936002)(82746002)(6436002)(83716004)(68736007)(71190400001)(71200400001)(25786009)(5250100002)(2501003)(58126008)(53546011)(6116002)(110136005)(2900100001)(76176011)(14444005)(5660300001)(4326008)(99286004)(256004)(86362001)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1712;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: ZkjEojJMN6OLeplTxJpDzXGNlWLE9SJgEAzWPf5SeH1ettdqNqj5ZeykA0xNroJWCRoV+Atg7L5QgIo0Y/OlTYQWJqeBVHSHDjiF3U1k6jUobNpOmcWDvQ/bAPO4MhxFjmonzlJOLx2QP6IcEfDqoivLLAvKPixYY5QcK1c1p5oaeg27d7Nt8YDeuf0Vjto7xFC4gnFxfPj8uoEm89lyeoEq0HDbUHXFjQNPOrl1v7ptIlAcW6vlpDqNaXb38YY16yCluzBgsDbLrtDXyMAgTiwr9CCpi9Fg4HDP18z6pyGPrZ45Uxyq6CKrxT0WZGHnEAoo96Ox7X7tXTCLcxgnWTXerIF7q8TJIOEaVzZSdz0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABE36146B5B2A04EAA239754A08F6EE4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed40eeb-08f6-4283-f5de-08d632524533
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2018 03:57:04.7062 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1712
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-15_03:, , signatures=0
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
X-List-Received-Date: Mon, 15 Oct 2018 03:57:43 -0000

T24gMTAvMTQvMTgsIDg6NDcgUE0sICJUYW8gUmVuIiA8dGFvcmVuQGZiLmNvbT4gd3JvdGU6DQoN
Cj4gQ3VycmVudGx5LCB0aGUgYXNwZWVkIE1BVENIMSByZWdpc3RlciBpcyB1cGRhdGVkIHRvIDxj
dXJyZW50X2NvdW50IC0NCj4gY3ljbGVzPiBpbiBzZXRfbmV4dF9ldmVudCBoYW5kbGVyLCB3aXRo
IHRoZSBhc3N1bXB0aW9uIHRoYXQgQ09VTlQNCj4gcmVnaXN0ZXIgdmFsdWUgaXMgcHJlc2VydmVk
IHdoZW4gdGhlIHRpbWVyIGlzIGRpc2FibGVkIGFuZCBpdCBjb250aW51ZXMNCj4gZGVjcmVtZW50
aW5nIGFmdGVyIHRoZSB0aW1lciBpcyBlbmFibGVkLiBCdXQgdGhlIGFzc3VtcHRpb24gaXMgd3Jv
bmc6DQo+IFJFTE9BRCByZWdpc3RlciBpcyBsb2FkZWQgaW50byBDT1VOVCByZWdpc3RlciB3aGVu
IHRoZSBhc3BlZWQgdGltZXIgaXMNCj4gZW5hYmxlZCwgd2hpY2ggbWVhbnMgdGhlIG5leHQgZXZl
bnQgbWF5IGJlIGRlbGF5ZWQgYmVjYXVzZSB0aW1lcg0KPiBpbnRlcnJ1cHQgd29uJ3QgYmUgZ2Vu
ZXJhdGVkIHVudGlsIDwweEZGRkZGRkZGIC0gY3VycmVudF9jb3VudCArDQo+IGN5Y2xlcz4uDQo+
IA0KPiBUaGUgcHJvYmxlbSBjYW4gYmUgZml4ZWQgYnkgdXBkYXRpbmcgUkVMT0FEIHJlZ2lzdGVy
IHRvIDxjeWNsZXM+LCBhbmQNCj4gQ09VTlQgcmVnaXN0ZXIgd2lsbCBiZSByZS1sb2FkZWQgd2hl
biB0aGUgdGltZXIgaXMgZW5hYmxlZCBhbmQgaW50ZXJydXB0DQo+IGlzIGdlbmVyYXRlZCB3aGVu
IENPVU5UIHJlZ2lzdGVyIG92ZXJmbG93cy4NCj4NCj4gVGhlIHRlc3QgcmVzdWx0IG9uIEZhY2Vi
b29rIEJhY2twYWNrLUNNTSBCTUMgaGFyZHdhcmUgKEFTVDI1MDApIHNob3dzDQo+IHRoZSBpc3N1
ZSBpcyBmaXhlZDogd2l0aG91dCB0aGUgcGF0Y2gsIHVzbGVlcCgxMDApIHN1c3BlbmRzIHRoZSBw
cm9jZXNzDQo+IGZvciBzZXZlcmFsIG1pbGxpc2Vjb25kcyAoYW5kIHNvbWV0aW1lcyBldmVuIG92
ZXIgNDAgbWlsbGlzZWNvbmRzKTsNCj4gYWZ0ZXIgYXBwbHlpbmcgdGhlIGZpeCwgdXNsZWVwKDEw
MCkgdGFrZXMgYXZlcmFnZWx5IDI0MCBtaWNyb3NlY29uZHMgdG8NCj4gcmV0dXJuIHVuZGVyIHRo
ZSBzYW1lIHdvcmtsb2FkIGxldmVsLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFvIFJlbiA8dGFv
cmVuQGZiLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4NCj4gVGVzdGVkLWJ5OiBMZWkgWVUgPG1pbmUyNjAzMDlAZ21haWwuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9y
Zz4NCiANCkhpIEpvZWwgLyBBbmRyZXcsDQoNClRoZSBwYXRjaCBpcyBpbmNsdWRlZCBpbiB2NC4x
OS1yYzYgKGNvbW1pdCA0NDUxZDNmNTlmMmEpLCBzbyB5b3UgY291bGQgZWl0aGVyIGFwcGx5IHRo
ZSBwYXRjaCB0byBkZXYtNC4xOCBub3csIG9yIGl0IGNhbiBhbHNvIGJlIGluY2x1ZGVkIHdoZW4g
a2VybmVsIGlzIHVwZ3JhZGVkIHRvIDQuMTkuDQoNCg0KVGhhbmtzLA0KDQpUYW8gUmVuDQoNCg==
