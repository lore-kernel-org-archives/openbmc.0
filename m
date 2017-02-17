Return-Path: <andrew@aj.id.au>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPdyw4PlhzDqBn
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:38:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OctuMlr0"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="mts8nJlA"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 090C4206F1;
 Thu, 16 Feb 2017 22:38:13 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Thu, 16 Feb 2017 22:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=dZsPMQU0hGI+USy0K5fzlK+DeVw=; b=OctuMl
 r058hZCsbug7Z/LSSiVbnR+Vcg6GZy4LLvaTT+Hwx5mbu3yEhTsvju2Q93f+2qV1
 IWktC+4qa39tIyAYt6HEhtM/ktOP5oigOGuyYXalHn5Z1KFd/sLi9hQj9tKsLGyT
 ttXaYZu3yY+4UPGdiQq0SrmrmS/bS0WDzai4Q=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=dZsPMQU0hGI+US
 y0K5fzlK+DeVw=; b=mts8nJlAK/LVvpjEB1s7sxqzYPNOxaWN/71kpBvFaHgLQX
 vhjiCTRIOhHcsQwrsFMbbi3Ki9GTI3Nmr1QJT6aT05P6BuoWkddh9iAvLpVwvhRZ
 7qPQTxdv9uhRjWy/NEldAzVOh+jDGSROiEc/EXecWdX5QJkTP0dtpYEXblllo=
X-ME-Sender: <xms:JHCmWEUmjAsBujEY8HMPU61xniLJ1k9hlYvfcIbD44P6jFcjwDkjVw>
X-Sasl-enc: Mq2y1qW7W8qsM8HvE1H3IxT1zsr3ZHJwF9W9navyHnSP 1487302692
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 063B17E0D2;
 Thu, 16 Feb 2017 22:38:10 -0500 (EST)
Message-ID: <1487302684.3661.40.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr
 <raltherr@google.com>,  OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Fri, 17 Feb 2017 14:08:04 +1030
In-Reply-To: <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-3-andrew@aj.id.au>
 <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-YQ+0q3LfhSIE5Zqy/POz"
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
X-List-Received-Date: Fri, 17 Feb 2017 03:38:18 -0000


--=-YQ+0q3LfhSIE5Zqy/POz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE3LTAyLTE3IGF0IDE0OjAyICsxMDMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
T24gVHVlLCBGZWIgMTQsIDIwMTcgYXQgMTE6MjEgQU0sIEFuZHJldyBKZWZmZXJ5IDxhbmRyZXdA
YWouaWQuYXU+Cj4gd3JvdGU6Cj4gPiBSZXF1aXJlZCBmb3IgcGlubXV4LCB3aGljaCB0ZXN0cyBz
b21lIGJpdHMgaW4gdGhlIExIQydzIElPIHNwYWNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pgo+IAo+IExhcmdlIEhhZHJvbiBDb2xsaWRl
ciEKPiAKPiBEb2VzIHRoZSBhc3QyNDAwIHdhbnQgdG8ga25vdyBhYm91dCBpdCdzIHBhcnRpY2xl
IGFjY2VsZXJhdG9yIHRvbz8KCk5haCwgdGhlIGFzdDI0MDAgZG9lc24ndCByZXF1aXJlIGEgcGFy
dGljbGUgYWNjZWxlcmF0b3IgZm9yIHBpbmN0cmwsCmFuZCBJIGRvbid0IHRoaW5rIHdlIGhhdmUg
YW55IG90aGVyIHJlYXNvbiB0byBuZWVkIGl0ICh5ZXQpLgoKQW5kcmV3Cgo+IAo+IEFja2VkLWJ5
OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pgo+IAo+ID4gLS0tCj4gPiAKPiA+IFRoaXMg
aXMgZXh0cmFjdGVkIGZyb20gY29tbWl0Cj4gPiBjZWM4MjJmODllYzE5YjE4MWRjMDJlMmEwYzY0
NDFkMTA3ZDhiNGQ5IGluIHRoZQo+ID4gQVJNIG5leHQvZHQgdHJlZS4KPiA+IAo+ID4gwqBhcmNo
L2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaSB8IDUgKysrKysKPiA+IMKgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvYXNwZWVkLWc1LmR0c2kKPiA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kK
PiA+IGluZGV4IGI3MzUwM2M4NjZhYS4uN2MwOWEyNmVlYTZlIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc1LmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1nNS5kdHNpCj4gPiBAQCAtMTE3LDYgKzExNywxMSBAQAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gPiAKPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGxoYzogbGhjQDIwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0K
PiA+ICJhc3BlZWQsYXN0MjUwMC1saGMiOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9
IDwweDIwIDB4MjQgMHg0OCAweDg+Owo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiA+ICsKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtYm94
OiBtYm94QDE4MCB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPQo+ID4g
ImFzcGVlZCxhc3QyNTAwLW1ib3giOwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZWcgPSA8
MHgxODAgMHg1Yz47Cj4gPiAtLQo+ID4gMi45LjMKPiA+IA==


--=-YQ+0q3LfhSIE5Zqy/POz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYpnAdAAoJEJ0dnzgO5LT5+BcP/ibJGQTxU0V2OEXHMUjaw/gC
IOzt02J2TXwDI5QFgpWJDCUL8WmOvgE0yHvoZ49dkG8YHTzkh0c39rdsOnKm/vs2
HwnT8gq7+YzQcetcGa1ffc0+zexeNCviGeiuowtRrGiZvYck+h6k2o4rmD3NCG+2
s+MUloJRczPONxOU2bFrAU+VOWXL8JEkyJ4PpmU4wH9CkOItEoz6pXzg1yA1nJ92
/B5LwqyYGUyzFWG2OyJg6riXa61GpQr4pFLHRGvH1R1Nzxz3viI33HGsQegd4JcE
BC4f9p2kSPtR6QkuUeo0WCwyXkkG/pT4oYAd85mK6u30TCHAgjf6CS8RRMGy0saQ
eA1NtmHGk8Jf3pz1/Bv7/v3Z4qeegq8wcbk+oQXKtBV6gb8HBKgIqS7aeVIgbOMn
x+iUO+grlTzPoN0CCbKlsSVxxBK21GWo1PDeFXhiV7w0eCYT2tFPEBx8OSMGCZoz
9mh5hoXrhpQo9K5eGG1aXE6F1i8iTIASKBpZvnBbpgbJcJgyp2CnO60hHHR8APjy
Ly+9efTJ8NgE0SW9myP1wDktsyTm3rij6nKTu9K22T7vEHt8c5KFFgjONyw5Nb5K
sDMHaEbP3XciQqTu3UvIaWV4WQ9rj3nZC/LtPZlRet5ipNJNO4lfFiu7hU+bvqWH
EqEOA3IDVROngR4ks8n4
=w57R
-----END PGP SIGNATURE-----

--=-YQ+0q3LfhSIE5Zqy/POz--
