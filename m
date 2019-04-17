Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.7; helo=cpsmtpb-ews04.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="EqUvc9qC"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews04.kpnxchange.com (cpsmtpb-ews04.kpnxchange.com
 [213.75.39.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 44kjfl3gVkzDq67
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 23:25:49 +1000 (AEST)
Received: from cpsps-ews29.kpnxchange.com ([10.94.84.195]) by
 cpsmtpb-ews04.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Wed, 17 Apr 2019 15:25:43 +0200
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=dcxRIkfe c=1 sm=1 tr=0 cx=a_idp_e
 a=YnLMpE5S06+Zisl5ga1zfg==:117 a=YnLMpE5S06+Zisl5ga1zfg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=pGLkceISAAAA:8 a=X5F7dNyOAAAA:8
 a=voM4FWlXAAAA:8 a=8pif782wAAAA:8 a=FYtOn5V5AAAA:8
 a=eUB6Skx6gXdoy8sm7OEA:9 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22
 a=IC2XNlieTeVoXbcui8wp:22 a=8KC0XMfIMpykJuR_t2TE:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.46]) by cpsps-ews29.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 17 Apr 2019 15:25:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=rwvI3PxKJMK5h+ld3wRSCaiKy7a8biD89apJrhtJlBM=;
 b=EqUvc9qCPz/yGlOQUUpon6I2spvLjFPxD3le7+k/fPH4RIitrdNSaCgsbQmZkNFwJtbpiyLHyPi1+
 Yyt786yvEasgDfeoskT5iK4gbmdkpRF3+yYGn4Z5Jf55Muao+D82KdUonv15nbTbCo+IPSuWSutIY2
 ZjJWQHB9whOcMOPw=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 4c871215-6114-11e9-b931-005056ab7584;
 Wed, 17 Apr 2019 15:25:42 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Wed, 17 Apr
 2019 15:25:15 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Wed, 17 Apr 2019 15:25:03 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Kurt Taylor <kurt.r.taylor@gmail.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: which licenses are allowed for OpenBMC projects
Thread-Topic: which licenses are allowed for OpenBMC projects
Thread-Index: AdTzcAvehfjbpZNJRdCoEuf1eymngQAPi1SAAFyZL/A=
Date: Wed, 17 Apr 2019 13:25:02 +0000
Message-ID: <82c4785e20614f5bb6831cb1ea9ad4b3@Eltsrv03.Eltan.local>
References: <cfdea58494de44aa8e30b18799b24aa3@Eltsrv03.Eltan.local>
 <CAG5Oiwj5a15Bm6i9SzJe-_zPO=9KRJfMdqDEopxznqj=UQ49fA@mail.gmail.com>
In-Reply-To: <CAG5Oiwj5a15Bm6i9SzJe-_zPO=9KRJfMdqDEopxznqj=UQ49fA@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 17 Apr 2019 13:25:42.0785 (UTC)
 FILETIME=[0E935710:01D4F521]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Wed, 17 Apr 2019 13:25:55 -0000

SGVsbG8gS3VydCwNCg0KSSBndWVzcyBJJ2xsIGhhdmUgdG8gZGl2ZSBpbiB0byBpdCBhIGJpdCBk
ZWVwZXIuDQoNCkJhc2ljYWxseSB3ZSBoYXZlIHR3byBzaXR1YXRpb25zOg0KMSkgV2UgY3JlYXRl
IGEgY3VzdG9tIGxheWVyIHRoYXQgaXMgdW5kZXIgQlNEIG9yIGEgY3VzdG9tIGxpY2Vuc2UgKG5v
dCBHUEwyKQ0KMikgSW4gYSBsYXllciB3ZSBwdWxsIGluIGEgcmVwb3NpdG9yeSB0aGF0IGVpdGhl
ciBwcm92aWRlIGNvZGUgdGhhdCBpcyBCU0Qgb3IgY3VzdG9tIGxpY2Vuc2VkIG9yIGV2ZW4gYmlu
YXJ5IGJsb2JzLg0KDQpCZXN0IFJlZ2FyZHMsDQpXaW0gVmVydm9vcm4NCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3VydCBUYXlsb3IgW21haWx0bzprdXJ0LnIudGF5bG9y
QGdtYWlsLmNvbV0gDQpTZW50OiBNb25kYXksIEFwcmlsIDE1LCAyMDE5IDk6MTEgUE0NClRvOiBX
aW0gVmVydm9vcm4gPHd2ZXJ2b29ybkBlbHRhbi5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnDQpTdWJqZWN0OiBSZTogd2hpY2ggbGljZW5zZXMgYXJlIGFsbG93ZWQgZm9yIE9wZW5C
TUMgcHJvamVjdHMNCg0KVGhlIGJlc3QgYW5zd2VyIGlzOiBpdCBkZXBlbmRzLiBJIHdvdWxkIHJl
Y29tbWVuZCBjaGVja2luZyB3aXRoIHlvdXIgbGVnYWwgdGVhbSBvbiB3aGF0IHlvdSB3aWxsIGJl
IGFibGUgdG8gZG8gZm9yIHlvdXIgY3VzdG9tIHByb2R1Y3QgaW1wbGVtZW50YXRpb24uDQoNCkRp
c2NsYWltZXI6IEkgYW0gbm90IGEgbGF3eWVyLCBidXQgZ2VuZXJhbGx5IHNwZWFraW5nLCB5b3Ug
Y2FuIHB1bGwgaW4gb3RoZXIgInBhY2thZ2VzIiB3aXRob3V0IHdvcnJ5IGFib3V0IHRoZW0gYmVp
bmcgdmlyYWwgaW5mZWN0ZWQuIFRoZSB0ZXJtICJwYXJ0cyIgY2FuIG1lYW4gbWFueSB0aGluZ3Ms
IHlvdSB3aWxsIG5lZWQgdG8gZmlndXJlIG91dCB3aGV0aGVyIGp1c3QgY29kZSBpcyBiZWluZyBw
dWxsZWQgaW50byBhIGV4aXN0aW5nIHRyZWUgd2l0aCBhIGRpZmZlcmVudCBsaWNlbnNlLCBvciBp
ZiB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgc2hpcHBpbmcgYW4gYWRkaXRpb25hbCBwYWNrYWdlIHdp
dGggeW91ciBwcm9kdWN0Lg0KDQpPcGVuIHNvdXJjZSBsaWNlbnNlcyBhbmQgdGhlaXIgdmlyYWwg
ZWZmZWN0czoNCmh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1ZpcmFsX2xpY2Vuc2UNCmh0
dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1Blcm1pc3NpdmVfc29mdHdhcmVfbGljZW5zZQ0K
aHR0cHM6Ly93d3cudG9wdGFsLmNvbS9vcGVuLXNvdXJjZS9kZXZlbG9wZXJzLWd1aWRlLXRvLW9w
ZW4tc291cmNlLWxpY2Vuc2VzDQoNCkt1cnQgVGF5bG9yIChrcnRheWxvcikNCg0KT24gTW9uLCBB
cHIgMTUsIDIwMTkgYXQgNDo1MSBBTSBXaW0gVmVydm9vcm4gPHd2ZXJ2b29ybkBlbHRhbi5jb20+
IHdyb3RlOg0KPg0KPiBIZWxsbywNCj4NCj4NCj4NCj4gSSBoYXZlIGEgbm9uLXRlY2huaWNhbCBx
dWVzdGlvbiBhYm91dCB0aGUgT3BlbkJNQyBwcm9qZWN0Lg0KPg0KPg0KPg0KPiBJZiB3ZSBjcmVh
dGUgYSBjdXN0b20gaW1wbGVtZW50YXRpb24gZm9yIGFuIE9wZW5CTUMgcHJvamVjdCB3aGljaCB3
ZSBkZWxpdmVyIHRvIGEgY3VzdG9tZXIgY2FuIHdlIGluY2x1ZGUgcGFydHMgdGhhdCBhcmUgdW5k
ZXIgYSBCU0Qgb3IgYSBwcm9wcmlldGFyeSBsaWNlbnNlPyBJbiB0aGlzIGNhc2UgdGhlIFlvY3Rv
IGZpbGVzIHdvdWxkIGJlIGluIHRoZSB0cmVlIGJ1dCB0aGUgY29kZSBwdWxsZWQgaW4gY291bGQg
YmUgYmluYXJ5IG9yIGEgQlNEIHJlcG9zaXRvcnk/DQo+DQo+DQo+DQo+IEZvciB1cyBpdOKAmXMg
aW1wb3J0YW50IHRvIG1ha2Ugc3VyZSB3ZSB1bmRlcnN0YW5kIGNvcnJlY3RseSB3aGF0IHRoZSBw
b3NzaWJpbGl0aWVzIGFyZS4NCj4NCj4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPg0KPg0KPiBXaW0g
VmVydm9vcm4NCj4NCj4NCg0KDQo=
