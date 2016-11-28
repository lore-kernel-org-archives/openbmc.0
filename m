Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqv91DnlzDvk1
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 13:12:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SCzTcE24"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="KD2LVAfl"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CA36B208A0;
 Sun, 27 Nov 2016 21:12:18 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 21:12:18 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=TL0zPrECFPUN4Hsd4JVL+h2tkC4=; b=SCzTcE
 24fI7IFxo5gozS3hPy1i/DAY56t9sFgJ810RaNkC42OdVrCPgTEpbRN1EG49L1VI
 ogFKp1eHdjS5qWAZ3gv1yFbwhoR/IcgxVzTOqhlH/s1RPRHyjnp/Ue+1xPxDpwWI
 9/j6GHjg89D1ZnAvIdvKT4UgDSmtiYUw8+q/E=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=TL0zPrECFPUN4H
 sd4JVL+h2tkC4=; b=KD2LVAflz83r+s4B/m1S5lRB0M6HmnmRnhp0a70r32EAy1
 wG777R3CW3XH798XmCjxC2aKAqFBd23nA1MQuoQusjqqwX5AhbynSUGOTQPj+RMw
 Nx3QNU3QneDq5Z1O7m/DEXJ7Tciee4qqTBek3OnSlbv0L1Ltu71TNC7M1TJTY=
X-ME-Sender: <xms:gpI7WNPrWX6DUPXzKujypI5keTUObiAO9t1VOpBRJzeWJsn0Dv6a2A>
X-Sasl-enc: 3aVG1EwzpxSRHc4BtI93yq8N3jredAShIWLt8XOrFRJU 1480299137
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEC1B24077;
 Sun, 27 Nov 2016 21:12:16 -0500 (EST)
Message-ID: <1480299131.2503.76.camel@aj.id.au>
Subject: Re: [PATCH qemu 31/38] aspeed: add a watchdog controller
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:42:11 +1030
In-Reply-To: <1479478938-13267-32-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-32-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-sbc3iTiyDchFj/CsiiqL"
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
X-List-Received-Date: Mon, 28 Nov 2016 02:12:21 -0000


--=-sbc3iTiyDchFj/CsiiqL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE1OjIyICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKUmV2
aWV3ZWQtYnk6IEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Cgo+IC0tLQo+IMKgaHcv
YXJtL2FzcGVlZF9zb2MuY8KgwqDCoMKgwqDCoMKgwqDCoHwgMTMgKysrKysrKysrKysrKwo+IMKg
aW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oIHzCoMKgMiArKwo+IMKgMiBmaWxlcyBjaGFuZ2Vk
LCAxNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2h3L2FybS9hc3BlZWRfc29jLmMg
Yi9ody9hcm0vYXNwZWVkX3NvYy5jCj4gaW5kZXggZDJiYzBiYTIwNzBkLi4yOTI2ZWQyZGQ0NmQg
MTAwNjQ0Cj4gLS0tIGEvaHcvYXJtL2FzcGVlZF9zb2MuYwo+ICsrKyBiL2h3L2FybS9hc3BlZWRf
c29jLmMKPiBAQCAtMzEsNiArMzEsNyBAQAo+IMKgI2RlZmluZSBBU1BFRURfU09DX1NDVV9CQVNF
wqDCoMKgwqDCoMKgwqDCoMKgMHgxRTZFMjAwMAo+IMKgI2RlZmluZSBBU1BFRURfU09DX1NSQU1f
QkFTRcKgwqDCoMKgwqDCoMKgwqAweDFFNzIwMDAwCj4gwqAjZGVmaW5lIEFTUEVFRF9TT0NfVElN
RVJfQkFTRcKgwqDCoMKgwqDCoMKgMHgxRTc4MjAwMAo+ICsjZGVmaW5lIEFTUEVFRF9TT0NfV0RU
X0JBU0XCoMKgwqDCoMKgwqDCoMKgwqAweDFFNzg1MDAwCj4gwqAjZGVmaW5lIEFTUEVFRF9TT0Nf
STJDX0JBU0XCoMKgwqDCoMKgwqDCoMKgwqAweDFFNzhBMDAwCj4gwqAKPiDCoHN0YXRpYyBjb25z
dCBpbnQgdWFydF9pcnFzW10gPSB7IDksIDMyLCAzMywgMzQsIDEwIH07Cj4gQEAgLTE2OCw2ICsx
NjksMTAgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19pbml0KE9iamVjdCAqb2JqKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzYy0+aW5mby0+
c2lsaWNvbl9yZXYpOwo+IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRkX2FsaWFzKG9iaiwg
InJhbS1zaXplIiwgT0JKRUNUKCZzLT5zZG1jKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJyYW0tc2l6ZSIsICZlcnJvcl9h
Ym9ydCk7Cj4gKwo+ICvCoMKgwqDCoG9iamVjdF9pbml0aWFsaXplKCZzLT53ZHQsIHNpemVvZihz
LT53ZHQpLCBUWVBFX0FTUEVFRF9XRFQpOwo+ICvCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9hZGRf
Y2hpbGQob2JqLCAid2R0IiwgT0JKRUNUKCZzLT53ZHQpLCBOVUxMKTsKPiArwqDCoMKgwqBxZGV2
X3NldF9wYXJlbnRfYnVzKERFVklDRSgmcy0+d2R0KSwgc3lzYnVzX2dldF9kZWZhdWx0KCkpOwo+
IMKgfQo+IMKgCj4gwqBzdGF0aWMgaW50IGFzcGVlZF9mbWNfZ2V0X2NzKEFzcGVlZFNvQ1N0YXRl
ICpzLCBFcnJvciAqKmVycnApCj4gQEAgLTMyOSw2ICszMzQsMTQgQEAgc3RhdGljIHZvaWQgYXNw
ZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoqZXJycCkKPiDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm47Cj4gwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgc3lzYnVzX21taW9f
bWFwKFNZU19CVVNfREVWSUNFKCZzLT5zZG1jKSwgMCwgQVNQRUVEX1NPQ19TRE1DX0JBU0UpOwo+
ICsKPiArwqDCoMKgwqAvKiBXYXRjaCBkb2cgKi8KPiArwqDCoMKgwqBvYmplY3RfcHJvcGVydHlf
c2V0X2Jvb2woT0JKRUNUKCZzLT53ZHQpLCB0cnVlLCAicmVhbGl6ZWQiLCAmZXJyKTsKPiArwqDC
oMKgwqBpZiAoZXJyKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqBlcnJvcl9wcm9wYWdhdGUoZXJycCwg
ZXJyKTsKPiArwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArwqDCoMKgwqB9Cj4gK8KgwqDCoMKg
c3lzYnVzX21taW9fbWFwKFNZU19CVVNfREVWSUNFKCZzLT53ZHQpLCAwLCBBU1BFRURfU09DX1dE
VF9CQVNFKTsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19jbGFzc19pbml0
KE9iamVjdENsYXNzICpvYywgdm9pZCAqZGF0YSkKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9h
cm0vYXNwZWVkX3NvYy5oIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oCj4gaW5kZXggMWFi
NWRlYWEwODEzLi5kYmVjMGMxNTk4ODUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody9hcm0vYXNw
ZWVkX3NvYy5oCj4gKysrIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oCj4gQEAgLTE5LDYg
KzE5LDcgQEAKPiDCoCNpbmNsdWRlICJody90aW1lci9hc3BlZWRfdGltZXIuaCIKPiDCoCNpbmNs
dWRlICJody9pMmMvYXNwZWVkX2kyYy5oIgo+IMKgI2luY2x1ZGUgImh3L3NzaS9hc3BlZWRfc21j
LmgiCj4gKyNpbmNsdWRlICJody93YXRjaGRvZy93ZHRfYXNwZWVkLmgiCj4gwqAKPiDCoCNkZWZp
bmUgQVNQRUVEX1NQSVNfTlVNwqDCoDIKPiDCoAo+IEBAIC0zNyw2ICszOCw3IEBAIHR5cGVkZWYg
c3RydWN0IEFzcGVlZFNvQ1N0YXRlIHsKPiDCoMKgwqDCoMKgQXNwZWVkU01DU3RhdGUgZm1jOwo+
IMKgwqDCoMKgwqBBc3BlZWRTTUNTdGF0ZSBzcGlbQVNQRUVEX1NQSVNfTlVNXTsKPiDCoMKgwqDC
oMKgQXNwZWVkU0RNQ1N0YXRlIHNkbWM7Cj4gK8KgwqDCoMKgQXNwZWVkV0RUU3RhdGUgd2R0Owo+
IMKgfSBBc3BlZWRTb0NTdGF0ZTsKPiDCoAo+IMKgI2RlZmluZSBUWVBFX0FTUEVFRF9TT0MgImFz
cGVlZC1zb2Mi


--=-sbc3iTiyDchFj/CsiiqL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO5J8AAoJEJ0dnzgO5LT5obYQAIvQRBQ62TyfJk4pVjUEEHV5
U5WKpK+8H3/kL6mWMx77/TODhbDgYJ7qaBlANuNMGRPJ8t+rphAB/uHzKbtHsrCI
jXpUSI1C6xp5dwucLRJrYPYfpWUG/dGGJZWHgdOMLSqA0TY/BQsEyi09JUubO5YM
JH/kyG83DR4vVNT4209Ce7cxr9yswiCxo4MkKeeFrfQc4cJEZIwEOAS/LCM8A8ah
wsOA9EWQu1WwRGD0KR87bUWDZgddpEog0VCnrQmxveT1ASjnxticcP7pP9P/EyXi
NAvA0a1NhcC2LBer7FKyVmMZMfzj4hTvCznyR6V4GRmraD1LMNMDhg0NmJvhIpHU
EkdQtMzIISQIJMmvSfQJeB7VG173CvG6qJZApTUWzHdGnjgue+/HcFzhLrtorr3d
JCqzPiIcd8G03uU2eYX2bxeWFRKnLTdTTU0G9yjUCv5iVTQDYwyZhrohfuZ/pRiC
EjrzUS1pP+StmMk3Re32US/WlKIp0TJSKPVT5cKmTyZXmTT4mKQ6j1eukL4twRXV
LiTTvB/qU6HbEIZQNR8drsZZtC0Ky/Wy4edxk6PHyhLEnjBbAZT3qvg8LBQoRSWB
MwKIo11knoiCMCFSilfAaB3VtpdacwLeGkiCNESK3jBuiH1bEz5gprnYKFJi/z++
Jf6N11loniQehVRem+uT
=HTRG
-----END PGP SIGNATURE-----

--=-sbc3iTiyDchFj/CsiiqL--
