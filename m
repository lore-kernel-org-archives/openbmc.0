Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vj4Ry40hXzDqZF
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 17:23:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BjRSJlGI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aW8g3QFI"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B129B208A2;
 Tue, 14 Mar 2017 02:23:23 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 14 Mar 2017 02:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=QS6+b/JHOhysJ/XMyLBMMUvA+QQ=; b=BjRSJl
 GIQH2InoyIJmtLntXsIHkI1jaCdoeE6v6N+JWPg/KQCx7NEv6mh9XYcAML99WvuC
 jZhcYt54yGUDVRk6OJ4mipaXdzDriiHuhEJTjRmHcpWSdf2UEUGWC4sa14txBJey
 i/NyHWUf+HnBHElRPOQttaDev/jhNU6/MXNG8=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=QS6+b/JHOhysJ/
 XMyLBMMUvA+QQ=; b=aW8g3QFIhabmcT8fpwPjM9JOoKX3BWtkDK2NsITvPpHlNG
 WBrD9ABQpFuy4T0uthL/TXcvYFkCTQ1O2H7OiRf7+p/lVtUMjkmW+3hp+9RjDNis
 31O6WlS6CCh2jj+tQsgpqTNBwMlqDREBIfWx4a0N+d03ulS6JIibjJBoPki5E=
X-ME-Sender: <xms:W4zHWBHOH-2eQ9D9DYoDlO-wEqg1KxETvrWiHZzwDTUyz3U0mbXuGg>
X-Sasl-enc: 45RUp8BPj2gyL/VKbATu8djTWC9ykLuFA57LvImehm/g 1489472602
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 943367E74E;
 Tue, 14 Mar 2017 02:23:20 -0400 (EDT)
Message-ID: <1489472593.3847.1.camel@aj.id.au>
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Milton Miller II
 <miltonm@us.ibm.com>, wghoffa@us.ibm.com, Patrick Williams
 <patrick@stwcx.xyz>,  Xo Wang <xow@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Tue, 14 Mar 2017 16:53:13 +1030
In-Reply-To: <CACPK8Xdso8w25fUhRWH3Ww87Gjv+tGKvYu0K9VGpTJVi62kiwg@mail.gmail.com>
References: <20170310122135.29827-1-andrew@aj.id.au>
 <CACPK8Xdso8w25fUhRWH3Ww87Gjv+tGKvYu0K9VGpTJVi62kiwg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-vQDGgNS1MOUYRky6hLp/"
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 14 Mar 2017 06:23:28 -0000


--=-vQDGgNS1MOUYRky6hLp/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SW4gYWRkaXRpb24gdG8geW91ciBjb21tZW50cyB0aGVyZSdzIGFsc28gYSBidWcsIHJldCBuZWVk
cyB0byBiZQppbml0aWFsaXNlZCB0byB6ZXJvLiBJIGhhZCB0aGUgY2hhbmdlIGxvY2FsbHkgYW5k
IGhhZCB0ZXN0ZWQgaXQsIGJ1dApoYWQgZm9yZ290dGVuIHRvIGFtZW5kIHRoZSBjb21taXQuCgpP
biBUdWUsIDIwMTctMDMtMTQgYXQgMTU6NTkgKzEwMzAsIEpvZWwgU3RhbmxleSB3cm90ZToKPiA+
IE9uIEZyaSwgTWFyIDEwLCAyMDE3IGF0IDEwOjUxIFBNLCBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PiB3cm90ZToKPiA+IC0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLmMKPiA+ICsr
KyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLmMKPiA+IEBAIC0yODk0LDE2ICsyODk0LDI2IEBAIHN0
YXRpYyBzMzIgaTJjX3NtYnVzX3hmZXJfZW11bGF0ZWQoc3RydWN0IGkyY19hZGFwdGVyICphZGFw
dGVyLCB1MTYgYWRkciwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjaGFyIHJlYWRfd3JpdGUsIHU4IGNvbW1h
bmQsIGludCBzaXplLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVuaW9uIGkyY19zbWJ1c19kYXRhICpkYXRh
KQo+ID4gwqB7Cj4gPiAtwqDCoMKgwqDCoMKgwqAvKiBTbyB3ZSBuZWVkIHRvIGdlbmVyYXRlIGEg
c2VyaWVzIG9mIG1zZ3MuIEluIHRoZSBjYXNlIG9mIHdyaXRpbmcsIHdlCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgbmVlZCB0byB1c2Ugb25seSBvbmUgbWVzc2FnZTsgd2hlbiByZWFkaW5nLCB3ZSBu
ZWVkIHR3by4gV2UgaW5pdGlhbGl6ZQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoG1vc3QgdGhpbmdz
IHdpdGggc2FuZSBkZWZhdWx0cywgdG8ga2VlcCB0aGUgY29kZSBiZWxvdyBzb21ld2hhdAo+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoHNpbXBsZXIuICovCj4gPiAtwqDCoMKgwqDCoMKgwqB1bnNpZ25l
ZCBjaGFyIG1zZ2J1ZjBbSTJDX1NNQlVTX0JMT0NLX01BWCszXTsKPiA+IC3CoMKgwqDCoMKgwqDC
oHVuc2lnbmVkIGNoYXIgbXNnYnVmMVtJMkNfU01CVVNfQkxPQ0tfTUFYKzJdOwo+ID4gK8KgwqDC
oMKgwqDCoMKgLyoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgKiBTbyB3ZSBuZWVkIHRvIGdlbmVyYXRl
IGEgc2VyaWVzIG9mIG1zZ3MuIEluIHRoZSBjYXNlIG9mIHdyaXRpbmcsIHdlCj4gPiArwqDCoMKg
wqDCoMKgwqDCoCogbmVlZCB0byB1c2Ugb25seSBvbmUgbWVzc2FnZTsgd2hlbiByZWFkaW5nLCB3
ZSBuZWVkIHR3by4gV2UgaW5pdGlhbGl6ZQo+ID4gK8KgwqDCoMKgwqDCoMKgwqAqIG1vc3QgdGhp
bmdzIHdpdGggc2FuZSBkZWZhdWx0cywgdG8ga2VlcCB0aGUgY29kZSBiZWxvdyBzb21ld2hhdAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqAqIHNpbXBsZXIuCj4gPiArwqDCoMKgwqDCoMKgwqDCoCoKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgKiBBbHNvLCBhbGxvY2F0ZSAyNTYgYnl0ZSBidWZmZXJzIGFzIHBy
b3RlY3Rpb24gYWdhaW5zdCBzdXNwZWN0Cj4gPiArwqDCoMKgwqDCoMKgwqDCoCogaGFyZHdhcmUg
bGlrZSB0aGUgVUNEOTB4eCwgd2hlcmUgb24gb2NjYXNpb24gdGhlIHJldHVybmVkIGJsb2NrCj4g
PiArwqDCoMKgwqDCoMKgwqDCoCogbGVuZ3RoIGlzIDB4ZmZbMV0uCj4gPiArwqDCoMKgwqDCoMKg
wqDCoCoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgKiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvb3BlbmJtYy9pc3N1ZXMvOTk4Cj4gPiArwqDCoMKgwqDCoMKgwqDCoCovCj4gPiArwqDCoMKg
wqDCoMKgwqB1bnNpZ25lZCBjaGFyICptc2didWYwID0ga21hbGxvYygweDEwMCwgR0ZQX0tFUk5F
TCk7Cj4gPiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBjaGFyICptc2didWYxID0ga21hbGxvYygw
eDEwMCwgR0ZQX0tFUk5FTCk7Cj4gCj4ga3phbGxvYz8KCkFyZ3VhYmx5IG5vdCByZXF1aXJlZCBh
cyBpbiB0aGUgdmFsaWQgcmVzcG9uc2UgY2FzZSB3ZSByZWFkIG9mZiB0aGUKY29ycmVjdCBudW1i
ZXIgb2YgYnl0ZXMsIGFuZCBpbiB0aGUgaW52YWxpZCByZXNwb25zZSBjYXNlIHdlJ3JlIGdvaW5n
CnRvIHJldHVybiBhbiBlcnJvci4KCj4gCj4gCj4gPiBAQCAtMzA1NiwxMSArMzA3NywxNyBAQCBz
dGF0aWMgczMyIGkyY19zbWJ1c194ZmVyX2VtdWxhdGVkKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRh
cHRlciwgdTE2IGFkZHIsCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBicmVhazsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2Fz
ZSBJMkNfU01CVVNfQkxPQ0tfREFUQToKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY2FzZSBJMkNfU01CVVNfQkxPQ0tfUFJPQ19DQUxMOgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgbXNnYnVmMVswXSAr
IDE7IGkrKykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZm9yIChpID0gMDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGkgPCBtaW4oKHNpemVfdCkobXNnYnVmMVswXSArIDEpLCBzaXpl
b2YoKmRhdGEpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGkrKykKPiAKPiBMZXRzIGFzc3VtZSBtc2didWYxWzBdICsgMSA+IHNp
emVvZigqZGF0YSkgbWVhbnMganVuayBpbiB0aGUgYnVmZmVyCj4gYW5kIHJldHVybiBhbiBlcnJv
ciBpbnN0ZWFkIG9mIGEgYnVmZmVyIG9mIGp1bmsuCj4gCj4gSWYgeW91IHdhbnQgdG8gcHJpbnQg
YSBkZWJ1ZyBtZXNzYWdlIHRoZXJlIGl0IG1pZ2h0IGJlIHVzZWZ1bCBmb3IKPiBmdXR1cmUgZGVi
dWdnaW5nLgoKSSdsbCBkbyBib3RoLgoKPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5ibG9ja1tpXSA9IG1z
Z2J1ZjFbaV07Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBicmVhazsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gLcKg
wqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiArb3V0Ogo+ID4gK8KgwqDCoMKgwqDCoMKga2ZyZWUo
bXNnYnVmMCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBrZnJlZShtc2didWYxKTsKPiAKPiBEbyB3ZSBj
bGVhbnVwIGluIGFsbCBwYXRocz8gCgpJIHNlYXJjaGVkICdyZXR1cm4nIGFuZCByZXBsYWNlZCBp
dCB3aXRoIGdvdG8gaW4gZWFjaCBpbnN0YW5jZS4gU28gYXMKbG9uZyBhcyB0aGF0J3MgZ29vZCBl
bm91Z2gsIHllcy4KCj4gSXMgdGhlcmUgYW55IHZhbHVlIGluIHVzaW5nIGRldm1fIGFwaXM/CgpO
byB2YWx1ZSBpbiBkZXZtXyBhcyB3ZSBkb24ndCB3YW50IHRoZSBtZW1vcnkgdG8gaGFuZyBhcm91
bmQgdW50aWwKdW5iaW5kLgoKVW5sZXNzIHdlIGRvIHVzZSBkZXZtXyBhbmQgc3Rhc2ggdGhlIHBv
aW50ZXJzIHNvbWV3aGVyZSBpbiB0aGUgYWRhcHRlcj8KVGhhdCB3b3VsZCBhbW9ydGlzZSB0aGUg
YWxsb2NhdGlvbiBjb3N0LCBidXQgaXQncyBtb3JlIGNoYW5nZXMgdG8gdGhlCmNvcmUuCgpBbmRy
ZXcKCj4gCj4gQ2hlZXJzLAo+IAo+IEpvZWw=


--=-vQDGgNS1MOUYRky6hLp/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYx4xRAAoJEJ0dnzgO5LT5o7sP/jd7HidyxLqUsxoxL5FrCgtA
/9udHrSrkrnO2fUicafho7WNOnmXeNGivbljOnnLeX5djKf/7WbkaLRfC8dWa74x
5u5Mip5PipnyQEJEakFcDs7BvOFbhXqYfY7SbxQISVG4qayyMqgiuPSYvEuMoSdi
vMw4Ism6Qto7JZnUE82aCHdsHT+HPkGqOzoYICLjQqkq6taxBbmEDPOnQq/dThnp
XA3SP9VVZTVrRT/AazILfIQHOjHdDpdzKT42QY/nFWLZ2Wci8maU7qqwbc9M8w48
/3Xwt+2CAQseMGZc6fQAI9EjAOCysrR1DF/UhPjPTvsfUqJj1tlvsXCNA80CPP09
2a55B6Y9UVTRCiPyPY4Q9/9mbA0Qajk4TTP2At27v7QpdmYFYfm7WXZfWytA8HLQ
GcsOGu8hiJKSd+Bkfefjy0QfjQVFw+nxa14AabG2Hy4uTTvSDFJzhOdw3AFuRpUh
LSIRroA3jFpqGAt6eBR2lyLmaQmCLNR+lr9qck93fKSHrg6JZKjPPYmQIRth3yGc
1z2mbXfKeRomr0lbZb7lxevzImeXQ/CXO/hSU1mXokQsW16Q5n/GfJ6x2azMFoah
u6wr5kth27CXJpaxoC9f5gL+KziFgRJKCqr2+XTJeqP3DAKbA8XAVBCcqPN1kAyT
rQzLJXqW43pXTkZMO24Y
=uv/O
-----END PGP SIGNATURE-----

--=-vQDGgNS1MOUYRky6hLp/--
