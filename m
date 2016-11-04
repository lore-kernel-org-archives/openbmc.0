Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t96Ct6NfGzDvNy
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 14:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="IhsELErn"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WCzVZg98"; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DA7ED20529;
 Thu,  3 Nov 2016 23:05:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 03 Nov 2016 23:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=fD+Me95Iay/2Yzz7CWXiN6zpGeA=; b=IhsELE
 rn+glp+iNkjDJaaUCNejoxjh40EYR/NdqQOaGHdBcD6lcr7tKbeZYrLgpiS4jMQe
 F4AkM+wZ0uZpfAaHDxNvPvToEZoOOA4mhk1H+fLhHgavhF1KK5m2BUkqu6yyQpOQ
 zBnfSKCCUd6iNx+YtSlQy355v+aXKl6zJMQkw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=fD+Me95Iay/2Yz
 z7CWXiN6zpGeA=; b=WCzVZg989evBNYRszLqviXM/KhQ/sku9a0VLzMFzQZ/g/k
 xL9fEzqt6C/JXJOpjp4px8WCKmmRdCb06EBvMFf4HqixCrqEzR73Bl+mQQVAFEh4
 T0OKBxs9O9AaQL9nTwmbUcQi6gccdePlRbe54VhpLf58CuJUIFKSwSbgv5SKw=
X-ME-Sender: <xms:CPsbWHotyrPLQCIFRoDftKiEAxIFWak_tOkEpB-MDTufHXOqlFqlsA>
X-Sasl-enc: AbuiO2zYJfTZ7j6Fx0R2o3MCcpe8PYTbzf58Kr76k3wm 1478228742
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9E2AFCCF2A;
 Thu,  3 Nov 2016 23:05:40 -0400 (EDT)
Message-ID: <1478228737.27396.61.camel@aj.id.au>
Subject: Re: [linux dev-4.7 PATCH 2/4] arm: aspeed: Remove Palmetto SCU hack
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
Date: Fri, 04 Nov 2016 13:35:37 +1030
In-Reply-To: <20161103223009.4794-3-joel@jms.id.au>
References: <20161103223009.4794-1-joel@jms.id.au>
 <20161103223009.4794-3-joel@jms.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-xsvSIO7idWIJ4JrPPpq6"
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
X-List-Received-Date: Fri, 04 Nov 2016 03:05:47 -0000


--=-xsvSIO7idWIJ4JrPPpq6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTA0IGF0IDA5OjAwICsxMDMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
VGhlIFBhbG1ldHRvIHdvdWxkIHdyaXRlIHRoZSBmb2xsb3dpbmcgc3RhdGUgaW50byB0aGUgU0NV
LCB3aGljaCBpcyBub3cgY292ZXJlZAo+IGJ5IHBpbm11eDoKPiAKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBNQUMjMSBNRElPMTogMHgw
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVu
YWJsZSBNQUMjMSBNREMxOiAweDAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgRW5hYmxlIE5PUiBmbGFzaCBST01BMjU6IDB4MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgTk9SIGZsYXNoIFJPTUEyNDogMHgwCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBmbGFzaCBST01D
UzQjOiAweDAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
RW5hYmxlIGZsYXNoIFJPTUNTMyM6IDB4MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgZmxhc2ggUk9NQ1MyIzogMHgwCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBmbGFzaCBST01DUzEjOiAw
eDEKPiDCoMKgwqDCoMKgRW5hYmxlIE5PUiBmbGFzaCBBQ0sgY29udHJvbCBpbnB1dCBwaW46IDB4
MQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgQk1DIElSUSMgaW50ZXJydXB0IG91dHB1
dDogMHgxCj4gwqAgRW5hYmxlIEJNQyBJUlEjIGludGVycnVwdCBvdXRwdXQgcG9sYXJpdHk6IDB4
MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgRW5hYmxlIFJlc2VydmVkOiAweDAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBWUElSOTogMHgwCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBF
bmFibGUgVlBJUjg6IDB4MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFZQSVI3OiAweDAKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBW
UElSNjogMHgwCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgVlBJUjU6IDB4MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFZQSVI0OiAw
eDAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoEVuYWJsZSBWUElSMzogMHgwCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgVlBJUjI6IDB4MAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgRW5hYmxlIFZQSVIxOiAweDAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBWUElSMDogMHgwCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBFbmFi
bGUgVlBJRzk6IDB4MAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFZQSUc4OiAweDAKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFBXTTcgb3IgVlBJRzc6IDB4MAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgUFdN
NiBvciBWUElHNjogMHgxCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgRW5hYmxlIFBXTTUgb3IgVlBJRzogMHgxCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFBXTTQgb3IgVlBJRzogMHgxCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFBXTTMg
b3IgVlBJRzogMHgxCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgRW5hYmxlIFBXTTIgb3IgVlBJRzogMHgxCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBQV00xIG9yIFZQSUcxOiAweDEKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxlIFBXTTAgb3IgVlBJ
RzA6IDB4MQo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
CgpSZXZpZXdlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KCj4gLS0tCj4g
wqBhcmNoL2FybS9tYWNoLWFzcGVlZC9hc3BlZWQuYyB8IDMgLS0tCj4gwqAxIGZpbGUgY2hhbmdl
ZCwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1hc3BlZWQv
YXNwZWVkLmMgYi9hcmNoL2FybS9tYWNoLWFzcGVlZC9hc3BlZWQuYwo+IGluZGV4IDIwMmJmM2Q5
ZDQ2Ny4uY2ZiZDZkM2IzYjczIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtYXNwZWVkL2Fz
cGVlZC5jCj4gKysrIGIvYXJjaC9hcm0vbWFjaC1hc3BlZWQvYXNwZWVkLmMKPiBAQCAtMTE1LDkg
KzExNSw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkb19wYWxtZXR0b19zZXR1cCh2b2lkKQo+IMKg
CS8qIFNldHVwIFBOT1IgYWRkcmVzcyBtYXBwaW5nIGZvciAzMk0gZmxhc2ggKi8KPiDCoAl3cml0
ZWwoMHgzMDAwMEUwMCwgQVNUX0lPKEFTVF9CQVNFX0xQQyB8IDB4ODgpKTsKPiDCoAl3cml0ZWwo
MHhGRTAwMDFGRiwgQVNUX0lPKEFTVF9CQVNFX0xQQyB8IDB4OEMpKTsKPiAtCj4gLQkvKiBTQ1Ug
c2V0dXAgKi8KPiAtCXdyaXRlbCgweDAxQzAwMDdGLCBBU1RfSU8oQVNUX0JBU0VfU0NVIHwgMHg4
OCkpOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgdm9pZCBfX2luaXQgZG9fZmlyZXN0b25lX3NldHVw
KHZvaWQp


--=-xsvSIO7idWIJ4JrPPpq6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJYG/sBAAoJEJ0dnzgO5LT5x5QP/jWxFzMS8l+l2JM3efCqzCpl
gvL0vh17+7WFJ+DZA+zOj4vJ/apHEwcyj40NEldkjGnJz2OfIREaKLnw0RsfjRNo
v0GnxXIafrKWMKfHKZasfh1vT0PF2za5vB7A7xtdK0pSwm3eewTUhSSHKhbjr76m
1MmcZedeL4nt0Ckmk5z37JDPVy5rQ1b/dF+TeynKFzt/crlApbuoQ7cBFxL+KO3s
yZKBtfQcDJ1r0CSTDCAyN1veahSn5u09tbHmkXvsnR2+5CeCRBKUjq/l8H5MHFp3
ntI8rCAMyVsT0+RdxAKbuUBmXBFr/XRxBvMBKmy93KCB3SrFnzQir6rMLkNzyM1c
qmj/iq0PEpEdTSjggkhKAjTiA89qgHR6uYLF5ulc3Qo344XEvUFSGX2wDEhSQH1M
tmkolq7hM26irV4W+9h0ynvmYT/S09USsxLk9CwpA1TeaFtpt/VZVvgbEYBJ+DPF
KKZpR+o3TzZOhRffSBMUGMmpQRPm8OE4Tq8hF1UUgkSvtadiALHfVM3EbWjzojfB
h1Pj5drsgL+vkUPlxBjTWForbbPiPrevVE6N7bJXnlwtn+tAcIqPQLNNJ4J5/eSR
ZLwfy5pD8Hh65JE5pboy3k+mu7QG7H1y7aii5Ti8G++iFA6GRNNH2r0EazsBqN3R
2NAHHCBrbIZ5RseiC7Rb
=uWcU
-----END PGP SIGNATURE-----

--=-xsvSIO7idWIJ4JrPPpq6--
