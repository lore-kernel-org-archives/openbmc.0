Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z6vx679dzDqPZ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 14:04:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2019 19:04:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,361,1544515200"; d="scan'208";a="143459885"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 11 Feb 2019 19:04:53 -0800
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Feb 2019 19:04:53 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 11 Feb 2019 19:04:52 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.207]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.232]) with mapi id 14.03.0415.000;
 Tue, 12 Feb 2019 11:04:50 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>
CC: Joel Stanley <joel@jms.id.au>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery, Vernon"
 <vernon.mauery@intel.com>, "Feist, James" <james.feist@intel.com>, "Yoo, Jae
 Hyun" <jae.hyun.yoo@intel.com>, "Nguyen, Hai V" <hai.v.nguyen@intel.com>,
 "Khetan, Sharad" <sharad.khetan@intel.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Subject: RE: Enable buttons GPIO passthrough
Thread-Topic: Enable buttons GPIO passthrough
Thread-Index: AQHUqY1NYywjorJW6EeKU0Lg6H6RIKWtkS8AgABZUQCAAgEksIAAKXmg//+oEgCAAj7wUIAHP+CAgAHrjjCACRkCAIAFUyCwgAvfAwCABD/SgIAANjGAgAGoCOA=
Date: Tue, 12 Feb 2019 03:04:49 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E455D65@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
 <CACRpkdbcKLXFNpWWsNqrDa2U9QKnO7700n2-1gM64-v1+bkrTg@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E440ABF@shsmsx102.ccr.corp.intel.com>
 <CACRpkda6PZnoF83mYeTDYxqaFYLTp2jn=E6WJe6KptRuYbFLuQ@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E451F18@shsmsx102.ccr.corp.intel.com>
 <CACRpkdaiLv94-bcE85E5TyRQWG-EXOCUVu0fLpOr++5_Q0Qqfw@mail.gmail.com>
 <1549860867.1161225.1655227592.67A55C10@webmail.messagingengine.com>
 <CACRpkdbqGvRXtsTZwhDvd77H3Tpgt5H5YaATyEbyAGKJ-OhBzQ@mail.gmail.com>
In-Reply-To: <CACRpkdbqGvRXtsTZwhDvd77H3Tpgt5H5YaATyEbyAGKJ-OhBzQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2019 03:05:02 -0000

SGkgTGludXMsDQpVc2VyIHNwYWNlIHN1cHBvcnRpbmcgaXMgbmVjZXNzYXJ5IGluIE9wZW5CTUMu
DQpPcGVuQk1DIGhhcyB0byBzdXBwb3J0IElQTUkgY29tbWFuZCh1c2VyIHNwYWNlIG5ldHdvcmsg
Y29tbWFuZCkgdG8gZHluYW1pY2FsbHkgZGlzYWJsZS9lbmFibGUgYWxsIHRoZSBidXR0b25zIGlu
IHRoZSBmcm9udCBwYW5lbCBvZiBhIHNlcnZlciwgd2hpY2ggbmVlZCBwYXNzLXRocm91Z2ggdG8g
c3VwcG9ydCBiZSBkaXNhYmxlZC9lbmFibGVkIGR5bmFtaWNhbGx5IGluIHRoZSB1c2VyIHNwYWNl
LiANCk9uY2UgcGFzcy10aHJvdWdoIG9mIHBvd2VyL3Jlc2V0IGJ1dHRvbiBpcyBlbmFibGVkLCBJ
UE1JIGNvbW1hbmQgY2Fubm90IGhhbmRsZSB0aGUgcG93ZXIgYW55IG1vcmUuDQpTbyBjb3JyZWN0
IGxvZ2ljIHNob3VsZCBiZSB0aGF0IHBhc3MtdGhyb3VnaCBvZiBidXR0b25zIGlzIGVuYWJsZWQg
YnkgZGVmYXVsdCwgb25jZSBPcGVuQk1DIGdvdCB0aGUgcmVsYXRlZCBpcG1pIGNvbW1hbmQgKGxp
a2UgcG93ZXIgb24vb2ZmL3Jlc2V0L2Rpc2FibGUgZnJvbnQgcGFuZWwgY29tbWFuZCksIGRpc2Fi
bGUgcGFzcy10aHJvdWdoIGZpcnN0bHksIGRvIHRoZSBjb3JyZXNwb25kaW5nIG9wZXJhdGlvbiBh
bmQgdGhlbiBlbmFibGUgcGFzcy10aHJvdWdoIGJhY2suDQoNCg0KVGhhbmtzLA0KS3dpbi4NCg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGludXMgV2FsbGVpaiBbbWFpbHRv
OmxpbnVzLndhbGxlaWpAbGluYXJvLm9yZ10gDQpTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDExLCAy
MDE5IDQ6MDggUE0NClRvOiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pg0KQ2M6IFdh
bmcsIEt1aXlpbmcgPGt1aXlpbmcud2FuZ0BpbnRlbC5jb20+OyBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1PjsgVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT47IG9wZW4gbGlzdDpHUElPIFNVQlNZU1RFTSA8bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc+
OyBBbmRyZXcgR2Vpc3NsZXIgPGdlaXNzb25hdG9yQGdtYWlsLmNvbT47IE9wZW5CTUMgTWFpbGxp
c3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IE1hdWVyeSwgVmVybm9uIDx2ZXJub24ubWF1
ZXJ5QGludGVsLmNvbT47IEZlaXN0LCBKYW1lcyA8amFtZXMuZmVpc3RAaW50ZWwuY29tPjsgWW9v
LCBKYWUgSHl1biA8amFlLmh5dW4ueW9vQGludGVsLmNvbT47IE5ndXllbiwgSGFpIFYgPGhhaS52
Lm5ndXllbkBpbnRlbC5jb20+OyBLaGV0YW4sIFNoYXJhZCA8c2hhcmFkLmtoZXRhbkBpbnRlbC5j
b20+OyBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+DQpT
dWJqZWN0OiBSZTogRW5hYmxlIGJ1dHRvbnMgR1BJTyBwYXNzdGhyb3VnaA0KDQpPbiBNb24sIEZl
YiAxMSwgMjAxOSBhdCA1OjU0IEFNIEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+IHdy
b3RlOg0KPiBPbiBGcmksIDggRmViIDIwMTksIGF0IDIyOjMxLCBMaW51cyBXYWxsZWlqIHdyb3Rl
Og0KDQo+ID4gPiArc3RhdGljIGludCBhc3BlZWRfZ3Bpb19wYXNzX3Rocm91Z2goc3RydWN0IGdw
aW9fY2hpcCAqY2hpcCwgdW5zaWduZWQgaW50IG9mZnNldCwNCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdXNlY3MpIHsNCj4gPiA+ICsgICAg
ICAgcHJpbnRrKCJrd2luOjphc3BlZWRfZ3Bpb19wYXNzX3Rocm91Z2ggaXMgY2FsbGVkIik7DQo+
ID4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ID4gK30NCj4gPg0KPiA+IEkgZ3Vlc3MgeW91IHdh
bnQgdG8gYWN0dWFsbHkgaW1wbGVtZW50IHRoaXMgdG9vIDpEDQo+DQo+IFNvbWV0aGluZyB0byBr
ZWVwIGluIG1pbmQgaXMgdGhhdCB0aGUgQVNQRUVEIHBpbmN0cmwgYWxyZWFkeSBzdXBwb3J0cyAN
Cj4gY29uZmlndXJpbmcgdGhlIHBhc3N0aHJvdWdoIGJpdHMuIFdoYXQgd2UgZG9uJ3Qgd2FudCBp
cyB0byBjYXVzZSBzb21lIA0KPiBpbmNvbnNpc3RlbnQgc3RhdGUgYmV0d2VlbiB0aGUgR1BJTyBh
bmQgcGlubXV4IHN1YnN5c3RlbXMgYnkganVzdCB3aGFja2luZyB0aGUgYml0cyBkaXJlY3RseS4N
Cj4NCj4gTG9va3MgbGlrZSB3ZSBzaG91bGQgYmUgYWJsZSB0byBtYWtlIGl0IHdvcmsgd2l0aCBQ
SU5fTUFQX01VWF9HUk9VUCgpIA0KPiBhbmQgdXNpbmcgc29tZSBjdXN0b20gbmFtZSBmb3IgdGhl
IHN0YXRlIChtYXliZSAicGFzc3Rocm91Z2giKT8gSXQncyBhIA0KPiBoYWxmLWJha2VkIHRob3Vn
aHQgdGhvdWdoIHNvIEknbSBub3Qgc3VyZSBpZiBpdCdzIGZlYXNpYmxlIGxldCBhbG9uZSANCj4g
YWNjZXB0YWJsZSwgYnV0IGhvcGVmdWxseSBMaW51cyBjYW4gY29tbWVudC4NCg0KU2luY2UgaXRz
IGEgcmVhbCBvZGQgdGhpbmcgdGhpcyAicGFzc3Rocm91Z2giIEkgd291bGQgY2VydGFpbmx5IHBy
ZWZlciBpZiB5b3UgY291bGQga2VlcCBpdCBhcyBhIGN1c3RvbSB0aGluZyBvbiB0aGUgcGluIGNv
bnRyb2wgc2lkZSBvZiB0aGluZ3MuIFRoZW4gSSBzdXBwb3NlIHRoYXQgeW91IHNldCBpdCB1cCB1
c2luZyB0aGUgZGV2aWNlIHRyZWUgYW5kIGFsbCBpcyBmaW5lPw0KDQpXaGF0IEknZCBsaWtlIHRv
IGhlYXIgZnJvbSBLd2luIGlzIGEgY29udmluY2luZyBzdG9yeSB3aHkgQXNwZWVkIFNvQ3MgbmVl
ZCB0byBkbyB0aGlzIGZyb20gdXNlcnNwYWNlLCBhcyB0aGF0IHNlZW1zIHRvIGJlIGhpcyBnb2Fs
Lg0KDQpZb3VycywNCkxpbnVzIFdhbGxlaWoNCg==
