Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCcb91PgdzDq5Y
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 12:01:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="umLRGro8"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bvs5RN0e"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 23688209DB;
 Wed, 19 Jul 2017 22:01:55 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Wed, 19 Jul 2017 22:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=dNFkam4orBBKkPngIEgcizl7B97clIcOjpgaffMv0
 O4=; b=umLRGro8hy5Oh2rWPUzFCI+sttN6tVTDRnBK0uPUm0dzqL1zDsyB/w15a
 r09xgC7XZYzkYVhjNXx98WaoYVMDVICd4XSoVwezy/Bxb1BQoWShI6Hn0/7xZwYk
 U8lvtb0zLv5K6nsqJx7P644eYTTMhgY6s/BE7mgmEGaRLecPfeO8FuPsRrDeqJpa
 0pwmRY6mcs4VBnDGLw9oGu8OE/cb2xsCVmtQeQYo7fQ/nPHBk3okJ22NS6dFZKll
 an2JmMBAPM6ufuYk5kui8bLPVnXdvFraOxdYDojURH+zqbG9+2jUKaezJFiBrPR+
 xT3TLVfV9JumsQ+YbwszBPd4L3fLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=dNFkam4orBBKkPngIE
 gcizl7B97clIcOjpgaffMv0O4=; b=bvs5RN0eJQUQdF+RYujgIfUiihWTuzxycs
 Hw8UKKI9NTIfLLxcINkjk0YlZy9IfY1PsYIbkJ1RWCWM3yV0IPumO7exiktRYYD5
 9IMnMMBVg3Yaq53HHg/GSdmi5pLlaA744QsBjtI2Co7B7Hv8BuCa0OBl5fXrK2y4
 0DJ1d0jDVmTEfDzAE/A3Dk3I3o6/FNUCSG7+1f2zaz8mTIhfhNjCKvsnvOTKPr59
 HCulphHgSQ2JSR6r+oe8wpzl0MIlEi3FjBSbZgkvn3waRJ44Sp/4MPMBTVxo/frU
 vE2lYYLx+xKvWa1c3NaMGEK5BZ3OglLgo0xyDsXl8HzN6QLouJ3w==
X-ME-Sender: <xms:Ew9wWWmaGaRKmnEhfuI2jHyuDPHET2nbRofDFQa5259VCt9jhXGUJg>
X-Sasl-enc: +G1XlDAv/Lf2klD2x6fXL7/5NIvSqCd3d9DaJ0J9kU4i 1500516114
Received: from keelia (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 52A1D247A2;
 Wed, 19 Jul 2017 22:01:52 -0400 (EDT)
Message-ID: <1500516109.500.13.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add gpio keys for
 power supply presence, ucd alert
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 20 Jul 2017 11:31:49 +0930
In-Reply-To: <CACPK8XfbX3VqQcvtMpmiDeJhyPBx5rqh3L5grep5gL+SmS+PDQ@mail.gmail.com>
References: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
 <CACPK8XfbX3VqQcvtMpmiDeJhyPBx5rqh3L5grep5gL+SmS+PDQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-gSjQsBQtxbUjCPDIeA5P"
X-Mailer: Evolution 3.22.6-1ubuntu1 
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
X-List-Received-Date: Thu, 20 Jul 2017 02:01:59 -0000


--=-gSjQsBQtxbUjCPDIeA5P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE3LTA3LTE5IGF0IDE5OjExICswOTMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
T24gRnJpLCBKdWwgMTQsIDIwMTcgYXQgNTowNiBBTSwgQ2hyaXN0b3BoZXIgQm9zdGljCj4gPiA8
Y2Jvc3RpY0BsaW51eC52bmV0LmlibS5jb20+IHdyb3RlOgo+ID4gQWRkIEdQSU8ga2V5cyBmb3Ig
cG93ZXIgc3VwcGx5IDAgYW5kIDEgcHJlc2VuY2UgYXMgd2VsbCBhcyB1Y2QgYWxlcnQKPiA+IHRv
IHRoZSBkZXZpY2UgdHJlZS4KPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVy
IEJvc3RpYyA8Y2Jvc3RpY0BsaW51eC52bmV0LmlibS5jb20+Cj4gPiAtLS0KPiA+IMKgYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1vcHAtd2l0aGVyc3Bvb24uZHRzIHwgMTggKysrKysrKysr
KysrKysrKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLW9wcC13aXRoZXJzcG9v
bi5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLW9wcC13aXRoZXJzcG9vbi5kdHMK
PiA+IGluZGV4IDc2YTViMjguLjM0YzVkZmMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybS9ib290
L2R0cy9hc3BlZWQtYm1jLW9wcC13aXRoZXJzcG9vbi5kdHMKPiA+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL2FzcGVlZC1ibWMtb3BwLXdpdGhlcnNwb29uLmR0cwo+ID4gQEAgLTQyLDYgKzQyLDI0
IEBACj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBn
cGlvcyA9IDwmZ3BpbyBBU1BFRURfR1BJTyhKLCAyKSBHUElPX0FDVElWRV9MT1c+Owo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGludXgsY29kZSA9
IDxBU1BFRURfR1BJTyhKLCAyKT47Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oH07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHMwLXByZXNlbmNl
IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGFi
ZWwgPSAicHMwLXByZXNlbmNlIjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgZ3Bpb3MgPSA8JmdwaW8gQVNQRUVEX0dQSU8oUCwgNykgR1BJT19BQ1RJ
VkVfTE9XPjsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbGludXgsY29kZSA9IDxBU1BFRURfR1BJTyhQLCA3KT47Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwczEtcHJlc2VuY2Ugewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBsYWJlbCA9ICJwczEtcHJlc2VuY2UiOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBncGlvcyA9IDwmZ3BpbyBBU1BFRURfR1BJTyhO
LCAwKSBHUElPX0FDVElWRV9MT1c+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsaW51eCxjb2RlID0gPEFTUEVFRF9HUElPKE4sIDApPjsKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Owo+IAo+IENocmlzLCB0aGVzZSB0d28gbG9v
ayBmaW5lLiBJIGFwcGxpZWQgdGhlc2UgdHdvIGFuZCBmaXhlZCB0aGUgY29tbWl0Cj4gbWVzc2Fn
ZSB0byBub3QgbWVudGlvbiB0aGUgVUNELgo+IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHVjZC1hbGVydCB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGxhYmVsID0gInVjZC1hbGVydCI7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdwaW9zID0gPCZncGlvIEFTUEVFRF9H
UElPKEksIDIpIEdQSU9fQUNUSVZFX0xPVz47Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxpbnV4LGNvZGUgPSA8QVNQRUVEX0dQSU8oSSwgMik+Owo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gCj4gQW5kcmV3LCBhcmUgd2Ug
c3VyZSB0aGlzIHNob3VsZCBiZSBleHBvc2VkIHRvIHVzZXJzcGFjZT8gSXMgaXQKPiBzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgaG9va2VkIHVwIHRvIHRoZSBTTUJ1cyBkcml2ZXIgaW5zdGVhZD8K
CkkndmUgbG9va2VkIGF0IHRoZSByZWxldmFudCBzY2hlbWF0aWNzIGFuZCBkYXRhc2hlZXRzLCBh
bmQgdGhlIEdQSU8gb2YKaW50ZXJlc3QgKEkyKSBhcHBlYXJzIHRvIGJlIGNvcnJlY3QgZm9yIHRo
ZSBVQ0QgYWxlcnQuIEhvd2V2ZXIsIEdQSU9JMgppcyAqbm90KiBjYXBhYmxlIG9mIGJlaW5nIG11
eGVkIGFzIGFuIFNNQnVzIEFsZXJ0IChTQUxUKSBsaW5lIGFuZAp0aGVyZWZvcmUgdGhlIGFsZXJ0
IHdpbGwgbm90IGJlIHByb3BhZ2F0ZWQgdG8gdGhlIEkyQyBtYXN0ZXIuIEl0CmFwcGVhcnMgd2Ug
bXVzdCBoYW5kbGUgaXQgaW4gdXNlcnNwYWNlLiBDb25maWd1cmluZyBpdCBhcyBHUElPIGtleSB3
aWxsCmdpdmUgdXMgYW4gaW50ZXJydXB0LgoKSG9wZSB0aGF0IGhlbHBzLgoKQW5kcmV3Cgo+IAo+
IENoZWVycywKPiAKPiBKb2VsCj4gCj4gPiDCoMKgwqDCoMKgwqDCoMKgfTsKPiA+IAo+ID4gwqDC
oMKgwqDCoMKgwqDCoGxlZHMgewo+ID4gLS0KPiA+IDEuOC4yLjIKPiA+IA==


--=-gSjQsBQtxbUjCPDIeA5P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZcA8NAAoJEJ0dnzgO5LT5TAcP/ijnldUdsJtW/cfsbPzi0Ovr
vQYCdVxOcpD1AgZdGySixFJkOmKPDkTpw8ECuFfSuDGDBiilWP/Uq5/RfeTg6pw8
HATpxVksC+KfNUVfktSS1AO7uJqX8OHsG9jM9CJJPq0oQ9mmEUMpMpWJ1BGQQM1n
HIIHpyvah4rkdFCbPDOlhc7aLLUmnT7jI3ptWLv100j7mEiPls8HwuWKgwNnCrv+
tBHQDwcK4dw5s3IKM681kz0pSGMXUsIwezSslgzUluTsUoqfMTxyw+z2IZh/kU2R
nCle80c5dFtdy5BOZDi7E1UQ9ug+kgWJPmATggJQDmciWUxUuq8i9YiLFC/RyOzz
6Yn7nyEKOGBN+rkbSBQE6r5r+bUaRUMleH9bxSVUnBJs0bNzGFDMVDzsP0L51+/h
90vbWT1VFHzZgwNsnVoXPf7AiZD1cFBFUmWxlAnIUu+TP/wfbaHiXY50hfVgLjMB
mND4pbg0A5AOvVAFL+E/VIHDZg9t7uZ+HwyQkN1NG2HlldSmsmByz6y9+SfK7Ea5
RENYXgD6JhQYB7SGHoma+aFS8YE16d9ER8E4ALcz7AjzFQDWYFaQ2ABm529nSo0M
K9O6j9iqQ1nYJeZXF5cvFoZSlk47/J+lq2drKjJhUmt1siVNTJQJhxfvJSYPpois
hFsr471UIzXenTjwriLb
=ow32
-----END PGP SIGNATURE-----

--=-gSjQsBQtxbUjCPDIeA5P--
