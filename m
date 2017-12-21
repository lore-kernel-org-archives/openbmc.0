Return-Path: <Michael.E.Brown@dell.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.149.229; helo=esa6.dell-outbound.iphmx.com;
 envelope-from=michael.e.brown@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="b4lnM0rs"; 
 dkim-atps=neutral
Received: from esa6.dell-outbound.iphmx.com (esa6.dell-outbound.iphmx.com
 [68.232.149.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z2dnY4W7dzDsQr
 for <openbmc@lists.ozlabs.org>; Fri, 22 Dec 2017 04:25:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1513877121; x=1545413121;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hrN/8PVzB1U4jPVqcgEkFYgHR6HAQvYvI4+tiBD9jVQ=;
 b=b4lnM0rsP/DKYESfjV6zV2BmALON/Tt4BYbRR7P16EZSRu1YM64mBZDP
 N68RiMiDYluDUBiIISxe4lHAZWjzzXmHw0SyaG6ryX9hN4y/H+8WeyOsD
 B72srBGIUntqSsBAAwfx6y7GcW0udjY18yy+244faS++P5fW3ui6Bau1a s=;
IronPort-PHdr: =?us-ascii?q?9a23=3AdQXRURJ7K9+486rZudmcpTZWNBhigK39O0sv0rFi?=
 =?us-ascii?q?tYgfK/XxwZ3uMQTl6Ol3ixeRBMOHs6sC07KempujcFRI2YyGvnEGfc4EfD4+ou?=
 =?us-ascii?q?JSoTYdBtWYA1bwNv/gYn9yNs1DUFh44yPzahANS47xaFLIv3K98yMZFAnhOgpp?=
 =?us-ascii?q?POT1HZPZg9iq2+yo9JDffxhEiCChbb9uMR67sRjfus4KjIV4N60/0AHJonxGe+?=
 =?us-ascii?q?RXwWNnO1eelAvi68mz4ZBu7T1et+ou+MBcX6r6eb84TaFDAzQ9L281/szrugLd?=
 =?us-ascii?q?QgaJ+3ART38ZkhtMAwjC8RH6QpL8uTb0u+ZhxCWXO9D9Qr4uWTSm8qxlVhnmhi?=
 =?us-ascii?q?kaPDI9/mzaisl8gaRGqxyjuhN/2ZbZboGLOvRjYqPTc9AURWRDUcZQSyNPDYyz?=
 =?us-ascii?q?YpATD+UaP+ZUs5Xxq0cMoBa4GAKiBPnvyjhNhnLu2qA01OUhHh3G3AM6Ad0OtG?=
 =?us-ascii?q?7YotrvOKoPS+C1y6fJzTPYYvxLxzj97IzIfgo9rvGLWLJ9aMzcwlQhGQPCi1Wf?=
 =?us-ascii?q?s43lPzWN2+QKq2iU8exgWvmqi2E7sg1xuiKvxsAuiobXmo0V1krI9Cp5wYc0I9?=
 =?us-ascii?q?CzVU11Yca8HZZRtCyWLZV6T808T21ypSo3yrILtYS6cSUE0Jgr2gLTZ+aaf4WH?=
 =?us-ascii?q?7B/vTvudLDRiiH9meb+znwu+/Eeux+HmS8W50VdHojBYntTDtX0BzQLf5tWaRv?=
 =?us-ascii?q?Z740yvwyyA1xrJ5eFBOU00kK3bJIM/zbMojZoTtFjDHjfxmEXrkK+abkUk9fas?=
 =?us-ascii?q?6+TgerjpuIScOJV6hw3kL6shhMi/AeAhPggJQmib5f+z1Lr+/U3/XbpGkOc6kq?=
 =?us-ascii?q?jBsJDaIMQaqbS1DBNS0oYm8xq/DjGm38oEnXQfLV9IewiLg5bnNl3QOvz0EPey?=
 =?us-ascii?q?jlu2nDpqyf3KJrjhDY/MLnjHnrfhZ7F960tExQQ0zNBQ+5JUBasfL/L3QEP/u8?=
 =?us-ascii?q?bUAwIjMwyzzefnDs5w2Z4AVmKLBq+VKr/dsViN5u43OemDeJcVuCrhK/gi//Pu?=
 =?us-ascii?q?imc5lkEbfaay2JsYdGu1HvBnI0WCfXrsmc0NEWALvwo6VuPlk0aCXSRUZ3aoUK?=
 =?us-ascii?q?Jvrg08XdasAIHDboOgmrqM2GGwBJRNZmFABRaLC3i+M83QVvtKdCuUJdJ6uj0C?=
 =?us-ascii?q?SbWlDYQm0Efq/Fv907dhJO/f0ikZro74kt9n4+TZjlc17zMiXOqH1GTYG0R1lW?=
 =?us-ascii?q?MBSjtw8eZVu0tizH+P3Kx8xfdfEIoAtLtyTg4mOMuEnKRBANfoV1eaI9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FrBQBn7Ttahz+a6ERbGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYQUEHQnB4QJmTWBJVyPP4UahGUKGAuBC4QNAhqEMEMUAQEBAQE?=
 =?us-ascii?q?BAQEBAQIQAQEBCgsJCCgvgjgMgUpbOwEBAQMBASIRSgcEAgEIEQQBAQECAiMDA?=
 =?us-ascii?q?gICJh4BCAgBAQQBEggTiggIEKQqgieKcAEBAQEGAQEBAQEBARwFgQ+CcIISgz+?=
 =?us-ascii?q?CIIEOgTCCAIFYgy2CZQWjSAqHd4cchgmCIIolhz5wjDGFaAGDdYE7NoFyb4JqA?=
 =?us-ascii?q?Q+CZIFzeAEBAYh+gRYBAQE?=
X-IPAS-Result: =?us-ascii?q?A2FrBQBn7Ttahz+a6ERbGQEBAQEBAQEBAQEBAQcBAQEBAYQ?=
 =?us-ascii?q?UEHQnB4QJmTWBJVyPP4UahGUKGAuBC4QNAhqEMEMUAQEBAQEBAQEBAQIQAQEBC?=
 =?us-ascii?q?gsJCCgvgjgMgUpbOwEBAQMBASIRSgcEAgEIEQQBAQECAiMDAgICJh4BCAgBAQQ?=
 =?us-ascii?q?BEggTiggIEKQqgieKcAEBAQEGAQEBAQEBARwFgQ+CcIISgz+CIIEOgTCCAIFYg?=
 =?us-ascii?q?y2CZQWjSAqHd4cchgmCIIolhz5wjDGFaAGDdYE7NoFyb4JqAQ+CZIFzeAEBAYh?=
 =?us-ascii?q?+gRYBAQE?=
Received: from esa3.dell-outbound2.iphmx.com ([68.232.154.63])
 by esa6.dell-outbound.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Dec 2017 11:25:17 -0600
From: <Michael.E.Brown@dell.com>
Received: from ausxipps310.us.dell.com ([143.166.148.211])
 by esa3.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Dec 2017 23:21:48 +0600
X-LoopCount0: from 10.166.136.214
X-IronPort-AV: E=Sophos;i="5.45,436,1508821200"; d="scan'208";a="103747702"
X-DLP: DLP_GlobalPCIDSS
To: <benh@kernel.crashing.org>, <ed.tanous@intel.com>,
 <openbmc@lists.ozlabs.org>
Subject: RE: Request for comments: C++ embedded webserver
Thread-Topic: Request for comments: C++ embedded webserver
Thread-Index: AdN4ftVuoDXj0cc0QHy/ckqdQwlbewBpuJgAABZE/eA=
Date: Thu, 21 Dec 2017 17:25:16 +0000
Message-ID: <096309f70da94fa59fac442ddc1cef86@ausx13mps334.AMER.DELL.COM>
References: <7E9441B1E5EFFD4681F54958E82169932F4B1A4D@ORSMSX114.amr.corp.intel.com>
 <1513816454.2743.36.camel@kernel.crashing.org>
In-Reply-To: <1513816454.2743.36.camel@kernel.crashing.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Dec 2017 17:25:23 -0000

QmVuamFtaW4sDQoNCkknbSBuZXcgYXJvdW5kIGhlcmUsIHNvIEkgZGlkbid0IHdhbnQgdG8gYmUg
dGhlIGZpcnN0IHRvIGJyaW5nIHRoaXMgdXAgd2l0aG91dCBkb2luZyBteSByZXNlYXJjaCBvbiBh
bnkgb2xkZXIgdGhyZWFkcywgc28gdGhhbmsgeW91IGZvciBicmluZ2luZyB0aGlzIHVwLg0KDQpN
eSBzdHJvbmcgb3BpbmlvbiBpcyB0aGF0IGdvbGFuZyBpcyBsaWtlbHkgdGhlIGJlc3QgY2FuZGlk
YXRlIGZvciB0aGlzIHNwZWNpZmljIHR5cGUgb2YgcHJvZ3JhbW1pbmcgZW52aXJvbm1lbnQgKGll
LiBPcGVuQk1DKS4NCgktIExvdyBydW50aW1lIG1lbW9yeSB1c2FnZQ0KCS0gQXV0b21hdGljIE1l
bW9yeSBNYW5hZ2VtZW50DQoJLSBDbGVhbiBjcm9zcyBjb21waWxlIGZvciBBUk12NSBhbmQgYWJv
dmUNCgktIENvbXBpbGVkDQoJLSBzdHJvbmdseSB0eXBlZA0KCS0gRmFzdA0KCS0gQ2xlYW5seSBo
YW5kbGVzIHRocmVhZGluZy9hc3luYw0KCS0gTmljZSBzdGFuZGFyZCBsaWJyYXJ5DQoNCkkgaGFk
IHByb3RvdHlwZWQgYSByZWRmaXNoIHNlcnZlciBpbiBnb2xhbmcgZW5vdWdoIHRvIGdldCB0byB0
aGUgcG9pbnQgd2hlcmUgSSBiZWxpZXZlIHRoYXQgaXQncyB0aGUgYmVzdCBzb2x1dGlvbi4gSSBo
YXZlIGdyZWF0IHRoaW5ncyB0byBzYXkgaW50ZXJuYWxseSBhYm91dCB0aGUgZXhpc3Rpbmcgb3Bl
bmJtYyBkZXNpZ246IEkgbG92ZSB0aGUgdXNlIG9mIERCVVMsIHRoZSBtb3JlIEkgbG9vayBhdCBp
dCB0aGUgbW9yZSBjbGVhcmx5IHRoZSBhZHZhbnRhZ2VzIHNlZW0gdG8gbWUuIFRoZSBuaWNlIHRo
aW5nIGFib3V0IHRoaXMgaXMgdGhhdCBnb2xhbmcgaGFzIGEgREJVUyBsaWJyYXJ5IGFuZCB3ZSBv
dWdodCB0byBiZSBhYmxlIHRvIHdyaXRlIGRpZmZlcmVudCBjb21wb25lbnRzIGluIGRpZmZlcmVu
dCBsYW5ndWFnZXMgZnJlZWx5LCBlc3BlY2lhbGx5IGlmIHdlIGhhdmUgdGhlIHVuZGVybHlpbmcg
ZGJ1cyBhcGlzIGNvcnJlY3QuDQoNCi0tDQpNaWNoYWVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBvcGVuYm1jIFttYWlsdG86b3BlbmJtYy1ib3VuY2VzK21pY2hhZWwuZS5i
cm93bj1kZWxsLmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgQmVuamFtaW4gSGVy
cmVuc2NobWlkdA0KU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAyMCwgMjAxNyA2OjM0IFBNDQpU
bzogVGFub3VzLCBFZCA8ZWQudGFub3VzQGludGVsLmNvbT47IE9wZW5CTUMgTWFpbGxpc3QgPG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBSZXF1ZXN0IGZvciBjb21tZW50
czogQysrIGVtYmVkZGVkIHdlYnNlcnZlcg0KDQpPbiBUdWUsIDIwMTctMTItMTkgYXQgMDQ6MDcg
KzAwMDAsIFRhbm91cywgRWQgd3JvdGU6DQo+IEnigJltIGxvb2tpbmcgZm9yIGNvbW1lbnRzIG9u
IGEgY29kZSByZXZpZXcgdGhhdOKAmXMgYmVlbiBvdXRzdGFuZGluZy4gDQo+IE9uZSBvZiB0aGUg
bGFyZ2UgcHVzaGVzIHdl4oCZdmUgbWFkZSBpcyB0byBhdHRlbXB0IHRvIG1ha2UgdGhlIHdlYiAN
Cj4gc2VydmVyIG1vcmUgZWZmaWNpZW50LCBhbmQgYWRkIGNhcGFiaWxpdGllcyB0aGF0IGNvbXBy
ZWhlbmQgbG9uZyB0ZXJtIA0KPiBuZWVkcyBvZiBPcGVuQm1jLiAgT25lIGtleSB0aGF0IHdhc27i
gJl0IG1hZGUgY2xlYXIgaW4gdGhlIGNvbW1pdCANCj4gbWVzc2FnZSBpcyB0aGF0IGl0IGluY2x1
ZGVzIHRoZSBiYXNpYyByZWRmaXNoIGltcGxlbWVudGF0aW9uIHRoYXQgKHdlDQo+IGhvcGUpIHNo
b3VsZCBiZSBleHRlbnNpYmxlIHRvIHRoZSBmdWxsIHJlZGZpc2ggc3BlY2lmaWNhdGlvbiBpbiB0
aGUgDQo+IHNob3J0IHRlcm0gZnV0dXJlLg0KDQpUaGVyZSBhcmUgcGxlbnR5IG9mIGV4aXN0aW5n
IEhUVFAgc2VydmVyIGltcGxlbWVudGF0aW9ucyBvdXQgdGhlcmUgdGhhdCBhcmUgd2VsbCBtYWlu
dGFpbmVkLCBhbnkgcmVhc29uIHdoeSB3ZSBzaG91bGQgaW52ZW50IGFub3RoZXIgb25lIGhlcmUg
Pw0KDQpBbHNvLCBkbyB3ZSByZWFsbHkgdGhpbmsgcGVycGV0dWF0aW5nIHRoZSB1c2Ugb2YgdGhh
dCBtb25zdHJ1b3NpdHkgbWFzcXVlcmFkaW5nIGFzIGEgcHJvZ3JhbW1pbmcgbGFuZ3VhZ2UgdGhh
dCBpcyBDKysgaXMgYSBnb29kIGlkZWEgPw0KDQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovIy9jLzc3ODYvDQo+ICANCj4gV2Ugd291bGQgdmVyeSBtdWNoIGFwcHJlY2lhdGUg
Y29tbWVudHMgdG8gc2VlIGlmIHdlIGNhbiBtb3ZlIHRoaXMgZm9yd2FyZC4NCj4gIA0KPiBUaGUg
Zm9sbG93aW5nIGRlc2NyaXB0aW9uIGlzIHB1bGxlZCBmcm9tIHRoZSByZWFkbWUuDQo+ICANCj4g
IyBPcGVuQk1DIHdlYnNlcnZlciAjDQo+ICANCj4gVGhpcyBjb21wb25lbnQgYXR0ZW1wdHMgdG8g
YmUgYSAiZG8gZXZlcnl0aGluZyIgZW1iZWRkZWQgd2Vic2VydmVyIGZvciBvcGVuYm1jLg0KPiAg
DQo+ICMjIENhcGFiaWxpdGllcyAjIw0KPiBBdCB0aGlzIHRpbWUsIHRoZSB3ZWJzZXJ2ZXIgaW1w
bGVtZW50cyBhIGZldyBpbnRlcmZhY2VzOg0KPiArIEF1dGhlbnRpY2F0aW9uIG1pZGRsZXdhcmUg
dGhhdCBzdXBwb3J0cyBjb29raWUgYW5kIHRva2VuIGJhc2VkIGF1dGhlbnRpY2F0aW9uLCBhcyB3
ZWxsIGFzIENTUkYgcHJldmVudGlvbiBiYWNrZWQgYnkgbGludXggUEFNIGF1dGhlbnRpY2F0aW9u
IGNyZWRlbnRpYWxzLg0KPiArIEFuIChpbmNvbXBsZXRlKSBhdHRlbXB0IGF0IHJlcGxpY2F0aW5n
IHBob3NwaG9yLWRidXMtcmVzdCBpbnRlcmZhY2VzIGluIEMrKy4gIFJpZ2h0IG5vdywgYSBmZXcg
b2YgdGhlIGVuZHBvaW50IGRlZmluaXRpb25zIHdvcmsgYXMgZXhwZWN0ZWQsIGJ1dCB0aGVyZSBp
cyBzdGlsbCBhIGxvdCBvZiB3b3JrIHRvIGJlIGRvbmUuICBUaGUgcG9ydGlvbnMgb2YgdGhlIGlu
dGVyZmFjZSB0aGF0IGFyZSBmdW5jdGlvbmFsIGFyZSBkZXNpZ25lZCB0byB3b3JrIGNvcnJlY3Rs
eSBmb3IgcGhvc3Bob3Itd2VidWksIGJ1dCBtYXkgbm90IHlldCBiZSBjb21wbGV0ZS4NCj4gKyBS
ZXBsaWNhdGlvbiBvZiB0aGUgcmVzdC1kYnVzIGJhY2tlbmQgaW50ZXJmYWNlcyB0byBhbGxvdyBi
bWMgZGVidWcgdG8gbG9nZ2VkIGluIHVzZXJzLg0KPiArIEFuIGluaXRpYWwgYXR0ZW1wdCBhdCBh
IHJlYWQtb25seSByZWRmaXNoIGludGVyZmFjZS4gIEN1cnJlbnRseSB0aGUgcmVkZmlzaCBpbnRl
cmZhY2UgdGFyZ2V0cyBTZXJ2aWNlUm9vdCwgU2Vzc2lvblNlcnZpY2UsIEFjY291bnRTZXJ2aWNl
LCBSb2xlcywgYW5kIE1hbmFnZXJzU2VydmljZS4gIFNvbWUgZnVuY3Rpb25hbGl0eSBoZXJlIGhh
cyBiZWVuIHNoaW1tZWQgdG8gbWFrZSBkZXZlbG9wbWVudCBwb3NzaWJsZS4gIEZvciBleGFtcGxl
LCB0aGVyZSBleGlzdHMgb25seSBhIHNpbmdsZSB1c2VyIHJvbGUuDQo+ICsgU1NMIGtleSBnZW5l
cmF0aW9uIGF0IHJ1bnRpbWUuICBJZiBhbiBSU0Ega2V5IGFuZCBjZXJ0IHBhaXIgYXJlIG5vdCBh
dmFpbGFibGUgdG8gdGhlIHNlcnZlciBhdCBydW50aW1lLCBrZXlzIGFyZSBnZW5lcmF0ZWQgdXNp
bmcgdGhlIG9wZW5zc2wgcm91dGluZXMsIGFuZCB3cml0dGVuIHRvIGRpc2suDQo+ICsgU3RhdGlj
IGZpbGUgaG9zdGluZy4gIEN1cnJlbnRseSwgc3RhdGljIGZpbGVzIGFyZSBob3N0ZWQgZnJvbSB0
aGUgZml4ZWQgbG9jYXRpb24gYXQgL3Vzci9zaGFyZS93d3cuICBUaGlzIGlzIGludGVuZGVkIHRv
IGFsbG93IGxvb3NlIGNvdXBsaW5nIHdpdGggeW9jdG8gcHJvamVjdHMsIGFuZCBhbGxvdyBvdmVy
cmlkaW5nIHN0YXRpYyBmaWxlcyBhdCBidWlsZCB0aW1lLg0KPiArIERidXMtbW9uaXRvciBvdmVy
IHdlYnNvY2tldC4gIEEgZ2VuZXJpYyBlbmRwb2ludCB0aGF0IGFsbG93cyBVSXMgdG8gDQo+ICsg
b3BlbiBhIHdlYnNvY2tldCBhbmQgcmVnaXN0ZXIgZm9yIG5vdGlmaWNhdGlvbiBvZiBldmVudHMg
dG8gYXZvaWQgDQo+ICsgcG9sbGluZyBpbiBzaW5nbGUgcGFnZSBhcHBsaWNhdGlvbnMuICAodGhp
cyBpbnRlcmZhY2UgbWF5IGJlIA0KPiArIG1vZGlmaWVkIGluIHRoZSBmdXR1cmUgZHVlIHRvIHNl
Y3VyaXR5IGNvbmNlcm5zLikNCj4gIA0KPiAgDQo+IFRoYW5rcywNCj4gIA0KPiAtRWQNCj4gIA0K
