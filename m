Return-Path: <prvs=8758f9fd9=P.K.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=8758f9fd9=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 659 seconds by postgrey-1.36 at bilbo;
 Mon, 10 Dec 2018 15:14:17 AEDT
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 43CqTP3jHbzDqVx
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 15:14:16 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx01.quantatw.com with ESMTP; 10 Dec 2018 12:03:14 +0800
Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Mon, 10 Dec
 2018 12:03:13 +0800
Received: from mailbx07.quanta.corp ([fe80::457c:729c:24f0:9cae]) by
 mailbx07.quanta.corp ([fe80::457c:729c:24f0:9cae%4]) with mapi id
 15.01.1531.004; Mon, 10 Dec 2018 12:03:13 +0800
From: =?big5?B?UC4gSy4gTGVlICin9axmvGUp?= <P.K.Lee@quantatw.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
CC: "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: The ipmid failed to start
Thread-Topic: The ipmid failed to start
Thread-Index: AQHUkD1FYmX9J3uc2U2Ls0/K9jJbAw==
Date: Mon, 10 Dec 2018 04:03:13 +0000
Message-ID: <16DD5F49-0911-4513-B01B-B8B8BAADFFAB@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.100.1062-23468.000
x-tm-as-result: No--9.412900-0.000000-31
x-tm-as-matchedid: 140026-701625-704425-700685-705861-705178-701253-139504-7
 08752-106420-703096-709584-701583-703330-701604-700756-700700-700387-703747
 -148004-148133-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
Content-ID: <7E6F8EE25D0E4B409017ECC94BE48906@quantatw.com>
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
X-List-Received-Date: Mon, 10 Dec 2018 04:14:18 -0000

SGkgQnJhZCwNCg0KSSBzYXcgdGhlIGlzc3VlLCB3aGljaCBpcyAicmVjaXBlcy1waG9zcGhvcjog
Rml4IHN5c3RlbWQgdW5pdCBkZXBlbmRlbmNlcyBvZiBpcG1pZCwgbWJveGQiIGFwcGVuZGluZyAi
UmVxdWlyZXM9b3JnLm9wZW5ibWMuSG9zdElwbWkuc2VydmljZSIgYW5kICJBZnRlb3JnLm9wZW5i
bWMuSG9zdElwbWkuc2VydmljZSIsIHlvdSBtZXJnZWQgb24gTm92IDI5Lg0KDQpBZnRlciB0aGF0
LCB0aGUgaXBtaWQgZmFpbGVkIHRvIHN0YXJ0Lg0KDQpCZWNhdXNlIHRoZSBmaWxlIG1ldGEtcGhv
c3Bob3IvcmVjaXBlcy1waG9zcGhvci9pcG1pL3Bob3NwaG9yLWlwbWkta2NzL29yZy5vcGVuYm1j
Lkhvc3RJcG1pLnNlcnZpY2UgYWxyZWFkeSBpbmNsdWRlZCAiQWZ0ZXI9cGhvc3Bob3ItaXBtaS1o
b3N0LnNlcnZpY2UiIGJlZm9yZSwgaXQgY2F1c2VkIHR3byBzZXJ2aWNlcyB3YWl0aW5nIGZvciBl
YWNoIG90aGVyLg0KDQpJZiB0aGUgIlJlcXVpcmVzPW9yZy5vcGVuYm1jLkhvc3RJcG1pLnNlcnZp
Y2UiIGFuZCAiQWZ0ZW9yZy5vcGVuYm1jLkhvc3RJcG1pLnNlcnZpY2UiIGFyZSByZW1vdmVkIGlu
IHRoZSBtZXRhLXBob3NwaG9yL3JlY2lwZXMtcGhvc3Bob3IvaXBtaS9waG9zcGhvci1pcG1pLWhv
c3QvcGhvc3Bob3ItaXBtaS1ob3N0LnNlcnZpY2Ugb3IgdGhlICJBZnRlcj1waG9zcGhvci1pcG1p
LWhvc3Quc2VydmljZSIgaXMgcmVtb3ZlZCBpbiB0aGUgbWV0YS1waG9zcGhvci9yZWNpcGVzLXBo
b3NwaG9yL2lwbWkvcGhvc3Bob3ItaXBtaS1rY3Mvb3JnLm9wZW5ibWMuSG9zdElwbWkuc2Vydmlj
ZSwgdGhlIGlwbWlkIHdpbGwgc3RhcnQgbm9ybWFsbHkuDQoNCkkgd29uZGVyIGlmIHRoZXJlIGlz
IGEgYmV0dGVyIHdheSB0byBnbyBhYm91dCBpdC4NCg0KQnkgdGhlIHdheSwgYWZ0ZXIgSSBwdXNo
ZWQgdGhlIGNvZGUgdG8gdGhlIEdlcnJpdCwgIkplbmtpbnMgUGF0Y2ggU2V0IDE6IFVzZXIgbm90
IGFwcHJvdmVkLCBzZWUgYWRtaW4sIG5vIENJIiBpdCBzaG93ZWQuIEhvdyBjYW4gSSBzb2x2ZSB0
aGlzIHByb2JsZW0/DQoNClNpbmNlcmVseSwNClAuIEsuIExlZQ==
