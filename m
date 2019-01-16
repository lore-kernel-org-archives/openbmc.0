Return-Path: <kuiying.wang@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43fqP754h7zDqkw
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 01:30:18 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2019 06:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,486,1539673200"; d="scan'208";a="118954774"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga003.jf.intel.com with ESMTP; 16 Jan 2019 06:30:15 -0800
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 16 Jan 2019 06:30:15 -0800
Received: from shsmsx104.ccr.corp.intel.com (10.239.4.70) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 16 Jan 2019 06:30:15 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.63]) by
 SHSMSX104.ccr.corp.intel.com ([169.254.5.159]) with mapi id 14.03.0415.000;
 Wed, 16 Jan 2019 22:30:13 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>
CC: Andrew Jeffery <andrew@aj.id.au>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mauery, Vernon"
 <vernon.mauery@intel.com>, "Feist, James" <james.feist@intel.com>, "Yoo, Jae
 Hyun" <jae.hyun.yoo@intel.com>, "Nguyen, Hai V" <hai.v.nguyen@intel.com>,
 "Khetan, Sharad" <sharad.khetan@intel.com>
Subject: RE: Enable buttons GPIO passthrough
Thread-Topic: Enable buttons GPIO passthrough
Thread-Index: AQHUqY1NYywjorJW6EeKU0Lg6H6RIKWtkS8AgABZUQCAAgEksIAAKXmg//+oEgCAAj7wUA==
Date: Wed, 16 Jan 2019 14:30:12 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E43DAA1@shsmsx102.ccr.corp.intel.com>
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
 <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
In-Reply-To: <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 16 Jan 2019 14:30:20 -0000

SGkgSm9lbCwNCkRvIGFncmVlIHRvIHVzZSBwcm9wb3NhbCAjMT8gKGV4dGVuZCAicGFzc3Rocm91
Z2giIHRvIHRoZSAiZGlyZWN0aW9uIiBwcm9wZXJ0eSBvZiBncGlvLCB1c2UgICJ2YWx1ZSIgdG8g
Y29udHJvbCBpdCBiZSBkaXNhYmxlZC9lbmFibGVkLikNCg0KQWxsLA0KQW55IG90aGVyIGNvbW1l
bnRzPw0KDQpUaGFua3MsDQpLd2luLg0KDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpG
cm9tOiBMaW51cyBXYWxsZWlqIFttYWlsdG86bGludXMud2FsbGVpakBsaW5hcm8ub3JnXSANClNl
bnQ6IFR1ZXNkYXksIEphbnVhcnkgMTUsIDIwMTkgODoxMCBQTQ0KVG86IFdhbmcsIEt1aXlpbmcg
PGt1aXlpbmcud2FuZ0BpbnRlbC5jb20+DQpDYzogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5p
ZC5hdT47IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+OyBK
b2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pjsgb3BlbiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxs
aW51eC1ncGlvQHZnZXIua2VybmVsLm9yZz47IEFuZHJldyBHZWlzc2xlciA8Z2Vpc3NvbmF0b3JA
Z21haWwuY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsg
TWF1ZXJ5LCBWZXJub24gPHZlcm5vbi5tYXVlcnlAaW50ZWwuY29tPjsgRmVpc3QsIEphbWVzIDxq
YW1lcy5mZWlzdEBpbnRlbC5jb20+OyBZb28sIEphZSBIeXVuIDxqYWUuaHl1bi55b29AaW50ZWwu
Y29tPg0KU3ViamVjdDogUmU6IEVuYWJsZSBidXR0b25zIEdQSU8gcGFzc3Rocm91Z2gNCg0KSGkg
S3dpbiwNCg0KPiBCYXNlZCBvbiBwaW5tdXggdG8gZG8gcGFzc3Rocm91Z2ggaXMgdG9vIGNvbXBs
ZXggYW5kIG5vIHJlZmVyZW5jZSwNCg0KRG9uJ3QgbGV0IHRoYXQgZGlzY291cmFnZSB5b3UhIFdl
IGFyZSBzb21lIG9mIHRoZSB3b3JsZCdzIG1vc3QgaW1wb3J0YW50IHNvZnR3YXJlIGVuZ2luZWVy
cyBpbiB0aGUga2VybmVsLCBhbmQgd2UgZG9uJ3QganVzdCBkbyB0aGUgc2ltcGxlIHN0dWZmLCBs
aWtlIGZpbGxpbmcgaW4gdGhlIGJsYW5rcyBndWlkZWQgYnkgcHJldmlvdXMgZXhhbXBsZSwgd2Ug
ZG8gdGhlIHJlYWxseSBjb21wbGljYXRlZCBzdHVmZiBvZiBpbnZlbnRpbmcgdGhlIGZyYW1ld29y
a3MuDQoNCj4gSSBoYXZlIGFub3RoZXIgMiBzaW1wbGUgcHJvcG9zYWxzIHRvIGRvIGJ1dHRvbiBH
UElPIHBhc3N0aHJvdWdoIGFzIGZvbGxvd2luZzoNCj4gMS4gZXh0ZW5kICJwYXNzdGhyb3VnaCIg
dG8gdGhlICJkaXJlY3Rpb24iIHByb3BlcnR5IG9mIGdwaW8sIHVzZSANCj4gInZhbHVlIiB0byBj
b250cm9sIGl0IGJlIGRpc2FibGVkL2VuYWJsZWQuDQoNClRoaXMgaXMgd2hhdCBJIGRlc2NyaWJl
ZCBpbiBteSBmaXJzdCByZXBseS4gQSAuc2V0X2NvbmZpZygpIG9wdGlvbi4NCkJ1dCBpdCBzdGls
bCBuZWVkcyB0byBwYXRjaCB0aGUgRFQgYmluZGluZ3MgZm9yIGdlbmVyaWMgcGluIGNvbmZpZyBh
bmQgYWRkIGEgZ2xvYmFsbHkgdW5pcXVpZSBlbnVtZXJhdG9yIGZvciB0aGlzIGNvbmZpZyB0byBw
aW5jb25mLWdlbmVyaWMuaCBzaW5jZSBHUElPIGlzIHJldXNpbmcgdGhlc2UgZ2VuZXJpY3MsIHNv
IGJlZ2luIHdpdGggdGhhdCBpbiBhbnkgY2FzZS4NCg0KPiAyLiBleHRlbmQgInZhbHVlIiBwcm9w
ZXJ0eSBvZiBncGlvIHRvIHN1cHBvcnQgdGhlIHRoaXJkIHZhbHVlICIyIiwgDQo+IHdoaWNoIG1l
YW5zIHBhc3MtdGhyb3VnaCBpcyBlbmFibGVkLCBvdGhlcndpc2UgcGFzc3Rocm91Z2ggaXMgZGlz
YWJsZWQuDQoNCk5vLCBzb3JyeSwgdGhpcyBpcyB0aGUgd3JvbmcgaWRlYS4NCg0KLnNldF92YWx1
ZSgpIHNldHMgdGhlIEdQSU8gbGluZSBhcyBoaWdoIG9yIGxvdywgaXQgaXMgZXNzZW50aWFsbHkg
Ym9vbGVhbiBhbmQgaXQgaXMgYW4gaW50ZWdlciBvbmx5IGZvciBoaXN0b3JpY2FsIHJlYXNvbnMu
DQoNCi5zZXRfY29uZmlnKCkgaXMgd2hhdCB3ZSB1c2UgdG8gc2V0IHVwIGRlYm91bmNlIG9yIG9w
ZW4gZHJhaW4gYW5kIHN1Y2ggZWxlY3Ryb25pYyBjb25maWd1cmF0aW9ucyBvbiBHUElPIGxpbmVz
LCBhbmQgdGhpcyBzaG91bGQgYmUgZG9uZSB0aGVyZSwgdW5sZXNzIEFuZHJldyBwcmVmZXJzIHRo
YXQgaXQgaXMgZ2V0cyBkb25lIGluIHRoZSBwaW4gY29udHJvbCBkcml2ZXIuDQoNCllvdXJzLA0K
TGludXMgV2FsbGVpag0K
