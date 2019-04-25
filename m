Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.6; helo=cpsmtpb-ews03.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="Y/27H4fn"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews03.kpnxchange.com (cpsmtpb-ews03.kpnxchange.com
 [213.75.39.6])
 by lists.ozlabs.org (Postfix) with ESMTP id 44qWRl6QfzzDqZR
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 19:02:56 +1000 (AEST)
Received: from cpsps-ews07.kpnxchange.com ([10.94.84.174]) by
 cpsmtpb-ews03.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 25 Apr 2019 11:02:52 +0200
X-Brand: 7abm2Q==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=K87z4BeI c=1 sm=1 tr=0 cx=a_idp_e
 a=ShNidqeCEQB33TAKUUzslw==:117 a=ShNidqeCEQB33TAKUUzslw==:17
 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10 a=xqWC_Br6kY4A:10
 a=oexKYjalfGEA:10 a=gWYGls-bMhU_9uigTGoA:9 a=QEXdDO2ut3YA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.11]) by cpsps-ews07.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 25 Apr 2019 11:02:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=LBXyTWasnL4YmIXIqXCapibGo7bOjyfiAklengNHdCI=;
 b=Y/27H4fneZz5bmRiLDnijlxst9Aqp81wSMs10wA0BpWg46nfUSNESEYFmq1SU9Jw/uKVnDo9NZU3S
 hxMdCrLB3eRorFWCKn7iyBHdbGZ5kv9q57SYn17YFmKmeG4oRXPnUrZi8GakmYEiJKdP270qXWFcyA
 w6RT1aiNLwmoO2mI=
Received: from Eltsrv03.Eltan.local (unknown [84.85.114.86])
 by smtp.kpnmail.nl (Halon) with ESMTPS
 id e7ddb35b-6738-11e9-a65f-00505699b758;
 Thu, 25 Apr 2019 11:02:51 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 25 Apr
 2019 11:02:09 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 25 Apr 2019 11:01:56 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: bmcweb image upload
Thread-Topic: bmcweb image upload
Thread-Index: AdT7RR7Sx7OXAFpqTk6JS5P32JibBA==
Date: Thu, 25 Apr 2019 09:01:56 +0000
Message-ID: <4ddbeb3bc1b64b1097775eddf9608cd9@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Apr 2019 09:02:51.0967 (UTC)
 FILETIME=[A9BD7CF0:01D4FB45]
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
X-List-Received-Date: Thu, 25 Apr 2019 09:03:02 -0000

SGVsbG8sDQoNCkkgaGF2ZSBhbiBBU1QyNDAwIE9wZW5CbWMgd2l0aCAxMjggTUIgb2YgUkFNLiBJ
IGZvdW5kIHRoYXQgdGhlIGZpcm13YXJlIHVwbG9hZCB1c2luZyBXZWJVSSAoYW5kIFJlZGZpc2gp
IGRvZXNuJ3Qgd29yay4gQm1jd2ViIGlzIGtpbGxlZCBkdWUgdG8gYW4gb3V0IG9mIG1lbW9yeSBj
b25kaXRpb24uDQoNCklmIGZvdW5kIG91dCB0aGlzIGlzIGR1ZSB0byB0aGUgbGFyZ2UgcmVxdWVz
dCBzaXplIG9mIDMwIE1CLiBXaWxsIHRoZXJlIGJlIGFuIHVwZGF0ZSB0byB0aGUgdXBsb2FkIG1l
Y2hhbmlzbSB0byByZXNvbHZlIHRoaXMgbGFyZ2UgbWVtb3J5IHJlcXVpcmVtZW50Pw0KDQpCZXN0
IHJlZ2FyZHMsDQoNCldpbSBWZXJ2b29ybg0KDQoNCg==
