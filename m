Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.6; helo=cpsmtpb-ews03.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="pA9T55Ie"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews03.kpnxchange.com (cpsmtpb-ews03.kpnxchange.com
 [213.75.39.6])
 by lists.ozlabs.org (Postfix) with ESMTP id 44qgmY47cZzDqW2
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 01:18:02 +1000 (AEST)
Received: from cpsps-ews03.kpnxchange.com ([10.94.84.170]) by
 cpsmtpb-ews03.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 25 Apr 2019 17:17:56 +0200
X-Brand: 7abm2Q==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=FsrUAFjq c=1 sm=1 tr=0 cx=a_idp_e
 a=WB5lYbMG1jvHJ1f8o08CVQ==:117 a=WB5lYbMG1jvHJ1f8o08CVQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=1XWaLZrsAAAA:8 a=X5F7dNyOAAAA:8
 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8 a=yKsw5dxF_gn_QvkelAYA:9
 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.14]) by cpsps-ews03.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 25 Apr 2019 17:17:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=j4dt8RFq79r/mrtgNIEshdZXrqQmpXobtMhqpkC4Tow=;
 b=pA9T55IePwSnLEjCns3wGcxPihkd6FADe5Vf+8ucDKPcp4vp+l6D5hdJINHaX5TJwySmTQNZQauGL
 U9q4XEHWiTomN9cWVquWND6UtO/3bkYN1L4EPoIt4ji/jSp2YMJg7XhbhyuzP0U0fo0QDtQcm+ifT7
 26OLpsVXdb2j0pV0=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 4da9070d-676d-11e9-aeb7-00505699d6e5;
 Thu, 25 Apr 2019 17:17:56 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 25 Apr
 2019 17:17:16 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 25 Apr 2019 17:16:57 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: bmcweb image upload
Thread-Topic: bmcweb image upload
Thread-Index: AdT7RR7Sx7OXAFpqTk6JS5P32JibBAAHY92AAAWw7cA=
Date: Thu, 25 Apr 2019 15:16:56 +0000
Message-ID: <a666a65dca65479aac93175385efd027@Eltsrv03.Eltan.local>
References: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
 <CAO=notz9eixtsv48gnJgqsNBK8jx9tLR_vwuL41dZy7pAtpvZw@mail.gmail.com>
In-Reply-To: <CAO=notz9eixtsv48gnJgqsNBK8jx9tLR_vwuL41dZy7pAtpvZw@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Apr 2019 15:17:56.0991 (UTC)
 FILETIME=[0FC7A0F0:01D4FB7A]
X-RcptDomain: lists.ozlabs.org
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
X-List-Received-Date: Thu, 25 Apr 2019 15:18:08 -0000

SGVsbG8gUGF0cmljaywNCg0KVGhhbmtzIGZvciB0aGUgcmVzcG9uc2UuIEkgd2lsbCB0cnkgdGhp
cy4gU29tZSBvdGhlciB0aGluZyBJIG5vdGljZWQgaXMgdGhhdCB0aGUgaW1hZ2UgdXBkYXRlIG5v
dyB1c2VzIGEgVEFSIGZpbGUuIEJhc2ljYWxseSBpdCB0cmFuc2ZlcnMgdGhlIFRBUiB0byB0aGUg
c3lzdGVtLCB0aGVuIHVudGFycyB0aGUgZmlsZSBhbmQgdXNlcyBpdC4gVGhpcyBtZWFucyB0aGUg
bWVjaGFuaXNtIHJlcXVpcmVzIHR3aWNlIHRoZSBzaXplIG9mIHRoZSBUQVIgZmlsZS4NCg0KSSBh
bSBub3cgY29uc2lkZXJpbmcgdG8gdXNlIGFuIElTTyBmaWxlIGFuZCBtb3VudCB0aGlzIHRoaXMg
d2lsbCByZXF1aXJlIGxlc3MgbWVtb3J5LiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB0aGlzLCBk
byBJIG92ZXJsb29rIHNvbWV0aGluZyBvciBjYW4gdGhpcyBiZSBhIHZpYWJsZSBzb2x1dGlvbj8N
Cg0KQmVzdCBSZWdhcmRzLA0KV2ltIFZlcnZvb3JuDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogUGF0cmljayBWZW50dXJlIFttYWlsdG86dmVudHVyZUBnb29nbGUuY29t
XSANClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAyNSwgMjAxOSA0OjMxIFBNDQpUbzogV2ltIFZlcnZv
b3JuIDx3dmVydm9vcm5AZWx0YW4uY29tPjsgVGFub3VzLCBFZCA8ZWQudGFub3VzQGludGVsLmNv
bT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBibWN3ZWIgaW1h
Z2UgdXBsb2FkDQoNCk9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDI6MDMgQU0gV2ltIFZlcnZvb3Ju
IDx3dmVydm9vcm5AZWx0YW4uY29tPiB3cm90ZToNCj4NCj4gSGVsbG8sDQo+DQo+IEkgaGF2ZSBh
biBBU1QyNDAwIE9wZW5CbWMgd2l0aCAxMjggTUIgb2YgUkFNLiBJIGZvdW5kIHRoYXQgdGhlIGZp
cm13YXJlIHVwbG9hZCB1c2luZyBXZWJVSSAoYW5kIFJlZGZpc2gpIGRvZXNuJ3Qgd29yay4gQm1j
d2ViIGlzIGtpbGxlZCBkdWUgdG8gYW4gb3V0IG9mIG1lbW9yeSBjb25kaXRpb24uDQo+DQo+IElm
IGZvdW5kIG91dCB0aGlzIGlzIGR1ZSB0byB0aGUgbGFyZ2UgcmVxdWVzdCBzaXplIG9mIDMwIE1C
LiBXaWxsIHRoZXJlIGJlIGFuIHVwZGF0ZSB0byB0aGUgdXBsb2FkIG1lY2hhbmlzbSB0byByZXNv
bHZlIHRoaXMgbGFyZ2UgbWVtb3J5IHJlcXVpcmVtZW50Pw0KDQpJJ20gc28gZXhjaXRlZCBmb3Ig
eW91ciBlbWFpbCEgIEZvciBhIHRpbWUsIEkgd2FzIHRoZSBvbmx5IHBlcnNvbiBtYWludGFpbmlu
ZyBhbiBhc3QyNDAwIHdpdGggMTI4TUIgb2YgUkFNLg0KDQpIZXJlIGFyZSBzb21lIHRoaW5ncyB0
byBkbyBzdHJhaWdodCBhd2F5Og0KbG9vayBhdCB5b3VyIGJtYyBpbWFnZSBhbmQgcmVtb3ZlIGFu
eSBpbWFnZV9mZWF0dXJlcyB5b3UncmUgbm90IHVzaW5nDQotLSBpZiBwb3NzaWJsZS4NCg0KVGhh
dCdsbCBoZWxwIHdpdGggdGhlIHByb2JsZW0gaW4gZ2VuZXJhbC4NCg0KVG8gZG8gdXBkYXRlcyBv
biBvdXIgZW5kLCB3ZSBoYXZlIGEgc2VydmljZSB0cmlnZ2VyZWQgYnkgYSBkaWZmZXJlbnQgdXBk
YXRlIG1lY2hhbmlzbSB0aGF0IGNsZWFycyB0aGUgY2FjaGVzLCB0aGlzIGZyZWVzIHVwIGNyaXRp
Y2FsIG1lbW9yeSBmb3IgdGhlIHN5c3RlbS4gIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhl
IHJlZGZpc2ggYXBwcm9hY2gsIGJ1dCBwZXJoYXBzIGl0IGNvdWxkIGJlIHByb2dyYW1tZWQgdG8g
Y2FsbCBhIHNpbWlsYXIgc2VydmljZSBiZWZvcmUgcmVjZWl2aW5nIHRoZSBpbWFnZSB3aGVuIHRo
ZSByZXF1ZXN0IGlzIHJlY2VpdmVkLg0KDQpPdXIgcGFja2FnZSwgImdvb2dsZS1wcmVwYXJlLXVw
ZGF0ZSIgaXMganVzdDoNCg0KcHJlcGFyZV91cGRhdGUuc2VydmljZToNCltVbml0XQ0KRGVzY3Jp
cHRpb249UHVyZ2UgTWVtb3J5IENhY2hlcw0KW1NlcnZpY2VdDQpUeXBlPW9uZXNob3QNCkV4ZWNT
dGFydD0vdXNyL3NiaW4vcHVyZ2VfY2FjaGUuc2gNCg0KcHVyZ2VfY2FjaGUuc2g6DQojIS9iaW4v
YmFzaA0KIyBSdW4gc3luYyBjb21tYW5kLg0Kc3luYw0KIyBQdXJnZSB0aGUgdGhyZWUgY2FjaGVz
Lg0KZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzDQojIERvbmUNCmV4aXQgMA0KDQo+
DQo+IEJlc3QgcmVnYXJkcywNCj4NCj4gV2ltIFZlcnZvb3JuDQo+DQo+DQoNCg0KDQo=
