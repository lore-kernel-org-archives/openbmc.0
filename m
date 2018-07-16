Return-Path: <luke_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ThCq3j57zF35b
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 21:35:02 +1000 (AEST)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id w6GBZoQR070670;
 Mon, 16 Jul 2018 19:35:50 +0800 (CST)
 (envelope-from luke_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Mon, 16 Jul
 2018 19:34:48 +0800
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Mon, 16 Jul
 2018 19:35:13 +0800
Received: from TWMBX01.aspeed.com ([fe80::157a:4af5:bbf4:5dbb]) by
 TWMBX01.aspeed.com ([fe80::157a:4af5:bbf4:5dbb%12]) with mapi id
 15.00.0620.020; Mon, 16 Jul 2018 19:35:13 +0800
From: Luke Chen <luke_chen@aspeedtech.com>
To: Avi Fishman <avifishman70@gmail.com>
CC: "akashgj91@gmail.com" <akashgj91@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "eyal.cohen@nuvoton.com"
 <eyal.cohen@nuvoton.com>, "uri.trichter@nuvoton.com"
 <uri.trichter@nuvoton.com>
Subject: Re: KVM Support?
Thread-Topic: KVM Support?
Thread-Index: AQHUHM9OGpUrukXRkUyaR+iL2PZn4qSRLN8AgACLoPk=
Date: Mon, 16 Jul 2018 11:35:12 +0000
Message-ID: <EE49FBFE-567E-4AFA-89AA-3906B5953BDC@aspeedtech.com>
References: <CAE33tLHVuuMgcEQw1xkGP+H1h_Gxq1Vf0Re2SKjVbPhiAgkxNQ@mail.gmail.com>,
 <CAKKbWA7JEMjsJm4W7eY=HaLtsTrh2h1M3YfdH82Fov_G1q37ew@mail.gmail.com>
In-Reply-To: <CAKKbWA7JEMjsJm4W7eY=HaLtsTrh2h1M3YfdH82Fov_G1q37ew@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DKIM-Results: twmbx02.aspeed.com; dkim=none;
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com w6GBZoQR070670
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 11:35:04 -0000

RGVhciBBbGFzaA0KDQpBU1BFRUQgaXMgd29ya2luZyB3aXRoIE9wZW5CTUMgdGVhbSBmb3IgdGhl
IEtWTW9JUCBpbXBsZW1lbnRhdGlvbi4NCg0KVGhhbmtzLg0KDQqxcafaqrogaVBob25lILbHsGUN
Cg0KPiBBdmkgRmlzaG1hbiA8YXZpZmlzaG1hbjcwQGdtYWlsLmNvbT4gqfMgMjAxOKZ+N6TrMTak
6SAxOToxNyC8Z7lEoUcNCj4gDQo+IEhpIEFrYXNoLA0KPiANCj4gV2UgaGF2ZSBmb3IgTnV2b3Rv
biBhIEtWTSBmb3Igb3VyIG5wY203NTAgY2hpcCwgaXQgaXMgYSB2bmNzZXJ2ZXINCj4gd29ya2lu
ZyB1bmRlciBWTkMgUkZCIHByb3RvY29sLg0KPiBXZSBkaWRuJ3QgeWV0IHB1dCBpdCBpbiBPcGVu
Qk1DLCBidXQgd2UgYXJlIGdvaW5nIHRvIGRvIHNvLg0KPiANCj4gUmVnYXJkcywNCj4gQXZpIEZp
c2htYW4NCj4+IE9uIE1vbiwgSnVsIDE2LCAyMDE4IGF0IDk6MzUgQU0gQUtBU0ggRyBKIDxha2Fz
aGdqOTFAZ21haWwuY29tPiB3cm90ZToNCj4+IA0KPj4gSGkgVGVhbSwNCj4+IA0KPj4gUGxlYXNl
IHNvbWVvbmUgc2hhcmUgd2hldGhlciBLZXlib2FyZCBWaWRlbyBNb3VzZSAoS1ZNKSBvdmVyIElQ
IGltcGxlbWVudGF0aW9uIGF2YWlsYWJsZSBpbiBPcGVuQk1DID8NCj4+IA0KPj4gDQo+PiANCj4+
IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4+IA0KPj4gQWthc2gNCg==
