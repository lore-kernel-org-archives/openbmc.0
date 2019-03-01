Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.8; helo=cpsmtpb-ews05.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="Bwlp0aSj"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews05.kpnxchange.com (cpsmtpb-ews05.kpnxchange.com
 [213.75.39.8])
 by lists.ozlabs.org (Postfix) with ESMTP id 449lFf2BK1zDqRR
 for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2019 20:57:06 +1100 (AEDT)
Received: from cpsps-ews04.kpnxchange.com ([10.94.84.171]) by
 cpsmtpb-ews05.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Fri, 1 Mar 2019 10:57:00 +0100
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=;e2=;e3=;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Grey;B
 M:NotScanned;FinalVerdict:PossibleSpam
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT103.kpnxchange.com ([195.121.3.19]) by
 cpsps-ews04.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 1 Mar 2019 10:57:00 +0100
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1551434220;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=LxxqxPK011kDX4e61pZr+x6IrUe1whSdiKq0wJMug0g=;
 b=Bwlp0aSjs02iZdjphMTSnvd/4zJ+raPnNc6jm7MwYI+AFyKz0G92uNNThaehdOAYnqDEVr0xV1h
 3FhOI8p+ZhjI3PzaqVZdw3txPSI+jPCF0ZDYN5ditnAEESiuMtm1nOUEWg6v11gM87s78ynKzE1Wk
 /7yH0mual92APIMowS4=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT103.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Fri, 1 Mar 2019 10:57:00 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Fri, 1 Mar
 2019 10:56:25 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Fri, 1 Mar 2019 10:56:25 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Vijay Khemka <vijaykhemka@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTFSt2alieuRaKeTgaddnrT2vklLAKGGQCAACxjjEA=
Date: Fri, 1 Mar 2019 09:56:24 +0000
Message-ID: <1c172896f971483e91b488c1cb9cbf7e@Eltsrv03.Eltan.local>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
 <C8BA2205-EAB7-4225-B879-B5D43D2CC2D7@fb.com>
In-Reply-To: <C8BA2205-EAB7-4225-B879-B5D43D2CC2D7@fb.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2019 09:57:00.0907 (UTC)
 FILETIME=[1D8A23B0:01D4D015]
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
X-List-Received-Date: Fri, 01 Mar 2019 09:57:14 -0000

SGVsbG8gVmlqYXksDQoNClBsZWFzZSBtYWtlIHN1cmUgdG8gdXNlIHRoaXMgYmIgZmlsZSB0byBo
ZXQgdGhlIGZpbGUgY29waWVkOg0KDQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9tZXRhLWlu
dGVsL3RyZWUvbWFzdGVyL21ldGEtY29tbW9uL3JlY2lwZXMtcGhvc3Bob3IvaXBtaQ0KDQpkb19p
bnN0YWxsX2FwcGVuZCgpew0KICBpbnN0YWxsIC1kICR7RH0ke2luY2x1ZGVkaXJ9L3Bob3NwaG9y
LWlwbWktaG9zdA0KICBpbnN0YWxsIC1tIDA2NDQgLUQgJHtTfS91dGlscy5ocHAgJHtEfSR7aW5j
bHVkZWRpcn0vcGhvc3Bob3ItaXBtaS1ob3N0DQogIGluc3RhbGwgLW0gMDY0NCAtRCAke1N9L3R5
cGVzLmhwcCAke0R9JHtpbmNsdWRlZGlyfS9waG9zcGhvci1pcG1pLWhvc3QNCiAgaW5zdGFsbCAt
bSAwNjQ0IC1EICR7U30vc2Vuc29yaGFuZGxlci5ocHAgJHtEfSR7aW5jbHVkZWRpcn0vcGhvc3Bo
b3ItaXBtaS1ob3N0DQogIGluc3RhbGwgLW0gMDY0NCAtRCAke1N9L3NlbHV0aWxpdHkuaHBwICR7
RH0ke2luY2x1ZGVkaXJ9L3Bob3NwaG9yLWlwbWktaG9zdA0KfQ0KDQpCZXN0IHJlZ2FyZHMsDQoN
CldpbQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogVmlqYXkgS2hlbWthIFtt
YWlsdG86dmlqYXlraGVta2FAZmIuY29tXSANClNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyOCwg
MjAxOSA5OjQ0IFBNDQpUbzogV2ltIFZlcnZvb3JuIDx3dmVydm9vcm5AZWx0YW4uY29tPjsgb3Bl
bmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogQnVpbGRpbmcgaW50ZWwgczI2MDB3
ZiBpbWFnZQ0KDQpIaSBXaW0sDQpIb3cgZGlkIHlvdSBnZXQgcGFzcyB0aHJvdWdoIGJlbG93IGJ1
aWxkIGlzc3VlIGFzIEkgYW0gc3RpbGwgc2VlaW5nIGl0Lg0KDQovaG9tZS92aWpheWtoZW1rYS9w
cm9qL29wZW5ibWMvbGYvZmViMDQtbGYvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm12Ni1vcGVu
Ym1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrY2FjOTdhNTMz
Yi1yMC9naXQvc3JjL3V0aWxzLmNwcDoxOjEwOiBmYXRhbCBlcnJvcjogcGhvc3Bob3ItaXBtaS1o
b3N0L3V0aWxzLmhwcDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KfCAgI2luY2x1ZGUgInBo
b3NwaG9yLWlwbWktaG9zdC91dGlscy5ocHAiDQoNClJlZ2FyZHMNCi1WaWpheQ0KDQrvu79PbiAy
LzE1LzE5LCA4OjMzIEFNLCAib3BlbmJtYyBvbiBiZWhhbGYgb2YgV2ltIFZlcnZvb3JuIiA8b3Bl
bmJtYy1ib3VuY2VzK3ZpamF5a2hlbWthPWZiLmNvbUBsaXN0cy5vemxhYnMub3JnIG9uIGJlaGFs
ZiBvZiB3dmVydm9vcm5AZWx0YW4uY29tPiB3cm90ZToNCg0KICAgIEhlbGxvIEphbWVzLA0KICAg
IA0KICAgIEkgZ290IHRoZSB0cmVlIGJ1aWxkaW5nIG5vdy4NCiAgICANCiAgICBJIGhhdmUgYmVl
biBwZXJmb3JtaW5nIHNvbWUgdGVzdHMgYXMgd2VsbC4gT25lIHRoaW5nIHRoYXQgcG9wcGVkIHVw
IGltbWVkaWF0ZWx5IGlzIHRoYXQgdGhlcmUgYXJlIG5vIGRldmljZXMgY3JlYXRlZCBmb3IgdGhl
IGtjcyBpbnRlcmZhY2Ugd2hpbGUgdGhlIHNlcnZpY2UgZm9yIHRoaXMgaXMgc3RhcnRlZC4NCiAg
ICANCiAgICBJIG5vdGljZWQgdGhhdCB0aGUgZmFjZWJvb2stdGlvZ2FwYXNzLmR0cyBoYXMgdGhl
IGl0ZW1zIGZvciBrY3MyIGFuZCAzIGluY2x1ZGVkIHdoaWxlIHRoZSBzMjYwMHdmLmR0cyBkb2Vz
bid0IGFzc2lnbiBhZGRyZXNzZXMgZm9yIHRoZXNlIGRldmljZXMgKGxlYXZpbmcgdGhlIGtjc19h
ZGRyIGF0IDAgY2F1c2luZyB0aGUgZHJpdmVyIG5vdCB0byBsb2FkKS4NCiAgICANCiAgICBJIHRo
aXMgaW50ZW50aW9uYWwgYW5kIGRvIHN0YXJ0IHRoZSBkcml2ZXIgaW4gYW5vdGhlciB3YXkgb3Ig
c2hvdWxkIEkgY2hhbmdlIHRoZSBkdHM/DQogICAgDQogICAgQmVzdCByZWdhcmRzLA0KICAgIA0K
ICAgIFdpbSBWZXJ2b29ybg0KICAgIA0KICAgIA0KICAgIE1lc3NhZ2U6IDQNCiAgICBEYXRlOiBU
aHUsIDE0IEZlYiAyMDE5IDE2OjAxOjU3IC0wODAwDQogICAgRnJvbTogSmFtZXMgRmVpc3QgPGph
bWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT4NCiAgICBUbzogb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnDQogICAgU3ViamVjdDogUmU6IEJ1aWxkaW5nIGludGVsIHMyNjAwd2YgaW1hZ2UNCiAgICBN
ZXNzYWdlLUlEOiA8MGFmNjAzZjktMzNlNi0wZGNiLTdlOWMtMmNmYTEzY2MyYTAyQGxpbnV4Lmlu
dGVsLmNvbT4NCiAgICBDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9dXRmLTg7IGZv
cm1hdD1mbG93ZWQNCiAgICANCiAgICBPbiAyLzE0LzE5IDM6NDkgUE0sIEFuZHJldyBKZWZmZXJ5
IHdyb3RlOg0KICAgID4gSGkgV2ltLA0KICAgID4gDQogICAgPiBPbiBGcmksIDE1IEZlYiAyMDE5
LCBhdCAwMjo1MSwgV2ltIFZlcnZvb3JuIHdyb3RlOg0KICAgID4+IEhlbGxvLA0KICAgID4+DQog
ICAgPj4gV2UgYXJlIHRyeWluZyB0byBidWlsZCB0aGUgSW50ZWwgczI2MDB3ZiBpbWFnZSB1c2lu
ZyB0aGUgbGF0ZXN0IA0KICAgID4+IE9wZW5CTUMgdHJlZS4gSWYgd2UgZG8gdGhhdCB3ZSBhcmUg
cnVubmluZyBpbnRvIGJ1aWxkIGVycm9ycy4NCiAgICA+Pg0KICAgID4+IEJlZm9yZSBkaWdnaW5n
IGludG8gdGhpcyBjYW4geW91IHRlbGwgbWUgd2hpY2ggY29tbWl0IG9mIHRoZSB0cmVlIGNhbiAN
CiAgICA+PiBiZSB1c2VkIHRvIGJ1aWxkIGFuIGltYWdlIGZvciAgdGhpcyBkZXZpY2Ugd2l0aG91
dCBlcnJvcnMuIFRoaXMgDQogICAgPj4gYWxsb3dzIHVzIHRvIGhhdmUgYSBzdGFibGUgdmVyc2lv
biBmb3IgcmVmZXJlbmNlLg0KICAgIA0KICAgIEkgdHJpZWQgdG8gYnVpbGQgdG9kYXkgd2l0aCBs
YXRlc3QgdHJ1bmsgYW5kIHRoZXJlIHdlcmUgc29tZSBpc3N1ZXMsIEkgZml4ZWQgdGhlbSBhbGwg
dG9kYXkgYnV0IGFsbCB0aGUgYnVtcHMgaGF2ZSB0byBnbyB0aHJvdWdoIGZpcnN0LiANCiAgICBT
cGVjaWZpY2FsbHkgdGhpcyBvbmU6IA0KICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50
LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fZ2Vycml0Lm9wZW5ibWMtMkRwcm9qZWN0Lnh5el8tMjNf
Y19vcGVuYm1jX21ldGEtMkRpbnRlbF8tMkJfMTg0MTBfJmQ9RHdJRkFnJmM9NVZEMFJUdE5sVGgz
eWNkNDFiM01VdyZyPXY5TVUwS2k5cFduVFhDV3dqSFBWZ3BuQ1I4MHZYa2tjcklhcVU3VVNsNWcm
bT1RUnBvYS00dEdqcmFTeDhreGV0bzJnaWpoazRkdDRYUHdobTJSVjg4UmRJJnM9cjVNWlFmU1Ro
VGQ4SEpyNTdIbkhFYWxWWWJOVkVuZDJTU0VodTBGWlRWUSZlPQ0KICAgIA0KICAgIFRoZW4gaXQg
bmVlZHMgdG8gZ2V0IHN5bmNlZCBpbnRvIG9wZW5ibWMtb3BlbmJtYywgb3IgeW91IGNhbiBjaGVj
a291dCB0aGUgcGF0Y2ggd2l0aCB0aGUgYWJvdmUgdmVyc2lvbiBvZiBtZXRhLXBob3NwaG9yIGFu
ZCBpdCBzaG91bGQgYnVpbGQuDQogICAgDQogICAgVGhhbmtzDQogICAgDQogICAgLUphbWVzDQog
ICAgDQogICAgDQogICAgRW5kIG9mIG9wZW5ibWMgRGlnZXN0LCBWb2wgNDIsIElzc3VlIDM2DQog
ICAgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQogICAgDQogICAgDQog
ICAgDQoNCg==
