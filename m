Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.4; helo=cpsmtpb-ews01.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="c3XfjBMc"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews01.kpnxchange.com (cpsmtpb-ews01.kpnxchange.com
 [213.75.39.4])
 by lists.ozlabs.org (Postfix) with ESMTP id 444NBP6Px7zDqHJ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 03:20:42 +1100 (AEDT)
Received: from cpsps-ews30.kpnxchange.com ([10.94.84.196]) by
 cpsmtpb-ews01.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Wed, 20 Feb 2019 17:20:39 +0100
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=GcnGYjfL c=1 sm=1 tr=0
 a=qax0hVeNvbzdTQm989tE2Q==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=voM4FWlXAAAA:8 a=-JXWrlxeB_KYf1oYZnIA:9
 a=QEXdDO2ut3YA:10 a=5SRTxDzXmMkA:10 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT105.kpnxchange.com ([195.121.3.21]) by
 cpsps-ews30.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 20 Feb 2019 17:20:39 +0100
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550679639;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=DruXnN15ezjnBaXpdqaVjGNJ6rEzLsTyYc5jBltgSFM=;
 b=c3XfjBMc0sQe0bs/hZQRox2Sxid97BKc5Nnug597MQdh7DNImv6Nc9QWpET3Cignb8AR+H6uXWr
 8klf9HFTy7LW5+eCWBbpEEpDR2pedeCBxognueeUz4DqK7QJdXWPu5Am6Mk8epxMctXvHuKE/cPij
 NldLJtVYjeWinv7XM4A=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT105.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Wed, 20 Feb 2019 17:20:39 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Wed, 20 Feb
 2019 17:20:36 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Wed, 20 Feb 2019 17:20:18 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: problem getting inventory to work intel s2600wf image
Thread-Topic: problem getting inventory to work intel s2600wf image
Thread-Index: AdTJMF2x2yNoZXFgRCq0pqAR4Wo4CQ==
Date: Wed, 20 Feb 2019 16:20:18 +0000
Message-ID: <793ef877fe654bd0810e8f27a18566f6@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Feb 2019 16:20:39.0229 (UTC)
 FILETIME=[37CF96D0:01D4C938]
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
X-List-Received-Date: Wed, 20 Feb 2019 16:20:48 -0000

SGVsbG8sDQoNCldlIGFyZSBoYXZpbmcgcHJvYmxlbXMgZ2V0dGluZyB0aGUgaW52ZW50b3J5IHRv
IHdvcmsgb24gdGhlIGludGVsIHMyNjAwd2YgYnVpbGQuDQoNCldlIGFyZSB1c2luZyBhIHZlcnkg
cmVjZW50IHZlcnNpb24gb2YgdGhlIHRyZWUuDQoNClRoZSBmaXJzdCB0aGluZyBJIG5vdGljZWQg
aXMgdGhlIHNhbWUgaXNzdWUgYXMgdGhlIG9uZSBtZW50aW9uZWQgaGVyZToNCmh0dHBzOi8vbGlz
dHMub3psYWJzLm9yZy9waXBlcm1haWwvb3BlbmJtYy8yMDE4LU1heS8wMTE4NDEuaHRtbA0KDQpC
YXNpY2FsbHkgdGhlIG9yZy5vcGVuYm1jLm1hbmFnZXJzLlN5c3RlbS5zZXJ2aWNlIGNhbid0IHN0
YXJ0IGJlY2F1c2UgdGhlIHB5dGhvbiBzY3JpcHQgdXNlZCBjYW4ndCBpbXBvcnQgb2JtYy5pbnZl
bnRvcnkuDQoNCkkgZ290IHRoYXQgaXNzdWUgb3V0IG9mIHRoZSB3YXkgYnkgYWRkaW5nIGEgZGVw
ZW5kZW5jeSBzbyB0aGUgc2NyaXB0IHJlcXVpcmVkIGlzIHB1bGxlZCBpbiBidXQgdGhlIHNlcnZp
Y2Ugc3RpbGwgZG9lc24ndCBzdGFydC4gTm93IEkgc2VlIHRoYXQgbGluZSAzMCBvZiB0aGUgc3lz
dGVtX21hbmFnZXIucHkgc2NyaXB0IGlzIGdlbmVyYXRpbmcgYW4gZXJyb3Igd2hpbGUgYmVpbmcg
Y2FsbGVkIGZyb20gbGluZSAxMTUuIA0KSXQgZ2VuZXJhdGVzIEF0dHJpYnV0ZUVycm9yOiAnbW9k
dWxlJyBvYmplY3QgaGFzIG5vIGF0dHJpYnV0ZSAnSURfTE9PS1VQJw0KDQpNeSBxdWVzdGlvbiBp
cyBzaG91bGQgdGhlIFMyNjAwV0YgY29kZSBpbiB0aGUgT3BlbkJtYyByZXBvIGJlIGNhcGFibGUg
b2Ygc3VwcG9ydGluZyB0aGlzIG9yIGFtIEkgbWlzc2luZyBzb21lIGl0ZW1zIHRvIHJlYWxseSBk
byB0aGlzPyANCg0KSWYgdGhlcmUgaXMgYSBzcGVjaWZpYyBjb21taXQgdGhhdCBzaG91bGQgaGF2
ZSB0aGlzIHdvcmtpbmcgcGxlYXNlIGxldCBtZSBrbm93IHdoYXQgdG8gY2hlY2sgb3V0Lg0KDQpC
ZXN0IHJlZ2FyZHMsDQoNCldpbSBWZXJ2b29ybg0K
