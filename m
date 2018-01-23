Return-Path: <sachnaik@cisco.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.142.92; helo=alln-iport-5.cisco.com;
 envelope-from=sachnaik@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="a+hhyizW"; 
 dkim-atps=neutral
X-Greylist: delayed 612 seconds by postgrey-1.36 at bilbo;
 Tue, 23 Jan 2018 18:43:31 AEDT
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zQgJz2VLszDr20
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 18:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1048; q=dns/txt; s=iport;
 t=1516693411; x=1517903011;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=3JlVESBghEAuBqv28GitXCpK9C8cTTL5x6Xy6HGFJdk=;
 b=a+hhyizWb/km3UkzrH7qy3lvn29hV8eMGAZvih/E/qESKE4m3qaHgqHc
 GWYtPJlM2U/r2jVv9C4vLMuwK6VvxDzJwQIm+wcj4zP4T5esE6XX9zKeG
 3ZF5Pqb8YVQujtOQTn21BVh34e4A3ay0dBwqFx4BT0/Q97DlJy7U2Idot M=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B2AwCN5GZa/49dJa1eGQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcBAQEBAYNCgVoug1aZCplAghcKhVeEVlYWAQEBAQEBAQEBax0LhU0RVwE?=
 =?us-ascii?q?iAiYCBDAVEgSKSLJngieKPQEBAQEBBQEBAQEBAQEBIIEPgzqCFYFXghGLPjGCN?=
 =?us-ascii?q?AWjfQKCApNZlB+XIQIRGQGBOwEmAy+BUHAVZwGCAIRWik+BFwEBAQ?=
X-IronPort-AV: E=Sophos;i="5.46,400,1511827200"; d="scan'208";a="59741643"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2018 07:33:16 +0000
Received: from XCH-RTP-020.cisco.com (xch-rtp-020.cisco.com [64.101.220.160])
 by rcdn-core-7.cisco.com (8.14.5/8.14.5) with ESMTP id w0N7XF3Q007619
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jan 2018 07:33:16 GMT
Received: from xch-rtp-019.cisco.com (64.101.220.159) by XCH-RTP-020.cisco.com
 (64.101.220.160) with Microsoft SMTP Server (TLS) id 15.0.1320.4;
 Tue, 23 Jan 2018 02:33:15 -0500
Received: from xch-rtp-019.cisco.com ([64.101.220.159]) by
 XCH-RTP-019.cisco.com ([64.101.220.159]) with mapi id 15.00.1320.000; Tue, 23
 Jan 2018 02:33:15 -0500
From: "Sachin Naik (sachnaik)" <sachnaik@cisco.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Porting hwmon sensors to openBMC
Thread-Topic: Porting hwmon sensors to openBMC
Thread-Index: AQHTlBxuKmJ99FNq7kGo+Rq4yMaexg==
Date: Tue, 23 Jan 2018 07:33:15 +0000
Message-ID: <32335E8B-FAAF-4B96-9B2E-57FF1FAFDD1A@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/f.1f.0.170216
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.82.183.182]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB6B8BDDE531874888B7C8DB35E5B1A4@emea.cisco.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jan 2018 15:12:58 +1100
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jan 2018 07:43:32 -0000

SGkgQWxsDQoNCkkgYW0gcG9ydGluZyBhIG5ldyBib2FyZCB0byBvcGVuYm1jLiANCkkgaGF2ZSBx
dWVzdGlvbiBvbiBtYXBwaW5nIGh3bW9uIHR5cGUgc2Vuc29ycyB0byBEYnVzIA0KDQpTbyBmYXIg
SSBoYXZlIGNyZWF0ZWQgbWFjaGluZSBsYXllciBhbmQgYWRkZWQgVS1ib290IGNvbmZpZywgS2Vy
bmVsIGNvbmZpZyBhbmQgZGV2aWNlIHRyZWUuIEluIGtlcm5lbCBjb25maWcgSSBoYXZlIGVuYWJs
ZWQgbG03NSBod21vbiBkcml2ZXIgZm9yIExNNzUgdGVtcGVyYXR1cmUgZGV2aWNlLiBDb3JyZXNw
b25kaW5nIGVudHJ5IGFkZGVkIGluIGRldmljZSB0cmVlLg0KDQpSaWdodCBub3cgSSBoYXZlIGNy
ZWF0ZWQgaHdtb24gdGVtcGVyYXR1cmUgc2Vuc29ycyBlbnRyeSBpbiBvdXIgbWFjaGluZSBsYXll
ciBieSBleHRlbmRpbmcgcmVjaXBlcy1waG9zcGhvci9zZW5zb3JzL3Bob3NwaG9yLWh3bW9uJS5i
YmFwcGVuZCANCmFuZCBjcmVhdGVkIGNvbmYgZmlsZSB3aXRoIHRlbXBlcmF0dXJlIHNlbnNvcnMg
bGFiZWwuDQoNCk5vdyBteSBxdWVzdGlvbiBpcyBob3cgZG8gaW1wbGVtZW50L21hcCBkYnVzIHRl
bXBlcmF0dXJlIHNlbnNvciB2YWx1ZSBpbnRlcmZhY2UgdG8gb3VyIGh3bW9uIHRlbXBlcmF0dXJl
IHNlbnNvcnM/IElzIGFib3ZlIGltcGxlbWVudGF0aW9uIGlzIGVub3VnaCBvciBpdCByZXF1aXJl
cw0KU29tZSBtYXBwaW5nIGZvciBkYnVzIHRvIGh3bW9uIGluc3RhbmNlPw0KDQpUaGFua3MgYW5k
IHJlZ2FyZHMNClNhY2hpbg0KDQoNCg==
