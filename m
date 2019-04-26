Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.10; helo=cpsmtpb-ews07.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="iy6IwSMm"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews07.kpnxchange.com (cpsmtpb-ews07.kpnxchange.com
 [213.75.39.10])
 by lists.ozlabs.org (Postfix) with ESMTP id 44r8v76lbLzDqTN
 for <openbmc@lists.ozlabs.org>; Fri, 26 Apr 2019 20:10:24 +1000 (AEST)
Received: from cpsps-ews27.kpnxchange.com ([10.94.84.193]) by
 cpsmtpb-ews07.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Fri, 26 Apr 2019 12:10:19 +0200
X-Brand: 4ZrJ
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=K87z4BeI c=1 sm=1 tr=0 cx=a_idp_e
 a=LO2mTXPAMClkaqVt2RTykg==:117 a=LO2mTXPAMClkaqVt2RTykg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=X5F7dNyOAAAA:8 a=1XWaLZrsAAAA:8
 a=QyXUC8HyAAAA:8 a=voM4FWlXAAAA:8 a=yKsw5dxF_gn_QvkelAYA:9
 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.12]) by cpsps-ews27.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 26 Apr 2019 12:10:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=B3ttfq+xdb3A2bBqYNxiT6c49Tdt3veYrrFM/Pdvfrk=;
 b=iy6IwSMmh5gEeZKo6LaHBhxp0iImEOVAjQPPNDA32WUiSrkQVKhpgcbNHe2ADkBt21AMZol0jEnOL
 2gXcfHu2qUtzLfpilT2tRkmitYNwxtzX/AeBi2tSo6KDqJWmidwXySIt8nYwzgo4CVpQOSV0/F05Ot
 KgK6M0ZG3iZT5b94=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 7ea2b8eb-680b-11e9-96e0-00505699772e;
 Fri, 26 Apr 2019 12:10:19 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Fri, 26 Apr
 2019 12:10:02 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Fri, 26 Apr 2019 12:10:02 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Patrick Venture <venture@google.com>, "Tanous, Ed" <ed.tanous@intel.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: bmcweb image upload
Thread-Topic: bmcweb image upload
Thread-Index: AdT7RR7Sx7OXAFpqTk6JS5P32JibBAAHY92AAC1bi6A=
Date: Fri, 26 Apr 2019 10:10:02 +0000
Message-ID: <a5d4f0468d6b4ea984273a86e9ed8695@Eltsrv03.Eltan.local>
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
X-OriginalArrivalTime: 26 Apr 2019 10:10:19.0310 (UTC)
 FILETIME=[408EC4E0:01D4FC18]
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
X-List-Received-Date: Fri, 26 Apr 2019 10:10:31 -0000

SGVsbG8gUGF0cmljaywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgd2lsbCBsb29r
IGF0IHRoaXMuDQoNCkJlc3QgUmVnYXJkcywNCldpbSBWZXJ2b29ybg0KDQpFbHRhbiBCLlYuDQpB
bWJhY2h0c3RyYWF0IDIzDQo1NDgxIFNNIFNjaGlqbmRlbA0KVGhlIE5ldGhlcmxhbmRzDQoNClQg
OiArMzEtKDApNzMtNTk0IDQ2IDY0DQpFIDogd3ZlcnZvb3JuQGVsdGFuLmNvbQ0KVyA6IGh0dHA6
Ly93d3cuZWx0YW4uY29tDQoNCg0KIlRISVMgTUVTU0FHRSBDT05UQUlOUyBDT05GSURFTlRJQUwg
SU5GT1JNQVRJT04uIFVOTEVTUyBZT1UgQVJFIFRIRSBJTlRFTkRFRCBSRUNJUElFTlQgT0YgVEhJ
UyBNRVNTQUdFLCBBTlkgVVNFIE9GIFRISVMgTUVTU0FHRSBJUyBTVFJJQ1RMWSBQUk9ISUJJVEVE
LiBJRiBZT1UgSEFWRSBSRUNFSVZFRCBUSElTIE1FU1NBR0UgSU4gRVJST1IsIFBMRUFTRSBJTU1F
RElBVEVMWSBOT1RJRlkgVEhFIFNFTkRFUiBCWSBURUxFUEhPTkUgKzMxLSgwKTczLTU5NDQ2NjQg
T1IgUkVQTFkgRU1BSUwsIEFORCBJTU1FRElBVEVMWSBERUxFVEUgVEhJUyBNRVNTQUdFIEFORCBB
TEwgQ09QSUVTLiLCoA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUGF0cmlj
ayBWZW50dXJlIFttYWlsdG86dmVudHVyZUBnb29nbGUuY29tXSANClNlbnQ6IFRodXJzZGF5LCBB
cHJpbCAyNSwgMjAxOSA0OjMxIFBNDQpUbzogV2ltIFZlcnZvb3JuIDx3dmVydm9vcm5AZWx0YW4u
Y29tPjsgVGFub3VzLCBFZCA8ZWQudGFub3VzQGludGVsLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBibWN3ZWIgaW1hZ2UgdXBsb2FkDQoNCk9uIFRodSwg
QXByIDI1LCAyMDE5IGF0IDI6MDMgQU0gV2ltIFZlcnZvb3JuIDx3dmVydm9vcm5AZWx0YW4uY29t
PiB3cm90ZToNCj4NCj4gSGVsbG8sDQo+DQo+IEkgaGF2ZSBhbiBBU1QyNDAwIE9wZW5CbWMgd2l0
aCAxMjggTUIgb2YgUkFNLiBJIGZvdW5kIHRoYXQgdGhlIGZpcm13YXJlIHVwbG9hZCB1c2luZyBX
ZWJVSSAoYW5kIFJlZGZpc2gpIGRvZXNuJ3Qgd29yay4gQm1jd2ViIGlzIGtpbGxlZCBkdWUgdG8g
YW4gb3V0IG9mIG1lbW9yeSBjb25kaXRpb24uDQo+DQo+IElmIGZvdW5kIG91dCB0aGlzIGlzIGR1
ZSB0byB0aGUgbGFyZ2UgcmVxdWVzdCBzaXplIG9mIDMwIE1CLiBXaWxsIHRoZXJlIGJlIGFuIHVw
ZGF0ZSB0byB0aGUgdXBsb2FkIG1lY2hhbmlzbSB0byByZXNvbHZlIHRoaXMgbGFyZ2UgbWVtb3J5
IHJlcXVpcmVtZW50Pw0KDQpJJ20gc28gZXhjaXRlZCBmb3IgeW91ciBlbWFpbCEgIEZvciBhIHRp
bWUsIEkgd2FzIHRoZSBvbmx5IHBlcnNvbiBtYWludGFpbmluZyBhbiBhc3QyNDAwIHdpdGggMTI4
TUIgb2YgUkFNLg0KDQpIZXJlIGFyZSBzb21lIHRoaW5ncyB0byBkbyBzdHJhaWdodCBhd2F5Og0K
bG9vayBhdCB5b3VyIGJtYyBpbWFnZSBhbmQgcmVtb3ZlIGFueSBpbWFnZV9mZWF0dXJlcyB5b3Un
cmUgbm90IHVzaW5nDQotLSBpZiBwb3NzaWJsZS4NCg0KVGhhdCdsbCBoZWxwIHdpdGggdGhlIHBy
b2JsZW0gaW4gZ2VuZXJhbC4NCg0KVG8gZG8gdXBkYXRlcyBvbiBvdXIgZW5kLCB3ZSBoYXZlIGEg
c2VydmljZSB0cmlnZ2VyZWQgYnkgYSBkaWZmZXJlbnQgdXBkYXRlIG1lY2hhbmlzbSB0aGF0IGNs
ZWFycyB0aGUgY2FjaGVzLCB0aGlzIGZyZWVzIHVwIGNyaXRpY2FsIG1lbW9yeSBmb3IgdGhlIHN5
c3RlbS4gIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQgdGhlIHJlZGZpc2ggYXBwcm9hY2gsIGJ1
dCBwZXJoYXBzIGl0IGNvdWxkIGJlIHByb2dyYW1tZWQgdG8gY2FsbCBhIHNpbWlsYXIgc2Vydmlj
ZSBiZWZvcmUgcmVjZWl2aW5nIHRoZSBpbWFnZSB3aGVuIHRoZSByZXF1ZXN0IGlzIHJlY2VpdmVk
Lg0KDQpPdXIgcGFja2FnZSwgImdvb2dsZS1wcmVwYXJlLXVwZGF0ZSIgaXMganVzdDoNCg0KcHJl
cGFyZV91cGRhdGUuc2VydmljZToNCltVbml0XQ0KRGVzY3JpcHRpb249UHVyZ2UgTWVtb3J5IENh
Y2hlcw0KW1NlcnZpY2VdDQpUeXBlPW9uZXNob3QNCkV4ZWNTdGFydD0vdXNyL3NiaW4vcHVyZ2Vf
Y2FjaGUuc2gNCg0KcHVyZ2VfY2FjaGUuc2g6DQojIS9iaW4vYmFzaA0KIyBSdW4gc3luYyBjb21t
YW5kLg0Kc3luYw0KIyBQdXJnZSB0aGUgdGhyZWUgY2FjaGVzLg0KZWNobyAzID4gL3Byb2Mvc3lz
L3ZtL2Ryb3BfY2FjaGVzDQojIERvbmUNCmV4aXQgMA0KDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4N
Cj4gV2ltIFZlcnZvb3JuDQo+DQo+DQoNCg0KDQo=
