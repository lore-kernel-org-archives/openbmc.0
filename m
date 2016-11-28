Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqLm63F4zDvWk
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 12:47:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VgmnGXJF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YhgAvXIi"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BF3F920950;
 Sun, 27 Nov 2016 20:47:42 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 20:47:42 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=0HIDeGLPB6yyGHoyTC+Hsf6rr+0=; b=VgmnGX
 JFLiJFyvIVaAssdM7Kb200trKVpK7uKmFCkWczoj4Qm/ukb2v3zmPvVIm84mgjRz
 AAu3lCZaDNMyjQJi8895Pbb63MwSbWW274DxB4NQ7Z0aLwBxIUYOEVJCNYTPTPow
 DeXrC4TewZkRMLjtKJ4WtCZdf8l35SfduWxi4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=0HIDeGLPB6yyGH
 oyTC+Hsf6rr+0=; b=YhgAvXIirXYRb4OVcSopaOzS1F2PdnuU4jOIDutK6yajsC
 tQsfX2Fvd7f10jPyenbohrml0ZuwKYLmLjWAiSBb4G56mBKSW1AESCE8SRn4hgz/
 FtevKO1RCNyWmdJEvzTbJ1boeThR6bNNv+CrBDH9RjfIpVOvn2iYtAESJg3OI=
X-ME-Sender: <xms:vow7WGhp2BJR0FfofWZiO77SFLt8ULE_7KqGd_hPG-cH7vH8U23Kyw>
X-Sasl-enc: uXyhGNWSBerlkNdGN80iuEfhr/teXhaBFG5OEwBB9jL0 1480297661
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 51126245D2;
 Sun, 27 Nov 2016 20:47:40 -0500 (EST)
Message-ID: <1480297657.2503.66.camel@aj.id.au>
Subject: Re: [PATCH qemu 22/38] aspeed: use first SPI flash as a boot ROM
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:17:37 +1030
In-Reply-To: <1479478938-13267-23-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-23-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-aYM26jFrrVzEIElvuEKa"
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
X-List-Received-Date: Mon, 28 Nov 2016 01:47:45 -0000


--=-aYM26jFrrVzEIElvuEKa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

YU9uIEZyaSwgMjAxNi0xMS0xOCBhdCAxNToyMiArMDEwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3Jv
dGU6Cj4gRmlsbCBhIFJPTSByZWdpb24gd2l0aCB0aGUgZmxhc2ggY29udGVudCB0byBzdXBwb3J0
IFUtQm9vdC4gVGhpcyBpcyBhCj4gbGl0dGxlIGhhY2t5IGJ1dCB1bnRpbCB3ZSBjYW4gYm9vdCBm
cm9tIGEgTU1JTyByZWdpb24sIGl0IHNlZW1zCj4gZGlmZmljdWx0IHRvIGRvIGFueXRoaW5nIGVs
c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4K
ClJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgoKPiAtLS0KPiDC
oGh3L2FybS9hc3BlZWQuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9ody9hcm0vYXNwZWVkLmMgYi9ody9hcm0vYXNwZWVkLmMKPiBpbmRleCA1ZTM1ZDQ1NjJk
ZTAuLjNlMTc4MWYzMGY1NSAxMDA2NDQKPiAtLS0gYS9ody9hcm0vYXNwZWVkLmMKPiArKysgYi9o
dy9hcm0vYXNwZWVkLmMKPiBAQCAtMjAsNiArMjAsOCBAQAo+IMKgI2luY2x1ZGUgInFlbXUvbG9n
LmgiCj4gwqAjaW5jbHVkZSAic3lzZW11L2Jsb2NrLWJhY2tlbmQuaCIKPiDCoCNpbmNsdWRlICJz
eXNlbXUvYmxvY2tkZXYuaCIKPiArI2luY2x1ZGUgImh3L2xvYWRlci5oIgo+ICsjaW5jbHVkZSAi
cWVtdS9lcnJvci1yZXBvcnQuaCIKPiDCoAo+IMKgc3RhdGljIHN0cnVjdCBhcm1fYm9vdF9pbmZv
IGFzcGVlZF9ib2FyZF9iaW5mbyA9IHsKPiDCoMKgwqDCoMKgLmJvYXJkX2lkID0gLTEsIC8qIGRl
dmljZS10cmVlLW9ubHkgYm9hcmQgKi8KPiBAQCAtMTAxLDYgKzEwMywyOCBAQCBzdGF0aWMgY29u
c3QgQXNwZWVkQm9hcmRDb25maWcgYXNwZWVkX2JvYXJkc1tdID0gewo+IMKgwqDCoMKgwqB9LAo+
IMKgfTsKPiDCoAo+ICsjZGVmaW5lIEZJUk1XQVJFX0FERFIgMHgwCj4gKwo+ICtzdGF0aWMgdm9p
ZCB3cml0ZV9ib290X3JvbShEcml2ZUluZm8gKmRpbmZvLCBod2FkZHIgYWRkciwgc2l6ZV90IHJv
bV9zaXplLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBFcnJvciAqKmVycnApCj4gK3sKPiArwqDCoMKgwqBCbG9ja0JhY2tlbmQgKmJsayA9
IGJsa19ieV9sZWdhY3lfZGluZm8oZGluZm8pOwo+ICvCoMKgwqDCoHVpbnQ4X3QgKnN0b3JhZ2U7
Cj4gKwo+ICvCoMKgwqDCoGlmIChyb21fc2l6ZSA+IGJsa19nZXRsZW5ndGgoYmxrKSkgewo+ICvC
oMKgwqDCoMKgwqDCoMKgcm9tX3NpemUgPSBibGtfZ2V0bGVuZ3RoKGJsayk7Cj4gK8KgwqDCoMKg
fQo+ICsKPiArwqDCoMKgwqBzdG9yYWdlID0gZ19uZXcwKHVpbnQ4X3QsIHJvbV9zaXplKTsKPiAr
wqDCoMKgwqBpZiAoYmxrX3ByZWFkKGJsaywgMCwgc3RvcmFnZSwgcm9tX3NpemUpIDwgMCkgewo+
ICvCoMKgwqDCoMKgwqDCoMKgZXJyb3Jfc2V0ZyhlcnJwLCAiZmFpbGVkIHRvIHJlYWQgdGhlIGlu
aXRpYWwgZmxhc2ggY29udGVudCIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ICvCoMKg
wqDCoH0KPiArCj4gK8KgwqDCoMKgcm9tX2FkZF9ibG9iX2ZpeGVkKCJhc3BlZWQuYm9vdF9yb20i
LCBzdG9yYWdlLCByb21fc2l6ZSwgYWRkcik7Cj4gK8KgwqDCoMKgZ19mcmVlKHN0b3JhZ2UpOwo+
ICt9Cj4gKwo+IMKgc3RhdGljIHZvaWQgYXNwZWVkX2JvYXJkX2luaXRfZmxhc2hlcyhBc3BlZWRT
TUNTdGF0ZSAqcywgY29uc3QgY2hhciAqZmxhc2h0eXBlLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oEVycm9yICoqZXJycCkKPiDCoHsKPiBAQCAtMTMyLDYgKzE1Niw3IEBAIHN0YXRpYyB2b2lkIGFz
cGVlZF9ib2FyZF9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSwKPiDCoHsKPiDCoMKgwqDCoMKg
QXNwZWVkQm9hcmRTdGF0ZSAqYm1jOwo+IMKgwqDCoMKgwqBBc3BlZWRTb0NDbGFzcyAqc2M7Cj4g
K8KgwqDCoMKgRHJpdmVJbmZvICpkcml2ZTAgPSBkcml2ZV9nZXQoSUZfTVRELCAwLCAwKTsKPiDC
oAo+IMKgwqDCoMKgwqBibWMgPSBnX25ldzAoQXNwZWVkQm9hcmRTdGF0ZSwgMSk7Cj4gwqDCoMKg
wqDCoG9iamVjdF9pbml0aWFsaXplKCZibWMtPnNvYywgKHNpemVvZihibWMtPnNvYykpLCBjZmct
PnNvY19uYW1lKTsKPiBAQCAtMTYzLDYgKzE4OCwyMiBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfYm9h
cmRfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUsCj4gwqDCoMKgwqDCoGFzcGVlZF9ib2FyZF9p
bml0X2ZsYXNoZXMoJmJtYy0+c29jLmZtYywgY2ZnLT5mbWNfbW9kZWwsICZlcnJvcl9hYm9ydCk7
Cj4gwqDCoMKgwqDCoGFzcGVlZF9ib2FyZF9pbml0X2ZsYXNoZXMoJmJtYy0+c29jLnNwaVswXSwg
Y2ZnLT5zcGlfbW9kZWwsICZlcnJvcl9hYm9ydCk7Cj4gwqAKPiArwqDCoMKgwqAvKiBJbnN0YWxs
IGZpcnN0IEZNQyBmbGFzaCBjb250ZW50IGFzIGEgYm9vdCByb20uICovCj4gK8KgwqDCoMKgaWYg
KGRyaXZlMCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgQXNwZWVkU01DRmxhc2ggKmZsID0gJmJtYy0+
c29jLmZtYy5mbGFzaGVzWzBdOwo+ICvCoMKgwqDCoMKgwqDCoMKgTWVtb3J5UmVnaW9uICpib290
X3JvbSA9IGdfbmV3KE1lbW9yeVJlZ2lvbiwgMSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgLyoK
PiArwqDCoMKgwqDCoMKgwqDCoMKgKiBjcmVhdGUgYSBST00gcmVnaW9uIHVzaW5nIHRoZSBkZWZh
dWx0IG1hcHBpbmcgd2luZG93IHNpemUgb2YKPiArwqDCoMKgwqDCoMKgwqDCoMKgKiB0aGUgZmxh
c2ggbW9kdWxlLgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgbWVt
b3J5X3JlZ2lvbl9pbml0X3JvbShib290X3JvbSwgT0JKRUNUKGJtYyksICJhc3BlZWQuYm9vdF9y
b20iLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGZsLT5zaXplLCAmZXJyb3JfYWJvcnQpOwo+ICvCoMKgwqDCoMKgwqDCoMKg
bWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uKGdldF9zeXN0ZW1fbWVtb3J5KCksIEZJUk1XQVJF
X0FERFIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJvb3Rfcm9tKTsKPiArwqDCoMKgwqDCoMKgwqDCoHdy
aXRlX2Jvb3Rfcm9tKGRyaXZlMCwgRklSTVdBUkVfQUREUiwgZmwtPnNpemUsICZlcnJvcl9hYm9y
dCk7Cj4gK8KgwqDCoMKgfQo+ICsKPiDCoMKgwqDCoMKgYXNwZWVkX2JvYXJkX2JpbmZvLmtlcm5l
bF9maWxlbmFtZSA9IG1hY2hpbmUtPmtlcm5lbF9maWxlbmFtZTsKPiDCoMKgwqDCoMKgYXNwZWVk
X2JvYXJkX2JpbmZvLmluaXRyZF9maWxlbmFtZSA9IG1hY2hpbmUtPmluaXRyZF9maWxlbmFtZTsK
PiDCoMKgwqDCoMKgYXNwZWVkX2JvYXJkX2JpbmZvLmtlcm5lbF9jbWRsaW5lID0gbWFjaGluZS0+
a2VybmVsX2NtZGxpbmU7


--=-aYM26jFrrVzEIElvuEKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO4y5AAoJEJ0dnzgO5LT5C8oP/R8Gf3reFx1rOfMlZ8apFiR4
akqvID46gPWnWyXRZKPOTmIiRigurzuCJO7tJaOBrmZcmhHUjkxn1ACRMdGJLTi8
9vz95arhyNGzwz9HaWEsCYFCucXzNC2UQSh+nk1X3wT+ErTGrxw8TFYY21qEHgpF
T36QcYuwJB5j6UtjspardpaqwSRUE2bElRF/z7YtH24kQV0tsTtJBOFFqpgxFHeO
othu06ISbI7uosniAZrhHalawM/mqm3zehI5aPuAYQx3C0vQWVBBF2Xn3WkdS4CA
J/jJDBteONphgcgJkfuiy76UKKy48v6Xj69WZz2GKPm4QaiOEKRU0ZlLH1cSDpce
WX7nioYwQx6GldHH9T54n83PvRF1M9dw6GfNGlt3FGrtA1nNOF8Wrw6PhfNIFmi6
jFTukUryg2CjPVIJ0rFgLut0NRLiUqbIPOdXoHYRJS7sqgXE4/jZA0n3ZZaE5311
nQpLUWg0Q77gWs+KLqJCpcur/K1uygJEfhxFGWRlUh81NnFDPHq91fgM04NAKPWV
fcdbwUrEBFn0X2vfzuSlvqE4agbWmKgOFOG1niqsh9Lsu3wuEAvPRXIlE2f+oFtU
xP/DKkQwz7g0mrM62EInyMc19tjWFy3Lwwxj098P37bWVLLV+P56fGn6awLzXcjp
klOGUjkoYIVlCCe6LcpN
=c33r
-----END PGP SIGNATURE-----

--=-aYM26jFrrVzEIElvuEKa--
