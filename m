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
 by lists.ozlabs.org (Postfix) with ESMTPS id 441g4S6CftzDqNv
 for <openbmc@lists.ozlabs.org>; Sat, 16 Feb 2019 17:21:11 +1100 (AEDT)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id x1G6IImi033100;
 Sat, 16 Feb 2019 14:18:18 +0800 (GMT-8)
 (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Sat, 16 Feb
 2019 14:20:48 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Sat, 16 Feb 2019 14:20:47 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: "'Alexander Amelkin'" <a.amelkin@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
Thread-Topic: [PATCHv2 linux dev-4.17 0/7] mmc/host: Add Aspeed SDIO driver
Thread-Index: AQHUHZ/LUpmNI+PCHEW9/Kir2UVl7aXhcycAgAFK+wA=
Date: Sat, 16 Feb 2019 06:20:46 +0000
Message-ID: <00a601d4c5bf$c01a9520$404fbf60$@aspeedtech.com>
References: <1531812378-14316-1-git-send-email-ryanchen.aspeed@gmail.com>
 <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
In-Reply-To: <ef432789-cbfe-9adf-2562-296abc261582@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Microsoft Outlook 16.0
Content-Type: text/plain; charset="utf-8"
Content-ID: <75919DE29A6AB343965E41148568CC10@aspeedtech.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x1G6IImi033100
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
X-List-Received-Date: Sat, 16 Feb 2019 06:21:13 -0000

SGVsbG8sDQoJSSBnb3Qgc29tZSBmZWVkYmFjayBmcm9tIG1haW50YWluZXIuIEkgd2lsbCBtb2Rp
ZnkgZm9yIG5ldyBhcmNoaXRlY3R1cmUsIGhvcGVmdWwsIEkgd2lsbCBhcHBseSBuZXcgcGF0Y2gg
YXQgTWFyY2guICANCg0KUmF5bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
b3BlbmJtYyBbbWFpbHRvOm9wZW5ibWMtYm91bmNlcytyeWFuX2NoZW49YXNwZWVkdGVjaC5jb21A
bGlzdHMub3psYWJzLm9yZ10gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBBbWVsa2luDQpTZW50OiBG
cmlkYXksIEZlYnJ1YXJ5IDE1LCAyMDE5IDY6MzYgUE0NClRvOiBvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0h2MiBsaW51eCBkZXYtNC4xNyAwLzddIG1tYy9ob3N0
OiBBZGQgQXNwZWVkIFNESU8gZHJpdmVyDQoNCkd1eXMsIHdoYXQncyB0aGUgZmF0ZSBvZiB0aGlz
IHBhdGNoIHNldD8NCklzIGdvaW5nIHRvIGJlIG1lcmdlZCBpbnRvIG9wZW5ibWMgbGludXg/DQpX
ZSBoYXZlIGFuIFNEIGNhcmQgc2xvdCBvbiBvdXIgQk1DIGNhcmQgYW5kIHNvIHdvdWxkIGxpa2Ug
dG8ga25vdyB3aGV0aGVyIG9yIG5vdCB0byBhd2FpdCBhcnJpdmFsIG9mIFNESU8gc3VwcG9ydCBm
cm9tIHVwc3RyZWFtIG9yIGltcG9ydCB0aGlzIHBhdGNoIHNldCBsb2NhbGx5Lg0KDQpUaGFuayB5
b3UuDQoNCjE3LjA3LjIwMTggMTA6MjYsIFJ5YW4gQ2hlbiB3cm90ZToNCj4gVGhpcyBzZXJpZXMg
aW1wbGVtZW50cyBBc3BlZWQgU0RJTyBkcml2ZXIuIEluIEFzcGVlZCBTRElPIGNvbnRyb2xsZXIg
DQo+IHdpdGggdHdvIHNsb3RzIGFuZCBoYXZlIGEgZ2xvYmFsIHJlZ2lzdGVyIGZvciBpbnRlcnJ1
cHQgc3RhdHVzIGFuZCANCj4gb3RoZXIgZ2VuZXJhbCBpbmZvcm1hdGlvbi4NCj4NCj4gdjINCj4g
Q2hhbmdlIGlycWNoaXAgZHJpdmVyKGlycS1hc3BlZWQtc2RoY2ktaWMuYykgdG8gYXNwZWVkIHNk
aGNpIGNvcmUgDQo+IGRyaXZlciBhc3BlZWQtc2RoY2ktY29yZS5jDQo+DQo+IHYwDQo+IEZvciBp
bXBsZW1lbnRzIHRoaXMsIGl0IHdpbGwgaGF2ZSBoYXZlIGlycS1hc3BlZWQtc2RoY2ktaWMuYyBm
b3Igc2RoY2kgDQo+IGVhY2ggc2xvdCBpcnEgZGlzcGF0Y2gsIGFuZCB0aGVuIGdvIHRvIHNkaGNp
IGRyaXZlciBoYW5kbGUgKHNkaGNpLmMpLg0KPg0KPiBBbm90aGVyIGlzIHNkaGNpLW9mLWFzcGVl
ZC5jIGZvciBzcGVjaWZpYyBmdW5jdGlvbiBjYWxsLg0KPg0KPg0KPiBSeWFuIENoZW4NCj4NCj4N
Cj4gUnlhbiBDaGVuICg3KToNCj4gICBjbGs6IEFzcGVlZDogTW9kaWZ5IGNsay1hc3BlZWQuYyBk
cml2ZXIgcHJvYmUgc2VxdWVuY2UNCj4gICBjbGs6IEFzcGVlZDogQWRkIHNkaGNpIHJlc2V0IGFu
ZCBjbG9jaw0KPiAgIG1tYzogQXNwZWVkOiBBZGQgQXNwZWVkIHNkaGNpIGNvcmUgZHJpdmVyDQo+
ICAgbW1jOiBBc3BlZWQ6IEFkZCBkcml2ZXIgZm9yIEFzcGVlZCBzZGhjaQ0KPiAgIGR0czogQXNw
ZWVkOiBBZGQgZGV2aWNldHJlZSBmb3IgQXNwZWVkIHNkaGNpDQo+ICAgRG9jdW1lbnRhdGlvbjog
bW1jOiBhZGQgYXNwZWVkIHNkaGNpIGJpbmRpbmcgZG9jdW1lbnQNCj4gICBjb25maWdzOiBBc3Bl
ZWQ6IGVuYWJsZSBtbWMgaG9zdCBpbiBkZWZjb25maWcNCj4NCj4gIC4uLi9iaW5kaW5ncy9tbWMv
YXNwZWVkLGFzcGVlZC1zZGhjaS50eHQgICAgICAgICAgIHwgIDU0ICsrKysrKysNCj4gIGFyY2gv
YXJtL2Jvb3QvZHRzL2FzcGVlZC1hc3QyNTAwLWV2Yi5kdHMgICAgICAgICAgIHwgIDE0ICsrDQo+
ICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzQuZHRzaSAgICAgICAgICAgICAgICAgICB8ICA0
MCArKysrKw0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kgICAgICAgICAgICAg
ICAgICAgfCAgNDAgKysrKysNCj4gIGFyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c1X2RlZmNvbmZp
ZyAgICAgICAgICAgICAgIHwgICA2ICsNCj4gIGRyaXZlcnMvY2xrL2Nsay1hc3BlZWQuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDUxICsrKy0tLQ0KPiAgZHJpdmVycy9pcnFjaGlwL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0NCj4gIGRyaXZlcnMvbW1j
L2hvc3QvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICsrDQo+ICBkcml2
ZXJzL21tYy9ob3N0L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+
ICBkcml2ZXJzL21tYy9ob3N0L2FzcGVlZC1zZGhjaS1jb3JlLmMgICAgICAgICAgICAgICB8IDE0
NyArKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQu
YyAgICAgICAgICAgICAgICAgfCAxNzggKysrKysrKysrKysrKysrKysrKysrDQo+ICBpbmNsdWRl
L2R0LWJpbmRpbmdzL2Nsb2NrL2FzcGVlZC1jbG9jay5oICAgICAgICAgICB8ICAgMiArLQ0KPiAg
aW5jbHVkZS9saW51eC9tbWMvc2RoY2ktYXNwZWVkLWRhdGEuaCAgICAgICAgICAgICAgfCAgMjgg
KysrKw0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgNTUzIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9u
cygtKSAgY3JlYXRlIG1vZGUgDQo+IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbW1jL2FzcGVlZCxhc3BlZWQtc2RoY2kudHh0DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tbWMvaG9zdC9hc3BlZWQtc2RoY2ktY29yZS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYw0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvbW1jL3NkaGNpLWFzcGVlZC1kYXRhLmgNCj4NCg0K
