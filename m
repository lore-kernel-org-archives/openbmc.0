Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 419 seconds by postgrey-1.36 at bilbo;
 Wed, 26 Apr 2017 21:31:04 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="c6kxbLp2"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gXUpfmQ0"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wCdF43F9nzDq9m
 for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2017 21:31:04 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 026EC21C96;
 Wed, 26 Apr 2017 07:24:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Wed, 26 Apr 2017 07:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=F0VEP9jTBtHOI+nqvl9GAEoCIEzh5dy1i7pMuPZfg
 t0=; b=c6kxbLp2pvtj/CmQc11FyaRwZXAEjBrPrCB3Mo+D8YiAj1EsaUFSWWVdd
 dnwXTAtpKIuoluqw6OWIajM1lSvG764weprjz3I1oumdWyUuVRYmvvt2VnOD4v8d
 /97T/4iQY0NGbW7Z9lWzxFfCmlq0/hL7mvplLFdzKRXGQjnSEZx2MjGGc84jGoeB
 F5xPzC2GmO3et/2duNJKkFpfdYjxkSUlWokY4Rb7ZslxBkfI5IRdDLjKs6npJxaC
 dUGh2Ji1Ccd3TFDlajrtyL0AnoA2KltqeTu/QBWTEV2HmsYnLlam1kv+1ThZgKNT
 kvKAqvvyjH4qtXHysjWGuq/T3d46g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=F0VEP9jTBtHOI+nqvl
 9GAEoCIEzh5dy1i7pMuPZfgt0=; b=gXUpfmQ0f2vxL/v9X5M++32D7c/T5709+T
 NAxY1a8PX+gFzAQWUVXRDsCMYZKffCRO7MFyfLmCkO1EtHC16narVynfJ3B+qfWb
 H6tm1yW7uXnq+C6Zh729Vx5wL4tkuYFiVv9zF4L90bFXF10OHIsivsqyKQdO3tIE
 PALyQnbKUrGRWdh4LNJEyTErgc+YG6Hao+ilaSv0TmozhqQgpZFIWjyKDnn1ZppA
 b3ewE7XYQ9BT+jDcmm4RlaTmmtrzVVVdGeFQWhvg7BreoNioKSS6Yg0jsqV05TxH
 w+nEiuEnev9IdmnCZqcsSNcfhzxzzWSFqP6yR6C4KJsDT9OjyuBw==
X-ME-Sender: <xms:UoMAWcgmwSBKoW5nDyZVVpU6LGFHAxrR2UU8RF4RYkBjAFsOScwYpw>
X-Sasl-enc: c8y7g6fD9ZJKYqeXnyRuMkMtTuIkUswZZzr7uFn15nZh 1493205842
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 36D137E0A4;
 Wed, 26 Apr 2017 07:24:00 -0400 (EDT)
Message-ID: <1493205831.4433.1.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2] ARM: dts: aspeed: Modify Laanyang BMC
 device tree
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Ken Chen <chen.kenyy@inventec.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 26 Apr 2017 20:53:51 +0930
In-Reply-To: <CACPK8Xe19-dDyn3GO5RE46=XSdAU=UC=egySFs37d1pBtExW5w@mail.gmail.com>
References: <20170426051358.1909-1-chen.kenyy@inventec.com>
 <CACPK8Xe19-dDyn3GO5RE46=XSdAU=UC=egySFs37d1pBtExW5w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-qbzrxsisJeOr52X9/Lq9"
X-Mailer: Evolution 3.22.6-0ubuntu0.1 
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
X-List-Received-Date: Wed, 26 Apr 2017 11:31:06 -0000


--=-qbzrxsisJeOr52X9/Lq9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA0LTI2IGF0IDE3OjQ1ICswOTMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
SGkgS2VuLAo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRjaC4gSSBoYXZlIHNvbWUgcXVlc3Rp
b25zIGJlbG93Lgo+IAo+ID4gT24gV2VkLCBBcHIgMjYsIDIwMTcgYXQgMjo0MyBQTSwgS2VuIENo
ZW4gPGNoZW4ua2VueXlAaW52ZW50ZWMuY29tPiB3cm90ZToKPiA+IAo+ID4gK8KgwqDCoMKgwqDC
oMKgwqAvKiBTZXR1cCBQTk9SIGFkZHJlc3MgbWFwcGluZyBmb3IgNjRNIGZsYXNoCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgKgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCrCoMKgwqBBRFJCQVNFOiAw
eDMwMDAgKDB4MzAwMDAwMDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgKsKgwqDCoEhXTUJBU0U6
IDB4MEMwMCAoMHgwQzAwMDAwMCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAqwqDCoEFERFJNQVNL
OiAweEZDMDAgKDB4RkMwMDAwMDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgKsKgwqDCoEhXTkNB
UkU6IDB4MDNGRiAoMHgwM0ZGMDAwMCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAqCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgKiBNYXBwaW5nIGFwcGVhcnMgYXQgMHg2MDMwMGZjMDAwMDAwIG9uIHRo
ZSBob3N0Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgd3Jp
dGVsKDB4MzAwMDBDMDAsIEFTVF9JTyhBU1RfQkFTRV9MUEMgfCAweDg4KSk7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoHdyaXRlbCgweEZDMDAwM0ZGLCBBU1RfSU8oQVNUX0JBU0VfTFBDIHwgMHg4Qykp
Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqAvKiBTZXQgU1BJMSBDRTEgZGVjb2Rpbmcgd2lu
ZG93IHRvIDB4MzQwMDAwMDAgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgd3JpdGVsKDB4NzA2ODAw
MDAsIEFTVF9JTyhBU1RfQkFTRV9TUEkgfCAweDM0KSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKg
wqDCoC8qIFNldCBTUEkxIENFMCBkZWNvZGluZyB3aW5kb3cgdG8gMHgzMDAwMDAwMCAqLwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqB3cml0ZWwoMHg2ODYwMDAwMCwgQVNUX0lPKEFTVF9CQVNFX1NQSSB8
IDB4MzApKTsKPiAKPiBXZSBzaG91bGQgbm90IG5lZWQgdG8gZG8gdGhpcy4gbWJveGQgd2lsbCBz
ZXQgdGhlbS4KClRvIGNsYXJpZnksIHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IGNhc2VzIGhlcmUs
IGJ1dCB0aGUgb3V0Y29tZSByZW1haW5zCnRoYXQgd2UgZG9uJ3QgbmVlZCB0aGUgYWJvdmUuIFdl
IGRvbid0IG5lZWQgdG8gc2V0IHRoZSB0d28gTFBDCnJlZ2lzdGVycyBiZWNhdXNlIG1ib3hkIHdp
bGwgc2V0IHRoZW0gdmlhIHRoZSBpbnRlcmZhY2UgZXhwb3NlZCBieQpkcml2ZXJzL21pc2MvYXNw
ZWVkLWxwYy1jdHJsLmMuIFdlIGFsc28gZG9uJ3QgbmVlZCB0byBzZXQgdGhlIHR3byBTUEkKcmVn
aXN0ZXJzIGJlY2F1c2UgdGhlIFNNQyBkcml2ZXIgd2lsbCBjb25maWd1cmUgdGhlbSBiYXNlZCBv
biB0aGUKY2hpcChzKSBkZXRlY3RlZCBvbiB0aGUgYnVzIGR1cmluZyBkcml2ZXIgcHJvYmUuCgpD
aGVlcnMsCgpBbmRyZXcK


--=-qbzrxsisJeOr52X9/Lq9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZAINHAAoJEJ0dnzgO5LT589IP/AkvD/9DfKocmjPogkTozvye
7mfID12jhmrLITuwohbnwSNMap4sCO14w8+F/FhsZSMnJgW3Lu3QPIf6BJPjcdP6
SVcsEqzFwV6B2U4IfHz625fLnUxW7TM4TfutvCkOmtnuwdZ2vYmcq+flim6ZGkBO
GzBj3jP2OCshcSdQ7i0jVfhZDF4YZCd7nMsbyMKlc0ezEEtXI6ZUmEIp9aA+8JUy
TO1AsjI1OcpaSjkb/37e8V2UtODadbZUr8adrB1kXHl8hmyYxMvImvJVbwMDwFel
z52I3EY7YWMVF9o8K82Vl/i3OSy9SdoQHh9RblTld7EMX5mf1iaXILPdeSbdL/q8
Ec0nB9ZWOE0KlrMzylKK1o+ji18S9w+prncb2ruU/qIuq9MtmDLV8LB3yDXO/vEa
MuDVrzeUcQRtddjVN5au9Ii5BR+rNQ7EftA12cVEJTA5vz3xtj2/JFozieDIwpqh
r6yn5fk5IR/TDsfIvNj1Q0fdpGodTkTNsXGtGEtZeCbk06mQVp/MnMzmQaaPuUSN
WlA6U5m2iCDE0aRuKIyNVjWmvdODbZ7kG/LZRVSO53jEZ7HsKSxqAAmB14NJICMp
timUUXDCYsLZkSErMkjrMdFjtTY5l9PoLaD3gjRXdx+cfWsWuXzQiX01yS6SM8U0
Ro2YyH+ZO01qJrvRFdeZ
=qBJv
-----END PGP SIGNATURE-----

--=-qbzrxsisJeOr52X9/Lq9--
