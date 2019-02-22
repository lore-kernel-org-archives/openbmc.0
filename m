Return-Path: <prvs=9492bb00f=P.K.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=9492bb00f=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 640 seconds by postgrey-1.36 at bilbo;
 Fri, 22 Feb 2019 14:13:54 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 445GdZ34J2zDqS4
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 14:13:53 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 22 Feb 2019 11:03:11 +0800
Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Fri, 22 Feb
 2019 11:03:09 +0800
Received: from mailbx07.quanta.corp ([fe80::457c:729c:24f0:9cae]) by
 mailbx07.quanta.corp ([fe80::457c:729c:24f0:9cae%4]) with mapi id
 15.01.1531.004; Fri, 22 Feb 2019 11:03:09 +0800
From: =?big5?B?UC4gSy4gTGVlICin9axmvGUp?= <P.K.Lee@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: To restrict IPMI commands
Thread-Topic: To restrict IPMI commands
Thread-Index: AQHUylskB3vWoq2pVk61p72AMw6zxg==
Date: Fri, 22 Feb 2019 03:03:09 +0000
Message-ID: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24446.003
x-tm-as-result: No--4.075500-0.000000-31
x-tm-as-matchedid: 140026-701625-704425-700685-702050-707451-702358-700994-7
 09908-709584-704421-708797-700107-148004-148133-10019-41000-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
Content-ID: <27A287C68E22EB41AAB332B4D7D2EAA6@quantatw.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 22 Feb 2019 03:13:55 -0000

SGksDQoNCkRvZXMgYW55b25lIGtub3cgaG93IHRvIHJlc3RyaWN0IHRoZSBJUE1JIGNvbW1hbmQg
ZXhlY3V0aW9uIHZpYSBvdXQtb2YtYmFuZD8NCg0KSSBrbm93IHRoYXQgdGhlIElQTUkgY29tbWFu
ZHMgdmlhIGluLWJhbmQgY2FuIHVzZSB0aGUgd2hpdGVsaXN0IG1lY2hhbmlzbSB0byByZXN0cmlj
dCB3aGV0aGVyIHRoZSBjb21tYW5kcyBjYW4gYWNjZXNzIHRoZSBCTUMsIGJ1dCBJIGNhbid0IHVz
ZSB0aGlzIGZvciB0aGUgb3V0LW9mLWJhbmQuDQoNCklmIHRoZXJlIGlzIGN1cnJlbnRseSBubyBy
ZXN0cmljdGlvbiBtZWNoYW5pc20gZm9yIHRoZSBvdXQtb2YtYmFuZCwgSSB3aWxsIHRyeSB0byBh
ZGQgdGhlIHdoaXRlbGlzdCBmdW5jdGlvbiBmb3IgaXQganVzdCBsaWtlIHRoZSBpbi1iYW5kLg0K
DQpUaGFua3MsDQoNClAuIEsu
