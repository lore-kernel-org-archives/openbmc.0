Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.13; helo=cpsmtpb-ews08.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="Xr/k4a27"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews08.kpnxchange.com (cpsmtpb-ews08.kpnxchange.com
 [213.75.39.13])
 by lists.ozlabs.org (Postfix) with ESMTP id 4419q250PyzDqbW
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 22:22:51 +1100 (AEDT)
Received: from cpsps-ews08.kpnxchange.com ([10.94.84.175]) by
 cpsmtpb-ews08.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Fri, 15 Feb 2019 12:22:45 +0100
X-Brand: +YTO/YbK+g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e2=11;e3=10);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=P9LreRIu c=1 sm=1 tr=0
 a=qDt3RXe/W/RMJVjRtURR+Q==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=4iTpeIUFBtVwLDWLuOcA:9 a=QEXdDO2ut3YA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT106.kpnxchange.com ([195.121.3.22]) by
 cpsps-ews08.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 15 Feb 2019 12:22:45 +0100
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550229765;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=6RgZG3F6aVDvVAK8VMBlZT0xmINa5Ir7vosWO+0xa5c=;
 b=Xr/k4a27vq0hocqwnxGRo8BKOEJMit8m58OUYiw3Zit6ySEzh52I9mCBGQqBzbuhrcvCLAxPLAc
 Fpb8l87w96O1+fymY2Tqd6ujUOETRp3hg6ZKBrteMFmrTT5mvFjam6V0OXopBA1aLuSm6fPu/YL8V
 PFL5v0e3u4qLqKqns00=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT106.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Fri, 15 Feb 2019 12:22:45 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Fri, 15 Feb
 2019 12:22:07 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Fri, 15 Feb 2019 12:21:49 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Adding IPMI support to an existing implementation
Thread-Topic: Adding IPMI support to an existing implementation
Thread-Index: AdTFIDsr8pTdO/3NT8aRBIZaZyiwgw==
Date: Fri, 15 Feb 2019 11:21:48 +0000
Message-ID: <5cb3deac47694e52afdf214837928110@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Feb 2019 11:22:45.0381 (UTC)
 FILETIME=[C61A1350:01D4C520]
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
X-List-Received-Date: Fri, 15 Feb 2019 11:22:57 -0000

SGVsbG8sDQoNCldlIGhhdmUgYW4gZXhpc3RpbmcgQVNUMjQwMCBiYXNlZCBpbXBsZW1lbnRhdGlv
biBmb3IgT3BlbkJNQyAyLjYuMCBhbmQgYXJlIHRyeWluZyB0byBhZGQgSVBNSSBzdXBwb3J0IHRv
IGl0Lg0KDQpBdCB0aGlzIG1vbWVudCB3ZSBkb24ndCBoYXZlIGEgZ29vZCBzZXQgb2YgZG9jdW1l
bnRhdGlvbiBvbiB0aGUgaXBtaSBpbXBsZW1lbnRhdGlvbiBpbmNsdWRlZCBpbiBPcGVuQk1DLg0K
DQpDYW4gYW55b25lIHBvaW50IG1lIHRvIHRoaXMgZG9jdW1lbnRhdGlvbj8gT3IgaXMgdGhlIG9u
bHkgd2F5IHRvIGRvIHRoaXMgdG8gZ28gb3ZlciB0aGUgdmFyaW91cyBwYWNrYWdlcz8NCg0KQmVz
dCByZWdhcmRzLA0KDQpXaW0gVmVydm9vcm4NCg==
