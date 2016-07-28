Return-Path: <andrew@aj.id.au>
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s0CjN3NP8zDrML
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jul 2016 10:41:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=YCBO9wqd; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=mncvGrbi; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0CE69178B;
 Wed, 27 Jul 2016 20:41:41 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Wed, 27 Jul 2016 20:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=6YoCD
 G2MThDgkRD66b+t7hJPLU0=; b=YCBO9wqdAJgOaT0SnbskuG70p+jgAA+QcS6Ep
 zUgoTwdGjdXUU+OoLu8ahjLmOhJnWRvkfoWdIu2MeiJ7ZoWioP65achpLUaP75dR
 Kg3qt3KNtPiYBYeuk5qhK28ma8clz/bt2AMfxcSnWruoBWTWmbKsE4t4dLoZRWln
 kTE3es=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=6YoCDG2MThDgkRD66b+t7hJPLU0=; b=mncvG
 rbimAj8ZCSJZ8xLfPS7RJbkeVhJVQ9VbKWpu635wzRUr3jh5fHtEyY/kqrJrXF77
 J+geAAgwp7EwSQefhiTlHms0R87kwCz59OGJi5xiseUvz/m3R8spa9FVjQccUnyr
 pBwTjg7h1MDcWuCrrSMkDVBClm1QOxEy4Yyo0E=
X-Sasl-enc: Dx5dqgf5OjwYk3dRI8a6mTIIu/cfowrbE0F9NoQHB5Lu 1469666501
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E8DDF29F3;
 Wed, 27 Jul 2016 20:41:39 -0400 (EDT)
Message-ID: <1469666490.5468.66.camel@aj.id.au>
Subject: Re: [PATCH] ast2500-edk: Configure HW strap register
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Date: Thu, 28 Jul 2016 10:11:30 +0930
In-Reply-To: <20160728002355.14307-1-andrew@aj.id.au>
References: <20160728002355.14307-1-andrew@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-r00gUuNVMLovXr60EUk+"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 00:41:45 -0000


--=-r00gUuNVMLovXr60EUk+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

RGlzcmVnYXJkIHRoaXMsIGl0IHdvbid0IGFwcGx5LiBTb3JyeSBmb3IgdGhlIG5vaXNlLgoKQW5k
cmV3CgpPbiBUaHUsIDIwMTYtMDctMjggYXQgMDk6NTMgKzA5MzAsIEFuZHJldyBKZWZmZXJ5IHdy
b3RlOgo+IFN0cmFwIHJlZ2lzdGVyIHZhbHVlIHdhcyByZWFkIG9mZiB0aGUgaGFyZHdhcmUgYWZ0
ZXIgYm9vdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlk
LmF1Pgo+IC0tLQo+IMKgaHcvYXJtL2FzdDI1MDAtZWRrLmMgfCAyICstCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcv
YXJtL2FzdDI1MDAtZWRrLmMgYi9ody9hcm0vYXN0MjUwMC1lZGsuYwo+IGluZGV4IGFhYWVkM2Y4
Mzc1Ny4uMWJkYTZlOTZiMDQxIDEwMDY0NAo+IC0tLSBhL2h3L2FybS9hc3QyNTAwLWVkay5jCj4g
KysrIGIvaHcvYXJtL2FzdDI1MDAtZWRrLmMKPiBAQCAtNDMsNyArNDMsNyBAQCBzdGF0aWMgdm9p
ZCBhc3QyNTAwX2Vka19pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmYm1j
LT5yYW0pOwo+IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRkX2NvbnN0X2xpbmsoT0JKRUNU
KCZibWMtPnNvYyksICJyYW0iLCBPQkpFQ1QoJmJtYy0+cmFtKSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAm
ZXJyb3JfYWJvcnQpOwo+IC3CoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfaW50KE9CSkVDVCgm
Ym1jLT5zb2MpLCAweDAwMDAwMjAwVSwgImh3LXN0cmFwMSIsCj4gK8KgwqDCoMKgb2JqZWN0X3By
b3BlcnR5X3NldF9pbnQoT0JKRUNUKCZibWMtPnNvYyksIDB4NzEwMGMyZTZVLCAiaHctc3RyYXAx
IiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgJmVycm9yX2Fib3J0KTsKPiDCoMKgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X3NldF9ib29s
KE9CSkVDVCgmYm1jLT5zb2MpLCB0cnVlLCAicmVhbGl6ZWQiLAo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZlcnJvcl9hYm9ydCk7



--=-r00gUuNVMLovXr60EUk+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXmVS6AAoJEJ0dnzgO5LT5Mr4P/1GeA7JY/UpEVF4Aj0i04wXe
XTnJ5fkr6LLxqTmFDoXCvJQAOyV6FSCRgJo0uUn9LFYvga27EGbBHnpMu9jurqYK
8KckaSx+xnY/TUkkvgGUIPPXcfQa2LaQgU7jLtCEBzYiQXDM6l3wNHsiCXkSWRhd
cgYqKCCaGfmYbtPxPlL8Czbfn6Rrs5vM416bWMIEWDnA0ZElIwmrmpWjNmQy883X
UPMlvzOTFs/X2MHa37ewWZW5wPYfh5fCI4wFLFN/99q8A8E+Z33TWNTeDlromTrP
g0+d9BJGYUb8MXqOCQQo27cDsB60yfw4nQ1rWW5aFmlDsFEa1jSbIplHPSCBbMrV
YJrHdszcvE5cFXX9vT1Y/9pQBbzLHiMwEeJup6gg/fdgzY+1nMrwZSZZI6jAYO1t
Oujn49TQYUlFqMLzWSRWoHl23+vVyj1TA01vnsDefCUwpZW5b9U4GSAbmPEjZ/iU
FfoleImf6gTQMP8sksw4HM17NW508oDgG24bI1zinJbx2n1Pq5SbpGcs7ZMTtV8T
xWK/boS0tz/NSRq5y/vejTFeCgEWuYq3YlLbupoUyfFDUrGo+EZxG9diUKsMzSNu
U03x1fIhyjVV9ajU8Da1ydMiVuPkyzmHB8/bMIXAPdoWOkVFCjSwu/TLpmISpP17
UjNh6PdB3xIErD+XvGxa
=8ex8
-----END PGP SIGNATURE-----

--=-r00gUuNVMLovXr60EUk+--
