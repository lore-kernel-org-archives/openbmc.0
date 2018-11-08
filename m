Return-Path: <prvs=48502dcd3d=taoren@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=48502dcd3d=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="C3mFos4P"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="B43vpmcb"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r6kS6z0hzF3L8;
 Thu,  8 Nov 2018 13:32:15 +1100 (AEDT)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wA82RbY7028130; Wed, 7 Nov 2018 18:31:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=NG93t91ruzj2Qpas9CeEL2km9VZqsyBrkfutZOViAsc=;
 b=C3mFos4PMjClClsRWe18Yva7AuSkELBNP8Y2YEq2AAGH4+Ap4kPBNozuX7d2h0XL4kJZ
 NT2cL2DutufVjZQ6LksQ/mnTPIUH+Htot9mxsftmZAPETncxitP/5gmRgU5ooJB5MTXT
 E2Q6g44CXyVCV9rbfDqn+R5Dlzq8hkCGeRk= 
Received: from mail.thefacebook.com ([199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2nmbpb040a-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 07 Nov 2018 18:31:36 -0800
Received: from prn-hub04.TheFacebook.com (2620:10d:c081:35::128) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Wed, 7 Nov 2018 18:31:36 -0800
Received: from PRN-CHUB02.TheFacebook.com (2620:10d:c081:35::11) by
 prn-hub04.TheFacebook.com (2620:10d:c081:35::128) with Microsoft SMTP Server
 (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1531.3
 via Frontend Transport; Wed, 7 Nov 2018 18:31:36 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.12) with Microsoft SMTP Server (TLS)
 id 14.3.361.1; Wed, 7 Nov 2018 18:31:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NG93t91ruzj2Qpas9CeEL2km9VZqsyBrkfutZOViAsc=;
 b=B43vpmcbUdQHRgn93YtNnqrkTODmL6xq+3ItZBIukNUGYBUjkM3+dpXQ3ouo+Bd31kfWwW4PtarDxx9GGyRVVUtEmQNoYwzSvFWiA3TbqJs6/zlMTuXAAkPnrQfsdmFZXmGZ06B2AwkPaUgdCbmRUqDZrfnuVBYIZF4tZzk2TZg=
Received: from MWHPR15MB1216.namprd15.prod.outlook.com (10.175.2.146) by
 MWHPR15MB1744.namprd15.prod.outlook.com (10.174.255.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1294.31; Thu, 8 Nov 2018 02:31:34 +0000
Received: from MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6]) by MWHPR15MB1216.namprd15.prod.outlook.com
 ([fe80::709f:e3cd:1db:74d6%2]) with mapi id 15.20.1294.034; Thu, 8 Nov 2018
 02:31:34 +0000
From: Tao Ren <taoren@fb.com>
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
Thread-Topic: [PATCH v2 1/2] ARM: dts: Add Facebook BMC flash layout
Thread-Index: AQHUdYk0ADCaMRjCYU+xz32xcxlND6VFAXgAgAAEiICAABiCAIAADLsA
Date: Thu, 8 Nov 2018 02:31:32 +0000
Message-ID: <62de5dcd-e8a2-9572-3b0b-fc3ca9d1875c@fb.com>
References: <20181106042829.2771226-1-taoren@fb.com>
 <1541635320.1462459.1569430616.0F5E4C4D@webmail.messagingengine.com>
 <c5e56fc4-397f-a38b-6378-99eecce1180b@fb.com>
 <1541641556.1495362.1569509568.7BE039CA@webmail.messagingengine.com>
In-Reply-To: <1541641556.1495362.1569509568.7BE039CA@webmail.messagingengine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:301:60::22) To MWHPR15MB1216.namprd15.prod.outlook.com
 (2603:10b6:320:23::18)
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::6:85f]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR15MB1744;
 20:I1wdN/SsvyyE5Qpj5VAouxKtrHojRXmBu/8q0hr+6t54jljovzJgUNgMiGzkBC7zg4n85sJlTSRRqnBDgP/w6cS0sQ8kGMA63V1nWT/qtn7yVheZh74F2S8ubgWW4Byxe0DHtJ4I46EJw2cNHQ73UpOVZl3gS3I0pJzFbn6shm4=
x-ms-office365-filtering-correlation-id: 6f59f3e4-af8d-4280-aadf-08d645224bb8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR15MB1744; 
x-ms-traffictypediagnostic: MWHPR15MB1744:
x-microsoft-antispam-prvs: <MWHPR15MB1744A0F930FE1032E8EFE410B2C50@MWHPR15MB1744.namprd15.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(81227570615382);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
 RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3231382)(11241501184)(944501410)(52105095)(3002001)(148016)(149066)(150057)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
 SRVR:MWHPR15MB1744; BCL:0; PCL:0; RULEID:; SRVR:MWHPR15MB1744; 
x-forefront-prvs: 0850800A29
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(39860400002)(346002)(376002)(366004)(136003)(47680400002)(52314003)(189003)(199004)(51914003)(2906002)(110136005)(58126008)(2501003)(65806001)(316002)(6436002)(25786009)(93886005)(65956001)(478600001)(11346002)(186003)(76176011)(476003)(102836004)(53546011)(2201001)(386003)(6506007)(86362001)(446003)(52116002)(486006)(46003)(256004)(99286004)(14444005)(31696002)(229853002)(8676002)(106356001)(345774005)(8936002)(14454004)(105586002)(6116002)(31686004)(81156014)(64126003)(5660300001)(68736007)(71190400001)(71200400001)(2616005)(305945005)(81166006)(97736004)(6486002)(65826007)(7736002)(6512007)(6246003)(2900100001)(53936002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1744;
 H:MWHPR15MB1216.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 3ZUZaCpc4NVl/0A4YcKi3n5JvrWKc2/F0PhtmAtpOI/bqOQMs+hPhR2jV7/T7ZxSwo3H1KbpHwBzLh25obJFsEyh84na+yDt7b9W5HeJD/nKtgg1NexvbjfhHE2hEyq+zp07X0yyOsUtOUiHSGv95uqi5Xs0AQ3oR/+7NtozN2nluVuPr9xuojnt1ZFjn1Lx5OoN0Gd/xRWNMrliZSwPm4hn2LH9taTEXd7d1vvp2g05eZDXqjeC+36/4jLBE+c7WrkpPIXqQsSG9Gx70t/JfwIYmISVl3eyI8P51EmvDotHt5rXrG+ytDixsF48Iq5sYYTWPiSP3urvYKre230snThs/QWY21jdgIZkQEJv3eQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <06E8ED74DF14784E964F85FBE040AACC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f59f3e4-af8d-4280-aadf-08d645224bb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2018 02:31:32.7352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1744
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-08_01:, , signatures=0
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
X-List-Received-Date: Thu, 08 Nov 2018 02:32:18 -0000

T24gMTEvNy8xOCA1OjQ1IFBNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToNCg0KPj4+IElzIHRoaXMg
bmVjZXNzYXJ5PyBJc24ndCB0aGUgc2FtZSB0aGluZyBhY2hpZXZlZCB3aXRoIHRoZSAvZGV2L210
ZDAgZGV2aWNlPw0KPj4NCj4+IEhpIEFuZHJldywNCj4+DQo+PiBUaGFuayB5b3UgZm9yIHRoZSBy
ZXZpZXchIFRoZSBuZXcgbGF5b3V0IGZpbGUgaXMgbmVlZGVkIG1haW5seSBiZWNhdXNlIA0KPj4g
b2YgImRhdGEwIiBwYXJ0aXRpb246IHNldmVyYWwgZmFjZWJvb2sgcGxhdGZvcm1zIHVzZSB0aGUg
cGFydGl0aW9uIGFzIA0KPj4gInBlcnNpc3RlbnQiIHN0b3JhZ2UuDQo+Pg0KPj4gQXMgZm9yICJm
bGFzaDAiLCB0ZWNobmljYWxseSBpdCdzIG5vdCBuZWVkZWQgKGFzIHlvdSBwb2ludGVkIG91dCwg
L2Rldi8NCj4+IG10ZDAgY292ZXJzIHRoZSBlbnRpcmUgZmxhc2ggaWYgbWFzdGVyX3BhcnRpdGlv
biBpcyBlbmFibGVkKS4gSXQncyBzdGlsbCANCj4+IGhlcmUgdG8gYXZvaWQgYnJlYWtpbmcgc29t
ZSBsZWdhY3kgYXBwbGljYXRpb25zLg0KPiANCj4gVGhpcyBpcyB3aGF0IEkgZXhwZWN0ZWQuIEkg
dGhpbmsgaXQgbWlnaHQgYmUgd29ydGggYWRkaW5nIGEgY29tbWVudCwgZ2l2ZW4NCj4geW91IGFy
ZSByZXNwaW5uaW5nIHRoZSBzZXJpZXMgdG8gYWRkcmVzcyBteSBjb21tZW50cyBvbiB0aGUgYm9h
cmQNCj4gZGV2aWNldHJlZSBwYXRjaC4NCj4gDQo+IEFueXdheSwgdGhhbmtzIGZvciB0aGUgY2xh
cmlmaWNhdGlvbi4NCj4gDQo+IEFuZHJldw0KDQpTdXJlIEFuZHJldy4gSSB3aWxsIGFkZCBzb21l
IGNvbW1lbnRzIGFuZCBzZW5kIG91dCAyIHVwZGF0ZWQgcGF0Y2hlcyB0b2dldGhlciAobW9zdCBs
aWtlbHkgc29tZXRpbWUgdG9tb3Jyb3cpLg0KDQpUaGFua3MsDQpUYW8gUmVuDQo=
