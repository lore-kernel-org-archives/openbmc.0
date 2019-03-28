Return-Path: <prvs=983839e4a=P.K.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=983839e4a=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44VS6C09r2zDqHY
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 01:33:31 +1100 (AEDT)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 28 Mar 2019 22:33:27 +0800
Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 28 Mar
 2019 22:33:26 +0800
Received: from mailbx07.quanta.corp ([fe80::6c28:4dd7:a1eb:d720]) by
 mailbx07.quanta.corp ([fe80::6c28:4dd7:a1eb:d720%4]) with mapi id
 15.01.1713.004; Thu, 28 Mar 2019 22:33:26 +0800
From: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
CC: Vernon Mauery <vernon.mauery@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Thread-Topic: To restrict IPMI commands
Thread-Index: AQHUylskvUTKJWIDpEOZnUXqsK3TfKXruSqAgCIdtICAEWQQAIABkKaA
Date: Thu, 28 Mar 2019 14:33:25 +0000
Message-ID: <3B56B3FD-0A20-4D51-8BCA-5F1637307ED9@quantatw.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
 <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
 <20190327143926.rix43miyfilbfrwp@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190327143926.rix43miyfilbfrwp@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24516.004
x-tm-as-result: No--15.203000-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-700075-700274-7
 00994-707163-700023-105250-705508-703788-700756-707451-702358-702527-711432
 -701558-703529-700038-702113-701236-780022-701403-707788-702791-702662-7107
 39-148004-148133-20043-42000-42003-63-190014
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <354BA7693F471E4CAB6A3DB572847CE8@quantatw.com>
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
X-List-Received-Date: Thu, 28 Mar 2019 14:33:40 -0000

DQoNCj4gT24gTWFyIDI3LCAyMDE5LCBhdCAyMjozOSwgQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1
enppZXNxdWlycmVsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBTYXQsIE1hciAxNiwgMjAxOSBhdCAw
MTowNDo1M1BNICswMDAwLCBQLiBLLiBMZWUgKOadjuafj+WvrCkgd3JvdGU6DQo+PiBIaSBWZXJu
b24sDQo+PiANCj4+IFRoYW5rIHlvdSBmb3IgcHJvdmlkaW5nIGEgbmV3IGZpbHRlcmluZyBtZWNo
YW5pc20gdGhhdCBsb29rcyB2ZXJ5DQo+PiBmbGV4aWJsZSwgYnV0IEkgaGF2ZSBhIHF1ZXN0aW9u
LiAgSSBoYXZlIHRyaWVkIHRoZSBmaWx0ZXIgdGhhdCBhbGxvd3MNCj4+IGZpbHRlcmluZyBvZiBj
b21tYW5kcyBieSB3aGl0ZWxpc3RGaWx0ZXIsIGJ1dCB0aGUgY2hhbm5lbCBvZiByZXF1ZXN0DQo+
PiBtdXN0IGJlIGNoYW5uZWxTeXN0ZW1JZmFjIHRvIGNoZWNrIHRoZSBjb250ZW50cyBvZiB0aGUg
d2hpdGVsaXN0LiAgV2hhdA0KPj4gcHV6emxlcyBtZSBpcyB3aHkgY2hhbm5lbFN5c3RlbUlmYWMg
aXMgaW4gdGhlIGNvbnN0cmFpbnQ/IFRoaXMNCj4+IGNvbnN0cmFpbnQgd2lsbCBjYXVzZSB0aGUg
d2hpdGVsaXN0IHRvIGZhaWwgd2hlbiB0aGUgdXNlciBjYWxscyB0aGUNCj4+IElQTUkgY29tbWFu
ZCB2aWEgdGhlIExBTi4gIElmIHRoZSB1c2VyIHdhbnRzIHRvIHVzZSB0aGUgd2hpdGVsaXN0IHZp
cw0KPj4gdGhlIExBTiwgDQo+IA0KPiBIaSBQLksuDQo+IA0KPiBJZiBJIHVuZGVyc3RhbmQgY29y
cmVjdGx5LCB5b3Ugd2FudCB0byBoYXZlIGEgc3lzdGVtIHRoYXQgb3BlcmF0ZXMgaW4NCj4gb25l
IG9mIHR3byBtb2RlcyAtIHJlc3RyaWN0ZWQgb3IgdW4tcmVzdHJpY3RlZC4gIFdoZW4gdGhlIHN5
c3RlbSBpcyBpbg0KPiByZXN0cmljdGVkIG1vZGUsIG9ubHkgd2hpdGVsaXN0ZWQgY29tbWFuZHMg
d2lsbCBiZSBwcm9jZXNzZWQgZnJvbSBfYW55Xw0KPiBjaGFubmVsLiAgRG8gSSB1bmRlcnN0YW5k
IGNvcnJlY3RseT8NCg0KWWVzLCB3ZSBuZWVkIHRvIHVzZSB0aGUgd2hpdGVsaXN0IG1lY2hhbmlz
bSB0byByZXN0cmljdCBJUE1JIGNvbW1hbmRzIA0KZnJvbSBhbnkgY2hhbm5lbC4NCg0KPiBIb3cg
ZG8geW91IHJlc3RvcmUgdGhlIHN5c3RlbSB0byB1bnJlc3RyaWN0ZWQgbW9kZT8gIFNvbWUgc2lk
ZS1iYW5kIChub24NCj4gSVBNSSkgbWVjaGFuaXNtPw0KDQpGb3IgdXMsIGl0IGNhbiB1c2UgdGhl
IFJFU1QgdG8gY2hhbmdlIHRoZSByZXN0cmljdGlvbiBtb2RlIGFzIHdlbGwuDQoNCj4gSWYgeW91
IGFyZSBhYmxlIHRvIHNoYXJlLCBJJ20gY3VyaW91cyB0byBrbm93IG1vcmUgYWJvdXQgdGhlIHVz
YWdlDQo+IHBhdHRlcm4gZHJpdmluZyB0aGUgbmVlZCBmb3IgdGhpcy4NCg0KSSB0aG91Z2h0IHRo
YXQgdGhlIGNvbmZpZ3VyYXRpb24gY2FuIGJlIG1vZGlmaWVkIHRoZSBmb3JtYXQgb2YgDQo8TmV0
Rm4+OjxDb21tYW5kPjo8Q2hhbm5lbD4gdG8gYXBwbHkgdGhlIHdoaXRlbGlzdCB3aXRoIG11bHRp
cGxlIGNoYW5uZWxzLCANCndoZXJlIDxDaGFubmVsPiB1c2VzIDIgYnl0ZXMgdG8gbWFwIHRoZSBj
aGFubmVsIHVzaW5nIGEgYml0IGFycmF5Lg0KDQpGb3IgZXhhbXBsZToNCjB4MDY6MHgwMToweEZG
RkUgIC8vIFRoZSAweEZGRkUgaXMgdXNlZCAyIGJ5dGVzIHRvIHJlcHJlc2VudCB0aGUgY2hhbm5l
bCAxfjE1DQoNCkhvd2V2ZXIsIGluIG9yZGVyIHRvIGJlIGNvbXBhdGlibGUgd2l0aCB0aGUgY3Vy
cmVudCBkZXNpZ24sIHRoZSA8TmV0Rm4+OjxDb21tYW5kPiBzdGlsbCBvbmx5IHVzZXMgdGhlIHN5
c3RlbSBpbnRlcmZhY2UuDQoNCkJlc3QsDQpQLksu
