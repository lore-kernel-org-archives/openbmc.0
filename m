Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.7; helo=cpsmtpb-ews04.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="rEbHLkYt"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews04.kpnxchange.com (cpsmtpb-ews04.kpnxchange.com
 [213.75.39.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 444nv74jW0zDq9L
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 19:38:56 +1100 (AEDT)
Received: from cpsps-ews04.kpnxchange.com ([10.94.84.171]) by
 cpsmtpb-ews04.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 21 Feb 2019 09:38:51 +0100
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=UOIM4xXy c=1 sm=1 tr=0
 a=2ogvC8Id7dqQrJ8F/yAB5g==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=QyXUC8HyAAAA:8 a=X5F7dNyOAAAA:8 a=voM4FWlXAAAA:8
 a=dpRSjrXKAAAA:8 a=bjWBM405qT_66yfbJp8A:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10 a=pS7LufLo7ZPxIL5li5Lt:22
 a=IC2XNlieTeVoXbcui8wp:22 a=xkwab4zIHtOjTkBAMNFX:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT102.kpnxchange.com ([195.121.3.18]) by
 cpsps-ews04.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 21 Feb 2019 09:38:50 +0100
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550738330;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=imnlWf4QenhjFW2/Kex6BMp9DWTnbYoS073ioumo4Hc=;
 b=rEbHLkYtoj+jfbfhoZnC3hjOp9zo6yaEZDy7RHOJE8GWtd1GJq50lopYe6BGWY1qQZaDKZBumlG
 AZRi6A1FiZ6xckJ3jsuWIfRztkyjy7tQCfzrWKiIH4PDoIbgM9QtrIg7tXx3WdIcBeWKV9BwkrjmW
 8Of1v6iB0hudN1/81GI=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT102.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Thu, 21 Feb 2019 09:38:50 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 21 Feb
 2019 09:38:22 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 21 Feb 2019 09:37:51 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
CC: "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
Subject: RE: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTFSt2alieuRaKeTgaddnrT2vklLAAJ7nwAAOtgobAACZSGAAAd4/kQ
Date: Thu, 21 Feb 2019 08:37:51 +0000
Message-ID: <b30260ad2a834983bebf6fe8da099330@Eltsrv03.Eltan.local>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
 <49051a8d-2eb0-566f-5c2d-2003792fcf83@linux.intel.com>
In-Reply-To: <49051a8d-2eb0-566f-5c2d-2003792fcf83@linux.intel.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Feb 2019 08:38:50.0855 (UTC)
 FILETIME=[DEBEFF70:01D4C9C0]
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
X-List-Received-Date: Thu, 21 Feb 2019 08:39:02 -0000

SGVsbG8gSmFtZXMsDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpUaGlzIHNob3VsZCBzb2x2
ZSBhIGNhc2Ugd2hlcmUgdGhlIFNNU19BVE4gaXMgYXNzZXJ0ZWQgZnJvbSB0aGUgc3RhcnQuIEhv
d2V2ZXIgSSBhbSB3b25kZXJpbmcgaWYgdGhpcyBpcyB0aGUgZnVsbCBzb2x1dGlvbiBmb3IgdGhl
IGlzc3VlLg0KDQpUaGUgdGhpbmcgaXMgdGhhdCB0aGUgU01TX0FUTiBpcyBzZXQgYnkgdGhlIGRy
aXZlciBhcyB3ZWxsLiBOb3Qgb25seSBhcyBhIHNwdXJpb3VzIG9jY2FzaW9uLiBBY2NvcmRpbmcg
dG8gdGhlIElQTUkgc3BlY2lmaWNhdGlvbiB0aGUgU01TX0FUTiBzaG91bGQgYmUgcmVtb3ZlZCBi
eSB0aGUgQk1DIG9uY2UgdGhlIGNvbmRpdGlvbiBoYW5kbGVkLiBTbyBiYXNpY2FsbHkgU01TX0FU
TiBzaG91bGQgY2xlYXJlZCB3aGVuIGFsbCB0aHJlZSBldmVudCBiaXRzIGluIHRoZSBzdGF0dXMg
YXJlIGNsZWFyZWQuIFRoaXMgY2FuIGVpdGhlciBiZSBkb25lIGJ5IHRoZSBDbGVhciBNZXNzYWdl
IEZsYWdzIG9yIHdoZW4gZS5nLiBhIG1lc3NhZ2UgaGFzIGJlZW4gcmVhZCBhbmQgdGhlIG1lc3Nh
Z2UgcXVlIGlzIGVtcHR5LiBUaGVzZSBzaXR1YXRpb25zIGFyZSBub3QgYWRkcmVzc2VkIGJ5IHRo
aXMgY29kZS4NCg0KQmVzdCByZWdhcmRzLA0KDQpXaW0gVmVydm9vcg0KDQoNCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphbWVzIEZlaXN0IFttYWlsdG86amFtZXMuZmVpc3RA
bGludXguaW50ZWwuY29tXSANClNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjAsIDIwMTkgODow
MiBQTQ0KVG86IFdpbSBWZXJ2b29ybiA8d3ZlcnZvb3JuQGVsdGFuLmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KQ2M6IGNoZW5nLmMueWFuZ0BsaW51eC5pbnRlbC5jb20NClN1YmplY3Q6
IFJlOiBCdWlsZGluZyBpbnRlbCBzMjYwMHdmIGltYWdlDQoNCk9uIDIvMjAvMTkgNTozNCBBTSwg
V2ltIFZlcnZvb3JuIHdyb3RlOg0KPiBIZWxsbyBKYW1lcywNCj4gDQo+IFdlIGdvdCB0aGUgS0NT
IGludGVyZmFjZSB3b3JraW5nIG9uIHRoZSBPcGVuQm1jIGJ1dCB3ZSBhcmUgcnVubmluZyBpbnRv
IGFuIGlzc3VlIHdlIHRoaW5rIGlzIGEgbWlzc2luZyBwYXJ0IGluIHRoZSBPcGVuQm1jIGltcGxl
bWVudGF0aW9uIGF0IHRoaXMgbW9tZW50Lg0KPiANCj4gV2UgYXJlIHVzaW5nIHRoZSBLQ1MgaW50
ZXJmYWNlIGFuZCB3aGF0IHdlIHNlZSBpcyB0aGF0IHRoZSBTTVNfQVROIGlzIHNldCBieSBPcGVu
Qm1jLiBUaGlzIGF0IGl0c2VsZiBpc24ndCBhbiBpc3N1ZSBidXQgaXQgaXNuJ3QgY2xlYXJlZC4N
Cj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhlIGlzc3VlIGlzIGluIHRoZSBLQ1MgZHJpdmVyIHRoaXMg
Y29ycmVjdGx5IGltcGxlbWVudHMgdGhlIHNldCBhbmQgY2xlYXIgU01TX0FUTiBmdW5jdGlvbnMu
DQo+IA0KPiAgRnJvbSB3aGF0IEkgc2VlIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGlw
bWktaG9zdCBkb2Vzbid0IGlzc3VlIGEgY2xlYXIgU01TX0FUTiBjYWxsIGFueXdoZXJlLg0KPiAN
Cj4gSSBndWVzcyB0aGlzIGNvZGUgd2FzIGRldmVsb3BlZCB1c2luZyB0aGUgQlQgaW50ZXJmYWNl
IChpbiB0aGlzIGNhc2UgdGhlIGhvc3QgY2xlYXJzIHRoZSBTTVNfQVROKS4NCj4gDQo+IFRvIHNv
bHZlIHRoaXMgdGhlIFNNU19BVE4gc2hvdWxkIGJlIGNsZWFyZWQgd2hlbiB0aGUgbWVzc2FnZSBx
dWUgaXMgZW1wdHkgYW5kIHdoZW4gdGhlIFNldE1lc3NhZ2VGbGFncyBjbGVhcnMgYWxsIGZsYWdz
Lg0KPiANCj4gSXMgdGhpcyBjb2RlIGFscmVhZHkgYXZhaWxhYmxlIGFuZCBub2cgeWV0IGNoZWNr
ZWQgaW4gb3Igc2hvdWxkIHdlIGltcGxlbWVudCB0aGlzPw0KDQpIaSBXaW0sDQoNCkkganVzdCBw
dXNoZWQgdGhlIHBhdGNoIHdlIGFyZSBjdXJyZW50bHkgdXNpbmcgZG93bnN0cmVhbSBmb3IgdGhp
cyBpc3N1ZToNCg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei8jL2Mvb3BlbmJt
Yy9waG9zcGhvci1ob3N0LWlwbWlkLysvMTg1NjgvDQoNCkl0IHByb2JhYmx5IGlzbid0IHJlYWR5
IHRvIGJlIG1lcmdlZCBpbiBpdCdzIGN1cnJlbnQgc3RhdGUsIGJ1dCBob3BlZnVsbHkgeW91J2xs
IGZpbmQgaXQgdXNlZnVsLg0KDQoNClRoYW5rcywNCg0KSmFtZXMNCg0KDQo+IA0KPiBCZXN0IHJl
Z2FyZHMsDQo+IA0KPiBXaW0gVmVydm9vcm4NCj4gDQoNCg0KDQoNCg==
