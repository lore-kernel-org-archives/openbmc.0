Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7p9N34nZzDvNT
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 10:59:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=dom17xfu; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=Nm8FB426; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 44B9E20844;
 Tue,  1 Nov 2016 19:59:01 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute7.internal (MEProxy); Tue, 01 Nov 2016 19:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 x-me-sender:x-sasl-enc:message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version; s=mesmtp; bh=
 TDSqt/MCiq7L7ycgbWWXLkWzicA=; b=dom17xfu6IgErbhJue2tgXYutVfe4uJJ
 oZAPCfhvXETB0Rg7noQ+soZAlhqoBxpgHVVqvVBxth9Ec13sT+BkOxysrH2y9TLT
 oF9rztcOl2UX07qKQ/c4I+xaczUCZxQng7t7PLGvRti26ORXO8GmBYBIU8bBvJ3E
 3xBSbAWR61k=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=x-me-sender:x-sasl-enc:message-id:subject
 :from:to:cc:date:in-reply-to:references:content-type
 :mime-version; s=smtpout; bh=TDSqt/MCiq7L7ycgbWWXLkWzicA=; b=Nm8
 FB426LZWDGRCy1fetzVmHbCTbng9INZXNFnpDabiSOvlzDwRQuc0BiJ8leKL/yqR
 oTVYU2Y7uwJnl6G0GO7RJ+g8ypYkrMeeAYQuH0mr7P2tS58DDZEPmEC3e5yRLXJV
 y5I6g5er6sk7dlopdSBwztDZIdN2KxgMYEpLhFH8=
X-ME-Sender: <xms:RSwZWNfyIsWNQ6yKA-w_NqbAqZVzhhrUlB6yfQ1UkfFjHECtAAihxQ>
X-Sasl-enc: cSFmzD1XLeW6MonvD9SmkjQgWKrWrmg2AJdZB2Huj79p 1478044740
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2FEC1F29CF;
 Tue,  1 Nov 2016 19:58:58 -0400 (EDT)
Message-ID: <1478044732.27396.3.camel@aj.id.au>
Subject: Re: [PATCH linux] ARM: dts: aspeed-g5: Update zaius with new
 spi-nor binding
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 02 Nov 2016 10:28:52 +1030
In-Reply-To: <CACPK8XfEt+8rdkffHTtfoh13akffxDhrTe0WXZA0-oGbt4FuXg@mail.gmail.com>
References: <1478043025-78465-1-git-send-email-xow@google.com>
 <CACPK8XfEt+8rdkffHTtfoh13akffxDhrTe0WXZA0-oGbt4FuXg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-xZb+rsQ4zyrW2PewcPRO"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
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
X-List-Received-Date: Tue, 01 Nov 2016 23:59:05 -0000


--=-xZb+rsQ4zyrW2PewcPRO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE2LTExLTAyIGF0IDEwOjE1ICsxMDMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
SGV5IFhvLAo+IAo+IE9uIFdlZCwgTm92IDIsIDIwMTYgYXQgMTA6MDAgQU0sIFhvIFdhbmcgPHhv
d0Bnb29nbGUuY29tPiB3cm90ZToKPiAKPiA+IAo+ID4gKyZzcGkxIHsKPiA+ICvCoMKgwqDCoMKg
wqDCoHN0YXR1cyA9ICJva2F5IjsKPiA+ICvCoMKgwqDCoMKgwqDCoHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7Cj4gPiArwqDCoMKgwqDCoMKgwqBwaW5jdHJsLTAgPSA8JnBpbmN0cmxfc3BpMV9k
ZWZhdWx0PjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGZsYXNoQDAgewo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsYWJlbCA9ICJwbm9yIjsKPiA+ICvCoMKgwqDCoMKgwqDCoH07Cj4g
PiArfTsKPiA+ICsKPiA+ICsmc3BpMiB7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAib2th
eSI7Cj4gSSB0aGluayB3ZSB3YW50IHRvIHJlcXVlc3QgdGhlIHBpbnMgaGVyZS4gU29tZXRoaW5n
IGxpa2UgdGhpczoKPiAKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoHBpbmN0cmwtMCA9IDwmcGluY3RybF9zcGky
Y2tfZGVmYXVsdAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCZwaW5jdHJsX3NwaTJjczBfZGVmYXVsdAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZwaW5jdHJsX3NwaTJjczFfZGVmYXVsdAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZwaW5jdHJs
X3NwaTJtaXNvX2RlZmF1bHQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAmcGluY3RybF9zcGkybW9zaV9kZWZhdWx0PjsKClllcywgd2UgbmVlZCB0
aGlzLCB0aG91Z2ggbWF5YmUgdGhlIGNoaXAgc2VsZWN0cyBzaG91bGQgYmUgcHVzaGVkIG91dAp0
byB0aGUgYm9hcmQgZHRzPwoKQW5kcmV3Cgo+ICsKPiAKPiBDYW4geW91IHRyeSB0aGF0IGFuZCBk
byBhIHRlc3QgYm9vdCBvbiB5b3VyIGhhcmR3YXJlPwo+IAo+IENoZWVycywKPiAKPiBKb2VsCj4g
Cj4gPiAKPiA+ICvCoMKgwqDCoMKgwqDCoGZsYXNoQDAgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJva2F5IjsKPiA+ICvCoMKgwqDCoMKgwqDCoH07Cj4gPiAr
fTsKPiA+ICs=


--=-xZb+rsQ4zyrW2PewcPRO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYGSw8AAoJEJ0dnzgO5LT5iAEQAJgoAvFMqyr0i8IQOVq4WWRw
yhS3xDLIypAqzlnAsUEjvDoXI90ZeF9TaOMw7e7hAs50Qr2ymJce/5ZqjG98Sd1W
4G9ThvtknAlD0PvOnC82RP0qHDln2QBXsLWlfRrYWBm/pUK17lQ+P92qjiZeP1Nc
qi98opFevTQ6WJB4UPJ6r4NyBwvkwV3lU2E1Qtnme1kjJ97/dcWgWoeH7fVjCK6d
KvZJ8WG+T4lfjTqQPb8cALyW9r/c5JVFsDAo46KmyhOptXzF/2ywOGaF8E8+eRrb
gnoJsatVdJoot8xFY8OO8INC0NpRMLyHGrW5E0BXPx3D5pEigTS/q4oCORMWx4LD
qkopYzzjZr85HoHCsr0TTEf06zXTpUCKm2z6vM69eqJyy21tqglH0NvEUYCYD9cQ
PxcAjBc3W14AGeivaO8tXXMLc/MP7ncUFfhOL6gDjUPLBPbAJTi8OHAkWEEj4pgq
BGs2etwIAw6YCQvb0Bbz7xJ/iV7XAy1NyUTd0lm6LFoUOMIPkyttOxIZpVUYDdwo
+I3XHsY4ZRU+wPHVFMjvpR55/Nzbp52TmDZ6PjWS4xNd1U0ioc9QVCkLiOqx7D+L
4tpT1m70B32KP+nj1XyFemx/gV5LQEpky6QiXVd2zXudNILJbUGHm/1ispDu6uGR
FBuTmf9Hhm8ycFJ/FV7g
=cUGY
-----END PGP SIGNATURE-----

--=-xZb+rsQ4zyrW2PewcPRO--
