Return-Path: <shrchand@cisco.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.142.90; helo=alln-iport-3.cisco.com;
 envelope-from=shrchand@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=cisco.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="AJK0IuOL"; 
 dkim-atps=neutral
X-Greylist: delayed 620 seconds by postgrey-1.36 at bilbo;
 Thu, 20 Dec 2018 11:54:47 AEDT
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43KtZb1gy8zDqdx
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 11:54:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2686; q=dns/txt; s=iport;
 t=1545267287; x=1546476887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sq8F6MgcW7oy+toEyacSlw3kTwF0wT2Ch6ifBfO4C/8=;
 b=AJK0IuOLw/ZacxIkYB8GkkycmYdzz33/SPBzVWMQphBvzxULXS2MI58d
 OB4A9lf5wJNmT81NgwqwHMc4Z4bZoeyqQGxVwZrKWiL0cbHcT+GL7sQpE
 RBeq0uaTkz8YFr/hhPQEXJzHna1u8xwsdLJb5h6aW7lcngIkfdCEWEXhy 0=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AFAAD05Bpc/51dJa1kGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQcBAQEBAQGBUgMBAQEBAQsBggOBaCcKg3OVfZgCgXsLAQGEbAIXglQ?=
 =?us-ascii?q?iNQgNAQMBAQIBAQJtKIU9BiMRRRACAQgaAiYCAgIwFRACBAENBYMiggKnZIE?=
 =?us-ascii?q?vhUCEb4ELizQXgUA/gREnDBOCTIUBF4JxMYImAol3lzMKCQKRYBiRWYlIkBM?=
 =?us-ascii?q?CERSBJyECNIFWcBU7KgGCQYIkGo4dQTGNSIEfAQE?=
X-IronPort-AV: E=Sophos;i="5.56,374,1539648000"; d="scan'208";a="215922980"
Received: from rcdn-core-6.cisco.com ([173.37.93.157])
 by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2018 00:44:22 +0000
Received: from XCH-RTP-013.cisco.com (xch-rtp-013.cisco.com [64.101.220.153])
 by rcdn-core-6.cisco.com (8.15.2/8.15.2) with ESMTPS id
 wBK0iM2K007281
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 20 Dec 2018 00:44:22 GMT
Received: from xch-rtp-007.cisco.com (64.101.220.147) by XCH-RTP-013.cisco.com
 (64.101.220.153) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 19 Dec 2018 19:44:21 -0500
Received: from xch-rtp-007.cisco.com ([64.101.220.147]) by
 XCH-RTP-007.cisco.com ([64.101.220.147]) with mapi id 15.00.1395.000; Wed, 19
 Dec 2018 19:44:21 -0500
From: "Shreyas Chandrashekar (shrchand)" <shrchand@cisco.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "Guhan Balasubramanian (gubalasu)" <gubalasu@cisco.com>
Subject: Re: Use MilliAmps for IPMI tool
Thread-Topic: Use MilliAmps for IPMI tool
Thread-Index: AQHUl8ymCQmEMU7mS0eLpjHFq4IuuaWGbkhQgAAqHQA=
Date: Thu, 20 Dec 2018 00:44:21 +0000
Message-ID: <72407329-3C6C-4265-8D57-9A104B66DEE5@cisco.com>
References: <85D37044-F771-4019-A66F-0762AD59BF1F@cisco.com>
 <7E9441B1E5EFFD4681F54958E821699345984003@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345984003@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.b.0.180311
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.24.10.217]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1DD14626465E54E88D491B81CABCE4F@emea.cisco.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Outbound-SMTP-Client: 64.101.220.153, xch-rtp-013.cisco.com
X-Outbound-Node: rcdn-core-6.cisco.com
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
X-List-Received-Date: Thu, 20 Dec 2018 00:54:49 -0000

RWQsDQoNClRoYW5rcyBmb3IgdGhlIHJlc3BvbnNlLiANCkFncmVlZCwgd2UgY2FuIHNldCB0aGUg
dmFsdWUgb2YgTSBhbmQgQiB0byBoYXZlIHRoZSB2YWx1ZXMgZ2l2ZSB1cyBtaWxsaWFtcCBhbmQg
bWlsbGl2b2x0cyByZXNvbHV0aW9uLiBXaWxsIGxvb2sgaW50byB0aGlzIG1vcmUgY2xvc2VseS4N
Cg0KV2UgYXJlIGxvb2tpbmcgYXQgaGF2aW5nIG1pbGxpYW1wIGFuZCBtaWxsaXZvbHRzIHVuaXRz
IGluIHRoZSB1bml0IGNvZGUgdGFibGUuIElzIHRoZXJlIGFueXdheSB0byBnZXQgdGhhdCBzdXBw
b3J0PyBUaGF0IHdheSwgd2Ugd2lsbCBiZSBhYmxlIHRvIGRpc3BsYXkgdGhlIHZhbHVlcyBpbiBt
aWxsaXZvbHRzIGFuZCBtaWxsaWFtcHMuDQoNClJlZ2FyZHMNCg0KVGhhbmtzDQpTaHJleWFzDQoN
Cu+7v09uIDEyLzE5LzE4LCAxMTozMyBBTSwgIlRhbm91cywgRWQiIDxlZC50YW5vdXNAaW50ZWwu
Y29tPiB3cm90ZToNCg0KICAgID5JUE1JIHRvb2wgaXMgYmVpbmcgdXNlZCB0byBwcm9iZSBhbmQg
Z2V0IHRoZSB2YXJpb3VzIHNlbnNvciB2YWx1ZXMgZnJvbSBibWMuIEhvd2V2ZXIsIGFmdGVyIHJl
YWRpbmcgdGhyb3VnaCB0aGUgSVBNSSBzcGVjIHRoZXJlIGlzIG5vIHN1cHBvcnQgZm9yIG1pbGxp
QW1wZXJlcyBvciBtaWxsaVZvbHRzLg0KICAgICANCiAgICBJJ20gbm90IHJlYWxseSBzdXJlIGhv
dyB0byBjYW1lIHRvIHRoaXMgY29uY2x1c2lvbi4gIFllcywgdGhlcmUgaXMgbm8gIm1pbGxpYW1w
IiB1bml0IGluIHRoZSB1bml0IGNvZGVzIHRhYmxlLCBidXQgSSB3b3VsZG4ndCBleHBlY3QgdGhl
cmUgdG8gYmUgZ2l2ZW4gaG93IElQTUkgc2Vuc29yIHNjYWxpbmcgd29ya3MuICBGb3IgbGluZWFy
IHNjYWxpbmcgbW9kZSAod2hpY2ggaXMgYWxsIG9wZW5ibWMgc3VwcG9ydHMgdG9kYXkpIHZhbHVl
IHNjYWxpbmcgaXMgc2V0IGJ5IE0gYW5kIEIgdmFsdWVzIGluIGEgdHlwZSAxIFNEUiByZWNvcmQu
ICBTZXR0aW5nIGFuIE0gdmFsdWUgb2YgMTAwMCBhbmQgYSB1bml0cyBmbGFnIG9mIFZvbHRzIHdv
dWxkIGVmZmVjdGl2ZWx5IGdpdmUgeW91ICJtaWxsaXZvbHRzIiByZXNvbHV0aW9uLg0KICAgIA0K
ICAgIEFub3RoZXIgb3B0aW9uIGhlcmUgd291bGQgYmUgdG8gdXNlIGxvZ2FyaXRobWljIHNjYWxp
bmcsIHdoaWNoIHdvdWxkIGdpdmUgeW91IGJldHRlciByZXNvbHV0aW9uIGluIHRoZSBsb3dlciBl
bmQgb2YgdGhlIHNwZWN0cnVtIChlc3BlY2lhbGx5IHVzZWZ1bCBpbiB0aGUgY2FzZSBvZiBtaWxs
aXZvbHRzKS4gIElmIHRoaXMgaXMgc29tZXRoaW5nIHlvdSdkIGxpa2UgdG8gcHVyc3VlLCB0aGVy
ZSdzIGxpa2VseSBzb21lIHBlb3BsZSBvbiB0aGlzIGxpc3QgdGhhdCBjb3VsZCBwb2ludCB5b3Ug
dG8gd2hlcmUgdGhhdCBjYXBhYmlsaXR5IGNvdWxkIGJlIGFkZGVkLg0KICAgIA0KICAgIFNvbWUg
c2VjdGlvbnMgb2YgdGhlIElQTUkgc3BlYyB0byByZWZlcmVuY2UgZm9yIHRoZSBhYm92ZQ0KICAg
IA0KICAgIDM2LjMgU2Vuc29yIFJlYWRpbmcgQ29udmVyc2lvbiBGb3JtdWxhDQogICAgMzYuNC4y
IFJlc29sdXRpb24uDQogICAgNDMuMSBTRFIgVHlwZSAwMWgsIEZ1bGwgc2Vuc29yIHJlY29yZCwg
Ynl0ZXMgMjU6MjgNCiAgICANCiAgICBUaGVyZSBoYXMgYmVlbiBzb21lIGVmZm9ydCBtYWRlIHRv
IG1ha2UgdGhlc2UgdmFsdWVzIGNhbGN1bGF0ZWQgYXV0b21hdGljYWxseSBiYXNlZCBvbiB0aGUg
bWF4aW11bSBhbmQgbWluaW11bSB2YWx1ZSByZWFkaW5ncyBpbiB0aGUgREJ1cyBpbnRlcmZhY2Us
IHdoaWNoIG1ha2VzIHRoaXMgcHJvY2VzcyBmYXIgbGVzcyBlcnJvciBwcm9uZS4gIElmIHRoaXMg
a2luZCBvZiB0aGluZyBpcyBpbXBvcnRhbnQgdG8geW91LCBJIHdvdWxkIGhpZ2hseSByZWNvbW1l
bmQgcmV2aWV3aW5nIGFuZCBhZGRpbmcgeW91ciBvcGluaW9uIHRvIHRob3NlIHBhdGNoZXMuDQog
ICAgDQogICAgLUVkDQogICAgDQoNCg==
