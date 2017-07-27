Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xJ1ZX07bkzDrFq
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 16:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kFgd9eNs"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XwEDelsR"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D6E72074D;
 Thu, 27 Jul 2017 02:01:37 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 27 Jul 2017 02:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=yJNUYYbswQWE0gwR+l6fFn4L0zj/4fIBVpJ5cc+dI
 bM=; b=kFgd9eNsFFb1qOb+Qf4I+Oc7V//oyS31DS920oJ8OfWziQdnJgrk+yfVp
 WbYFmuA020zGgA/NSnHUO9yNPxTAbSvAFFTiXhUYUcd7/Bh5/OyOp8U6SJg+73oD
 JB2UgEAQlJDrrepQMxNwJD6od2Vtf7L1JG46AhAuTRNHOTGXlTnQ+NJZVL02b1KY
 SJdTJITwKAmAszvNxVDIfV9oUJ+3MExHaFxsvMk5sG+kRges6RdaOhFLJVsINUl+
 TO0ez8LLb/sCpen417r9sPVsb+wKaPS4GMp6gF/7EG35lZWAS1XvvbfpYWb7DP1J
 z5ae8n8R54QfAqom/HQ5l7boA5QkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=yJNUYYbswQWE0gwR+l
 6fFn4L0zj/4fIBVpJ5cc+dIbM=; b=XwEDelsRmca2kEdHooKv7Ze7xqpFCzpfau
 umMe8IenETwPZY6Vk+KocfDbUALBEvBnJU10ZyalBDaBTgpgjHTO+Bt6dQGJaIaK
 jgv4dcWSzoiWFB/sz/9Hr7kpbwuUQ8+FKrK3IOEIL44KkC+s/RZueYiiQcGEtidl
 4h2hQmZaHNlFQLyiRHGPNqH3ipDRcCAcm+Zby8tIDko5yI7FasvSC4Y7vpB0wPD0
 iYAjS3Wf6LtWtS8pd9mrsKXMFZzU++9TX9lpQVzc6KMWOK+KJOZPIBp7p72nceV2
 kWd0I64qWYoJ9PhfxAzspzU3YRZhhjsyLoDfx8K97FIkL7gg43ZQ==
X-ME-Sender: <xms:wYF5WV82a3p4lI9iM2jCBRQ5jVHb4Yb1O4FXxvyh1ETwfAoPm3krzQ>
X-Sasl-enc: lViODgWH9T0qHxf0uAg6XnlYL5JvTuVl6/fnu6t+lD+y 1501135296
Received: from keelia (ppp118-210-176-216.bras2.adl6.internode.on.net
 [118.210.176.216])
 by mail.messagingengine.com (Postfix) with ESMTPA id DAB3F24515;
 Thu, 27 Jul 2017 02:01:32 -0400 (EDT)
Message-ID: <1501135285.5179.16.camel@aj.id.au>
Subject: Re: [patch v3] hwmon: (aspeed-pwm-tacho) cooling device support.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>, Joel Stanley <joel@jms.id.au>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>, Jean Delvare
 <jdelvare@suse.com>, Ohad Oz <ohado@mellanox.com>,  Vadim Pasternak
 <vadimp@mellanox.com>, Patrick Venture <venture@google.com>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Date: Thu, 27 Jul 2017 15:31:25 +0930
In-Reply-To: <DB5PR05MB1224F329AA1C5BA4B37B4B86EFB90@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170725141727.13105-1-c_mykolak@mellanox.com>
 <CACPK8XeidChD_LT6o8MQBmyJ4r3mPCPfwEX_1REmQJkMNGELeQ@mail.gmail.com>
 <DB5PR05MB1224F329AA1C5BA4B37B4B86EFB90@DB5PR05MB1224.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WnzFIJlJIZd2WLhZCmcC"
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
X-List-Received-Date: Thu, 27 Jul 2017 06:01:41 -0000


--=-WnzFIJlJIZd2WLhZCmcC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTXlrb2xhLAoKSSBrbm93IHlvdSd2ZSBzZW50IG91dCBzdWJzZXF1ZW50IHZlcnNpb25zLCBi
dXQgSSB3YW50ZWQgdG8gYWRkcmVzcyBvbmUKb2YgeW91ciBhcmd1bWVudHMgaGVyZToKCk9uIFdl
ZCwgMjAxNy0wNy0yNiBhdCAxMTowOCArMDAwMCwgTXlrb2xhIEtvc3Rlbm9rIHdyb3RlOgo+ID4g
PiBAQCAtODM0LDEwICs5NDYsMTIgQEAgc3RhdGljIGludCBhc3BlZWRfcHdtX3RhY2hvX3Byb2Jl
KHN0cnVjdAo+ID4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+IAo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgIGZvcl9lYWNoX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7Cj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGFzcGVlZF9jcmVhdGVfZmFuKGRldiwg
Y2hpbGQsIHByaXYpOwo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZl9ub2Rl
X3B1dChjaGlsZCk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQp
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9mX25vZGVfcHV0KGNo
aWxkKTsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4gPiA+ICvCoMKgwqDCoMKgwqAgb2Zfbm9kZV9wdXQoY2hp
bGQpOwo+ID4gCj4gPiBJJ20gbm90IHN1cmUgYWJvdXQgdGhlc2UuCj4gPiAKPiA+IENoZWVycywK
PiA+IAo+ID4gSm9lbAo+IAo+IElmIENPTkZJR19PRl9VTklUVEVTVCBpcyBzZXQsIHN5c3RlbSBp
bml0aWFsaXphdGlvbsKgIGZhaWxzIG9uIHRoaXMgb2Zfbm9kZV9wdXQuCj4gSSBjaGVja2VkIGFu
ZCBmb3VuZCB0aGF0IGZvcl9lYWNoX2NoaWxkX29mX25vZGUgaXMgbWFjcm8gd2l0Y2ggdXNlIF9f
b2ZfZ2V0X25leHRfY2hpbGQKPiDCoGluIGN5Y2xlLiBfX29mX2dldF9uZXh0X2NoaWxkIGRvIG9m
X25vZGVfcHV0IHByZXZpb3VzIGNoaWxkIGJ1dCBub3QgbGFzdC4KPiAKPiBzdGF0aWMgc3RydWN0
IGRldmljZV9ub2RlICpfX29mX2dldF9uZXh0X2NoaWxkKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbm9kZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnByZXYpCj4gewo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5leHQ7Cj4gCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghbm9kZSkKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBOVUxMOwo+IAo+IMKgwqDCoMKgwqDCoMKgwqBuZXh0
ID0gcHJldiA/IHByZXYtPnNpYmxpbmcgOiBub2RlLT5jaGlsZDsKPiDCoMKgwqDCoMKgwqDCoMKg
Zm9yICg7IG5leHQ7IG5leHQgPSBuZXh0LT5zaWJsaW5nKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKG9mX25vZGVfZ2V0KG5leHQpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgwqDCoMKgwqDCoMKgwqBvZl9u
b2RlX3B1dChwcmV2KTsKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIG5leHQ7Cj4gfQo+ICNkZWZp
bmUgX19mb3JfZWFjaF9jaGlsZF9vZl9ub2RlKHBhcmVudCwgY2hpbGQpIFwKPiDCoMKgwqDCoMKg
wqDCoMKgZm9yIChjaGlsZCA9IF9fb2ZfZ2V0X25leHRfY2hpbGQocGFyZW50LCBOVUxMKTsgY2hp
bGQgIT0gTlVMTDsgXAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjaGlsZCA9IF9fb2ZfZ2V0
X25leHRfY2hpbGQocGFyZW50LCBjaGlsZCkpCj4gCj4gU28gaW5zaWRlIGN5Y2xlIHdlIHNob3Vs
ZCBub3QgdXNlIG9mX25vZGVfcHV0IG9uIGVhY2ggY2hpbGQuIFdlIG11c3QgdXNlIGl0IG9ubHkg
b24gbGFzdCBjaGlsZCBpbiBjeWNsZS4KCkkgd2FzIGp1c3QgbG9va2luZyBhdCB0aGlzIG15c2Vs
ZiBmb3IgYSBkaWZmZXJlbnQgZHJpdmVyLCBhbmQgSSBkb24ndAp0aGluayB0aGlzIGFyZ3VtZW50
IGlzIHJpZ2h0LiBUaGUgbmF0dXJhbCB0ZXJtaW5hdGluZyBjb25kaXRpb24gb2YgdGhlCmxvb3Ag
aXMgY2hpbGQgPT0gTlVMTC4gY2hpbGQgPT0gTlVMTCBvY2N1cnMgaWYgd2UgaGF2ZSB6ZXJvLW9y
LW1vcmUtCmNoaWxkcmVuOyB0aGUgY2hpbGQgaXMgYWx3YXlzIGluaXRpYWxpc2VkIGFzIHBhcnQg
b2YgdGhlIGxvb3AgaGVhZGVyCmFuZCB3b3VsZCBiZSBOVUxMIGlmIHRoZXJlIGFyZSBubyBjaGls
ZHJlbi4gSWYgd2UgaGF2ZSBtb3JlIHRoYW4gb25lCmNoaWxkLCB0aGUgcmVmZXJlbmNlIHRvIHRo
ZSBsYXN0IHZhbGlkIGNoaWxkIGlzIHBhc3NlZCB0byBvZl9ub2RlX3B1dCgpCmluIF9fb2ZfZ2V0
X25leHRfY2hpbGQoKSBpbiBvcmRlciB0byByZXR1cm4gdGhlIHRlcm1pbmF0aW5nIE5VTEwuIEdp
dmVuCl9fb2ZfZ2V0X25leHRfY2hpbGQoKSBpcyBwYXNzZWQgdGhlIGxhc3Qgbm9kZSBhbmQgdGhl
IHJlc3VsdCBpcyBOVUxMLAp0aGUgY2FsbCB0byBvZl9ub2RlX3B1dCgpIGFmdGVyIHRoZSBsb29w
IGlzIGFsd2F5cyBpbnZva2VkIG9uIE5VTEwsCndoaWNoIHBlcmZvcm1zIGFuIGVhcmx5IHJldHVy
bi4KCkFzIHN1Y2ggSSB0aGluayBpdCBpcyB1bm5lY2Vzc2FyeS4KCkNoZWVycywKCkFuZHJldw==


--=-WnzFIJlJIZd2WLhZCmcC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZeYG1AAoJEJ0dnzgO5LT5kqIQAIUnRXbEJZx63rQNMoU4By33
bvRQTYZi2t430hkvZBfCRg2OV8mXMNRUtx8mNKmLwBkOONn9Zbqc1dC+eqqaUuYn
V7rVnctINPgqdOwFeoQT/NZMCOr87f7LYdiBUgiXzRUeWog1fztYPgQ6hOu7HYI2
W3CR3KJCtfmyYR/EgmPj41V8WcJ1LFF8njmez/OEMj8IlRvuGL979E75zS/oTePX
+v3P1aG9CuQTzkdwyh/1EWdjphDXg7C6xqAkt2TcVnVY/jUTrz95PDkTNgmHPBg8
l7IMKiSnaxY41dJIt/hEjwVgL8z9C9CsSQUycT3Xsh47g9qjoIGtQTv8ek06KDAT
bNNfJVu0JXW8gDNQnHbVBpT5t1jfwfUdyF5+fxyoVpA8pX25TuU1PvV/l/KgFRQD
Kk9gjD5nHIkvI3L7Gvs+GmziFXeI8GHvhd8i0VQZNjlE1EUzU6I4qrvrBonMCtJi
f9kZmgg7xOgZkx91gi6kpPOCau6WAcrDANz0NoX7pT5OKHnPUaWKlbHIYzGvHSpz
/ibXf1F09RvXzYH+6LhRYM4b2Br6iuY2vUJKgVDddRFJ5fuJUOnUa0yoU9R8Yn0W
NuYneydxYwvT3fnfdzsQ4TYufC0xxYzLwW/0aAFpH73VXyRlKJQy+3AdIwpHLYMy
bP98jQIVFYQK140oBIr5
=EyQ/
-----END PGP SIGNATURE-----

--=-WnzFIJlJIZd2WLhZCmcC--
