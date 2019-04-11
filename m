Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.8; helo=cpsmtpb-ews05.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="hF94B3/X"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews05.kpnxchange.com (cpsmtpb-ews05.kpnxchange.com
 [213.75.39.8])
 by lists.ozlabs.org (Postfix) with ESMTP id 44g1Vg5QNrzDqSc
 for <openbmc@lists.ozlabs.org>; Thu, 11 Apr 2019 23:06:00 +1000 (AEST)
Received: from cpsps-ews24.kpnxchange.com ([10.94.84.190]) by
 cpsmtpb-ews05.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 11 Apr 2019 15:05:56 +0200
X-Brand: 7abm2Q==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=K87z4BeI c=1 sm=1 tr=0 cx=a_idp_e
 a=4/rmT19p7yX2nqNQQg5uwQ==:117 a=4/rmT19p7yX2nqNQQg5uwQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10
 a=xqWC_Br6kY4A:10 a=oexKYjalfGEA:10 a=pGLkceISAAAA:8 a=X5F7dNyOAAAA:8
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=KNaPpXF8ngmNYrDXQ6UA:9
 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.44]) by cpsps-ews24.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 11 Apr 2019 15:05:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=Mph48VXWulMJ1RNIVZVR8l2BQ1aU3YOUpSw6Z/WPi6Y=;
 b=hF94B3/XPgqR7YKbPo5X9sRy3xUbrQzQzyiNFqiAi528JDOnT6IOBmyNSyTWaoPQcCvLLCbL8YspW
 1qbQ8er9NK59ljMpzLbzCxPw1H8SaxV4hcbSmN5eRU52bxwRLbfFOp16KdX90qdByz4oe5nyFAocqn
 2xFoaz4d553/LyBw=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id 8afede1e-5c5a-11e9-871b-005056abf0db;
 Thu, 11 Apr 2019 15:05:56 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 11 Apr
 2019 15:05:01 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 11 Apr 2019 15:05:01 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: Lei YU <mine260309@gmail.com>
CC: Matthew Barth <msbarth@linux.ibm.com>, Matt Spinler
 <mspinler@linux.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: using phosphor-dbus-monitor
Thread-Topic: using phosphor-dbus-monitor
Thread-Index: AdTuEGrG+gJJ+lgAS6eE4IA4ANXSuAAZVliAAAu1tjAACXWxAAAAwpwAADbw/YAAKlm1AAAFDSvw
Date: Thu, 11 Apr 2019 13:05:00 +0000
Message-ID: <39cdf20b2c8e4b528109b88bb16d3274@Eltsrv03.Eltan.local>
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <CAARXrtkjzG80mWxR=rjYX7WeMBz4JMVz-HB1aZcjbQzE4O3zng@mail.gmail.com>
In-Reply-To: <CAARXrtkjzG80mWxR=rjYX7WeMBz4JMVz-HB1aZcjbQzE4O3zng@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Apr 2019 13:05:55.0962 (UTC)
 FILETIME=[4CB205A0:01D4F067]
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
X-List-Received-Date: Thu, 11 Apr 2019 13:06:06 -0000

SSBqdXN0IGZvdW5kIGZpbGVkIGFuIGlzc3VlIGJlY2F1c2UgcGhvc3Bob3ItZGJ1cy1tb25pdG9y
IGRvZXNuJ3Qgc3VwcG9ydCAiZG91YmxlIiB2YWx1ZXMgdGhpcyBpcyByZXF1aXJlZCB0byBtYWtl
IGl0IHdvcmsgd2hlbiBkYnVzLXNlbnNvcnMgaXMgdXNlZC4NCg0KSSBhbHNvIG1hZGUgMiBwdWxs
IHJlcXVlc3RzIHRvIHJlc29sdmUgdGhpcy4NCg0KQmVzdCByZWdhcmRzLA0KDQpXaW0gVmVydm9v
cm4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IExlaSBZVSBbbWFpbHRvOm1p
bmUyNjAzMDlAZ21haWwuY29tXSANClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAxMSwgMjAxOSAyOjM4
IFBNDQpUbzogV2ltIFZlcnZvb3JuIDx3dmVydm9vcm5AZWx0YW4uY29tPg0KQ2M6IE1hdHRoZXcg
QmFydGggPG1zYmFydGhAbGludXguaWJtLmNvbT47IE1hdHQgU3BpbmxlciA8bXNwaW5sZXJAbGlu
dXguaWJtLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IHVzaW5n
IHBob3NwaG9yLWRidXMtbW9uaXRvcg0KDQo+IEkganVzdCBmb3VuZCB0aGUgcmVhc29uIHdoeSB0
aGlzIHdhc27igJl0IHdvcmtpbmcuIEkgb3Zlcmxvb2tlZCBhIHR5cG8gaW4gdGhlIGludGVyZmFj
ZSA6IFNlbnNvcnMgaW5zdGVhZCBvZiBTZW5zb3IuDQoNClRoaXMgaXMgdGhlIHNpZ24gb2Ygd2hh
dCBuZWVkcyB0byBiZSBpbXByb3ZlZC4gRWl0aGVyIG1ha2UgaXQgcmVwb3J0IGVycm9yIGF0IGNv
bXBpbGUgdGltZSwgb3IgYXQgbGVhc3QgaGF2ZSBhIHRvb2wgdG8gdmVyaWZ5IHRoZSB5YW1sLg0K
DQoNCg==
