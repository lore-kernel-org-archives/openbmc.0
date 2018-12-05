Return-Path: <ryan_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438gWr5j6xzDqYJ
 for <openbmc@lists.ozlabs.org>; Wed,  5 Dec 2018 12:05:27 +1100 (AEDT)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id wB50viob015318;
 Wed, 5 Dec 2018 08:57:44 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 5 Dec
 2018 09:03:38 +0800
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Wed, 5 Dec
 2018 09:04:45 +0800
Received: from TWMBX01.aspeed.com ([fe80::157a:4af5:bbf4:5dbb]) by
 TWMBX01.aspeed.com ([fe80::157a:4af5:bbf4:5dbb%12]) with mapi id
 15.00.0620.020; Wed, 5 Dec 2018 09:04:44 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Samuel Jiang <chyishian.jiang@gmail.com>,
 qianlihu <wangzhiqiang8906@gmail.com>, Gary Hsu <gary_hsu@aspeedtech.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Jenmin Yuan
 <jenmin_yuan@aspeedtech.com>
Subject: RE: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUiyCeCzMesNBW9E6tBAQ+ThpndaVs4vUAgAE4KVCAABjxAIAAil0AgACXo3A=
Date: Wed, 5 Dec 2018 01:04:43 +0000
Message-ID: <790f8bc733404e189b52edc2c27b9fa5@TWMBX01.aspeed.com>
References: <CAHkHK08zcycaqmg_Pkq=Oe+8xC8TBYsCoBGLA0CCwH0qvwicWg@mail.gmail.com>
 <3022407b-fa4e-9e80-2044-69dbf4f03586@linux.intel.com>
 <CAHkHK09Km5BVLdq7OMSwTLi05-KgDc8K8j9_+e1ewtGanyr4Tg@mail.gmail.com>
 <47558ef0-d8e9-de42-e1dd-be7293048a91@linux.intel.com>
 <A5419381-84F9-490A-8BF0-70C513741ECF@fb.com>
 <e63c758f-2eec-9e28-9381-4e28d2d8bb64@linux.intel.com>
 <4780f022-1c80-4b53-9eb1-0e3fe313c6a2@Spark>
 <db5cfcea-972d-2f50-05f4-266ab2c8f310@linux.intel.com>
 <87C3DCC8-F773-46A0-B8EC-5E3DC5E3983F@fb.com>
 <660c304f-60eb-f54a-f3b7-4d6d4481a96a@linux.intel.com>
 <A9318AC7-EE0E-4B84-84D1-A16695EE3FC0@fb.com>
 <b20d590b-be35-046e-26c2-2c1b2456309a@linux.intel.com>
 <253b7d32-1230-4111-a6dc-a84afddcc679@Spark>
 <25e866d4-749c-902b-86b2-3d38975dcc65@linux.intel.com>
 <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
 <d002c20bfe964463b1d7c305b12fdd70@TWMBX01.aspeed.com>
 <904db864-71c4-d4e6-e7fd-14df7820fb7b@linux.intel.com>
 <D6923B46-D807-48AC-B007-2AFD3E72F8A9@fb.com>
In-Reply-To: <D6923B46-D807-48AC-B007-2AFD3E72F8A9@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com wB50viob015318
X-Mailman-Approved-At: Wed, 05 Dec 2018 12:15:13 +1100
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
X-List-Received-Date: Wed, 05 Dec 2018 01:05:29 -0000

SGVsbG8gSmFlLA0KCQlZZXMsIEVTUElDTEsgc2hvdWxkIGJlIHRoZSBzYW1lIGZsYWcuIA0KCQlU
aGFua3MuIA0KUnlhbg0KDQrvu79PbiAxMi80LzE4LCA3OjQ0IEFNLCAiSmFlIEh5dW4gWW9vIiA8
amFlLmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiAxMi80LzIwMTgg
MTI6MTggQU0sIFJ5YW4gQ2hlbiB3cm90ZToNCiAgICA+IEhlbGxvIEphZSwNCiAgICA+IAlBU1BF
RUQgTFBDIElQIEhXIGJsb2NrIGhhdmUgc2VydmFsIGNsayBpbnB1dC4NCiAgICA+IAlNb3N0IGlt
cG9ydGFudCBpcyBMQ0xLIGlzIGNvbWUgZnJvbSBMUEMgSG9zdC4NCiAgICA+IAlUaGUgb3RoZXJz
IGlzIG5vdCBjb250cm9sbGFibGUgYnkgcmVnaXN0ZXIuDQogICAgPiBSeWFuDQogICAgPiANCiAg
ICANCiAgICBIaSBSeWFuLA0KICAgIA0KICAgIFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiBT
byBjbG9jayBzb3VyY2Ugb2YgTENMSyBpcyBmcm9tIGV4dGVybmFsDQogICAgdXN1YWxseSBmcm9t
IFBDSCwgbWVhbnMgdGhhdCBpdCBkb2Vzbid0IGhhdmUgYW55IHBhcmVudCBkZXBlbmRlbmN5DQog
ICAgd2l0aGluIEJNQy4gSW4gdGhpcyBjYXNlLCB3ZSBuZWVkIHRvIG1hcmsgQ0xLX0lTX0NSSVRJ
Q0FMIGZsYWcgdG8gZW5hYmxlDQogICAgaXQuIEFsc28sIHdlIHNob3VsZCBtYXJrIHRoZSBmbGFn
IGZvciBFU1BJQ0xLIHRvbyBiZWNhdXNlIGVTUEkgaXMNCiAgICBzaGFyaW5nIHRoZSBzYW1lIGlu
dGVyZmFjZSB3aXRoIExQQy4NCiAgICANCiAgICBJJ2xsIG1ha2UgYW5kIHVwc3RyZWFtIGEgcGF0
Y2guDQogICAgDQogICAgVGhhbmtzLA0KICAgIEphZQ0KSmFlLA0KQnV0IEkgYW0gYWJsZSB0byBl
bmFibGUgY2xvY2sgdGhyb3VnaCBscGMtY3RybCBpbiBkdHMuIFdoaWNoIGRvZXMgc2FtZSB0aGlu
ZyBlbmFibGluZyBjbG9jayBmb3IgbHBjLiBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdGhpcyBwYXRj
aC4NCg0KUmVnYXJkcw0KLVZpamF5IA0KDQo=
