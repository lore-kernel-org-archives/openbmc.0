Return-Path: <prvs=99627cf47=P.K.Lee@quantatw.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=99627cf47=p.k.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 44fFhw3t5DzDqCg
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 17:12:15 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 10 Apr 2019 15:10:59 +0800
Received: from mailbx07.quanta.corp (10.243.91.102) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 10 Apr
 2019 15:10:57 +0800
Received: from mailbx07.quanta.corp ([192.168.1.7]) by mailbx07.quanta.corp
 ([192.168.1.7]) with mapi id 15.01.1713.004; Wed, 10 Apr 2019 15:10:57 +0800
From: =?utf-8?B?UC4gSy4gTGVlICjmnY7mn4/lr6wp?= <P.K.Lee@quantatw.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
CC: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: To restrict IPMI commands
Thread-Topic: To restrict IPMI commands
Thread-Index: AQHUylskvUTKJWIDpEOZnUXqsK3TfKXruSqAgCIdtICAEWQQAIABkKaAgAae6QCADVPGgA==
Date: Wed, 10 Apr 2019 07:10:57 +0000
Message-ID: <E62E4158-AD52-48B8-8D9B-1C9AA884E347@quantatw.com>
References: <939F2F2B-6C7E-4EDE-A755-CFFADAD6F1D3@quantatw.com>
 <20190222200545.GA44612@mauery.jf.intel.com>
 <9674FC29-B121-444E-A123-E99A31181766@quantatw.com>
 <20190327143926.rix43miyfilbfrwp@thinkpad.dyn.fuzziesquirrel.com>
 <3B56B3FD-0A20-4D51-8BCA-5F1637307ED9@quantatw.com>
 <20190401193944.GB15959@mauery.jf.intel.com>
In-Reply-To: <20190401193944.GB15959@mauery.jf.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24542.000
x-tm-as-result: No--15.299400-0.000000-31
x-tm-as-matchedid: 140026-150567-701625-704425-700685-139010-700648-700075-7
 00274-700994-707163-700023-105250-705508-703788-700756-707451-702358-702527
 -711432-701558-703529-700038-702113-701236-780022-701403-707788-702791-7026
 62-710739-700807-704195-700624-709584-186035-701555-705388-843364-703366-70
 5584-701604-148004-148133-20043-42000-42003-63-190014
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E16FC335297C04FA6E794E5090D29D5@quantatw.com>
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
X-List-Received-Date: Wed, 10 Apr 2019 07:12:19 -0000

DQoNCj4gT24gQXByIDIsIDIwMTksIGF0IDAzOjM5LCBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1
ZXJ5QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyOC1NYXItMjAxOSAwMjozMyBQ
TSwgUC4gSy4gTGVlICjmnY7mn4/lr6wpIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBNYXIgMjcs
IDIwMTksIGF0IDIyOjM5LCBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29t
PiB3cm90ZToNCj4+PiANCj4+PiBPbiBTYXQsIE1hciAxNiwgMjAxOSBhdCAwMTowNDo1M1BNICsw
MDAwLCBQLiBLLiBMZWUgKOadjuafj+WvrCkgd3JvdGU6DQo+Pj4+IEhpIFZlcm5vbiwNCj4+Pj4g
DQo+Pj4+IFRoYW5rIHlvdSBmb3IgcHJvdmlkaW5nIGEgbmV3IGZpbHRlcmluZyBtZWNoYW5pc20g
dGhhdCBsb29rcyB2ZXJ5DQo+Pj4+IGZsZXhpYmxlLCBidXQgSSBoYXZlIGEgcXVlc3Rpb24uICBJ
IGhhdmUgdHJpZWQgdGhlIGZpbHRlciB0aGF0IGFsbG93cw0KPj4+PiBmaWx0ZXJpbmcgb2YgY29t
bWFuZHMgYnkgd2hpdGVsaXN0RmlsdGVyLCBidXQgdGhlIGNoYW5uZWwgb2YgcmVxdWVzdA0KPj4+
PiBtdXN0IGJlIGNoYW5uZWxTeXN0ZW1JZmFjIHRvIGNoZWNrIHRoZSBjb250ZW50cyBvZiB0aGUg
d2hpdGVsaXN0LiAgV2hhdA0KPj4+PiBwdXp6bGVzIG1lIGlzIHdoeSBjaGFubmVsU3lzdGVtSWZh
YyBpcyBpbiB0aGUgY29uc3RyYWludD8gVGhpcw0KPj4+PiBjb25zdHJhaW50IHdpbGwgY2F1c2Ug
dGhlIHdoaXRlbGlzdCB0byBmYWlsIHdoZW4gdGhlIHVzZXIgY2FsbHMgdGhlDQo+Pj4+IElQTUkg
Y29tbWFuZCB2aWEgdGhlIExBTi4gIElmIHRoZSB1c2VyIHdhbnRzIHRvIHVzZSB0aGUgd2hpdGVs
aXN0IHZpcw0KPj4+PiB0aGUgTEFOLA0KPj4+IA0KPj4+IEhpIFAuSy4NCj4+PiANCj4+PiBJZiBJ
IHVuZGVyc3RhbmQgY29ycmVjdGx5LCB5b3Ugd2FudCB0byBoYXZlIGEgc3lzdGVtIHRoYXQgb3Bl
cmF0ZXMgaW4NCj4+PiBvbmUgb2YgdHdvIG1vZGVzIC0gcmVzdHJpY3RlZCBvciB1bi1yZXN0cmlj
dGVkLiAgV2hlbiB0aGUgc3lzdGVtIGlzIGluDQo+Pj4gcmVzdHJpY3RlZCBtb2RlLCBvbmx5IHdo
aXRlbGlzdGVkIGNvbW1hbmRzIHdpbGwgYmUgcHJvY2Vzc2VkIGZyb20gX2FueV8NCj4+PiBjaGFu
bmVsLiAgRG8gSSB1bmRlcnN0YW5kIGNvcnJlY3RseT8NCj4+IA0KPj4gWWVzLCB3ZSBuZWVkIHRv
IHVzZSB0aGUgd2hpdGVsaXN0IG1lY2hhbmlzbSB0byByZXN0cmljdCBJUE1JIGNvbW1hbmRzDQo+
PiBmcm9tIGFueSBjaGFubmVsLg0KPj4gDQo+Pj4gSG93IGRvIHlvdSByZXN0b3JlIHRoZSBzeXN0
ZW0gdG8gdW5yZXN0cmljdGVkIG1vZGU/ICBTb21lIHNpZGUtYmFuZCAobm9uDQo+Pj4gSVBNSSkg
bWVjaGFuaXNtPw0KPj4gDQo+PiBGb3IgdXMsIGl0IGNhbiB1c2UgdGhlIFJFU1QgdG8gY2hhbmdl
IHRoZSByZXN0cmljdGlvbiBtb2RlIGFzIHdlbGwuDQo+PiANCj4+PiBJZiB5b3UgYXJlIGFibGUg
dG8gc2hhcmUsIEknbSBjdXJpb3VzIHRvIGtub3cgbW9yZSBhYm91dCB0aGUgdXNhZ2UNCj4+PiBw
YXR0ZXJuIGRyaXZpbmcgdGhlIG5lZWQgZm9yIHRoaXMuDQo+PiANCj4+IEkgdGhvdWdodCB0aGF0
IHRoZSBjb25maWd1cmF0aW9uIGNhbiBiZSBtb2RpZmllZCB0aGUgZm9ybWF0IG9mDQo+PiA8TmV0
Rm4+OjxDb21tYW5kPjo8Q2hhbm5lbD4gdG8gYXBwbHkgdGhlIHdoaXRlbGlzdCB3aXRoIG11bHRp
cGxlIGNoYW5uZWxzLA0KPj4gd2hlcmUgPENoYW5uZWw+IHVzZXMgMiBieXRlcyB0byBtYXAgdGhl
IGNoYW5uZWwgdXNpbmcgYSBiaXQgYXJyYXkuDQo+PiANCj4+IEZvciBleGFtcGxlOg0KPj4gMHgw
NjoweDAxOjB4RkZGRSAgLy8gVGhlIDB4RkZGRSBpcyB1c2VkIDIgYnl0ZXMgdG8gcmVwcmVzZW50
IHRoZSBjaGFubmVsIDF+MTUNCj4+IA0KPj4gSG93ZXZlciwgaW4gb3JkZXIgdG8gYmUgY29tcGF0
aWJsZSB3aXRoIHRoZSBjdXJyZW50IGRlc2lnbiwgdGhlIDxOZXRGbj46PENvbW1hbmQ+IHN0aWxs
IG9ubHkgdXNlcyB0aGUgc3lzdGVtIGludGVyZmFjZS4NCj4gDQo+IFRoaXMgaXMgYSByZWFzb25h
YmxlIG1lY2hhbmlzbSB0byBleHRlbmQgdGhlIHdoaXRlbGlzdCB0byBtdWx0aXBsZSBpbnRlcmZh
Y2VzIGZvciBhIGZpeGVkIHNldHVwLiBJcyB0aGVyZSBhIG5lZWQgdG8gbWFrZSB0aGUgZmlsdGVy
aW5nIG1vcmUgZmxleGlibGUsIGxpa2UgcnVudGltZSBjaGFuZ2luZyB3aGljaCBjb21tYW5kcyBh
cmUgYXZhaWxhYmxlPyBJZiBzbywgZG9lcyB0aGUgbGF5b3V0IG9mIHRoZSBJUE1JMi4wIGZpcm13
YXJlIGZpcmV3YWxsIHdvcms/DQo+IA0KPiDigJRWZXJub24NCg0KSSB0aG91Z2h0IHRoYXQgdGhl
IHdoaXRlbGlzdCBpcyBwcm92aWRlZCBieSB0aGUgdmVuZGVyLCBhbmQgdGhlIGZpcm13YXJlIGZp
cmV3YWxsIGlzIHRoZSBwYXJ0IHRoYXQgdGhlIGN1c3RvbWVyIGNhbiBjdXN0b21pemUuIEluIGEg
c2VjdXJpdHktYmFzZWQgcmVzdHJpY3Rpb24sIHRoZSBjdXN0b21lciBjYW5ub3QgZXhlY3V0ZSBj
b21tYW5kcyB0aGF0IGFyZSBub3QgaW4gdGhlIHdoaXRlbGlzdC4NCk9mIGNvdXJzZSB0aGUgY3Vz
dG9tZXIgY2FuJ3QgZGlzY292ZXIgdGhlIGNvbW1hbmQgdGhhdCBpcyBub3QgaW4gdGhlIHdoaXRl
bGlzdCwganVzdCBhcyB0aGUgY29tbWFuZCBkb2VzIG5vdCBleGlzdC4gSW4gb3JkZXIgdG8gZGlz
dGluZ3Vpc2ggdGhlIGRpZmZlcmVuY2UgZnJvbSB0aGUgZmlybXdhcmUgZmlyZXdhbGwgaW4gdGhl
IGNvbXBsZXRpb24gY29kZSwgdGhlIGNvbXBsZXRpb24gY29kZSBvZiB0aGUgY29tbWFuZCB0aGF0
IGlzIG5vdCBpbiB3aGl0ZWxpc3QgY2FuIGJlIGNoYW5nZWQgdG8gQzFoLg0KDQpCZXN0LA0KUEsN
Cg0K
