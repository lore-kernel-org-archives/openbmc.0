Return-Path: <prvs=7935d51854=vijaykhemka@fb.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=7935d51854=vijaykhemka@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Z+iNXRRs"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="E9qq6nWI"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43rlNw5tQ3zDqQT
 for <openbmc@lists.ozlabs.org>; Sat,  2 Feb 2019 05:04:28 +1100 (AEDT)
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x11HxoZr025894; Fri, 1 Feb 2019 10:04:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=pfsPFyeEge3FYAjRQJkHQ51Suuj3JEilYmkI+x22vCU=;
 b=Z+iNXRRsZhWEhf5KiWTuFbF+ZkuSySLelY7lDdfcjrjVKB9vvKx8mMw7cgf9FNboO9GL
 oKd5Yj0bGsssQiaW06/fercyH2B3HFJNRr0MeTCqnOLjC4GFyzHYX2rwgtCtt9BfkifB
 ix2ikIhPGdYcMXVmCJQ0O4YxqKlf4CnL1sU= 
Received: from maileast.thefacebook.com ([199.201.65.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2qct3707u6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 01 Feb 2019 10:04:23 -0800
Received: from frc-hub05.TheFacebook.com (2620:10d:c021:18::175) by
 frc-hub06.TheFacebook.com (2620:10d:c021:18::176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1531.3; Fri, 1 Feb 2019 10:04:15 -0800
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.183.28)
 by o365-in.thefacebook.com (192.168.177.75) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1531.3
 via Frontend Transport; Fri, 1 Feb 2019 10:04:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector1-fb-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfsPFyeEge3FYAjRQJkHQ51Suuj3JEilYmkI+x22vCU=;
 b=E9qq6nWIDv70bQ+kfgjoDQf5G55OZyoPB1Q5hrYmea6+snkJJJEGUQOkdGYO7534+Wo15Xg+NJ/8y7xcVfh6BqcDvE38QlwkIyOBp1koTUnqQYsbBay4rfkL8eizPRidXmtijb9bPYhwqKhDuQ8vVfdQTyvRizNageLfeADdA0s=
Received: from CY4PR15MB1269.namprd15.prod.outlook.com (10.172.180.139) by
 CY4PR15MB1397.namprd15.prod.outlook.com (10.172.160.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.23; Fri, 1 Feb 2019 18:04:13 +0000
Received: from CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6]) by CY4PR15MB1269.namprd15.prod.outlook.com
 ([fe80::b9cb:6dd8:d8bf:45c6%2]) with mapi id 15.20.1580.017; Fri, 1 Feb 2019
 18:04:13 +0000
From: Vijay Khemka <vijaykhemka@fb.com>
To: Aaron Williams <awilliams@marvell.com>, Patrick Venture
 <venture@google.com>
CC: Emily Shaffer <emilyshaffer@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [EXT] Re: OpenBMC Sensors
Thread-Topic: [EXT] Re: OpenBMC Sensors
Thread-Index: AQHUs8VFpOBh8NPwE0qPvbtRqVyQ86W+JkaAgAn6fgCAAD04AIAAA+sAgAABRQCAAABFAIABKRDwgADmrYCAAFA9AA==
Date: Fri, 1 Feb 2019 18:04:13 +0000
Message-ID: <9D2AC2D4-287E-4449-B817-0A6295E55E78@fb.com>
References: <6065976.siBLTEBlHZ@flash>
 <CAJoAoZnV+u8kJKV7TkPxU_b1hdmJ3nbFyD6rVMSd9ohPSjDHig@mail.gmail.com>
 <CAO=notzSOb7VcYhByoyae63o3xFctpJpMCnKgaTn0dRKp+VckA@mail.gmail.com>
 <15407680.LHmlcfl6Tm@flash>
In-Reply-To: <15407680.LHmlcfl6Tm@flash>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::5:b1b4]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY4PR15MB1397;
 20:LdlhDQZW9gvCzuvIGS6LODfiJZ8s3ekpWsQo/jZowLyNWxzM6siTk1rat0qLhnX5xEEupLeImzYosbDHFSpWBZjvCXuXs1EVt0oaJILhEnb4v1qE2RY4HsBmlTvTxnjLN2fZCE3EuUifEFoszHNQTRZgdAsPtp9s3//QWK2sASM=
x-ms-office365-filtering-correlation-id: fecba8f0-e22a-4a38-c294-08d6886fac9a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:CY4PR15MB1397; 
x-ms-traffictypediagnostic: CY4PR15MB1397:
x-microsoft-antispam-prvs: <CY4PR15MB1397EC1192B9B0E3BB721F8BDD920@CY4PR15MB1397.namprd15.prod.outlook.com>
x-forefront-prvs: 09352FD734
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(396003)(39860400002)(376002)(346002)(189003)(199004)(6306002)(86362001)(316002)(186003)(11346002)(6246003)(446003)(256004)(478600001)(2906002)(14444005)(110136005)(966005)(54906003)(6436002)(2616005)(6512007)(229853002)(6486002)(68736007)(14454004)(33656002)(305945005)(93886005)(82746002)(6116002)(99286004)(53546011)(4326008)(106356001)(6506007)(25786009)(71190400001)(71200400001)(102836004)(8936002)(83716004)(8676002)(81156014)(76176011)(476003)(81166006)(486006)(105586002)(53936002)(36756003)(7736002)(46003)(97736004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR15MB1397;
 H:CY4PR15MB1269.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iZ3ifFO9J+/zBNVD5WvUeuGw+YRYGJbNXHv4tdlrR4pOcXBxLOLm6dRdQrSyee199yxta+rPAtId6eF8OZFjsJByrTuT2+Tz7UBZ7M8lnYBGJr416DbbG2K8JOXIeomASczpU/xS240athzNUUSpKKEdJ0e80u1pf0U66Zu2gkG40nWmTntEEAMM5q4PQ3qIVnABNd9kZgEPsJez0QJuU7Ye5ttV8Agx7a7r5z3CABvuEJbMPcS0NqUwUAgLG86c5js45G2/VOjP+nLS3UvNFHSfAWS1rn5t91/3c7FP1TCTNl0F2fGEsLs+8X+OZG0PWyPbDlU1FD0PiB60Br0TmE3VOgaHbfqDqt7EZqciyOQIcY/uiFMl0cnS7gxllo3Nrj9X+kYTXmaG3x3kVWxpzKazRYpQJ43sFZJssj7zP0Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93435B79D851A642BF5807274226CC3F@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fecba8f0-e22a-4a38-c294-08d6886fac9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2019 18:04:13.6593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1397
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-01_13:, , signatures=0
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
X-List-Received-Date: Fri, 01 Feb 2019 18:04:33 -0000

QXJvbiwNCllvdSBtYXkgYWxzbyB3YW50IHRvIGxvb2sgYXQgZGJ1cy1zZW5zb3JzIGFzIHdlbGwu
IFRoaXMgaXMgYW5vdGhlciBhcHByb2FjaCBmb3Igc2Vuc29ycyB0aHJvdWdoIGRidXMuIFlvdSBo
YXZlIHRvIGluY2x1ZGUgZW50aXR5IG1hbmFnZXIgZm9yIHRoaXMgYXBwcm9hY2guDQoNClJlZ2Fy
ZHMNCi1WaWpheQ0KDQrvu79PbiAxLzMxLzE5LCA5OjE4IFBNLCAib3BlbmJtYyBvbiBiZWhhbGYg
b2YgQWFyb24gV2lsbGlhbXMiIDxvcGVuYm1jLWJvdW5jZXMrdmlqYXlraGVta2E9ZmIuY29tQGxp
c3RzLm96bGFicy5vcmcgb24gYmVoYWxmIG9mIGF3aWxsaWFtc0BtYXJ2ZWxsLmNvbT4gd3JvdGU6
DQoNCiAgICBUaGFua3MsDQogICAgDQogICAgSSB0aGluayBJIGtub3cgd2hhdCBJIG5lZWQgdG8g
ZG8sIGFmdGVyIGxvb2tpbmcgYXQgdGhlIGNvbmZpZyBleGFtcGxlIGFuZCANCiAgICBvdGhlciB5
YW1sIGV4YW1wbGVzIEkndmUgZm91bmQuIE15IHByb2JsZW0gaXMgSSBoYXZlbid0IGJlZW4gYWJs
ZSB0byBmaW5kIGFueSANCiAgICBleGFtcGxlIHJlY2lwZXMgYW5kIHdoYXRub3QgdGhhdCB1c2Ug
dGhpcyAob3IgbWF5YmUgSSdtIGxvb2tpbmcgYXQgdGhlIHdyb25nIA0KICAgIHRoaW5ncykuIEkn
dmUgbG9va2VkIGF0IHRoZSB2YXJpb3VzIGltcGxlbWVudGF0aW9ucyBidXQgZG9uJ3Qgc2VlIGFu
eXRoaW5nIA0KICAgIHVzaW5nIHRoaXMuDQogICAgDQogICAgLUFhcm9uDQogICAgDQogICAgT24g
VGh1cnNkYXksIEphbnVhcnkgMzEsIDIwMTkgNzozMDowNCBBTSBQU1QgUGF0cmljayBWZW50dXJl
IHdyb3RlOg0KICAgID4gT24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgODo0OSBQTSBFbWlseSBTaGFm
ZmVyIDxlbWlseXNoYWZmZXJAZ29vZ2xlLmNvbT4gDQogICAgd3JvdGU6DQogICAgPiA+IEFhcm9u
LA0KICAgID4gPiANCiAgICA+ID4gSWYgaXQncyBjb21wbGFpbmluZyBhdCBidWlsZCB0aW1lIGl0
J3Mgd2hhdCBpdCBzYXlzIG9uIHRoZSBib3ggLSB5b3UNCiAgICA+ID4gcHJvYmFibHkgbmVlZCB0
byBpbmNsdWRlIHRoZSByZWNpcGUgd2hpY2ggYnVpbGRzDQogICAgPiA+IHBob3NwaG9yLWZhbnMt
c2Vuc29yLWludmVudG9yeS4NCiAgICA+ID4gDQogICAgPiA+IEVtaWx5DQogICAgPiA+IA0KICAg
ID4gPiBPbiBXZWQsIEphbiAzMCwgMjAxOSwgODoxNyBQTSBBYXJvbiBXaWxsaWFtcyA8YXdpbGxp
YW1zQG1hcnZlbGwuY29tPiANCiAgICB3cm90ZToNCiAgICA+ID4+IEhpIEVtaWx5LA0KICAgID4g
Pj4gDQogICAgPiA+PiBJJ20gc3RpbGwgbm90IHN1cmUgaG93IHRvIGdvIGFib3V0IHVzaW5nIHRo
aXMsIEknbSBzdGlsbCBmYWlybHkgbmV3IHRvDQogICAgPiA+PiBPcGVuQk1DLiBJdCdzIGNvbXBs
YWluZyBhYm91dCBub3RoaW5nIHByb3ZpZGluZw0KICAgID4gPj4gJ3ZpcnR1YWwvcGhvc3Bob3It
ZmFucy1zZW5zb3ItIGludmVudG9yeScuICBJIGluY2x1ZGVkDQogICAgPiA+PiBwaG9zcGhvci1w
aWQtY29udHJvbCBhcyBvbmUgb2Ygb3VyIGRlcGVuZGVuY2llcy4NCiAgICA+IFBlciBFbWlseSwg
eW91J2xsIG5lZWQgdG8gaW1wbGVtZW50IGEgcmVjaXBlIHRoYXQgZGVmaW5lcyB0aGUgUElEDQog
ICAgPiBpbnB1dHMuICBJdCBzb3VuZHMgbGlrZSB5b3UgaGF2ZSB0d28gUElEIGxvb3BzLiAgT25l
IGlzIHRoZQ0KICAgID4gdGVtcGVyYXR1cmUgc2Vuc29yLCBhbmQgdGhhdCBmZWVkcyB0aGUgc2V0
LXBvaW50IGZvciB0aGUgZmFucywgd2hpY2gNCiAgICA+IGFyZSBhIHNlY29uZCBQSUQgbG9vcC4g
IFRoZSBpZGVhIGJlaW5nLCB0aGUgdGVtcGVyYXR1cmUgcGlkIGxvb3ANCiAgICA+IGF0dGVtcHRz
IHRvIG1haW50YWluIHRoZSB0ZW1wZXJhdHVyZSB1bmRlciAob3Igb3Zlcikgc29tZSBzZXQtcG9p
bnQsDQogICAgPiBhbmQgaXQnbGwgaW4gdHVybiB0cnkgdG8gZ2V0IHRoZSBmYW5zIHRvIHNwZWVk
IHVwIHdoZW4gbmVjZXNzYXJ5Lg0KICAgID4gDQogICAgPiA+PiAtQWFyb24NCiAgICA+ID4+IA0K
ICAgID4gPj4gT24gV2VkbmVzZGF5LCBKYW51YXJ5IDMwLCAyMDE5IDE6NDg6MTAgUE0gUFNUIHlv
dSB3cm90ZToNCiAgICA+ID4+ID4gR3JlYXQsIGJlc3QgbHVjayBBYXJvbi4gVGhhbmtzIQ0KICAg
ID4gPj4gPiANCiAgICA+ID4+ID4gT24gV2VkLCBKYW4gMzAsIDIwMTksIDE6NDcgUE0gQWFyb24g
V2lsbGlhbXMgPGF3aWxsaWFtc0BtYXJ2ZWxsLmNvbT4gDQogICAgd3JvdGU6DQogICAgPiA+PiA+
ID4gSGkgRW1pbHksDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4gVGhhbmsgeW91LCBJIHdp
bGwgbG9vayBpbnRvIGl0LiBJIGRvbid0IHRoaW5rIGxvc2luZyB0aGUgc2Vuc29ycyB3aGVuDQog
ICAgPiA+PiA+ID4gd2UNCiAgICA+ID4+ID4gPiBjdXQNCiAgICA+ID4+ID4gPiBwb3dlciB0byB0
aGUgaG9zdCBDUFUgd2lsbCBiZSBtdWNoIG9mIGFuIGlzc3VlLiBJIHdhcyBqdXN0IG5vdGlmaWVk
DQogICAgPiA+PiA+ID4gb2YgYQ0KICAgID4gPj4gPiA+IGNoYW5nZSB0byBvdXIgQ1BMRCB0aGF0
IHdpbGwgYWxsb3cgdGhlIEJNQyB0byBrZWVwIHRoZSBzZW5zb3JzDQogICAgPiA+PiA+ID4gcG93
ZXJlZC4gQXQNCiAgICA+ID4+ID4gPiB0aGUNCiAgICA+ID4+ID4gPiBtb21lbnQsIGN1dHRpbmcg
cG93ZXIgc2h1dHMgb2YgdGhlIHBvd2VyIGZyb20gdGhlIEFUWCBwb3dlciBzdXBwbHkNCiAgICA+
ID4+ID4gPiBidXQgbm93DQogICAgPiANCiAgICA+IEFzIGZhciBhcyB0aGUgc2Vuc29ycyB3aGVu
IHRoZSB0cnkgaXMgcG93ZXJlZCBkb3duLCB0aGF0J3MgcHJldHR5DQogICAgPiBjb21tb24uICBU
aGUgaHdtb24gZHJpdmVyIG9uIHRoZSBCTUMgd2lsbCBqdXN0IGJlIHVuYWJsZSB0byByZWFkIHRo
ZQ0KICAgID4gdmFsdWVzLCBhbmQgeW91IGNhbiBkZWFsIHdpdGggdGhhdCBpbiBwaG9zcGhvci1o
d21vbiBhIGNvdXBsZSB3YXlzLg0KICAgID4gUGhvc3Bob3ItcGlkLWNvbnRyb2wgd2lsbCBnbyBp
bnRvIGZhaWwtc2FmZSBtb2RlIGlmIGl0IGRvZXNuJ3QgcmVjZWl2ZQ0KICAgID4gYSBzZW5zb3Ig
dmFsdWUgZnJlcXVlbnRseSBlbm91Z2guICBUaGlzIG1vZGUgd291bGQgY2F1c2UgaXQgdG8gZHJp
dmUNCiAgICA+IHRoZSBmYW5zIHRvIGEgcHJlLWRlZmluZWQgc2V0LXBvaW50IHBlciBhIGNvbmZp
Z3VyYXRpb24uDQogICAgPiANCiAgICA+ID4+ID4gPiBJDQogICAgPiA+PiA+ID4gd2lsbCBoYXZl
IG1vcmUgZmluZS1ncmFpbmVkIHBvd2VyIGNvbnRyb2wuIE5vdyBJIGp1c3QgaGF2ZSB0byBmaWd1
cmUNCiAgICA+ID4+ID4gPiBvdXQNCiAgICA+ID4+ID4gPiBob3cNCiAgICA+ID4+ID4gPiB0byB1
cGRhdGUgdGhlIExhdHRpY2UgQ1BMRCBmcm9tIHRoZSBCTUMuLi4gSSBmb3VuZCBzb21lIGNvZGUg
aW4gdGhlDQogICAgPiA+PiA+ID4gRmFjZWJvb2sNCiAgICA+ID4+ID4gPiBPcGVuQk1DIHdoaWNo
IGhvcGVmdWxseSBJIGNhbiBwb3J0IG92ZXIuDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4g
LUFhcm9uDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4gT24gV2VkbmVzZGF5LCBKYW51YXJ5
IDMwLCAyMDE5IDE6NDI6NDAgUE0gUFNUIEVtaWx5IFNoYWZmZXIgd3JvdGU6DQogICAgPiA+PiA+
ID4gPiBBYXJvbiwgd2UgdXNlIHRoaXMgZGFlbW9uIGZvciBsb2NhbCAodG8gQk1DKSB0aGVybWFs
IGNvbnRyb2w6DQogICAgPiA+PiA+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9z
cGhvci1waWQtY29udHJvbA0KICAgID4gPj4gPiA+ID4gTWF5YmUgeW91J2xsIGZpbmQgaXQgaGVs
cGZ1bC4NCiAgICA+ID4+ID4gPiA+IA0KICAgID4gPj4gPiA+ID4gQWx0aG91Z2ggSSdtIG5vdCBz
dXJlIGhvdyB0byBoZWxwIHlvdSB3aXRoIGxvc2luZyBzZW5zb3JzIHdoZW4gdGhlDQogICAgPiA+
PiA+ID4gPiBob3N0DQogICAgPiA+PiA+ID4gPiBwb3dlcnMgZG93biBidXQgdGhlIEJNQyBpcyBl
eHBlY3RlZCB0byBjb250aW51ZSB0byBjb29sIHRoZSB0cmF5Lg0KICAgID4gPj4gPiA+ID4gU291
bmRzDQogICAgPiA+PiA+ID4gPiBsaWtlIGFuIGlzc3VlIHdpdGggdGhlIGJvYXJkIGRlc2lnbiwg
dW5sZXNzIEknbSBub3QgdW5kZXJzdGFuZGluZw0KICAgID4gPj4gPiA+ID4gd2hhdA0KICAgID4g
Pj4gPiA+ID4geW91J3JlIHNheWluZy4NCiAgICA+ID4+ID4gPiA+IA0KICAgID4gPj4gPiA+ID4g
T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMToyOCBQTSBBYXJvbiBXaWxsaWFtcw0KICAgID4gPj4g
PiA+ID4gPGF3aWxsaWFtc0BtYXJ2ZWxsLmNvbT4NCiAgICA+ID4+ID4gPiA+IA0KICAgID4gPj4g
PiA+ID4gd3JvdGU6DQogICAgPiA+PiA+ID4gPiA+IEhpIEVtaWx5LA0KICAgID4gPj4gPiA+ID4g
PiANCiAgICA+ID4+ID4gPiA+ID4gVGhhdCdzIHdoYXQgSSBuZWVkIHRoZSB0ZW1wZXJhdHVyZSBm
b3IuIFdlIGhhdmUgdHdvIGNvbnRyb2xsZXJzLA0KICAgID4gPj4gPiA+ID4gPiBvbmUNCiAgICA+
ID4+ID4gPiANCiAgICA+ID4+ID4gPiB0aGF0DQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4g
PiA+IG1vbml0b3JzIHRoZSBjb3JlIHRlbXBlcmF0dXJlIChhIFRJIFRNUDQyMSkgYW5kIG9uZSB0
aGF0IGNvbnRyb2xzDQogICAgPiA+PiA+ID4gPiA+IHRoZQ0KICAgID4gPj4gPiA+IA0KICAgID4g
Pj4gPiA+IGZhbnMNCiAgICA+ID4+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gKEFEVDc0NjIpLiBJ
biBvcmRlciB0byBtYWludGFpbiB0aGUgdGhlcm1hbCBlbnZlbG9wZSB0aGUgVE1QNDIxDQogICAg
PiA+PiA+ID4gPiA+IG5lZWRzDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4gdG8NCiAgICA+
ID4+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gYmUNCiAgICA+ID4+ID4gPiA+ID4gbW9uaXRvcmVk
IHRvIGFkanVzdCB0aGUgZmFuIHNwZWVkIHRocm91Z2ggdGhlIEFEVDc0NjIuDQogICAgPiA+PiA+
ID4gPiA+IA0KICAgID4gPj4gPiA+ID4gPiBGdXJ0aGVyIGNvbXBsaWNhdGluZyB0aGluZ3MgaXMg
dGhlIGZhY3QgdGhhdCB0aGVzZSBzZW5zb3JzDQogICAgPiA+PiA+ID4gPiA+IGRpc2FwcGVhcg0K
ICAgID4gPj4gPiA+IA0KICAgID4gPj4gPiA+IHdoZW4NCiAgICA+ID4+ID4gPiANCiAgICA+ID4+
ID4gPiA+ID4gdGhlDQogICAgPiA+PiA+ID4gPiA+IGhvc3QgaXMgcG93ZXJlZCBkb3duLg0KICAg
ID4gPj4gPiA+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gLUFhcm9uDQogICAgPiA+PiA+ID4gPiA+
IA0KICAgID4gPj4gPiA+ID4gPiBPbiBXZWRuZXNkYXksIEphbnVhcnkgMzAsIDIwMTkgOTo0OToz
MiBBTSBQU1QgRW1pbHkgU2hhZmZlciANCiAgICB3cm90ZToNCiAgICA+ID4+ID4gPiA+ID4gPiBF
eHRlcm5hbCBFbWFpbA0KICAgID4gPj4gPiA+IA0KICAgID4gPj4gPiA+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
ICAgID4gPj4gPiA+IC0NCiAgICA+ID4+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gPiBIaSBBYXJv
biwNCiAgICA+ID4+ID4gPiA+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gPiBOb3RlIHRoYXQgeW91
IG9ubHkgcmVhbGx5IG5lZWQgdG8gd29ycnkgYWJvdXQgc2VuZGluZyB0aGUNCiAgICA+ID4+ID4g
PiA+ID4gPiB0ZW1wZXJhdHVyZQ0KICAgID4gPj4gPiA+ID4gPiA+IHZpYQ0KICAgID4gPj4gPiA+
ID4gPiA+IElQTUkgaWYgeW91IHdhbnQgdG8gc2VuZCBpdCBzb21ld2hlcmUgYmVzaWRlcyB0aGUg
Qk1DLiAgSWYgeW91DQogICAgPiA+PiA+ID4gPiA+ID4gcGxhbg0KICAgID4gPj4gPiA+IA0KICAg
ID4gPj4gPiA+IHRvDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4gPiA+ID4gZG8NCiAgICA+
ID4+ID4gPiA+ID4gPiBpbnRlcm5hbCB0aGVybWFsIGNvbnRyb2wgKEJNQyByZWFkcyB0ZW1wZXJh
dHVyZSwgQk1DIGFkanVzdHMNCiAgICA+ID4+ID4gPiA+ID4gPiBmYW5zDQogICAgPiA+PiA+ID4g
PiA+ID4gYWNjb3JkaW5nbHkpIHlvdSBwcm9iYWJseSBkb24ndCBuZWVkIElQTUkgY29uZmlnIGFu
ZCBjYW4gZ2V0DQogICAgPiA+PiA+ID4gPiA+ID4gYXdheQ0KICAgID4gPj4gPiA+IA0KICAgID4g
Pj4gPiA+IHdpdGgNCiAgICA+ID4+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gPiBzZXR0aW5nIGl0
IHVwIGFzIGZhciBhcyBEQnVzIGluIHRoZSBzZW5zb3IgYXJjaGl0ZWN0dXJlIGRvYyBMZWkNCiAg
ICA+ID4+ID4gPiA+ID4gPiBzZW50Lg0KICAgID4gPj4gPiA+ID4gPiA+IA0KICAgID4gPj4gPiA+
ID4gPiA+IEVtaWx5DQogICAgPiA+PiA+ID4gPiA+ID4gDQogICAgPiA+PiA+ID4gPiA+ID4gT24g
VGh1LCBKYW4gMjQsIDIwMTkgYXQgMToyNyBBTSBMZWkgWVUgPG1pbmUyNjAzMDlAZ21haWwuY29t
PiANCiAgICB3cm90ZToNCiAgICA+ID4+ID4gPiA+ID4gPiA+IE9uIFRodSwgSmFuIDI0LCAyMDE5
IGF0IDU6MTMgUE0gQWFyb24gV2lsbGlhbXMgPA0KICAgID4gPj4gPiA+IA0KICAgID4gPj4gPiA+
IGF3aWxsaWFtc0BtYXJ2ZWxsLmNvbT4NCiAgICA+ID4+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4g
PiA+IHdyb3RlOg0KICAgID4gPj4gPiA+ID4gPiA+ID4gPiBJIHNlZSBob3cgdG8gc2V0IHVwIHRo
ZSBod21vbiBwb3J0aW9uIGRlZmluaW5nIHRoZSBkZXZpY2VzDQogICAgPiA+PiA+ID4gPiA+ID4g
PiA+IGJhc2VkDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4gb24NCiAgICA+ID4+ID4gPiAN
CiAgICA+ID4+ID4gPiA+ID4gdGhlDQogICAgPiA+PiA+ID4gPiA+IA0KICAgID4gPj4gPiA+ID4g
PiA+ID4gZGV2aWNlDQogICAgPiA+PiA+ID4gPiA+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gPiA+
ID4gdHJlZSwgYnV0IEkgYW0gdW5zdXJlIGhvdyB0byBnbyBhYm91dCBjb25maWd1cmluZyB0aGUg
WUFNTA0KICAgID4gPj4gPiA+ID4gPiA+ID4gPiBhbmQNCiAgICA+ID4+ID4gPiANCiAgICA+ID4+
ID4gPiBvdGhlcg0KICAgID4gPj4gPiA+IA0KICAgID4gPj4gPiA+ID4gPiA+ID4gZmlsZXMgZm9y
DQogICAgPiA+PiA+ID4gPiA+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gPiA+ID4gdGhpcy4NCiAg
ICA+ID4+ID4gPiA+ID4gPiA+IA0KICAgID4gPj4gPiA+ID4gPiA+ID4gRm9yIHNlbnNvcnMnIGNv
bmZpZywgcGxlYXNlIHJlZmVyIHRvDQogICAgPiA+PiA+ID4gPiA+ID4gPiBodHRwczovL2dpdGh1
Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL3NlbnNvci1hcmNoaXRlY3R1DQogICAgPiA+
PiA+ID4gPiA+ID4gPiByZS5tZA0KICAgID4gPj4gPiA+ID4gPiA+ID4gDQogICAgPiA+PiA+ID4g
PiA+ID4gPiBBbmQgaXQgbG9va3MgeW91IGFyZSBsb29raW5nIGZvciBmYW4gY29udHJvbHMsIHRo
ZW4geW91IGNvdWxkDQogICAgPiA+PiA+ID4gDQogICAgPiA+PiA+ID4gcmVmZXINCiAgICA+ID4+
ID4gPiB0bzoNCiAgICA+ID4+ID4gPiANCiAgICA+ID4+ID4gPiBodHRwczovL2dpdGh1Yi5jb20v
bWluZTI2MDMwOS9vcGVuYm1jLWludHJvL2Jsb2IvbWFzdGVyL1BvcnRpbmdfR3VpZGUNCiAgICA+
ID4+ID4gPiAubWQjZg0KICAgID4gPj4gPiA+IA0KICAgID4gPj4gPiA+ID4gPiA+ID4gYW5zDQog
ICAgPiA+PiA+ID4gPiA+ID4gPiANCiAgICA+ID4+ID4gPiA+ID4gPiA+IChJIHJlYWxseSBuZWVk
IHRvIHN1Ym1pdCBteSBwb3J0aW5nIGd1aWRlIHRvIG9wZW5ibWMvZG9jcykNCiAgICANCiAgICAN
CiAgICANCiAgICANCiAgICANCg0K
