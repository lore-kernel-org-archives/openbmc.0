Return-Path: <wvervoorn@eltan.com>
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=eltan.com
 (client-ip=213.75.39.14; helo=cpsmtpb-ews09.kpnxchange.com;
 envelope-from=wvervoorn@eltan.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="ibUqLQk+"; 
 dkim-atps=neutral
Received: from cpsmtpb-ews09.kpnxchange.com (cpsmtpb-ews09.kpnxchange.com
 [213.75.39.14])
 by lists.ozlabs.org (Postfix) with ESMTP id 4451bR4dd8zDqD8
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 04:26:10 +1100 (AEDT)
Received: from cpsps-ews10.kpnxchange.com ([10.94.84.177]) by
 cpsmtpb-ews09.kpnxchange.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 21 Feb 2019 18:26:04 +0100
X-Brand: /q/rzKX13g==
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e4=10;e1=10;e3=10;e2=11);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=P9LreRIu c=1 sm=1 tr=0
 a=2ogvC8Id7dqQrJ8F/yAB5g==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=eIHzyqS2sMcA:10 a=IkcTkHD0fZMA:10 a=xqWC_Br6kY4A:10
 a=CFTnQlWoA9kA:10 a=a6E6v4z86zQ9wxqfOIUA:9 a=QEXdDO2ut3YA:10
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from CPSMTPM-CMT102.kpnxchange.com ([195.121.3.18]) by
 cpsps-ews10.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 21 Feb 2019 18:26:05 +0100
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
DKIM-Signature: v=1; a=rsa-sha256; d=kpnmail.nl; s=kpnmail01;
 c=relaxed/relaxed; t=1550769965;
 h=mime-version:date:message-id:subject:from:to:content-type;
 bh=45EXzz9ksebi8d3NocQKSz4yxqs7NfflDvYG8SEthis=;
 b=ibUqLQk+l2/bv8sH3W8Xvyqed7FzNkcjr4N1bALzeU57Im6q6wDRokQoEB8ebIBgLMlRAn+zssE
 1vZ2/3MzwTFuhLZtGAN7btLNggBCOUMMa53ag2kJYimXZB8w7Txbx0uCYiIsOU/M56H6alYUAWSm8
 bpQ1xvhvtz3gfo/QB8g=
Received: from Eltsrv03.Eltan.local ([84.85.114.86]) by
 CPSMTPM-CMT102.kpnxchange.com over TLS secured channel with Microsoft
 SMTPSVC(8.5.9600.16384); Thu, 21 Feb 2019 18:26:05 +0100
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 21 Feb
 2019 18:25:22 +0100
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Thu, 21 Feb 2019 18:25:16 +0100
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Adding items to the inventory
Thread-Topic: Adding items to the inventory
Thread-Index: AdTKCdILjkUvAIbPQJiwb2C0caqZVg==
Date: Thu, 21 Feb 2019 17:25:15 +0000
Message-ID: <f1fde8eb21f147188daa49e949ebd12e@Eltsrv03.Eltan.local>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.108]
MIME-Version: 1.0
X-OriginalArrivalTime: 21 Feb 2019 17:26:05.0259 (UTC)
 FILETIME=[8651F9B0:01D4CA0A]
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
X-List-Received-Date: Thu, 21 Feb 2019 17:26:14 -0000

SGVsbG8sDQoNCldlIGFyZSB0cnlpbmcgdG8gYWRkIGl0ZW1zIHRvIHRoZSBpbnZlbnRvcnkuDQoN
ClNvIGZhciB3ZSBoYXZlbid0IGJlZW4gYWJsZSB0byBnZXQgdGhpcyB3b3JraW5nLiBBbGwgd2Ug
c2VlIGlzIHRoZSBzeXN0ZW0gaXRlbS4NCg0KV2Ugbm90aWNlZCBzb21lIGNvZGUgaXMgYWRkaW5n
IHN0YXRpYyBpdGVtcyBmcm9tIHRoZSAiYm9hcmRfbmFtZSIucHkuIElmIHdlIHRyeSB0byBkbyB0
aGlzIG5vdGhpbmcgc2hvd3MgdXAuDQoNCldlJ3ZlIGJhc2VkIG91ciBjb2RlIG9uIHRoZSBJbnRl
bCBTMjYwMFdGIGltcGxlbWVudGF0aW9uLg0KDQpBdCB0aGlzIHBvaW50IHdlIGRvbid0IGhhdmUg
RUVQUk9NcyBjb25uZWN0ZWQgdG8gdGhlIEJNQyBzbyBldmVuIGFkZGluZyBzdGF0aWMgaXRlbXMg
d291bGQgYmUgYW4gaW1wcm92ZW1lbnQuDQoNCklzIHRoZSB3YXkgdG8gaGFuZGxlIHRoaXMgZG9j
dW1lbnRlZCBzb21ld2hlcmU/DQoNCkJlc3QgcmVnYXJkcywNCg0KV2ltIFZlcnZvb3JuDQogICAg
DQoNCg==
