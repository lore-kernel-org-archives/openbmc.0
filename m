Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.95; helo=esa5.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="LsMwyRKU"; 
 dkim-atps=neutral
Received: from esa5.dell-outbound.iphmx.com (esa5.dell-outbound.iphmx.com
 [68.232.153.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Prwn1NprzF38n;
 Wed,  3 Oct 2018 06:53:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1538513632; x=1570049632;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pBKIIfCB4VTj8D4OvXKnc4OBdcbAH8sbbi5AZ0WFDYY=;
 b=LsMwyRKUYfltayXrNwhLJ+SQkVf+/YYNfTeQsqYjc0eHGXeRMHxdliw2
 opaGLyjPNAjioZOxxns455ak4qxM58e4xCY8cAxf8fBz/b8FW+Qkf0M/h
 XB+PxuwyjpL59FWXMp6C+Qh0q0Re2ChsYNQLPJnn9dz+o/F/Jxim7Axuc Q=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2F7AAB42rNbhyWd50NbHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBUYFfghQyg2qIFV+LPIINgz2TH4F6C4RsAheDeCE0GAEDAQECAQECAQE?=
 =?us-ascii?q?CEAEBARUJCCkvgjUigmIBAQEBAgESEQQNSgsCAQgaAiYCAgJFEAIEARoagn+?=
 =?us-ascii?q?BegidAIlXAQEBbXszhAEBhhWBC4l4gheBEoMSh3+CVwKBKAGHA1OKfIlBBgE?=
 =?us-ascii?q?CkDAfgUmEX4kylRkCBAIEBQIUgUI3gVdwgW6BT4IhEQmNYgE1jhuBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2F7AAB42rNbhyWd50NbHAEBAQQBAQcEAQGBUYFfghQyg?=
 =?us-ascii?q?2qIFV+LPIINgz2TH4F6C4RsAheDeCE0GAEDAQECAQECAQECEAEBARUJCCkvg?=
 =?us-ascii?q?jUigmIBAQEBAgESEQQNSgsCAQgaAiYCAgJFEAIEARoagn+BegidAIlXAQEBb?=
 =?us-ascii?q?XszhAEBhhWBC4l4gheBEoMSh3+CVwKBKAGHA1OKfIlBBgECkDAfgUmEX4kyl?=
 =?us-ascii?q?RkCBAIEBQIUgUI3gVdwgW6BT4IhEQmNYgE1jhuBHwEB?=
Received: from mx0b-00154901.pphosted.com ([67.231.157.37])
 by esa5.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Oct 2018 15:53:49 -0500
Received: from pps.filterd (m0134318.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w92KrVMa161237; Tue, 2 Oct 2018 16:53:56 -0400
Received: from esa5.dell-outbound2.iphmx.com (esa5.dell-outbound2.iphmx.com
 [68.232.153.203])
 by mx0a-00154901.pphosted.com with ESMTP id 2mt41dhwk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Oct 2018 16:53:56 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausxipps301.us.dell.com ([143.166.148.223])
 by esa5.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 03 Oct 2018 02:53:15 +0600
X-LoopCount0: from 10.166.135.97
X-IronPort-AV: E=Sophos;i="5.54,333,1534827600"; d="scan'208";a="239324586"
To: <vijaykhemka@fb.com>, <sam@mendozajonas.com>, <joel@jms.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <sdasari@fb.com>, <netdev@vger.kernel.org>, <christian@cmd.nu>
Subject: RE: [PATCH v2] net/ncsi: Add NCSI OEM command support
Thread-Topic: [PATCH v2] net/ncsi: Add NCSI OEM command support
Thread-Index: AQHUV5CszdljEBEgLUydRIWplvMUgaULgN+AgACdLMCAAInZAP//s2sw
Date: Tue, 2 Oct 2018 20:53:52 +0000
Message-ID: <3dc1e3c74a864c3da7aaf19c3ca9edfa@AUSX13MPS306.AMER.DELL.COM>
References: <20180929010602.1025909-1-vijaykhemka@fb.com>
 <1004987ef0ab138e772ed5740a0d839bffe39910.camel@mendozajonas.com>
 <4876838166d140bab331280efcfd771d@AUSX13MPS306.AMER.DELL.COM>
 <F932552B-5751-48E9-BC8B-6F9D7841C7FA@fb.com>
In-Reply-To: <F932552B-5751-48E9-BC8B-6F9D7841C7FA@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-02_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810020196
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
X-List-Received-Date: Tue, 02 Oct 2018 20:54:02 -0000

SGkgVmlqYXksDQoNClBsZWFzZSBzZWUgdGhlIGNvbW1lbnRzIGJlbG93Lg0KDQpUaGFua3MsDQpK
dXN0aW4NCg0KDQo+IEhpIEp1c3RpbiwNCj4gVGhhbmtzIGZvciByZXNwb25zZS4gUGxlYXNlIHNl
ZSBteSBjb21tZW50cyBiZWxvdy4NCj4gDQo+IC1WaWpheQ0KPiAgICAgDQo+ID4gPiBkaWZmIC0t
Z2l0IGEvbmV0L25jc2kvbmNzaS1jbWQuYyBiL25ldC9uY3NpL25jc2ktY21kLmMNCj4gPiA+IGlu
ZGV4IDc1NjdjYTYzYWFlMi4uMmY5ODUzM2ViYTQ2IDEwMDY0NA0KPiA+ID4gLS0tIGEvbmV0L25j
c2kvbmNzaS1jbWQuYw0KPiA+ID4gKysrIGIvbmV0L25jc2kvbmNzaS1jbWQuYw0KPiA+ID4gQEAg
LTIxMSw2ICsyMTEsMjYgQEAgc3RhdGljIGludCBuY3NpX2NtZF9oYW5kbGVyX3NuZmMoc3RydWN0
IHNrX2J1ZmYgKnNrYiwNCj4gPiA+ICAJcmV0dXJuIDA7DQo+ID4gPiAgfQ0KPiA+ID4gIA0KPiA+
ID4gK3N0YXRpYyBpbnQgbmNzaV9jbWRfaGFuZGxlcl9vZW0oc3RydWN0IHNrX2J1ZmYgKnNrYiwN
Cj4gPiA+ICsJCQkJc3RydWN0IG5jc2lfY21kX2FyZyAqbmNhKQ0KPiA+ID4gK3sNCj4gPiA+ICsJ
c3RydWN0IG5jc2lfY21kX29lbV9wa3QgKmNtZDsNCj4gDQo+ID5PRU0gY29tbWFuZCBkb2Vzbid0
IG5vdCBoYXZlIHRoZSBmaXhlZCBkYXRhIHNpemUuIFNob3VsZCB3ZSB1c2UgcG9pbnRlciBpbnN0
ZWFkPw0KPiA+c3RydWN0IG5jc2lfY21kX29lbV9wa3Qgew0KPiA+CXN0cnVjdCBuY3NpX2NtZF9w
a3RfaGRyIGNtZDsgICAgICAgICAvKiBDb21tYW5kIGhlYWRlciAgICAqLw0KPiA+CV9fYmUzMiAg
ICAgICAgICAgICAgICAgIG1mcl9pZDsgICAgICAvKiBNYW51ZmFjdHVyZSBJRCAgICAqLw0KPiA+
CXVuc2lnbmVkIGNoYXIgICAgICAgICAgICpkYXRhOyAgICAgICAvKiBPRU0gUGF5bG9hZCBEYXRh
ICAqLw0KPiA+fTsNCj4gWWVzLCBJIGFncmVlIHRoYXQgT0VNIGNvbW1hbmQgZG9lc24ndCBoYXZl
IGZpeGVkIGRhdGEgYnV0IHRvIG1hcCB0byBza2J1ZmYgc3RydWN0dXJlLCANCj4gSSBoYXZlIGRl
ZmluZWQgYWJvdmUgc3RydWN0dXJlIGFzIHBlciBOQ1NJIHNwZWMsIFdlIGNhbiBjZXJ0YWlubHkg
aGF2ZSBhIE1BWF9EQVRBX0xFTiBkZWZpbmUuDQoNClRoZSBzcGVjIG9ubHkgZGVmaW5lcyBtYW51
ZmFjdHVyZSBJRCBmaWVsZCBhbmQgdGhlIHN0YXJ0IG9mZnNldCBvZiB2ZW5kb3IgZGF0YS4gDQpJ
ZiB3ZSBqdXN0IHdhbnQgdG8gcG9pbnQgdG8gdGhlIHZlbmRvciBkYXRhLCB3ZSBkb24ndCBuZWVk
IHRvIHNwZWNpZnkgdGhlIG1heCBsZW5ndGggYW5kDQp3ZSBjYW4gdXNlIGZsZXhpYmxlIGFycmF5
IGFzIHRoZSBsYXN0IG1lbWJlciAoY29ycmVjdCB0aGUgdHlwbyBhYm92ZSkuDQoNCnN0cnVjdCBu
Y3NpX2NtZF9vZW1fcGt0IHsNCglzdHJ1Y3QgbmNzaV9jbWRfcGt0X2hkciBjbWQ7ICAgICAgICAg
LyogQ29tbWFuZCBoZWFkZXIgICAgKi8NCglfX2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7
ICAgICAgLyogTWFudWZhY3R1cmUgSUQgICAgKi8NCgl1bnNpZ25lZCBjaGFyICAgICAgICAgICBk
YXRhW107ICAgICAgIC8qIE9FTSBQYXlsb2FkIERhdGEgICovDQp9Ow0KDQo+ID4gPiArCXVuc2ln
bmVkIGludCBsZW47DQo+ID4gPiArDQo+ID4gPiArCWxlbiA9IHNpemVvZihzdHJ1Y3QgbmNzaV9j
bWRfcGt0X2hkcikgKyA0Ow0KPiA+ID4gKwlpZiAobmNhLT5wYXlsb2FkIDwgMjYpDQo+ID4gPiAr
CQlsZW4gKz0gMjY7DQo+IA0KPiA+V2h5IGRvZXMgaXQgYWRkIDI2PyBJIGtuZXcgdGhlIG90aGVy
IHBsYWNlIGluIG5jc2lfYWxsb2NfY29tbWFuZCgpIGlzIGFsc28gYWRkIDI2Lg0KPiA+SWYgaXQg
aXMgbGVzcyB0aGFuIDI2LCB0aGVuIGl0IHNob3VsZCBiZSBhIGZpeGVkIHNpemUgb2Ygc3RydWN0
dXJlIG5jc2lfY21kX3BrdCAoNDYpLCByaWdodD8NCj4gSXQgYWRkcyAyNiBiZWNhdXNlIEl0IGhh
cyBhbHJlYWR5IGFzc2lnbmVkIGxlbiB0byBoZHIrNCB3aGljaCBpcyAxNis0ID0gMjAgYnl0ZXMu
IEJ5IA0KPiBhZGRpbmcgMjYgaXQgbWFrZXMgaXQgdG8gNDYuIEkgYW0ganVzdCBiZWluZyBjb25z
aXN0ZW50IHdpdGggb3RoZXIgcG9ydGlvbiBvZiBjb2RlLg0KPiANCj4gPiA+ICsJZWxzZQ0KPiA+
ID4gKwkJbGVuICs9IG5jYS0+cGF5bG9hZDsNCj4gPiA+ICsNCj4gPiA+ICsJY21kID0gc2tiX3B1
dF96ZXJvKHNrYiwgbGVuKTsNCj4gPiA+ICsJY21kLT5tZnJfaWQgPSBuY2EtPmR3b3Jkc1swXTsN
Cj4gPiA+ICsJbWVtY3B5KGNtZC0+ZGF0YSwgJm5jYS0+ZHdvcmRzWzFdLCBuY2EtPnBheWxvYWQg
LSA0KTsNCj4gDQo+ID5OZXRsaW5rIHJlcXVlc3QgaXMgdXNpbmcgdGhlIG5ldyBuY2EtPmRhdGEg
cG9pbnRlciB0byBwYXNzIHRoZSBkYXRhIGFzIHRoZSByZXF1ZXN0IHBheWxvYWQNCj4gPmlzIG5v
dCB0aGUgc2FtZSBzaXplIGFuZCBzb21lIGNvbW1hbmQgcGF5bG9hZCBpcyBiaWdnZXIgdGhhbiAx
NiBieXRlcy4NCj4gPldpbGwgeW91IGNvbnNpZGVyIHRvIHVzZSB0aGUgc2FtZSBkYXRhIHBvaW50
ZXI/IFNvLCB3ZSBkb24ndCBuZWVkIHRvIGhhdmUgYSBjaGVja2luZyBoZXJlLg0KPiA+SWYgdGhl
IGNvbW1hbmQgaXMgdXNlZCBsZXNzIHRoYW4gMTYgYnl0ZXMsIHdlIGNhbiBzaW1wbHkgYXNzaWdu
ZWQgJm5jYS0+Ynl0ZXNbMF0gdG8gaXQuDQo+IFRvIGtlZXAgb3JpZ2luYWwgc3RydWN0dXJlLCB3
ZSBjYW4gY2hhbmdlIDE2IGJ5dGVzIHRvIE1BWF9EQVRBX0xFTi4gT3IgSSBkb24ndCBzZWUgYW55
IGlzc3VlIGluIA0KPiBDb3B5aW5nIGRhdGEgZnJvbSBkYXRhIHBvaW50ZXIgZnJvbSBuY2EgYnV0
IHVzZXIgbmVlZHMgdG8gYmUgYXdhcmUgaWYgaXQgaXMgbGVzcyB0aGFuIDE2IGJ5dGVzIHRoZW4g
DQo+IHVzZSBieXRlcyBvciB1c2UgZGF0YSBwb2ludGVyLiBUbyBrZWVwIGl0IHNpbXBsZSwgd2Ug
c2hvdWxkIHNpbXBseSBkZWZpbmUgTUFYX0xFTi4NCg0KSSB1c2UgdGhlIHBvaW50ZXIgdG8gYXZv
aWQgY29weWluZyB0aGUgZGF0YSBhZ2Fpbi4gT0VNIGhhbmRsZXIgY2FuIGFsd2F5cyBwcm9jZXNz
IHRoZSBmbGV4aWJsZSBwYXlsb2FkDQp0aHJvdWdoIHRoZSBkYXRhIHBvaW50ZXIuIEl0IGNhbiBk
ZXBlbmQgb24gdGhlIGNhbGxlciB0byB1c2Ugc3RhY2svYWxsb2NhdGVkIGJ1ZmZlci9uY2EgYnVm
ZmVyIGFuZA0KaXQgd2lsbCBiZSBzdHJhaWdodCBmb3J3YXJkIGlmIGFsbCBPRU0gc3R1ZmYgaXMg
dXNpbmcgdGhlIGRhdGEgcG9pbnRlciB0byBwcm9jZXNzIHRoZSBmbGV4aWJsZQ0KcGF5bG9hZC4N
Cg0KPiANCj4gPiA+IGRpZmYgLS1naXQgYS9uZXQvbmNzaS9uY3NpLXBrdC5oIGIvbmV0L25jc2kv
bmNzaS1wa3QuaA0KPiA+ID4gaW5kZXggOTFiNGI2NjQzOGRmLi4xZjMzODM4NjgxMGQgMTAwNjQ0
DQo+ID4gPiAtLS0gYS9uZXQvbmNzaS9uY3NpLXBrdC5oDQo+ID4gPiArKysgYi9uZXQvbmNzaS9u
Y3NpLXBrdC5oDQo+ID4gPiBAQCAtMTUxLDYgKzE1MSwyMiBAQCBzdHJ1Y3QgbmNzaV9jbWRfc25m
Y19wa3Qgew0KPiA+ID4gIAl1bnNpZ25lZCBjaGFyICAgICAgICAgICBwYWRbMjJdOw0KPiA+ID4g
IH07DQo+ID4gPiAgDQo+ID4gPiArLyogT0VNIFJlcXVlc3QgQ29tbWFuZCBhcyBwZXIgTkNTSSBT
cGVjaWZpY2F0aW9uICovDQo+ID4gPiArc3RydWN0IG5jc2lfY21kX29lbV9wa3Qgew0KPiA+ID4g
KwlzdHJ1Y3QgbmNzaV9jbWRfcGt0X2hkciBjbWQ7ICAgICAgICAgLyogQ29tbWFuZCBoZWFkZXIg
ICAgKi8NCj4gPiA+ICsJX19iZTMyICAgICAgICAgICAgICAgICAgbWZyX2lkOyAgICAgIC8qIE1h
bnVmYWN0dXJlIElEICAgICovDQo+ID4gPiArCXVuc2lnbmVkIGNoYXIgICAgICAgICAgIGRhdGFb
NjRdOyAgICAvKiBPRU0gUGF5bG9hZCBEYXRhICAqLw0KPiA+ID4gKwlfX2JlMzIgICAgICAgICAg
ICAgICAgICBjaGVja3N1bTsgICAgLyogQ2hlY2tzdW0gICAgICAgICAgKi8NCj4gPiA+ICt9Ow0K
PiA+ID4gKw0KPiA+ID4gKy8qIE9FTSBSZXNwb25zZSBQYWNrZXQgYXMgcGVyIE5DU0kgU3BlY2lm
aWNhdGlvbiAqLw0KPiA+ID4gK3N0cnVjdCBuY3NpX3JzcF9vZW1fcGt0IHsNCj4gPiA+ICsJc3Ry
dWN0IG5jc2lfcnNwX3BrdF9oZHIgcnNwOyAgICAgICAgIC8qIENvbW1hbmQgaGVhZGVyICAgICov
DQo+ID4gPiArCV9fYmUzMiAgICAgICAgICAgICAgICAgIG1mcl9pZDsgICAgICAvKiBNYW51ZmFj
dHVyZSBJRCAgICAqLw0KPiA+ID4gKwl1bnNpZ25lZCBjaGFyICAgICAgICAgICBkYXRhWzY0XTsg
ICAgLyogUGF5bG9hZCBkYXRhICAgICAgKi8NCj4gPiA+ICsJX19iZTMyICAgICAgICAgICAgICAg
ICAgY2hlY2tzdW07ICAgIC8qIENoZWNrc3VtICAgICAgICAgICovDQo+ID4gPiArfTsNCj4gPiA+
ICsNCj4gDQo+ID5PRU0gY29tbWFuZCBkb2Vzbid0IG5vdCBoYXZlIHRoZSBmaXhlZCByZXNwb25z
ZSBkYXRhIHNpemUgdG9vLg0KPiA+U2hvdWxkIHdlIHVzZSBwb2ludGVyIGluc3RlYWQ/DQo+IA0K
PiBIZXJlIGFsc28gd2UgY2FuIGRlZmluZSBNQVhfREFUQV9MRU4gYmVjYXVzZSBkYXRhIHBvaW50
ZXIgd29uJ3QgbWFwIHRvIHNrYiBkaXJlY3RseS4NCg0KU3VnZ2VzdCB0byBjaGFuZ2UgYXMgYmVs
b3cgZHVlIHRvIHRoZSBmbGV4aWJsZSByZXNwb25zZS4NCnN0cnVjdCBuY3NpX3JzcF9vZW1fcGt0
IHsNCglzdHJ1Y3QgbmNzaV9yc3BfcGt0X2hkciByc3A7ICAgICAgICAgLyogQ29tbWFuZCBoZWFk
ZXIgICAgKi8NCglfX2JlMzIgICAgICAgICAgICAgICAgICBtZnJfaWQ7ICAgICAgLyogTWFudWZh
Y3R1cmUgSUQgICAgKi8NCgl1bnNpZ25lZCBjaGFyICAgICAgICAgICBkYXRhW107ICAgIC8qIFBh
eWxvYWQgZGF0YSAgICAgICovDQp9Ow0KDQo=
