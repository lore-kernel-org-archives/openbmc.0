Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 458 seconds by postgrey-1.36 at bilbo;
 Thu, 02 Feb 2017 03:59:34 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="vjMOKu4Z"; dkim-atps=neutral
Received: from forwardcorp1g.cmail.yandex.net (forwardcorp1g.cmail.yandex.net
 [87.250.241.190])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vD8Vt119jzDq96
 for <openbmc@lists.ozlabs.org>; Thu,  2 Feb 2017 03:59:33 +1100 (AEDT)
Received: from mxbackcorp1m.mail.yandex.net (mxbackcorp1m.mail.yandex.net
 [IPv6:2a02:6b8:0:2519::301])
 by forwardcorp1g.cmail.yandex.net (Yandex) with ESMTP id E025220E8F;
 Wed,  1 Feb 2017 19:51:48 +0300 (MSK)
Received: from webcorp01e.yandex-team.ru (webcorp01e.yandex-team.ru
 [5.255.227.50])
 by mxbackcorp1m.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 hGXJSmq5Hc-pmjieC7Z; Wed, 01 Feb 2017 19:51:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1485967908; bh=rkJHAtBo3G8tbE6a1/m2xUeJaUIQnztGu4XoCCL9OCc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=vjMOKu4ZlA7A3A5AeMmegt2um5R6k/KMgqzTdPoYWqo8A2avq4i4USWR6owEWE+Ip
 VyTCj45FJx8ifzTm2OEOp1FtqdsgBs/+VHyBMr9lE7XQrp6PTPjJX7MlMO7qO3tawv
 rkyBiZjK37CkMT6pzU/0NXAwz7NuKFKRlV20aVn0=
Authentication-Results: mxbackcorp1m.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01e.yandex-team.ru with HTTP;
 Wed, 01 Feb 2017 19:51:48 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Rick Altherr <raltherr@google.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <CAPLgG=m=K3CWvViASn26iCiHMsr0WRfakuCgum8dXOCPJE43MQ@mail.gmail.com>
References: <20170201014414.31868-1-raltherr@google.com>
 <4621485941510@webcorp02f.yandex-team.ru>
 <CAPLgG=m=K3CWvViASn26iCiHMsr0WRfakuCgum8dXOCPJE43MQ@mail.gmail.com>
Subject: Re: [PATCH linux v4] dts: Minimal device tree for Quanta Q71L BMC
MIME-Version: 1.0
Message-Id: <101031485967908@webcorp01e.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 01 Feb 2017 19:51:48 +0300
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2017 16:59:37 -0000

PGRpdj5IZWxsbyw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIGhhdmUgdGhpcyBvbiBteSB0b2Rv
IGxpc3QsIGJ1dCBpbiBsb3cgcHJpbyB0b28uIEVhcmx5IEkgZGlkIGEgcHJvb2Ytb2YtY29uY2Vw
dCBiYXNlZCBvbiBTcGljZSBhbmQgQU1JIGRyaXZlcnMgb24gdG9wIG9mIGtlcm5lbCAzLjE4ICh2
aWRlb2VuZ2luZSwgdXNiICZhbXA7IGhpZCk6PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+PGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL3lhLW1vdXNlL3NwaWNlLXNlcnZlci1hc3BlZWQiPmh0dHBz
Oi8vZ2l0aHViLmNvbS95YS1tb3VzZS9zcGljZS1zZXJ2ZXItYXNwZWVkPC9hPjwvZGl2PjxkaXY+
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3lhLW1vdXNlL3NwaWNlLXByb3RvY29sIj5odHRw
czovL2dpdGh1Yi5jb20veWEtbW91c2Uvc3BpY2UtcHJvdG9jb2w8L2E+PC9kaXY+PGRpdj7CoDwv
ZGl2PjxkaXY+TGF0ZXIgSSByZWNlaXZlIGV4YW1wbGUgc291cmNlcyBmb3IgdmlkZW8gZW5naW5l
IGZyYW1lIGRlY29kZXIgKFFWICZhbXA7IEpQRUcgc3RyZWFtcykgZnJvbSBBc3BlZWQgdG8gaW1w
bGVtZW50IGl0IHVuZGVyIHRoZSBjb3JyZXNwb25kaW5nIGxpY2Vuc2UgKGNvbXBhdGlibGUgd2l0
aCBTcGljZSkuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SGVyZSBpcyBzb21lIGRpc2N1c3Npb24g
b24gU3BpY2UtZGV2ZWw6PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvc3BpY2UtZGV2ZWwvMjAxNS1Ob3ZlbWJlci8w
MjMwNzcuaHRtbCI+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvc3BpY2Ut
ZGV2ZWwvMjAxNS1Ob3ZlbWJlci8wMjMwNzcuaHRtbDwvYT48L2Rpdj48ZGl2PsKgPC9kaXY+PGRp
dj5JIHBsYW4gdG8gc3RhcnQgb3ZlciBhZ2FpbiBhIGxpdHRsZSBsYXRlciB1c2luZyBrZXJuZWwn
cyBnYWRnZXRzIGFuZCBzbyBvbi48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4wMS4wMi4yMDE3LCAx
OTo0MSwgIlJpY2sgQWx0aGVyciIgJmx0O3JhbHRoZXJyQGdvb2dsZS5jb20mZ3Q7OjwvZGl2Pjxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxkaXY+SSB3b24ndCBiZSB1c2luZyB0aG9zZSBpbiBvdXIg
ZGVwbG95bWVudCBzY2VuYXJpbyBzbyBhZGRpbmcgc3VwcG9ydCBmb3IgdGhlbSBpcyBsb3cgb24g
bXkgbGlzdC7CoCBJZiB5b3Ugb3IgYW55b25lIGVsc2UgaXMgaW50ZXJlc3RlZCBpbiB3cml0aW5n
IGRyaXZlcnMgZm9yIHRoZSBWR0EgYW5kIFVTQiBkZXZpY2UgcGVyaXBoZXJhbHMsIEknbGwgZ2xh
ZGx5IHByb3ZpZGUgZGlyZWN0aW9uIGFuZCByZXZpZXcgcGF0Y2hlcy48L2Rpdj48ZGl2PsKgPGRp
dj5PbiBXZWQsIEZlYiAxLCAyMDE3IGF0IDE6MzEgQU0sIEFudG9uIEQuIEthY2hhbG92IDxzcGFu
PiZsdDs8YSB0YXJnZXQ9Il9ibGFuayIgaHJlZj0ibWFpbHRvOm1vdXNlQHlhbmRleC10ZWFtLnJ1
Ij5tb3VzZUB5YW5kZXgtdGVhbS5ydTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YmxvY2txdW90ZSBz
dHlsZT0ibWFyZ2luOjAgMCAwIDAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRp
bmctbGVmdDoxZXg7Ij5IZWxsbywgUmljay48YnIgLz48YnIgLz4wMS4wMi4yMDE3LCAwNDo0NCwg
IlJpY2sgQWx0aGVyciB2aWEgb3BlbmJtYyIgJmx0OzxhIGhyZWY9Im1haWx0bzpvcGVuYm1jQGxp
c3RzLm96bGFicy5vcmciPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvYT4mZ3Q7OjxiciAvPjxz
cGFuPiZndDsgU3VwcG9ydHM6PGJyIC8+Jmd0OyDCoMKgLSBCTUMgY29uc29sZSBVQVJUPGJyIC8+
Jmd0OyDCoMKgLSBCTUMgYm9vdCBmbGFzaDxiciAvPiZndDsgwqDCoC0gaG9zdCBib290IGZsYXNo
PGJyIC8+Jmd0OyDCoMKgLSBob3N0IHZpcnR1YWwgVUFSVCAoaG9zdCBjb25zb2xlKTxiciAvPiZn
dDs8L3NwYW4+PGJyIC8+PGJyIC8+SGF2ZSB5b3UgcGxhbnMgdG8gYWRkIHN1cHBvcnQgZm9yIEtW
TSBhbmQgVmlydHVhbCBNZWRpYSB0aHJvdWdoIHRoZSBBc3BlZWQ/PC9ibG9ja3F1b3RlPjwvZGl2
PjwvZGl2PjwvYmxvY2txdW90ZT48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDxi
ciAvPkFudG9uIEQuIEthY2hhbG92PGJyIC8+PGJyIC8+SVRPLCBTeXN0ZW1zIEFyY2hpdGVjdDxi
ciAvPlRlbDogNyAoNDk1KSA3MzktNzAtMDAgZXh0Ljc2MTM8L2Rpdj48ZGl2PsKgPC9kaXY+
