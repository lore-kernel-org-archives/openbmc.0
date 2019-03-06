Return-Path: <prvs=961ff1f93=Tony.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=961ff1f93=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44Dpnr5J6BzDqC7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 20:47:07 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 06 Mar 2019 17:47:04 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1531.3; Wed, 6 Mar 2019
 17:47:02 +0800
Received: from mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381]) by
 mailbx08.quanta.corp ([fe80::c92c:150b:530e:b381%11]) with mapi id
 15.01.1531.004; Wed, 6 Mar 2019 17:47:02 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: How to upload proposal and code for specifying and customizing
 projects?
Thread-Topic: How to upload proposal and code for specifying and customizing
 projects?
Thread-Index: AdTTIPIRPhO1APIASHuF/QKTlnZP6gA3/52Q
Date: Wed, 6 Mar 2019 09:47:02 +0000
Message-ID: <68bb4c4e34d94cd0b34016f178053799@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24470.002
x-tm-as-result: No--4.928300-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-780030-711953-863519-7
 04195-700107-139006-700724-106660-707825-701604-709584-704156-700040-148004
 -148133-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="big5"
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
X-List-Received-Date: Wed, 06 Mar 2019 09:47:13 -0000

SGkgQnJhZCwNCg0KSSBhcG9sb2dpemUgZm9yIHRoZSBjb25mdXNpb24gaW4gcHJldmlvdXMgbWFp
bC4NCkNvdWxkIHlvdSBoZWxwIGNyZWF0ZSBhIHJlcG9zaXRvcnkgZm9yIFF1YW50YSBzcGVjaWZp
YyBkYnVzIGludGVyZmFjZXMsIG5hbWVkICJxdWFudGEtZGJ1cy1pbnRlcmZhY2VzIj8NCg0KVGhh
bmtzDQpCZXN0IFJlZ2FyZHMsDQpUb255DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBUb255IExlZSAop/Wk5bRJKSANClNlbnQ6IFR1ZXNkYXksIE1hcmNoIDUsIDIwMTkgMzow
NiBQTQ0KVG86ICdicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20nIDxicmFkbGV5YkBmdXp6aWVz
cXVpcnJlbC5jb20+DQpDYzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBIb3cg
dG8gdXBsb2FkIHByb3Bvc2FsIGFuZCBjb2RlIGZvciBzcGVjaWZ5aW5nIGFuZCBjdXN0b21pemlu
ZyBwcm9qZWN0cz8NCg0KSGkgQnJhZCwNCg0KSSBoYXZlIHR3byBuZXcgcGFja2FnZXMgInBob3Nw
aG9yLW52bWUiIGFuZCAicXVhbnRhLWRidXMtaW50ZXJmYWNlcyIgZm9yIHNwZWNpZnlpbmcgYW5k
IGN1c3RvbWl6aW5nIHByb2plY3RzLg0KVGhlcmUgd2FzIGEgc2VydmljZSBwb29saW5nIHN0YXR1
cyBvZiBOVk1lIGRldmljZXMgaW4gIiBwaG9zcGhvci1udm1lICIgYW5kIHNldmVyYWwgZC1idXMg
aW50ZXJmYWNlcyBmb3IgUXVhbnRhIGluICJxdWFudGEtZGJ1cy1pbnRlcmZhY2VzIi4NCiANCjEu
IElzIGl0IHdpbGwgYmUgcHV0IGludG8gYSBuZXcgcmVwb3NpdG9yeSBvciBwdXQgaXQgdW5kZXIg
dGhlIG1ldGEtcXVhbnRhPw0KMi4gQXMgZm9yIHRoZSBwcm9wb3NhbCwgaXMgaXQgc3RpbGwgbmVl
ZCB0byBjb21taXQgdG8gZ2Vycml0IHVuZGVyIG9wZW5ibWMvZG9jcyA/DQoNClRoYW5rcw0KQmVz
dCBSZWdhcmRzLA0KVG9ueQ0KDQo=
