Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43f1ww2DKZzDqdp
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 18:21:34 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2019 23:21:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,481,1539673200"; d="scan'208";a="114763344"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2019 23:21:32 -0800
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 14 Jan 2019 23:21:32 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 14 Jan 2019 23:21:32 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.63]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.85]) with mapi id 14.03.0415.000;
 Tue, 15 Jan 2019 15:21:30 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Joel Stanley <joel@jms.id.au>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery, Vernon"
 <vernon.mauery@intel.com>, "Feist, James" <james.feist@intel.com>, "Yoo, Jae
 Hyun" <jae.hyun.yoo@intel.com>
Subject: RE: Enable buttons GPIO passthrough
Thread-Topic: Enable buttons GPIO passthrough
Thread-Index: AQHUqY1NYywjorJW6EeKU0Lg6H6RIKWtkS8AgABZUQCAAgEksA==
Date: Tue, 15 Jan 2019 07:21:30 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E43CEF9@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
In-Reply-To: <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
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
X-List-Received-Date: Tue, 15 Jan 2019 07:21:37 -0000

SGkgTGludXMsDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgc2hhcmluZyBhbmQgc3VnZ2VzdGlvbi4N
Ck15IHByb3Bvc2FsIHRvIGVuYWJsZSBidXR0b25zIEdQSU8gcGFzcy10aHJvdWdoIGJhc2VkIG9u
IHBpbm11eCBkcml2ZXIgYXMgZm9sbG93aW5nOg0KMS4gcmVtb3ZlIGNvZGVzIGFib3V0IFNDVTdD
IGNsZWFyYW5jZSAoZnJvbSBsaW5lIDE5NCB0byBsaW5lIDIzNikgaW4gYXNwZWVkX3NpZ19leHBy
X3NldCBmdW5jdGlvbiBpbiBwaW5jdHJsLWFzcGVlZC5jIGZpbGUuDQoyLiBjcmVhdGUgMiBuZXcg
ZnVuY3Rpb25zIGluIHBpbmN0cmwtYXNwZWVkLmMgZmlsZTog4oCcYXNwZWVkX2dwaW9fcGFzc3Ro
cm91Z2hfZW5hYmxl4oCdIGFuZCDigJxhc3BlZWRfZ3Bpb19wYXNzdGhyb3VnaF9kaXNhYmxl4oCd
DQozLiBiaW5kIGJ1dHRvbiBncGlvIHRvIHBpbmN0cmwNCg0KUGxlYXNlIGZlZWwgZnJlZSB0byBj
b3JyZWN0IG1lIGFuZCBzaGFyZSB5b3VyIHByZWZlcnJlZCBzb2x1dGlvbi4NCg0KVGhhbmtzLA0K
S3dpbi4NCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGludXMgV2FsbGVp
aiBbbWFpbHRvOmxpbnVzLndhbGxlaWpAbGluYXJvLm9yZ10gDQpTZW50OiBNb25kYXksIEphbnVh
cnkgMTQsIDIwMTkgNDoxOSBQTQ0KVG86IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+
OyBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPg0KQ2M6IEpv
ZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+OyBXYW5nLCBLdWl5aW5nIDxrdWl5aW5nLndhbmdA
aW50ZWwuY29tPjsgb3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC1ncGlvQHZnZXIua2Vy
bmVsLm9yZz47IEFuZHJldyBHZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPjsgT3BlbkJN
QyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsgTWF1ZXJ5LCBWZXJub24gPHZl
cm5vbi5tYXVlcnlAaW50ZWwuY29tPjsgRmVpc3QsIEphbWVzIDxqYW1lcy5mZWlzdEBpbnRlbC5j
b20+OyBZb28sIEphZSBIeXVuIDxqYWUuaHl1bi55b29AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6
IEVuYWJsZSBidXR0b25zIEdQSU8gcGFzc3Rocm91Z2gNCg0KT24gTW9uLCBKYW4gMTQsIDIwMTkg
YXQgMzo1OSBBTSBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PiB3cm90ZToNCj4gT24g
RnJpLCAxMSBKYW4gMjAxOSwgYXQgMTk6MzEsIExpbnVzIFdhbGxlaWogd3JvdGU6DQoNCj4gPiBJ
IGFtIHNvcnJ5IGJ1dCBJJ20gY29uZnVzZWQgYWJvdXQgdGhpcy4gSXQncyBhIHZlcnkgdGVyc2Ug
DQo+ID4gZXhwbGFuYXRpb24gb2YgdGhlIHByb2JsZW0gYW5kIGEgYnVuY2ggb2YgY29kZS4NCj4g
Pg0KPiA+IENhbiB5b3UgZm9sa3MgcGxlYXNlIGRlZmluZSB3aGF0IGV4YWN0bHkgeW91IG1lYW4g
d2l0aCBhICJHUElPIA0KPiA+IHBhc3N0aHJvdWdoIiBhbmQgd2hhdCB5b3UgYXJlIHRyeWluZyB0
byBhY2hpZXZlIHdpdGggdGhpcyBvbiB0aGVzZSANCj4gPiBidXR0b25zPw0KPg0KPiBPbiB0aGUg
QXNwZWVkIEJNQyBTb0NzLCBzZXZlcmFsIEdQSU8gYmFua3MgKEQgYW5kIEUpIGNhbiBiZSBjb25m
aWd1cmVkIA0KPiBzbyB0aGUgcGlucyBpbiB0aGUgbG93IGhhbGYgb2YgYSBiYW5rIG9mIDggcGlu
cyBhcmUgaW5wdXQsIGFuZCB0aGUgDQo+IHBpbnMgaW4gdGhlIGhpZ2ggaGFsZiBvZiB0aGUgYmFu
ayBhcmUgb3V0cHV0LiBUaGUgbGluZSBzdGF0ZSBvZiBwaW5zIDAgDQo+IDw9IGkgPCA0IGlzIHJl
ZmxlY3RlZCBvbiBwaW4gaSArIDQuIFRoaXMgd2F5IGl0IGFwcGVhcnMgYXMgdGhvdWdoIHRoZSAN
Cj4gQk1DIGlzIG5vdCBwcmVzZW50IGluIHRoZSBjaXJjdWl0Lg0KPg0KPiBUaGlzIGlzIHVzZWZ1
bCB3aGVuIHRoZSBCTUMgbWF5IG5vdCBoYXZlIGZpcm13YXJlIG9mIGl0cyBvd24sIG9yIGlmIGl0
IA0KPiBkb2VzLCBpZiB0aGUgQk1DIGZpcm13YXJlIGlzIG5vdCByZXF1aXJlZCBvbiB0aGUgY3Jp
dGljYWwgcGF0aCBvZiB0aGUgDQo+IGhvc3QncyBib290IHByb2Nlc3MuIElmIG9yIHdoZW4gdGhl
IEJNQyBmaXJtd2FyZSBib290cyB1cCwgaXQgbWF5IA0KPiBjaG9vc2UgdG8gYnJlYWsgdGhlIHBh
c3MtdGhyb3VnaCBiZWhhdmlvdXIgaW4gb3JkZXIgdG8gcHJvdmlkZSBpdHMgb3duIA0KPiBvdXQt
b2YtYmFuZCBtYW5hZ2VtZW50IGNhcGFiaWxpdGllcy4NCj4NCj4gVGhpcyBjYW4gYmUgdXNlZCBm
b3IgdGhpbmdzIGxpa2UgYSBib3gncyBwb3dlciBidXR0b24gYXMNCj4gbWVudGlvbmVkOiBJZiB0
aGUgQk1DIGlzIG5vdCB1cCwgcG9rZSB0aGUgaG9zdCBkaXJlY3RseSwgb3RoZXJ3aXNlLCANCj4g
cG9rZSB0aGUgQk1DIGZpcm13YXJlIGFuZCBoYXZlIGl0IHBva2UgdGhlIGhvc3QuDQo+DQo+IFRo
ZSBwYXNzLXRocm91Z2ggc2V0dGluZ3MgYXJlIHRpZWQgdG8gdGhlIFNvQydzIHBpbm11eC4gSW50
dWl0aXZlbHkgaXQgDQo+IHNob3VsZCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIHBpbm11eCBkcml2
ZXIsIGJ1dCBJSVJDIHRoZXJlIHdhcyBzb21lIA0KPiB1Z2x5IGNvdXBsaW5nIG9mIHRoZSBmdW5j
dGlvbiB0aGF0IGRpZG4ndCBoYXZlIGEgbmVhdCBzb2x1dGlvbiB3aXRoIA0KPiB0aGUgY3VycmVu
dGx5LXNlcGFyYXRlIEdQSU8gYW5kIHBpbm11eCBkcml2ZXJzLg0KPg0KPiBIb3BlIHRoYXQgaGVs
cHMuDQoNClllcyBJIGdldCBpdCBub3chIFRoYW5rcyBhIGxvdCENCg0KVGhhdCdzIGEgdmVyeSBu
ZWF0IGhhcmR3YXJlIHRyaWNrLCBJIGxpa2UgaG93IHRoZXkgdGhpbmsuDQoNClBpbiBjb25maWcg
aW4gdGhlIHBpbiBjb250cm9sIGRyaXZlciBpcyBpbmRlZWQgdGhlIHJlY29tbWVuZGVkIHdheSB0
byBnbywgaWYgcG9zc2libGUuDQoNCklmIG5vdCBwb3NzaWJsZSwgc28gdGhhdCB0aGlzIHBhcnRp
Y3VsYXIgdHJpY2sgbmVlZHMgdG8gYmUgaGFuZGxlZCBvbiB0aGUgR1BJTyBzaWRlIG9mIHRoZSB3
b3JsZCwgSSB3b3VsZCByZWNvbW1lbmQgdG8gd29yayB3aXRoIGFkZGluZyBpdCBhcyBnZW5lcmlj
IEdQSU8gbGluZSBjb25maWcgb24gdGhlIEdQSU8gc2lkZS4NCg0KVGhhdCBtZWFucywgZG9jdW1l
bnQgcGFzc3Rocm91Z2ggaW4NCmluY2x1ZGUvbGludXgvcGluY3RybC9waW5jb25mLWdlbmVyaWMu
aA0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1iaW5k
aW5ncy50eHQNCnNvIGl0IGlzIGEgZ2VuZXJpYyBjb25maWcgaW4gdGhlIHBpbiBjb250cm9sIHdv
cmxkLCB0aGVuIGFsc28gbWFrZSBpdCBhIEdQSU8tb25seSBiaW5kaW5nOg0KDQpEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9ncGlvLnR4dA0KaW5jbHVkZS9kdC1iaW5kaW5n
cy9ncGlvL2dwaW8uaA0KQW5kIHBhcnNlIGl0IGFzIGFuIGFyZ3VtZW50IGZvciB0aGUgc2Vjb25k
IGNlbGwgaW4gdGhlIEdQSU8gcGhhbmRsZSwgdGhlbiBtYW5hZ2UgaXQgaW4gdGhlIEdQSU8gZHJp
dmVyDQouc2V0X2NvbmZpZygpIGNhbGxiYWNrIHdpdGhvdXQgY2FsbGluZyBpbnRvIHRoZSBwaW4g
Y29uZmlnIGJhY2tlbmQuDQoNClRob21hcyBQZXRhenpvbmkgaXMgY3VycmVudGx5IGxvb2tpbmcg
aW50byB1c2luZyBzb21lIG9mIHRoZSBzdGFuZGFyZCBwaW4gY29uZmlnIHNldCB1cHMgb24gdGhl
IHB1cmUgR1BJTyBwYXRoIHNvIGtlZXAgaGltIGluIENDLiBJIHRoaW5rIGl0IHdpbGwgYmUgbmVj
ZXNzYXJ5IHRvIGdvIGRvd24gdGhpcyBwYXRoIGZvciBzb21lIGxpbmUgY29uZmlndXJhdGlvbnMg
cmF0aGVyIHRoYW4gZm9yY2libHkga2VlcCBHUElPIGFuZCBwaW4gY29udHJvbCBlbGVjdHJvbmlj
IHNldHRpbmdzIHNlcGFyYXRlLg0KDQpNeSBpZGVhIGFzIG1haW50YWluZXIgaXMgdGhhdCBJIHdh
bnQgdG8ga2VlcCB0aGUgYXZhaWxhYmxlIGNvbmZpZ3MgdG9nZXRoZXIgc28gdGhhdCBpdCBjYW4g
YmUgc2VhbWxlc3NseSBzd2l0Y2hlZCBiZXR3ZWVuIHRoZSBHUElPIGZyb250LWVuZCBhbmQgYSBw
aW4gY29udHJvbCBiYWNrLWVuZC4NCg0KWW91cnMsDQpMaW51cyBXYWxsZWlqDQo=
