Return-Path: <prvs=89841f00aa=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=89841f00aa=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="dkWTc2XT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="WDsR6Gfm"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44R0PH4m19zDqPg
 for <openbmc@lists.ozlabs.org>; Sat, 23 Mar 2019 10:34:41 +1100 (AEDT)
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2MNU7CH019686; Fri, 22 Mar 2019 16:33:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=facebook;
 bh=IBNwk0wxRelO7seSJIc2Ci3lWZjJLDkQcAG/ISlabRk=;
 b=dkWTc2XTVvmDL2dli1lsBEPVa0wt6D9Z5eIq1RRNXV7+psYM8Z+SDqRg0ITB6mVlv5vU
 pc8TR0BefMCk1Zgr10rNFqw2naRwvwkXrfCSs59bmRqgPl0EmSCYz0zeXHVM7bjud2xm
 Bok/6LiAGDYWYEVcwxnlHgNxcf1ex1HmwDA= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2rd6dm8pju-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 22 Mar 2019 16:33:38 -0700
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub01.TheFacebook.com (2620:10d:c021:18::171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Fri, 22 Mar 2019 16:33:37 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Fri, 22 Mar 2019 16:33:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IBNwk0wxRelO7seSJIc2Ci3lWZjJLDkQcAG/ISlabRk=;
 b=WDsR6GfmwjcNU7rChETsPKAvuokWuVLP54UMVp0VVUE0beyI1hokCbc/LGqExOQcf+llwzYHv8d3O6C4ECWgfAPzIgmK5bmdxIjfIrZ9jxUdPHfXdE9XMQuvhboX1coZI5x5G9VUV3lPQ1IASJAM80AdEEaZIwU+nVlHWa3ohf0=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.177.11) by
 CY4PR15MB1816.namprd15.prod.outlook.com (10.172.79.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.18; Fri, 22 Mar 2019 23:33:36 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::adbc:85e5:68d3:ac2d%3]) with mapi id 15.20.1730.017; Fri, 22 Mar 2019
 23:33:36 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Potential Spoof] Re: [Potential Spoof] Re: IPMID crashing
Thread-Topic: [Potential Spoof] Re: [Potential Spoof] Re: IPMID crashing
Thread-Index: AQHU4QerFIzAVCR3GkCiCqolF1ok1g==
Date: Fri, 22 Mar 2019 23:33:35 +0000
Message-ID: <54AAA053-214D-4AF8-92D9-86EF251E99ED@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::97a5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2884113a-2fac-43ee-6df1-08d6af1ece1b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1816; 
x-ms-traffictypediagnostic: CY4PR15MB1816:
x-microsoft-antispam-prvs: <CY4PR15MB1816310AEFF0F161267CFCEADD430@CY4PR15MB1816.namprd15.prod.outlook.com>
x-forefront-prvs: 09840A4839
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(376002)(346002)(136003)(199004)(189003)(97736004)(14454004)(305945005)(4326008)(25786009)(7736002)(6246003)(478600001)(83716004)(71190400001)(71200400001)(86362001)(36756003)(6116002)(53936002)(106356001)(5660300002)(6512007)(82746002)(33656002)(8676002)(68736007)(2906002)(81156014)(8936002)(105586002)(81166006)(6506007)(316002)(6436002)(46003)(6486002)(229853002)(53546011)(186003)(486006)(102836004)(476003)(6916009)(256004)(2616005)(99286004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1816;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6rt+y2+ewi0L13HXCpr4gvAFgNP0NZILWgZ9f2pA0o4Zh5V8DQ8O/xS/lPajiW2dcMNa+us4ce9OOO4oC2CDi/Nt6ynQEiJlunkJbGhIATVxKDW82K+0571KN/clJSP7KdGdyv6J7OdqOOA48zEwaO3DVoqfRFzWEjAtaXfHmBsMrkNzusyYSp51LZbkPplEKsBH8Pt49wSGiLcXcayYtCijl8Ze/kI6KQlFooFSvndItNVzTGxsXwEh5LCsVl4+zJTqeAtTP5Fxm/pPISalIpPa3n8IcLQhKzzoHBeIEGCHLEjLFqwL0tW9hrqVjZmRYSlJE+hyYBB+YzNRi1xbaSgyvv8y8a7USa6B+/HOqt6PNNxz2mHum2ZR+UVJB0/XyfL9V2+t+JLs/ashUWarZVgp8zvcWLYjm9GD9vvc+xk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D041E3045A490149BACD9D4D0B6D63F2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2884113a-2fac-43ee-6df1-08d6af1ece1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2019 23:33:35.9596 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1816
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-22_13:, , signatures=0
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
X-List-Received-Date: Fri, 22 Mar 2019 23:34:44 -0000

SSBkZWJ1Z2dlZCB0aHJvdWdoIHRoaXMgYW5kIHN1c3BlY3RpbmcgYXMgaXBtYiBjcmFzaGluZyB0
aGlzLiBJbiBvbGQgaW1wbGVtZW50YXRpb24sIE1BWF9JUE1JX0JVRkZFUiB3YXMgZGVmaW5lZCBh
cyA2NCB3aGljaCBJIGhhdmUgbWFkZSBjaGFuZ2UgdG8gMjU2IGluIG91ciBwYXRjaCB0byBjYXRl
ciBvdXIgaXBtYiByZXNwb25zZSB3aGljaCBpcyBtb3JlIHRoYW4gNjQgYnl0ZXMuIEJ1dCBuZXcg
aXBtaWQgaW1wbGVtZW50YXRpb24gZG9lc24ndCB1c2UgdGhpcyBwYXJhbWV0ZXIgc28gSSBhbSBu
b3Qgc3VyZSBob3cgc2l6ZSBpcyBiZWluZyBkZWZpbmVkLg0KDQpWZXJub24sIENhbiB5b3UgcGxl
YXNlIGxldCB1cyBrbm93IGhvdyB0aGUgc2l6ZSBvZiByZXNwb25zZSBpcyBkZWZpbmVkIGFzIEkg
ZG91YnQgdGhhdCBvdXIgcmVzcG9uc2Ugc2l6ZSBpcyBtb3JlIHRoYW4gNjQgYnl0ZXMgd2hpY2gg
aXMgY2F1c2luZyBpc3N1ZXMuDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAzLzIxLzE5LCAz
OjM0IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgVmlqYXkgS2hlbWthIiA8b3BlbmJtYy1ib3Vu
Y2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFsZiBvZiB2aWph
eWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KDQogICAgVmVybm9uLA0KICAgIEl0IGlzIGdldHRpbmcg
Y29ycnVwdGVkIHdoaWxlIHVzaW5nIGxpYmlwbWlkLiBJIHNlZSBub3cgZm9sbG93aW5nIG1lc3Nh
Z2VzDQogICAgDQogICAgZG91YmxlIGZyZWUgb3IgY29ycnVwdGlvbiAoIXByZXYpDQogICAgQWJv
cnRlZA0KICAgIA0KICAgIA0KICAgIFJlZ2FyZHMNCiAgICAtVmlqYXkNCiAgICANCiAgICBPbiAz
LzIxLzE5LCAyOjM0IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgVmlqYXkgS2hlbWthIiA8b3Bl
bmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFs
ZiBvZiB2aWpheWtoZW1rYUBmYi5jb20+IHdyb3RlOg0KICAgIA0KICAgICAgICBJIHNlYXJjaGVk
IGZvciB0aGlzIG91dHB1dCBzdHJpbmcgYW5kIGZvdW5kIGluIGxpYmMtMi4yOC5zbyBhbmQgbGli
Yy5hLiBJIGhhdmUgbm8gaWRlYSwgd2hhdCBpcyBpdCBkb2luZy4gSSBoYXZlIGV4ZWN1dGVkIGl0
IG1hbnVhbGx5IGZyb20gY29tbWFuZCBsaW5lIGFuZCBjYW4gc2VlIGFsbCBvZW0gZnVuY3Rpb25z
IGl0IHJlZ2lzdGVycy4NCiAgICAgICAgDQogICAgICAgIE9uIDMvMjEvMTksIDEyOjQ3IFBNLCAi
VmVybm9uIE1hdWVyeSIgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPiB3cm90ZToNCiAg
ICAgICAgDQogICAgICAgICAgICBPbiAyMS1NYXItMjAxOSAwNzozOCBQTSwgVmlqYXkgS2hlbWth
IHdyb3RlOg0KICAgICAgICAgICAgPkFueW9uZSBpcyBzZWVpbmcgaXBtaWQgY3Jhc2hpbmcuIEkg
aGF2ZSBjaGVja2Vkb3V0IG9wZW5ibWMgdG9kYXkgYW5kIHNlZWluZyBpcG1pZCBpcyBjcmFzaGlu
ZyB3aXRoIGZvbGxvd2luZyBtZXNzYWdlDQogICAgICAgICAgICA+DQogICAgICAgICAgICA+cmVh
bGxvYygpOiBpbnZhbGlkIG5leHQgc2l6ZQ0KICAgICAgICAgICAgDQogICAgICAgICAgICBXaGF0
IHdhcyBpdCBkb2luZz8gV2hhdCBJUE1JIGNvbW1hbmQgd2FzIHJ1bm5pbmcgd2hlbiBpdCBjcmFz
aGVkPyBXaGF0IA0KICAgICAgICAgICAgcHJvdmlkZXIgbGlicmFyaWVzIGRvIHlvdSBoYXZlIGl0
IGxvYWRpbmc/DQogICAgICAgICAgICANCiAgICAgICAgICAgIC0tVmVybm9uDQogICAgICAgICAg
ICANCiAgICAgICAgDQogICAgICAgIA0KICAgIA0KICAgIA0KDQo=
