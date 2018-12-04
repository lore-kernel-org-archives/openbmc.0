Return-Path: <ryan_chen@aspeedtech.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=aspeedtech.com
 (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com;
 envelope-from=ryan_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
X-Greylist: delayed 907 seconds by postgrey-1.36 at bilbo;
 Tue, 04 Dec 2018 17:33:11 AEDT
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 438BrR5ztxzDqV1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 17:33:11 +1100 (AEDT)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id wB46CIa2095302
 for <openbmc@lists.ozlabs.org>; Tue, 4 Dec 2018 14:12:18 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id wB46BgW8095194;
 Tue, 4 Dec 2018 14:11:42 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Tue, 4 Dec
 2018 14:17:33 +0800
Received: from TWMBX01.aspeed.com ([fe80::157a:4af5:bbf4:5dbb]) by
 TWMBX01.aspeed.com ([fe80::157a:4af5:bbf4:5dbb%12]) with mapi id
 15.00.0620.020; Tue, 4 Dec 2018 14:18:41 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Vijay Khemka <vijaykhemka@fb.com>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Samuel Jiang <chyishian.jiang@gmail.com>,
 qianlihu <wangzhiqiang8906@gmail.com>, Gary Hsu <gary_hsu@aspeedtech.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Jenmin Yuan
 <jenmin_yuan@aspeedtech.com>
Subject: RE: [HELP] ipmi-kcs didn't work
Thread-Topic: [HELP] ipmi-kcs didn't work
Thread-Index: AQHUiyCeCzMesNBW9E6tBAQ+ThpndaVs4vUAgAE4KVA=
Date: Tue, 4 Dec 2018 06:18:40 +0000
Message-ID: <d002c20bfe964463b1d7c305b12fdd70@TWMBX01.aspeed.com>
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
In-Reply-To: <033266A0-B6C1-4BE7-BA3B-A6E319BDD8D5@fb.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.81]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com wB46BgW8095194
X-Mailman-Approved-At: Wed, 05 Dec 2018 10:07:18 +1100
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
X-List-Received-Date: Tue, 04 Dec 2018 06:33:12 -0000

SGVsbG8gSmFlLA0KCUFTUEVFRCBMUEMgSVAgSFcgYmxvY2sgaGF2ZSBzZXJ2YWwgY2xrIGlucHV0
LiANCglNb3N0IGltcG9ydGFudCBpcyBMQ0xLIGlzIGNvbWUgZnJvbSBMUEMgSG9zdC4NCglUaGUg
b3RoZXJzIGlzIG5vdCBjb250cm9sbGFibGUgYnkgcmVnaXN0ZXIuIA0KUnlhbiANCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFZpamF5IEtoZW1rYSBbbWFpbHRvOnZpamF5a2hl
bWthQGZiLmNvbV0gDQpTZW50OiBUdWVzZGF5LCBEZWNlbWJlciA0LCAyMDE4IDM6MzggQU0NClRv
OiBKYWUgSHl1biBZb28gPGphZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20+OyBTYW11ZWwgSmlh
bmcgPGNoeWlzaGlhbi5qaWFuZ0BnbWFpbC5jb20+OyBxaWFubGlodSA8d2FuZ3poaXFpYW5nODkw
NkBnbWFpbC5jb20+OyBHYXJ5IEhzdSA8Z2FyeV9oc3VAYXNwZWVkdGVjaC5jb20+OyBSeWFuIENo
ZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmcNClN1YmplY3Q6IFJlOiBbSEVMUF0gaXBtaS1rY3MgZGlkbid0IHdvcmsNCg0KDQoNCu+7v09u
IDEyLzMvMTgsIDc6NTQgQU0sICJKYWUgSHl1biBZb28iIDxqYWUuaHl1bi55b29AbGludXguaW50
ZWwuY29tPiB3cm90ZToNCg0KICAgIE9uIDEyLzEvMjAxOCA4OjI5IEFNLCBTYW11ZWwgSmlhbmcg
d3JvdGU6DQogICAgPiBBcG9sb2dpemUgZm9yIHNlbmRpbmcgb3V0IG5vIGNvbnRlbnQgbWFpbCBm
aXJzdC4NCiAgICA+IA0KICAgID4gSmFlLA0KICAgID4gVGhlIGFzcGVlZF9nYXRlcyBpbiBjbGst
YXNwZWVkLmMgcGVyaGFwcyBhcyB0b2RvIHN1Z2dlc3QgYXNraW5nIEFzcGVlZCANCiAgICA+IHRo
ZSBhY3R1YWwgcGFyZW50IGRhdGEgZm9yIGNoZWNrIGluaXRpYWxpemluZz8NCiAgICA+IA0KICAg
IA0KICAgIFllcywgdGhhdCBtYWtlcyBzZW5zZS4NCiAgICANCiAgICBIaSBHYXJ5IGFuZCBSeWFu
LA0KICAgIA0KICAgIENhbiB5b3UgcGxlYXNlIHRlbGwgdXMgd2hhdCBpcyB0aGUgYWN0dWFsIHBh
cmVudCBjbG9jayBzb3VyY2Ugb2YgTFBDIElQPw0KICAgIEkgbWVhbiB0aGUgb3BlcmF0aW9uYWwg
Y2xvY2sgb2YgTFBDIElQIGhhcmR3YXJlIGJsb2NrLCBub3QgdGhlIGludGVyZmFjZQ0KICAgIGNs
b2NrLg0KICAgIA0KICAgIFRoYW5rcywNCiAgICBKYWUNCiAgICANCiAgICA+IFZpamF5LA0KICAg
ID4gSSB0cmFjZWQgbHBjLWN0cmwgbW9kdWxlLCBpdCBzZWVtcyBkaXJlY3QgdXBkYXRlIHRoZSBz
YW1lIA0KICAgID4gQVNQRUVEX0NMS19HQVRFX0xDTEsgcmVnaXN0ZXIgbWFwIGJpdCB0byBlbmFi
bGUuIElmIHBhcmVudCBkYXRhIGlzIA0KICAgID4gZGlzYWJsZWQsIGl0IGNvdWxkIGVuYWJsZSBp
biBkdHMuDQogICAgPiBUaGUgZGV2aWNlIHRyZWUgZGV0YWlsLCBJIHJlZmVyZW5jZSBpdCBmcm9t
IGFzcGVlZC1nNS5kdHNpLiBIb3BlIGl0IA0KICAgID4gY291bGQgaGVscCB5b3UgZm9yIHdvcmsu
DQogICAgPiANCiAgICA+IFRoYW5rcywNCiAgICA+IA0KICAgID4gU2FtdWVsIEppYW5nDQoNClNh
bXVhbC9KYXksDQpJbiBteSBjYXNlIGlmIEkgZG9uJ3QgaW5pdGlhbGl6ZSBMUEMgY2xvY2sgaW4g
ZHJpdmVyLCBCaW9zIG9uIGhvc3Qgc2lkZSB3YWl0IGFuZCBkb2Vzbid0IGJvb3QuDQpJIGRvbid0
IHVuZGVyc3RhbmQgaGVyZSB3aGF0IGlzIGhvbGRpbmcgQmlvcyBoZXJlIGJ1dCBieSBpbml0aWFs
aXppbmcgdGhpcyBMUEMgY2xvY2sgbGV0IGJpb3MgYm9vdC4NCg0KUmVnYXJkcw0KLVZpamF5IA0K
DQo=
