Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vjY7h3zb4zDqXc
 for <openbmc@lists.ozlabs.org>; Wed, 15 Mar 2017 11:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Tnxe/d0m"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O6yYsAqL"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6125720CDC;
 Tue, 14 Mar 2017 20:55:58 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Tue, 14 Mar 2017 20:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=8Mfu9xKiY5JClcCN4q0E/XWYZ50=; b=Tnxe/d
 0mTe2VpPsyO3mxwDNd743W3pyGEK7yONmI7PYjhii/8C+fICgcf8iilJcH0aDWOy
 5BVrnkggi5MoAGFmi8sKoh4H5vbKRfyq06cWJ8DOHrB+P0MFSzoeOMGS3aZtP43q
 X7XkCPWv02AmfhHqFG0mpdUnlsJgUQOvFwuio=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=8Mfu9xKiY5JClc
 CN4q0E/XWYZ50=; b=O6yYsAqLgWPlUKA4aL8MJq6XgXcx3iAQFPSxWtyQv82Dzk
 gHE+7oS2ewa1DY0uPfzsyUpjR2r1heYJqAgHyOQ1iGl0adffd23oSSAf0saABpNX
 abnG8baU2bBrroDJlHwYLQw1HHOfKMcywH7GbOiqbSjgTjDTJdkWuNjFmzW64=
X-ME-Sender: <xms:HpHIWGaDOtepe7Bx17_WNTFzBx-5jAW1nIyQiMzKFwVnqCB0qBVn-w>
X-Sasl-enc: 7bm1jB2fcRc6VnOzv5FZxMvmsqe+i5WzDrI8Q0byKl86 1489539357
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9802C2445F;
 Tue, 14 Mar 2017 20:55:54 -0400 (EDT)
Message-ID: <1489539349.3847.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.{7,10} v2] i2c-core: Expand buffers used in
 i2c_smbus_xfer_emulated()
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Milton Miller II <miltonm@us.ibm.com>, wghoffa@us.ibm.com, Patrick
 Williams <patrick@stwcx.xyz>, Xo Wang <xow@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Wed, 15 Mar 2017 11:25:49 +1030
In-Reply-To: <CACPK8Xf4i63C6FUqKKPByNE8UPhbX2Xskg37Kj-dk6qcerBAhA@mail.gmail.com>
References: <20170314092023.13994-1-andrew@aj.id.au>
 <CACPK8Xf4i63C6FUqKKPByNE8UPhbX2Xskg37Kj-dk6qcerBAhA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HTwHCsE2GBaYsTSc+gSE"
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
X-List-Received-Date: Wed, 15 Mar 2017 00:56:01 -0000


--=-HTwHCsE2GBaYsTSc+gSE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTAzLTE1IGF0IDExOjIzICsxMDMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
PiBPbiBUdWUsIE1hciAxNCwgMjAxNyBhdCA3OjUwIFBNLCBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PiB3cm90ZToKPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
c3dpdGNoIChzaXplKSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNhc2Ug
STJDX1NNQlVTX0JZVEU6Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBkYXRhLT5ieXRlID0gbXNnYnVmMFswXTsKPiA+IEBAIC0zMDU2LDExICszMDc5
LDI2IEBAIHN0YXRpYyBzMzIgaTJjX3NtYnVzX3hmZXJfZW11bGF0ZWQoc3RydWN0IGkyY19hZGFw
dGVyICphZGFwdGVyLCB1MTYgYWRkciwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBjYXNlIEkyQ19TTUJVU19CTE9DS19EQVRBOgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjYXNlIEkyQ19TTUJVU19CTE9DS19QUk9DX0NBTEw6Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBtc2di
dWYxWzBdICsgMTsgaSsrKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZWN2ZCA9IG1zZ2J1ZjFbMF0gKyAxOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocmVjdmQgPiBzaXplb2YoKmRh
dGEpKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBkZXZfd2FybigmYWRhcHRlci0+ZGV2LAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiU01CdXMgYmxvY2sgb3BlcmF0aW9uIHJlY2VpdmVk
IGludmFsaWQgcGF5bG9hZCBsZW5ndGggb2YgJXp1XG4iLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZWN2ZCk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTzsKPiAKPiBU
aGUgbWFpZGVuIHZveWFnZSBvZiBMZWFreSBNY0xlYWtmYWNlLgo+IAo+IEkgY2hhbmdlZCB0aGlz
IHRvOgo+IAo+IHJldCA9IC1FSU87Cj4gZ290byBvdXQ7CgpUaGFua3MuCgo+IAo+IEFzaWRlIGZy
b20geW91ciBhdmVyc2lvbiB0byB2b3dlbHMgdGhpcyBsb29rcyBnb29kIHRvIG1lLiBBcHBsaWVk
IHRvIGRldi00LjcuCj4gCj4gSSB0aGluayB5b3Ugc2hvdWxkIHNlbmQgdGhpcyB1cHN0cmVhbS4g
WW91IGNvdWxkIHNlbmQgaXQgd2l0aCBqdXN0Cj4gdGhpcyBzbmlwcGV0LCB3aXRob3V0IHRoZSBk
eW5hbWljIG1lbW9yeSBhbGxvY2F0aW9uLiBPciB0aGUgZW50aXJlCj4gdGhpbmcuCgpZZWFoLCBJ
J2xsIHNlbmQgaXQgYXMgYW4gUkZDIHdoZW4gSSBnZXQgYSBtb21lbnQuCgpBbmRyZXc=


--=-HTwHCsE2GBaYsTSc+gSE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYyJEVAAoJEJ0dnzgO5LT59rYQALHXmHCdZKR6gi7gaKw79L3J
jB4UqDDYYYcUiP6QIsfb9OZmG52ryqe4my3U2ixqtXEQtWf69BIK1XC7bn/m3WTD
iHM4jmsY+vagyX8FkZsvH2rTT1Fmtz2sjbJkEf/fyqPX7IXGX8QDiPMvefCFnrl3
E9QgKzV0JEWofUxxtUNgPM8wpDM721XYTtW2BQrRiIiqkhymJbf4ja2A/VDFErrt
OsQuC2gYH8li5fBLl0zISZaN2iLYSYa6YSyJ21HiMao5U4MEbQoTtzg24oAbdfmZ
xvBXs2lbK0uaFTS2p2MOubCvnKPHye+/WoSwp4G3gHCy7UobtKo5qEdO34Kb8q5+
jmR+GY0RQo3hdNz2phy1LbqaIxaH1rRJiPr36EDfb248DeuIiK5h4I8gEeORHrJf
yI49z5pKQKm0KAJ8P9rnAPRDVQrxALIHbQ+mGqsEjP3kQVlRo6/zVsc015uqc8nX
UGmyzca49MR2RVgLzX7Cx/P9bkrg+bi2TcCWxGsEBddvAnEXPdOlPjA50XLiLFBe
e6khFOjUp+i72rkDSAWKWK8s07VvaL7YIe5GzDEnsoEfKanxoPkm8heSRoVX++wW
Fjv5zSwgKhOY2Ieh1sE1s7pvC0k8fZ/ZXbl3KFvjxt9FQa7aTq7V0l2WKn0T/NjF
sJuNcqpq9vAZPIozs+Ky
=g5Mo
-----END PGP SIGNATURE-----

--=-HTwHCsE2GBaYsTSc+gSE--
