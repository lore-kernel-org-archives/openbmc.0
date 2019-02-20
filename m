Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.4; helo=cpsmtpb-ews01.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="jL+Ivhnq"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews01.kpnxchange.com (cpsmtpb-ews01.kpnxchange.com
 [213.75.39.4])
 by lists.ozlabs.org (Postfix) with ESMTP id 444JWk0r4tzDqBg
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 00:35:26 +1100 (AEDT)
Received: from cpsps-ews18.kpnxchange.com ([10.94.84.184]) by
 cpsmtpb-ews01.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Wed, 20 Feb 2019 14:35:22 +0100
X-Brand: 7Ljiz6bi2A==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=FI3KONgs c=1 sm=1 tr=0
 a=O9TprTQLaYRVp1+k5WUGuw==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=QyXUC8HyAAAA:8 a=X5F7dNyOAAAA:8 a=voM4FWlXAAAA:8
 a=EL7C97wt0h34XmngHL8A:9 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22
 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT107.kpnxchange.com ([195.121.3.23]) by
 cpsps-ews18.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Feb 2019 14:35:21 +0100
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550669721;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=7Zgj54IasJVeZ/dhvesmwr39gHiX3JsG0wa+AZEFEMk=;
 b=jL+IvhnqkFH29ocgJAe4tFNzmiXNtqpBSiseW/CX8Ndx1djSxifqFFq76bB5rfpBivaGG5wb2K7
 DhfGwCC7xhZL8Fe0bP8oa3Kydn/bhEJiGDEovYsOPWwUbDhH4wZArclM3YINGvvcNpCh90LaGFswO
 gPsuK0j9Rckoff6Kdzg=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT107.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Wed, 20 Feb 2019 14:35:21 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Wed, 20 Feb
 2019 14:34:41 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Wed, 20 Feb 2019 14:34:34 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Building intel s2600wf image
Thread-Topic: Building intel s2600wf image
Thread-Index: AdTFSt2alieuRaKeTgaddnrT2vklLAAJ7nwAAOtgobA=
Date: Wed, 20 Feb 2019 13:34:34 +0000
Message-ID: <945fb918714e446abf45684bd6016e18@Eltsrv03.Eltan.local>
References: <0dd29982f6954541a2ce2420c87684e7@Eltsrv03.Eltan.local>
 <8bd2d371-29ab-d2f1-ca0b-6f572b021ac5@linux.intel.com>
In-Reply-To: <8bd2d371-29ab-d2f1-ca0b-6f572b021ac5@linux.intel.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Feb 2019 13:35:21.0926 (UTC)
 FILETIME=[20A33E60:01D4C921]
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
X-List-Received-Date: Wed, 20 Feb 2019 13:35:32 -0000

SGVsbG8gSmFtZXMsDQoNCldlIGdvdCB0aGUgS0NTIGludGVyZmFjZSB3b3JraW5nIG9uIHRoZSBP
cGVuQm1jIGJ1dCB3ZSBhcmUgcnVubmluZyBpbnRvIGFuIGlzc3VlIHdlIHRoaW5rIGlzIGEgbWlz
c2luZyBwYXJ0IGluIHRoZSBPcGVuQm1jIGltcGxlbWVudGF0aW9uIGF0IHRoaXMgbW9tZW50Lg0K
DQpXZSBhcmUgdXNpbmcgdGhlIEtDUyBpbnRlcmZhY2UgYW5kIHdoYXQgd2Ugc2VlIGlzIHRoYXQg
dGhlIFNNU19BVE4gaXMgc2V0IGJ5IE9wZW5CbWMuIFRoaXMgYXQgaXRzZWxmIGlzbid0IGFuIGlz
c3VlIGJ1dCBpdCBpc24ndCBjbGVhcmVkLg0KDQpJIGRvbid0IHRoaW5rIHRoZSBpc3N1ZSBpcyBp
biB0aGUgS0NTIGRyaXZlciB0aGlzIGNvcnJlY3RseSBpbXBsZW1lbnRzIHRoZSBzZXQgYW5kIGNs
ZWFyIFNNU19BVE4gZnVuY3Rpb25zLg0KDQpGcm9tIHdoYXQgSSBzZWUgdGhlIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gb2YgaXBtaS1ob3N0IGRvZXNuJ3QgaXNzdWUgYSBjbGVhciBTTVNfQVROIGNh
bGwgYW55d2hlcmUuDQoNCkkgZ3Vlc3MgdGhpcyBjb2RlIHdhcyBkZXZlbG9wZWQgdXNpbmcgdGhl
IEJUIGludGVyZmFjZSAoaW4gdGhpcyBjYXNlIHRoZSBob3N0IGNsZWFycyB0aGUgU01TX0FUTiku
DQoNClRvIHNvbHZlIHRoaXMgdGhlIFNNU19BVE4gc2hvdWxkIGJlIGNsZWFyZWQgd2hlbiB0aGUg
bWVzc2FnZSBxdWUgaXMgZW1wdHkgYW5kIHdoZW4gdGhlIFNldE1lc3NhZ2VGbGFncyBjbGVhcnMg
YWxsIGZsYWdzLg0KDQpJcyB0aGlzIGNvZGUgYWxyZWFkeSBhdmFpbGFibGUgYW5kIG5vZyB5ZXQg
Y2hlY2tlZCBpbiBvciBzaG91bGQgd2UgaW1wbGVtZW50IHRoaXM/DQoNCkJlc3QgcmVnYXJkcywN
Cg0KV2ltIFZlcnZvb3JuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKYW1l
cyBGZWlzdCBbbWFpbHRvOmphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbV0gDQpTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDE1LCAyMDE5IDExOjA4IFBNDQpUbzogV2ltIFZlcnZvb3JuIDx3dmVydm9v
cm5AZWx0YW4uY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJqZWN0OiBSZTogQnVp
bGRpbmcgaW50ZWwgczI2MDB3ZiBpbWFnZQ0KDQpPbiAyLzE1LzE5IDg6MzEgQU0sIFdpbSBWZXJ2
b29ybiB3cm90ZToNCj4gSSBub3RpY2VkIHRoYXQgdGhlIGZhY2Vib29rLXRpb2dhcGFzcy5kdHMg
aGFzIHRoZSBpdGVtcyBmb3Iga2NzMiBhbmQgMyBpbmNsdWRlZCB3aGlsZSB0aGUgczI2MDB3Zi5k
dHMgZG9lc24ndCBhc3NpZ24gYWRkcmVzc2VzIGZvciB0aGVzZSBkZXZpY2VzIChsZWF2aW5nIHRo
ZSBrY3NfYWRkciBhdCAwIGNhdXNpbmcgdGhlIGRyaXZlciBub3QgdG8gbG9hZCkuDQo+IA0KPiBJ
IHRoaXMgaW50ZW50aW9uYWwgYW5kIGRvIHN0YXJ0IHRoZSBkcml2ZXIgaW4gYW5vdGhlciB3YXkg
b3Igc2hvdWxkIEkgY2hhbmdlIHRoZSBkdHM/DQoNClRoZSBkdHMgbmVlZHMgdG8gaGF2ZSB0aGUg
a2NzIG5vZGVzIGFkZGVkLiBUaGlzIGhhc24ndCBiZWVuIHVwc3RyZWFtZWQgeWV0LiBTaG91bGQg
bG9vayBsaWtlOg0KDQogICsma2NzMyB7DQogICsgICBrY3NfYWRkciA9IDwweENBMj47DQogICsg
ICBzdGF0dXMgPSAib2theSI7DQogICt9Ow0KICArDQogICsma2NzNCB7DQogICsgICBrY3NfYWRk
ciA9IDwweENBND47DQogICsgICBzdGF0dXMgPSAib2theSI7DQogICt9Ow0KDQoNCg0KVGhhbmtz
LA0KDQpKYW1lcw0KDQoNCg0KDQoNCg==
