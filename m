Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jvsQuHHc"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Gng+eV9n"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQKt41YnNzDrch
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 14:37:16 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C202020C3C;
 Sun, 29 Oct 2017 23:37:13 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 29 Oct 2017 23:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=P7U9fqrNCJ8WkGqoGrYtYtsYlZsvSFUHzferv1Ph2N0=; b=jvsQuHHc
 ETu/jfuswpvva+48Cdabk2NuHoh4JmRVjU89U5q/B3wmukKu4CHZgV61LdOY/fth
 uIP8mXsl7moO2u1E5dN1rAHjpvuKQPRK0jIMHVrsiQerV0M7Ckrx8s2xBzrQKgpx
 BaVB8NzaPfkmS0yMgQxPmnzP58w+sVVPyehyNTdtXJcvRv9Et0Qf+udNAuaMEkZu
 DTlbrxpWqbqs59dVpCDeuWvM1Yq7GM+0O7ap+GObHoNme+E7+BFzZdfuXUjjYCCe
 oVbA4YiUNI/+1DaJL/55bmiJrb7FwBV/zVwDQ7GfvGSgWo2+ewfb2fqJQMw2PZKN
 5QoOaf4GdDIbbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=P7U9fqrNCJ8WkGqoGrYtYtsYlZsvS
 FUHzferv1Ph2N0=; b=Gng+eV9nMo9NJ6XVLp6WvJecVoypHd3apZLiM0yPSSU4c
 AYVQAV4ztvcBTI+nJ8cVq+mdHV9mpYXyxR5kpPDZIxe7zxh/I6jAwmwvc41yID4Z
 +adlwAPcUQ12CjqrofUntA9NsQkbcF6rIfAP3bSQwNwJrJRCnD+PJr+pNFJ+z7Ib
 v3DdOazOu8v6Z0lqbmfcV7y1FDcVvJ6YOOQjAlxGOGo1b3b04NUTZND9KLnqK5GC
 daZ8jPFCiNyePdAUvf6yW5Mg1YO6FPNq4hTFowvMPk6ZuEw9abD8Qjk6C09DXbNK
 xu+zqg1LzMN7LCbpvC4L85z3cNODoAWVH9vev7jbQ==
X-ME-Sender: <xms:aZ72We5G81bvSb0D3oQjV_iVRNoInyKLP1roCMLOEvnGPT8-DkbGSw>
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 520F2240A4;
 Sun, 29 Oct 2017 23:37:12 -0400 (EDT)
Message-ID: <1509334629.13477.19.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] pmbus: core: Switch PAGE failure
 dev_warn() to dev_dbg() for serenity
From: Andrew Jeffery <andrew@aj.id.au>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, andrewg@us.ibm.com
Date: Mon, 30 Oct 2017 14:07:09 +1030
In-Reply-To: <CALLMt=qZJaYrYjg4tLhdWeKiV7YvAUHXaG1R1RJwScMZa8+ybg@mail.gmail.com>
References: <20171030002707.30557-1-andrew@aj.id.au>
 <CALLMt=qZJaYrYjg4tLhdWeKiV7YvAUHXaG1R1RJwScMZa8+ybg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-8UWjHoNd8leijRulxXD6"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Oct 2017 03:37:16 -0000


--=-8UWjHoNd8leijRulxXD6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDE3LTEwLTI5IGF0IDIyOjAwIC0wNTAwLCBBbmRyZXcgR2Vpc3NsZXIgd3JvdGU6
Cj4gPiBPbiBTdW4sIE9jdCAyOSwgMjAxNyBhdCA3OjI3IFBNLCBBbmRyZXcgSmVmZmVyeSA8YW5k
cmV3QGFqLmlkLmF1PiB3cm90ZToKPiA+IFJlZHVjZSBrZXJuZWwgbG9nIHNwYW0gZnJvbSBQTUJ1
cyBjb3JlIGZhaWxpbmcgYSBQQUdFIGNvbW1hbmQgdG8gdGhlCj4gPiBNQVgzNzE4NSAoYW5kIGFu
eSBvdGhlciBkZXZpY2UpLiBJdCdzIGEgaGFyZHdhcmUtZGVzaWduIG9yIGRyaXZlcgo+ID4gcmVs
YXRlZCBmYXVsdCwgYW5kIGlzIG5vdCBhbnl0aGluZyB0aGUgdXNlciBjYW4gZml4LiBUaGVyZWZv
cmUgcmVkdWNlCj4gPiBpdCBmcm9tIHdhcm4gdG8gZGVidWcuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Cj4gPiAtLS0KPiA+IMKgZHJpdmVy
cy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMgfCA2ICsrKy0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMgYi9kcml2ZXJzL2h3bW9uL3BtYnVzL3Bt
YnVzX2NvcmUuYwo+ID4gaW5kZXggZDRlOTU5YmRhNDkxLi5jNGI1NTFiOTIyNmMgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2h3bW9uL3BtYnVzL3BtYnVzX2NvcmUuYwo+ID4gKysrIGIvZHJpdmVy
cy9od21vbi9wbWJ1cy9wbWJ1c19jb3JlLmMKPiA+IEBAIC0xNzUsOSArMTc1LDkgQEAgaW50IHBt
YnVzX3NldF9wYWdlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsIHU4IHBhZ2UpCj4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChydikgewo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcnYgPSBpMmNfc21idXNfd3JpdGVfYnl0
ZV9kYXRhKGNsaWVudCwgUE1CVVNfUEFHRSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFnZSk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldl93YXJuKCZjbGllbnQtPmRldiwKPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIkZhaWxlZCB0byBzZXQgcGFnZSAldSwgcGVyZm9ybWVkIG9uZS1zaG90IHJldHJ5ICVz
OiAlZFxuIiwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFnZSwgcnYgPyAiYW5kIGZhaWxlZCIgOiAid2l0aCBzdWNj
ZXNzIiwgcnYpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBkZXZfZGJnKCZjbGllbnQtPmRldiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJGYWlsZWQgdG8gc2V0IHBhZ2Ug
JXUsIHBlcmZvcm1lZCBvbmUtc2hvdCByZXRyeSAlczogJWRcbiIsCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwYWdlLCBy
diA/ICJhbmQgZmFpbGVkIiA6ICJ3aXRoIHN1Y2Nlc3MiLCBydik7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBuZXdwYWdlID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwgUE1CVVNfUEFH
RSk7Cj4gPiAtLQo+ID4gMi4xMS4wCj4gPiAKPiAKPiBBY2tlZC1ieTogQW5kcmV3IEdlaXNzbGVy
IDxnZWlzc29uYXRvckBnbWFpbC5jb20+CgpUaGFua3MsIGFwcGxpZWQgdG8gZGV2LTQuMTAgd2l0
aCB5b3VyIGFjay4KCkFuZHJldw==


--=-8UWjHoNd8leijRulxXD6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9p5lAAoJEJ0dnzgO5LT5jwMP/3nQZ0prBf4rOrT1Un37eesg
TmU7VFraB4AawcNiuu7RDZwoVVxlDThNF4jSD46dPTrf0OqlrQX0CcuoTrD3Fq5+
s9LUJY47PnCE2jLUvueFfA6t5NjcMUp6Y9g9Qj+t6MgcJc4cN5FTs2GiusJ/ly0/
emhzNaeNtLjtLU7DYH5/XJAdSwG5zDqNE+noP/Vq3+GFTjWJ94/7D+fzbk1mroSh
glf8UZgOjD3QygEAfas92t8Ts+meKBnZDRGZw0mutv0IZFadknymDJfm6u8IEI9R
6TwrkBpYXT0UQ0w0fFLm2HXv5JEaQzif4hv5ZYBU8G4vb+c7pVZ2t9irxAWwgmSB
DrpzT8nD/JAVvXf2dI7PQshrAsioTttCiOJtrV6g9Y8+Sl6C6AyXJRRwPmtZwe8d
3lA86VAD9dqb4FdR7TtxSe9ETRYhXw3FuHZkzklSOAjvjwzli9pYGptjPU3RyJEw
Tf5gKTW2ViWm5uQucGqVMmnUuwrkK6LOoXp+ppDKT4JwBcrJ8885eUsrhsBrT5G1
IukOCJpjR/N4gynYfNjQpiYke1ou0xUj05WIQ6y9z4I3MLKhj6pe95HsA4crX2Uy
2e98dJEiv27ogg/9pYSDimuEMIVDci/9SBKbNR1MwfjJBaOE1mZUfsWeI4GJeNzO
CiUt2LdGhP4gGki5wSet
=RaUm
-----END PGP SIGNATURE-----

--=-8UWjHoNd8leijRulxXD6--
