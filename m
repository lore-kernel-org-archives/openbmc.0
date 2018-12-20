Return-Path: <shrchand@cisco.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.142.91; helo=alln-iport-4.cisco.com;
 envelope-from=shrchand@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=cisco.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="cKTRbNmV"; 
 dkim-atps=neutral
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LKTp6yZQzDr0R
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 05:07:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1422; q=dns/txt; s=iport;
 t=1545329231; x=1546538831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2eijEMOs4cx21XQVEhImzeKxwi/bMFwkA9mE7vR60Hc=;
 b=cKTRbNmVNmqdpY7DhP92jWIjlMCjepSXBqhu3TBrdQI/bGQPbqf7iSha
 xJzEW8GqEZbpRrhDYnBQGCm/fk6RAou9eeC8qyJeZfzr7cppZ0Sj3Y3xu
 54A23N9r+d+aiT9UQ/T7rcDPgzXh83Y5mGn5Y4QGVgZubaTF3LRCufBnR g=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AIAAAp2Rtc/5RdJa1lGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQcBAQEBAQGBUQQBAQEBAQsBggOBaCcKg3OIGYt7gg2DRZQYgXsLAQG?=
 =?us-ascii?q?EbAIXglUiNAkNAQMBAQIBAQJtKIU9AQQBIxFFEAIBCBoCJgICAjAVEAIEAQ0?=
 =?us-ascii?q?FgyKBeginX4EvhUCEZoELizQXgUA/gREnH4JMhQGDCIJXAqEzCgkCkWMYkV2?=
 =?us-ascii?q?JTZAZAhEUgScfOIFWcBVlAYJBkFtBMY1IgR8BAQ?=
X-IronPort-AV: E=Sophos;i="5.56,378,1539648000"; d="scan'208";a="215973050"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
 by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2018 18:07:07 +0000
Received: from XCH-RTP-013.cisco.com (xch-rtp-013.cisco.com [64.101.220.153])
 by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id
 wBKI76Ql032005
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
 Thu, 20 Dec 2018 18:07:07 GMT
Received: from xch-rtp-007.cisco.com (64.101.220.147) by XCH-RTP-013.cisco.com
 (64.101.220.153) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 20 Dec 2018 13:07:06 -0500
Received: from xch-rtp-007.cisco.com ([64.101.220.147]) by
 XCH-RTP-007.cisco.com ([64.101.220.147]) with mapi id 15.00.1395.000; Thu, 20
 Dec 2018 13:07:05 -0500
From: "Shreyas Chandrashekar (shrchand)" <shrchand@cisco.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "Guhan Balasubramanian (gubalasu)" <gubalasu@cisco.com>
Subject: Re: Use MilliAmps for IPMI tool
Thread-Topic: Use MilliAmps for IPMI tool
Thread-Index: AQHUl8ymCQmEMU7mS0eLpjHFq4IuuaWGbkhQgAAqHQCAADMgIIAA8DeA
Date: Thu, 20 Dec 2018 18:07:05 +0000
Message-ID: <7D4EEED3-BA50-467B-96DC-984898942787@cisco.com>
References: <85D37044-F771-4019-A66F-0762AD59BF1F@cisco.com>
 <7E9441B1E5EFFD4681F54958E821699345984003@ORSMSX114.amr.corp.intel.com>
 <72407329-3C6C-4265-8D57-9A104B66DEE5@cisco.com>
 <7E9441B1E5EFFD4681F54958E8216993459845B3@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E8216993459845B3@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.b.0.180311
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.154.161.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C84469442D48142A6C698B3AD91C323@emea.cisco.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Outbound-SMTP-Client: 64.101.220.153, xch-rtp-013.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
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
X-List-Received-Date: Thu, 20 Dec 2018 18:07:12 -0000

QXMgSSBtZW50aW9uZWQsIHdlIGhhdmUgYWxsIHRoZSByZWFkaW5ncyBpbiBtaWxsaWFtcHMvbWls
bGl2b2x0cyBieSBkZWZhdWx0LiBBbmQgdGhlIGNvbnN1bWVyIG9mIHRoZSBJUE1JIHRvb2wgbWFr
ZXMgYWxsIHRoZSBjYWxjdWxhdGlvbnMgYmFzZWQgb24gbWlsbGlhbXBzIHNpbmNlIHRoYXQgaXMg
dGhlIHVuaXQgb2YgdGhlIHJlYWRpbmdzLiBXZSB3ZXJlIHdvbmRlcmluZyBpZiB0aGVyZSB3YXMg
YSB3YXkgdG8gaGF2ZSBtaWxsaWFtcC9taWxsaXZvbHRzIGluIHRoZSB1bml0IGNvZGUgdGFibGUg
aXQgd291bGQgYmUgY29uc2lzdGVudC4gDQpJZiBub3QsIHdlIHdpbGwganVzdCBnbyB3aXRoIGNo
YW5naW5nIHRoZW0gdG8gQW1wcyBhbmQgZG8gdGhlIGNoYW5nZXMgYWNjb3JkaW5nbHkuDQoNClRo
YW5rcyBhIGxvdCBmb3IgdGhlIHJlc3BvbnNlcyBFZC4gQXBwcmVjaWF0ZSBpdCENCg0KDQpSZWdh
cmRzDQoNClNocmV5YXMgDQrvu79PbiAxMi8xOS8xOCwgNTowMSBQTSwgIlRhbm91cywgRWQiIDxl
ZC50YW5vdXNAaW50ZWwuY29tPiB3cm90ZToNCg0KICAgID4gDQogICAgPiBXZSBhcmUgbG9va2lu
ZyBhdCBoYXZpbmcgbWlsbGlhbXAgYW5kIG1pbGxpdm9sdHMgdW5pdHMgaW4gdGhlIHVuaXQgY29k
ZSB0YWJsZS4gSXMNCiAgICA+IHRoZXJlIGFueXdheSB0byBnZXQgdGhhdCBzdXBwb3J0PyBUaGF0
IHdheSwgd2Ugd2lsbCBiZSBhYmxlIHRvIGRpc3BsYXkgdGhlDQogICAgPiB2YWx1ZXMgaW4gbWls
bGl2b2x0cyBhbmQgbWlsbGlhbXBzLg0KICAgID4gDQogICAgDQogICAgV2hhdCBwcm9ibGVtIGFy
ZSB5b3UgdHJ5aW5nIHRvIHNvbHZlIHdpdGggdGhhdCBjaGFuZ2U/ICBUaGUgSVBNSSBzcGVjIGlz
IG1vcmUgcmlnaWQgdGhhbiBpdCBvbmNlIHdhcywgYW5kIGZvciBhIHVzZSBjYXNlIHRoYXQgaXMg
YWxyZWFkeSBjb3ZlcmVkLCBJIHdvdWxkIGJlIHN1cnByaXNlZCBpZiB5b3UgY291bGQgZ2V0IGl0
IGFkZGVkLCBhbmQgZ2V0IGFsbCB0aGUgdG9vbHMgYW5kIGJpbmRpbmdzIHRvIGFkZCBzdXBwb3J0
Lg0KICAgIA0KDQo=
