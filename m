Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZyFn0YnjzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:22:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=gU3M7Tv6; 
 dkim=fail reason="signature verification failed" (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b=ccisTlsj; dkim-atps=neutral
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B350F207DD;
 Thu, 15 Sep 2016 21:22:50 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute7.internal (MEProxy); Thu, 15 Sep 2016 21:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=HqHAp
 Lz6qhnbyqW1U9xsSp0kUm0=; b=gU3M7Tv65mo4tzuWMSNZfYqCTssuuc79B6edn
 UPGVJKzbayRoRtf+CmhtLnzbH0Wm5hgxGdRQzEWdHgZaSeFwldnTzWFlvRQnAlZX
 5fckUE0JfXItQu5mVEzjN0rK7D5EgMbDheL1a/K8dD3ASB0iS/WjA5vYgbJdPqCb
 pssjgY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-sasl-enc
 :x-sasl-enc; s=smtpout; bh=HqHApLz6qhnbyqW1U9xsSp0kUm0=; b=ccisT
 lsjsFWqnWWVqtlrfvbHxgaIGPB9zZhSYztJbFQo0yjxxMAoqBxQHa00OsWGK7JNN
 lCCt6R9quUvhf3OW/dfIDY/cJCnNXV9BfKjOhmrXhL3PE2QP8qqH7J9AK0xXH7RR
 Tf3DG66M6hlAJDUoThH5J4xAkmig1YvNnVoheQ=
X-Sasl-enc: boUCYfaAUngDFq4S2Dhs78ziQemhyBnnwg/RjBhrEKH/ 1473988969
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0421ECCE9D;
 Thu, 15 Sep 2016 21:22:48 -0400 (EDT)
Message-ID: <1473988958.13249.29.camel@aj.id.au>
Subject: Re: [PATCH 06/16] mach-aspeed: Add missing Firestone setup method and
From: Andrew Jeffery <andrew@aj.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, openbmc@lists.ozlabs.org
Date: Fri, 16 Sep 2016 10:52:38 +0930
In-Reply-To: <183575887.194626.1473971702437.JavaMail.zimbra@raptorengineeringinc.com>
References: <183575887.194626.1473971702437.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZVLHnLd76ifZslmezZ88"
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
X-List-Received-Date: Fri, 16 Sep 2016 01:22:53 -0000


--=-ZVLHnLd76ifZslmezZ88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE2LTA5LTE1IGF0IDE1OjM1IC0wNTAwLCBUaW1vdGh5IFBlYXJzb24gd3JvdGU6
Cj4gwqBjYWxsCj4gCj4gLS0tCj4gwqBhcmNoL2FybS9tYWNoLWFzcGVlZC9hc3BlZWQuYyB8wqDC
oMKgMTQgKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtYXNwZWVkL2FzcGVlZC5jIGIvYXJjaC9h
cm0vbWFjaC0KPiBhc3BlZWQvYXNwZWVkLmMKPiBpbmRleCAxYjBlZTExLi5lY2I2MTNkIDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtYXNwZWVkL2FzcGVlZC5jCj4gKysrIGIvYXJjaC9hcm0v
bWFjaC1hc3BlZWQvYXNwZWVkLmMKPiBAQCAtMTE5LDYgKzExOSwxOCBAQCBzdGF0aWMgdm9pZCBf
X2luaXQgZG9fcGFsbWV0dG9fc2V0dXAodm9pZCkKPiDCoAl3cml0ZWwoMHgwMUMwMDA3RiwgQVNU
X0lPKEFTVF9CQVNFX1NDVSB8IDB4ODgpKTsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgdm9pZCBfX2lu
aXQgZG9fZmlyZXN0b25lX3NldHVwKHZvaWQpCj4gK3sKPiArCWRvX2NvbW1vbl9zZXR1cCgpOwo+
ICsKPiArCS8qIFNldHVwIFBOT1IgYWRkcmVzcyBtYXBwaW5nIGZvciA2NE0gZmxhc2ggKi8KPiAr
CXdyaXRlbCgweDMwMDAwQzAwLCBBU1RfSU8oQVNUX0JBU0VfTFBDIHwgMHg4OCkpOwo+ICsJd3Jp
dGVsKDB4RkMwMDAzRkYsIEFTVF9JTyhBU1RfQkFTRV9MUEMgfCAweDhDKSk7CgpKb2VsOiBIbW0s
IHRoYXQgTFBDIGRyaXZlciBzdXJlIHdvdWxkIGJlIGhhbmR5Li4uCgo+ICsKPiArCS8qIFNDVSBz
ZXR1cCAqLwo+ICsJd3JpdGVsKDB4RDcwMDAwMDAsIEFTVF9JTyhBU1RfQkFTRV9TQ1UgfCAweDg4
KSk7CgpDYW4geW91IHBsZWFzZSBkb2N1bWVudCBleGFjdGx5IHdoYXQgdGhpcyBpcyAoZGUpY29u
ZmlndXJpbmcgYW5kIHdoeT8KVGhhdCB3YXkgd2hlbiB3ZSBjb21lIHRvIHJlbW92ZSB0aGUgaGFj
ayB3ZSBoYXZlIHNvbWUgY29udGV4dC4KCkJldHRlciB5ZXQsIGFjY29yZGluZyB0byBgYml0Zmll
bGRgOgoKJCBiaXRmaWVsZCBTQ1U4OCAweEQ3MDAwMDAwCmRlY29kaW5nIGFzIFNDVSBNdWx0aS1m
dW5jdGlvbiBQaW4gQ29udHJvbCAjMwoweGQ3MDAwMDAwIFszNjA3MTAxNDQwXQrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBFbmFibGUgTUFDIzEgTURJTzE6IDB4MQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBNQUMj
MSBNREMxOiAweDEKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBFbmFibGUgTk9SIGZsYXNoIFJPTUEyNTogMHgwCsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxl
IE5PUiBmbGFzaCBST01BMjQ6IDB4MQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBmbGFzaCBST01DUzQjOiAw
eDAKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBFbmFibGUgZmxhc2ggUk9NQ1MzIzogMHgxCsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRW5hYmxl
IGZsYXNoIFJPTUNTMiM6IDB4MQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoEVuYWJsZSBmbGFzaCBST01DUzEjOiAweDEK
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLi4uCgpB
bmQgYXMgc3VjaCBlYWNoIG9mIHRoZXNlIGNhbiBiZSBjb25maWd1cmVkIHRocm91Z2ggdGhlIGRl
dmljZXRyZWUgdmlhCnBpbm11eCBmdW5jdGlvbnMgTURJTzEsIFJPTTE2LCBST01DU1szMjFdLiBI
b3dldmVyLCBsb29raW5nIGF0IHRoZQpwaW5tdXggZHJpdmVyLCB3aGlsc3QgUk9NQ1NbMzIxXSBh
cmUgZGVmaW5lZCBmb3IgdGhlIHJlbGV2YW50IHBpbnMgdGhleQpkb24ndCBsb29rIHRvIGhhdmUg
YmVlbiBhZGRlZCB0byB0aGUgbGlzdCBvZiBleHBvcnRlZCBmdW5jdGlvbnMgaW4gZGV2LQo0Ljcu
IEknbGwgaGF2ZSB0byBkaWcgZnVydGhlciBpbnRvIHRoYXQsIGJ1dCBpdCdzIHByb2JhYmx5IGFu
IG92ZXJzaWdodApvbiBteSBwYXJ0LgoKT3V0IG9mIGludGVyZXN0LCB3aGF0IGFyZSB5b3UgZG9p
bmcgd2l0aCBST01BMjQ/IElzIHRoYXQgYWN0dWFsbHkKcmVxdWlyZWQsIGFuZCBpZiBzbywgaXMg
aXQgbWVhbnQgdG8gYmUgaW5kZXBlbmRlbnQgb2YgUk9NQTI1PyBJIG1heQpoYXZlIHRvIHJldGhp
bmsgbXkgYXBwcm9hY2ggdGhlcmUuCgpDaGVlcnMsCgpBbmRyZXcKCj4gK30KPiArCj4gwqBzdGF0
aWMgdm9pZCBfX2luaXQgZG9fZ2Fycmlzb25fc2V0dXAodm9pZCkKPiDCoHsKPiDCoAlkb19jb21t
b25fc2V0dXAoKTsKPiBAQCAtMTk2LDYgKzIwOCw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBhc3Bl
ZWRfaW5pdF9lYXJseSh2b2lkKQo+IMKgCQlkb19iYXJyZWxleWVfc2V0dXAoKTsKPiDCoAlpZiAo
b2ZfbWFjaGluZV9pc19jb21wYXRpYmxlKCJ0eWFuLHBhbG1ldHRvLWJtYyIpKQo+IMKgCQlkb19w
YWxtZXR0b19zZXR1cCgpOwo+ICsJaWYgKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgiaWJtLGZp
cmVzdG9uZS1ibWMiKSkKPiArCQlkb19maXJlc3RvbmVfc2V0dXAoKTsKPiDCoAlpZiAob2ZfbWFj
aGluZV9pc19jb21wYXRpYmxlKCJpYm0sZ2Fycmlzb24tYm1jIikpCj4gwqAJCWRvX2dhcnJpc29u
X3NldHVwKCk7Cj4gwqAJaWYgKG9mX21hY2hpbmVfaXNfY29tcGF0aWJsZSgiYXNwZWVkLGFzdDI1
MDAtZXZiIikp


--=-ZVLHnLd76ifZslmezZ88
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX20leAAoJEJ0dnzgO5LT5rRAQALlPiSxGvZpxH/YMTmuVE/jF
jVjAwxLATxoJ+mGWJ5rb5HjIugqgHZkIQpK3MBs5ZHtWso7gTVTg5vEsOmtegXNB
m5xgltFnuJ4psp9cLJ8PWa4EhvcZUq8tQhNDPul1eUK47qm8Zju2I0z/wZg30oV2
BLDGHE8YKkMMEb01tlYDpH5qsrE1CC7QL4ekQyZ2XasAhTvyvA8ey7Yplkphs47v
zTBA35AXFwBW/QyBD0BE6sjMpvXPn3ERcKFfX4u7buHPwduQM99AB0Cbb6TAccsY
v/XbWcRv1QzIkIk/BNXr8pNBVIvhXUNLOI4u32GPZRYCagADLlYZ2drxf4OD1/6l
lGLy8is/YFsUkommGlY/nXqWEgfUKNa1YhOp+Hm421+cqJxPcq9VZDQTejo6GlUf
aaGm9FtEnBAmKawl7hRW96wmzd74Adso8lKJG5z8MqkMG6U6nN86J+wzCkbci+Iu
CHtNZulHY6Xm2zhxa7X5WCKjqiNOzAE3Nmx25ojosHd2CTT1z/tlvr8oKIol+0Lu
bx45IR4HXvPIU87NrqFSKB4YNJA4HWmSCtl9QDNywVKDCSnwrtyeuQ05jq/DGYpu
C0lu1uaxc5+Roe9ozDDPcyibkPVRifgWZJaX1XI4z75qMK2uH7q8pNbfyNkzzJ/h
fm+Wb8m4GgzUITAMt7qJ
=dICR
-----END PGP SIGNATURE-----

--=-ZVLHnLd76ifZslmezZ88--
