Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 436 seconds by postgrey-1.36 at bilbo;
 Wed, 09 Aug 2017 21:03:40 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="Cpq638+P"; dkim-atps=neutral
Received: from forwardcorp1m.cmail.yandex.net (forwardcorp1m.cmail.yandex.net
 [5.255.216.198])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xS7g026m8zDr2g
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 21:03:40 +1000 (AEST)
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1m.cmail.yandex.net (Yandex) with ESMTP id AD82420718;
 Wed,  9 Aug 2017 13:56:17 +0300 (MSK)
Received: from webcorp01h.yandex-team.ru (webcorp01h.yandex-team.ru
 [37.9.109.45])
 by mxbackcorp1g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 bzd2wfetTB-uGj89ZVW; Wed, 09 Aug 2017 13:56:17 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1502276177; bh=KOHHa5bs0649eqdaB5SQPaQzDGiDvKRJrjuwwlFgsbA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=Cpq638+PotbiKQFg8FJqN4PjpD8j/KE3dnF7l/YPnqsredfEsqRiGyKFMEEHXr2Hz
 p/SmgnBwkZ8Z3FnmRdmDTvFUKHbWKO+NnQrvN5BbjDfetGb5Kv7X0rt6KoaQHzVpJ/
 sShxIUp88j8itIg0o19mQHva0cAWFmFSWJN47k5k=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01h.yandex-team.ru with HTTP;
 Wed, 09 Aug 2017 13:56:16 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Brendan Higgins <brendanhiggins@google.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "minyard@acm.org" <minyard@acm.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
In-Reply-To: <20170804231854.19730-1-brendanhiggins@google.com>
References: <20170804231854.19730-1-brendanhiggins@google.com>
Subject: Re: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
MIME-Version: 1.0
Message-Id: <57021502276176@webcorp01h.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 09 Aug 2017 13:56:16 +0300
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
X-List-Received-Date: Wed, 09 Aug 2017 11:03:42 -0000

PGRpdj5IZWxsbyw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIHdvdWxkIGxpa2UgdG8gbWVudGlv
biBvbmUgb2YgdGhlIG91ciByZWxhdGVkIHdvcmsgZm9yIElQTUkgYW5kIEkyQy48L2Rpdj48ZGl2
PsKgPC9kaXY+PGRpdj5XZSB1c2UgT3BlbklQTUkgc3RhY2sgdG8gY29ubmVjdCB0byB0aGUgY29t
cHV0aW5nIG5vZGVzIHRocm91Z2ggdGhlIEkyQyB1c2luZyBJUE1CIChCVCBpcyBub3Qgc3VwcG9y
dGVkIGJ5IG5vZGVzKTo8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20veWEtbW91c2UvbWV0YS1vcGVuYm1jLXlhbmRleC9ibG9iL21hc3Rlci9tZXRhLXlh
bmRleC9tZXRhLW9wZW5yYWNrL21ldGEtc2hhb3NpL3JlY2lwZXMta2VybmVsL2xpbnV4L2xpbnV4
LW9ibWMvaXBtaV9pMmMuYyI+aHR0cHM6Ly9naXRodWIuY29tL3lhLW1vdXNlL21ldGEtb3BlbmJt
Yy15YW5kZXgvYmxvYi9tYXN0ZXIvbWV0YS15YW5kZXgvbWV0YS1vcGVucmFjay9tZXRhLXNoYW9z
aS9yZWNpcGVzLWtlcm5lbC9saW51eC9saW51eC1vYm1jL2lwbWlfaTJjLmM8L2E+PC9kaXY+PGRp
dj7CoDwvZGl2PjxkaXY+SXQgbGFja3MgY29tcGxldGUgc2xhdmUgc3VwcG9ydCAoc2xhdmUgcGFy
dCBpcyBvbmx5IGZvciByZWNlaXZpbmcga25vd24gcGFja2V0cyB3aXRoIHF1ZXJ5IHJlc3VsdHMg
ZHVlIHRvIE9wZW5JUE1JIGltcGxlbWVudGF0aW9uIGluIGtlcm5lbCkgYW5kIHVzZSBvbmUgbG9j
YWwgc2xhdmUgdG8gY29tbXVuaWNhdGUgd2l0aCBhIG51bWJlciBvZiB0YXJnZXQgc3lzdGVtcyBv
biB0aGUgc2FtZSBidXMgKGN1cnJlbnRseSBzdXBwb3J0ZWQgb25seSAxLXRvLTEgc2NoZW1hKS48
L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5XaXRoIHRoaXMgc3R1ZmYgd2UgYWJsZSB0byB1c2UgaXBt
aXRvb2wgYWNyb3NzIGRpZmZlcmVudCAvZGV2L2lwbWlYIGRldmljZXMgdG8gY29tbXVuaWNhdGUg
d2l0aCBub2Rlcy48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4wNS4wOC4yMDE3LCAwMjoxOSwgIkJy
ZW5kYW4gSGlnZ2lucyIgJmx0O2JyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20mZ3Q7OjwvZGl2Pjxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxwPlRoaXMgcGF0Y2hzZXQgaW50cm9kdWNlcyBJUE1JIEJs
b2NrIFRyYW5zZmVyIG92ZXIgSTJDIChCVC1JMkMpLCB3aGljaCBoYXMgdGhlPGJyIC8+c2FtZSBz
ZW1hbnRpY3MgYXMgSVBNSSBCbG9jayBUcmFuc2ZlciBleGNlcHQgaXQgZG9uZSBvdmVyIEkyQy48
YnIgLz48YnIgLz5UaGUgZG9jdW1lbnRhdGlvbiBkaXNjdXNzZXMgdGhlIHJlYXNvbiBmb3IgdGhp
cyBpbiBncmVhdGVyIGRldGFpbCwgc3VmZmljZSBpdCB0bzxiciAvPnNheSBTU0lGIGNhbm5vdCBi
ZSBjb3JyZWN0bHkgaW1wbGVtZW50ZWQgb24gc29tZSBuYWl2ZSBJMkMgZGV2aWNlcy4gVGhlcmUg
YXJlPGJyIC8+c29tZSBhZGRpdGlvbmFsIHJlYXNvbnMgd2h5IHdlIGRvbid0IGxpa2UgU1NJRiwg
YnV0IHRob3NlIGFyZSBhZ2FpbiBjb3ZlcmVkIGluPGJyIC8+dGhlIGRvY3VtZW50YXRpb24gZm9y
IGFsbCB0aG9zZSB3aG8gYXJlIGludGVyZXN0ZWQuPGJyIC8+PGJyIC8+SW4gYWRkaXRpb24sIHNp
bmNlIEkgYW0gYWRkaW5nIGJvdGggaG9zdCBzaWRlIGFuZCBCTUMgc2lkZSBzdXBwb3J0LCBJIGZp
Z3VyZWQ8YnIgLz50aGF0IG5vdyBpcyBhIGdvb2QgdGltZSB0byByZXNvbHZlIHRoZSBwcm9ibGVt
IG9mIHdoZXJlIHRvIHB1dCBCTUMgc2lkZSBJUE1JPGJyIC8+ZHJpdmVyczsgcmlnaHQgbm93IHdl
IGhhdmUgaXQgKHRoZXJlIGlzIG9ubHkgb25lKSBpbiBkcml2ZXJzL2NoYXIvaXBtaS8gd2l0aCB0
aGU8YnIgLz5yZXN0IG9mIHRoZSBob3N0IHNpZGUgSVBNSSBkcml2ZXJzLCBidXQgSSB0aGluayBp
dCBtYWtlcyBzZW5zZSB0byBwdXQgYWxsIG9mIHRoZTxiciAvPmhvc3Qgc2lkZSBJUE1JIGRyaXZl
cnMgaW4gb25lIGRpcmVjdG9yeSBhbmQgYWxsIG9mIHRoZSBCTUMgc2lkZSBkcml2ZXJzIGluPGJy
IC8+YW5vdGhlciwgcHJlZmVyYWJseSBpbiBhIHdheSB0aGF0IGRvZXMgbm90IGVmZmVjdCBhbGwg
b2YgdGhlIGN1cnJlbnQgT3BlbklQTUk8YnIgLz51c2Vycy4gSSBoYXZlIG5vdCBjcmVhdGVkIGEg
TUFJTlRBSU5FUlMgZW50cnkgZm9yIHRoZSBuZXcgZGlyZWN0b3J5IHlldCwgYXMgSTxiciAvPmZp
Z3VyZWQgdGhlcmUgbWlnaHQgYmUgc29tZSBkaXNjdXNzaW9uIHRvIGJlIGhhZCBhYm91dCBpdC48
YnIgLz48YnIgLz5JIGhhdmUgdGVzdGVkIHRoaXMgcGF0Y2hzZXQgb24gdGhlIEFzcGVlZCAyNTAw
IEVWQi48L3A+PC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4tLcKg
PGJyIC8+QW50b24gRC4gS2FjaGFsb3Y8YnIgLz7CoDwvZGl2PjxkaXY+wqA8L2Rpdj4=
