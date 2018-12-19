Return-Path: <shrchand@cisco.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cisco.com
 (client-ip=173.37.86.77; helo=rcdn-iport-6.cisco.com;
 envelope-from=shrchand@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=cisco.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.b="dk4aJP0y"; 
 dkim-atps=neutral
X-Greylist: delayed 722 seconds by postgrey-1.36 at bilbo;
 Thu, 20 Dec 2018 06:09:24 AEDT
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 (using TLSv1.2 with cipher DHE-RSA-SEED-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Kkw43XwLzDqp5
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 06:09:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=4970; q=dns/txt; s=iport;
 t=1545246564; x=1546456164;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=9+gDOVuLK7xLVRtSqnqbwQWNpql3J6ZKFwQplch7p4E=;
 b=dk4aJP0y16JtvNRdxLAP+nMnUemunKFJFZNFJEAuMlXD3zF2UAq/f/+k
 gaHdKg+fXumvzqw1zcYS0RUUkW8UcFv1FFILvTw5qKl2W0lTApUHmf7aF
 OrU+uEehR0AMfaob9EOAPaxUcOki6HHdILnGwGXjVRfiNkdkdFE6WmE2r o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AWAAAylBpc/5pdJa1kGgEBAQEBAgE?=
 =?us-ascii?q?BAQEHAgEBAQGBVAIBAQEBCwGBDXZmgQIxg3OUFYFokieHVgsBAYRsGYJUIjc?=
 =?us-ascii?q?GDQEDAQECAQECbR0LhWZWEgEMPgIEMCcEDoMnAYEdZKgfgS+FQIRxjD8XgUA?=
 =?us-ascii?q?/gREnDBOKVTGCJgKPQIZXixMKCQKRYBiRWYlIkBMCERSBJzUiKIEucBVlAYJ?=
 =?us-ascii?q?CkFpBjXmBHwEB?=
X-IronPort-AV: E=Sophos;i="5.56,373,1539648000"; 
 d="scan'208,217";a="497443674"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
 by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2018 18:57:13 +0000
Received: from XCH-RTP-015.cisco.com (xch-rtp-015.cisco.com [64.101.220.155])
 by rcdn-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id
 wBJIvCYg026918
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 18:57:13 GMT
Received: from xch-rtp-007.cisco.com (64.101.220.147) by XCH-RTP-015.cisco.com
 (64.101.220.155) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 19 Dec 2018 13:57:12 -0500
Received: from xch-rtp-007.cisco.com ([64.101.220.147]) by
 XCH-RTP-007.cisco.com ([64.101.220.147]) with mapi id 15.00.1395.000; Wed, 19
 Dec 2018 13:57:11 -0500
From: "Shreyas Chandrashekar (shrchand)" <shrchand@cisco.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: "Guhan Balasubramanian (gubalasu)" <gubalasu@cisco.com>
Subject: Use MilliAmps for IPMI tool
Thread-Topic: Use MilliAmps for IPMI tool
Thread-Index: AQHUl8ymCQmEMU7mS0eLpjHFq4IuuQ==
Date: Wed, 19 Dec 2018 18:57:11 +0000
Message-ID: <85D37044-F771-4019-A66F-0762AD59BF1F@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.b.0.180311
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.154.161.147]
Content-Type: multipart/alternative;
 boundary="_000_85D37044F7714019A66F0762AD59BF1Fciscocom_"
MIME-Version: 1.0
X-Outbound-SMTP-Client: 64.101.220.155, xch-rtp-015.cisco.com
X-Outbound-Node: rcdn-core-3.cisco.com
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
X-List-Received-Date: Wed, 19 Dec 2018 19:09:26 -0000

--_000_85D37044F7714019A66F0762AD59BF1Fciscocom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCklQTUkgdG9vbCBpcyBiZWluZyB1c2VkIHRvIHByb2JlIGFuZCBnZXQgdGhlIHZhcmlv
dXMgc2Vuc29yIHZhbHVlcyBmcm9tIGJtYy4gSG93ZXZlciwgYWZ0ZXIgcmVhZGluZyB0aHJvdWdo
IHRoZSBJUE1JIHNwZWMgdGhlcmUgaXMgbm8gc3VwcG9ydCBmb3IgbWlsbGlBbXBlcmVzIG9yIG1p
bGxpVm9sdHMuIElzIHRoZXJlIGFueSB3YXkgdG8gaGF2ZSB0aGUgc3VwcG9ydCBmb3IgbWlsbEFt
cHMgYW5kIG1pbGxpVm9sdHM/DQoNClRoZSBhbGFybXMgYXJlIHJhaXNlZCBiYXNlZCBvbiBpbmNy
ZW1lbnRzIGluIG1BbXBzL21Wb2x0cy4gSGVuY2Ugd291bGQgcHJlZmVyIHRoZSB2YWx1ZXMgc2Vu
dCBhY3Jvc3MgYXMgaW4gbUFtcHMgKGFzIG9wcG9zZWQgdG8gZGl2aWRpbmcgdGhlIHZhbHVlIGJ5
IDEwMDAgdG8gY29udmVydCB0aGVtIHRvIEFtcHMpLg0KDQpBbnkgaGVscCB3b3VsZCBiZSBhcHBy
ZWNpYXRlZC4NCg0KDQpSZWdhcmRzDQoNClRoYW5rcw0KU2hyZXlhcw0K

--_000_85D37044F7714019A66F0762AD59BF1Fciscocom_
Content-Type: text/html; charset="utf-8"
Content-ID: <229EA1B623B63E4FB0217F2BCDFC5536@emea.cisco.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6Q2FsaWJyaTsNCglwYW5vc2UtMToy
IDE1IDUgMiAyIDIgNCAzIDIgNDt9DQovKiBTdHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3Jt
YWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05vcm1hbA0KCXttYXJnaW46MGluOw0KCW1hcmdpbi1i
b3R0b206LjAwMDFwdDsNCglmb250LXNpemU6MTIuMHB0Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJp
IixzYW5zLXNlcmlmO30NCmE6bGluaywgc3Bhbi5Nc29IeXBlcmxpbmsNCgl7bXNvLXN0eWxlLXBy
aW9yaXR5Ojk5Ow0KCWNvbG9yOiMwNTYzQzE7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9
DQphOnZpc2l0ZWQsIHNwYW4uTXNvSHlwZXJsaW5rRm9sbG93ZWQNCgl7bXNvLXN0eWxlLXByaW9y
aXR5Ojk5Ow0KCWNvbG9yOiM5NTRGNzI7DQoJdGV4dC1kZWNvcmF0aW9uOnVuZGVybGluZTt9DQpz
cGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJzb25hbC1jb21wb3NlOw0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0KLk1z
b0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1mYW1pbHk6
IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+DQo8Ym9keSBs
YW5nPSJFTi1VUyIgbGluaz0iIzA1NjNDMSIgdmxpbms9IiM5NTRGNzIiPg0KPGRpdiBjbGFzcz0i
V29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTEuMHB0Ij5IaSw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PklQTUkgdG9vbCBpcyBiZWluZyB1c2VkIHRvIHByb2JlIGFuZCBnZXQgdGhlIHZhcmlvdXMgc2Vu
c29yIHZhbHVlcyBmcm9tIGJtYy4gSG93ZXZlciwgYWZ0ZXIgcmVhZGluZyB0aHJvdWdoIHRoZSBJ
UE1JIHNwZWMgdGhlcmUgaXMgbm8gc3VwcG9ydCBmb3IgbWlsbGlBbXBlcmVzIG9yIG1pbGxpVm9s
dHMuIElzIHRoZXJlIGFueSB3YXkgdG8gaGF2ZSB0aGUgc3VwcG9ydA0KIGZvciBtaWxsQW1wcyBh
bmQgbWlsbGlWb2x0cz88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PlRoZSBhbGFybXMgYXJlIHJhaXNlZCBiYXNlZCBvbiBpbmNyZW1lbnRzIGluIG1BbXBzL21Wb2x0
cy4gSGVuY2Ugd291bGQgcHJlZmVyIHRoZSB2YWx1ZXMgc2VudCBhY3Jvc3MgYXMgaW4gbUFtcHMg
KGFzIG9wcG9zZWQgdG8gZGl2aWRpbmcgdGhlIHZhbHVlIGJ5IDEwMDAgdG8gY29udmVydCB0aGVt
IHRvIEFtcHMpLg0KPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwv
cD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5B
bnkgaGVscCB3b3VsZCBiZSBhcHByZWNpYXRlZC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJz
cDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZv
bnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5SZWdhcmRzPG86cD48L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGFua3M8bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBw
dCI+U2hyZXlhcyA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_85D37044F7714019A66F0762AD59BF1Fciscocom_--
