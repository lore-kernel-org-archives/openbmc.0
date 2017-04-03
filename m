Return-Path: <karthik.t@incedoinc.com>
X-Greylist: delayed 713 seconds by postgrey-1.36 at bilbo;
 Tue, 04 Apr 2017 03:23:11 AEST
Received: from IPout.ibtechnology.com (ipout.ibtechnology.com [14.141.217.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxf7z17GRzDq8M
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 03:23:10 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.36,271,1486405800"; d="scan'208";a="16642065"
Received: from unknown (HELO TS-GGN-HT001.ibtechnology.com) ([10.11.200.225])
 by IPout.ibtechnology.com with ESMTP; 03 Apr 2017 22:40:54 +0530
Received: from TS-GGN-MBX002.ibtechnology.com ([169.254.2.57]) by
 TS-GGN-HT001.ibtechnology.com ([10.11.200.85]) with mapi id 14.03.0123.003;
 Mon, 3 Apr 2017 22:40:54 +0530
From: "Karthik BalaGuru  T" <karthik.t@incedoinc.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC and DHCP server
Thread-Topic: OpenBMC and DHCP server
Thread-Index: AdKsmjakUzkWWxlXQBGpITG8XdLxiw==
Date: Mon, 3 Apr 2017 17:10:53 +0000
Message-ID: <E41D83B2B2E8CB42AC13E92B4C3FABD3B6026B@TS-GGN-MBX002.ibtechnology.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [40.139.113.66]
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Apr 2017 17:23:12 -0000

SGksDQoNCkkgYW0gYW5hbHl6aW5nIGZldyBwYXJ0cyBvZiBPcGVuQk1DIGZvciBhbiBhcmNoaXRl
Y3R1cmUuDQpLaW5kbHkgbGV0IG1lIGtub3cgd2hldGhlciBPcGVuQk1DIG9mIEFTVDEyNTAgYW5k
IEFTVDI1MjAgYWxsb3cgc2V0dGluZyBvZiBESENQIHNlcnZlciBzbyB0aGF0IGl0IGNhbiBzZXJ2
ZSBJUCBhZGRyZXNzZXMgdG8gdGhlIGNvbm5lY3RlZCBjbGllbnRzLg0KDQpUaGFua3MgaW4gYWR2
YW5jZSwNCkthcnRoaWsgQmFsYWd1cnUNCkRpc2NsYWltZXIgOiANClRoaXMgZW1haWwgY29tbXVu
aWNhdGlvbiBtYXkgY29udGFpbiBwcml2aWxlZ2VkIGFuZCBjb25maWRlbnRpYWwgaW5mb3JtYXRp
b24gYW5kIGlzIGludGVuZGVkIGZvciB0aGUgdXNlIG9mIHRoZSBhZGRyZXNzZWUgb25seS4gSWYg
eW91IGFyZSBub3QgYW4gaW50ZW5kZWQgcmVjaXBpZW50IHlvdSBhcmUgcmVxdWVzdGVkIG5vdCB0
byByZXByb2R1Y2UsIGNvcHkgZGlzc2VtaW5hdGUgb3IgaW4gYW55IG1hbm5lciBkaXN0cmlidXRl
IHRoaXMgZW1haWwgY29tbXVuaWNhdGlvbiBhcyB0aGUgc2FtZSBpcyBzdHJpY3RseSBwcm9oaWJp
dGVkLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGVtYWlsIGluIGVycm9yLCBwbGVhc2Ugbm90
aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYnkgcmV0dXJuIGUtbWFpbCBhbmQgZGVsZXRlIHRo
ZSBjb21tdW5pY2F0aW9uIHNlbnQgaW4gZXJyb3IuIEVtYWlsIGNvbW11bmljYXRpb25zIGNhbm5v
dCBiZSBndWFyYW50ZWVkIHRvIGJlIHNlY3VyZSAmIGVycm9yIGZyZWUgYW5kIEluY2VkbyBJbmMu
IGlzIG5vdCBsaWFibGUgZm9yIGFueSBlcnJvcnMgaW4gdGhlIGVtYWlsIGNvbW11bmljYXRpb24g
b3IgZm9yIHRoZSBwcm9wZXIsIHRpbWVseSBhbmQgY29tcGxldGUgdHJhbnNtaXNzaW9uIHRoZXJl
b2YuCg==
