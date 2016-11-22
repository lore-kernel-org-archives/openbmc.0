Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDwb2dg2zDvsL
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:46:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="SNaHDJmT"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="GXi/bDjp"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A13BE209A4;
 Tue, 22 Nov 2016 00:46:04 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 22 Nov 2016 00:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=tNJmfNbEgQaEMTxt9aH8slKQXX8=; b=SNaHDJ
 mTerGHuuqdpiRhx/D4Nm9CAP1fzWxMc1PDfwi6nRqSeIRHnIgF+Kq28tF2XJsDOL
 HQiO1Sq1WsD9NM2sB98aSYu5xtzrqHpMFV/U5XSC7AuGwajxIuBrvKnTCLgw6plH
 s+uBuumZjhgfkUORnVfCthiFL+b6Il4ehtWIc=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=tNJmfNbEgQaEMT
 xt9aH8slKQXX8=; b=GXi/bDjp+Qo15hcHFkdtfr1f0I7ebA9VZJaQfDHdZmXdHd
 eRzRPoqVCfYqJeUpm2bda5/I06sO/iBxULGdy3eEp5w9FMWUXTDzgnCN+WqGoapW
 DOLlClcPCJlTH7Vqp0gd8XC7uQhztuK8SQ++AgKjsCFY10oYBvE6BZmdBoeHk=
X-ME-Sender: <xms:nNszWGE-uhprGSOWcLfCUlOTjaYfeVr3jWwIwGdFlVWBs_4g5pMPZQ>
X-Sasl-enc: 1i1M7/I1xgbFVhu/G10PqvLZ52xVwtVRR1LeP/Oqg2L4 1479793563
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BFF77E430;
 Tue, 22 Nov 2016 00:46:02 -0500 (EST)
Message-ID: <1479793556.2503.34.camel@aj.id.au>
Subject: Re: [PATCH 4/7] arm: dts: aspeed: Remove unused pinmux from Palmetto
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 22 Nov 2016 16:15:56 +1030
In-Reply-To: <CACPK8Xeam22AU+U_Vpg+nd_yyaNye-vJ=W5rbE-uD460K-ryBQ@mail.gmail.com>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-4-joel@jms.id.au> <1479792147.2503.30.camel@aj.id.au>
 <CACPK8Xeam22AU+U_Vpg+nd_yyaNye-vJ=W5rbE-uD460K-ryBQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-4jbC+TyzmEn694H+jIEE"
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
X-List-Received-Date: Tue, 22 Nov 2016 05:46:07 -0000


--=-4jbC+TyzmEn694H+jIEE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDE2LTExLTIyIGF0IDE2OjA3ICsxMDMwLCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4g
PiBPbiBUdWUsIE5vdiAyMiwgMjAxNiBhdCAzOjUyIFBNLCBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3
QGFqLmlkLmF1PiB3cm90ZToKPiA+IE9uIFR1ZSwgMjAxNi0xMS0yMiBhdCAxNDozOCArMTAzMCwg
Sm9lbCBTdGFubGV5IHdyb3RlOgo+ID4gPiBUaGVzZSB3ZXJlIHNldCBhcyB0aGUgY29tbW9uIGNv
ZGUgaW4gdGhlIGJvYXJkIGZpbGUgc2V0IHRoZW0gdG8gdGhlc2UKPiA+ID4gc3RhdGVzLiBBIGNs
b3NlIHJlYWRpbmcgb2YgdGhlIHNjaG1lYXRpYyBzdWdnZXN0cyB0aGlzIGlzIG5vdCByZXF1aXJl
ZC4KPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4KPiA+ID4gCj4gPiA+IC0tLQo+ID4gPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1i
bWMtb3BwLXBhbG1ldHRvLmR0cyB8IDkgKy0tLS0tLS0tCj4gPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMtb3BwLXBhbG1ldHRvLmR0cyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1ibWMtb3BwLXBhbG1ldHRvLmR0cwo+ID4gPiBpbmRleCA4ZmUyNDhm
NGQ1MzEuLmQxNmM2NzkzNTQ5OSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
YXNwZWVkLWJtYy1vcHAtcGFsbWV0dG8uZHRzCj4gPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1ibWMtb3BwLXBhbG1ldHRvLmR0cwo+ID4gPiBAQCAtNzEsMTQgKzcxLDcgQEAKPiA+
ID4gPiDCoMKgwqDCoHBpbmN0cmwtMCA9IDwmcGluY3RybF9mbGJ1c3lfZGVmYXVsdCAmcGluY3Ry
bF9mbHdwX2RlZmF1bHQKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgJnBpbmN0cmxfdmdhaHNfZGVmYXVsdCAmcGluY3RybF92Z2F2c19kZWZhdWx0Cj4gPiA+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJnBpbmN0cmxfZGRjY2xr
X2RlZmF1bHQgJnBpbmN0cmxfZGRjZGF0X2RlZmF1bHQKPiA+ID4gCj4gPiA+IC0KPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmcGluY3RybF9wd20xX2RlZmF1
bHQgJnBpbmN0cmxfcHdtMl9kZWZhdWx0Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgJnBpbmN0cmxfcHdtM19kZWZhdWx0ICZwaW5jdHJsX3B3bTRfZGVmYXVs
dAo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZwaW5jdHJs
X3B3bTVfZGVmYXVsdCAmcGluY3RybF9wd202X2RlZmF1bHQKPiA+ID4gPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmcGluY3RybF9wd203X2RlZmF1bHQKPiA+ID4gCj4g
PiA+IC0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmcGlu
Y3RybF9ibWNpbnRfZGVmYXVsdCAmcGluY3RybF9mbGFja19kZWZhdWx0PjsKPiA+ID4gCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmcGluY3RybF9kZGNj
bGtfZGVmYXVsdCAmcGluY3RybF9kZGNkYXRfZGVmYXVsdD47Cj4gPiAKPiA+IERvIHdlIG5lZWQg
YW55IG9mIGl0Pwo+IAo+IEkgZG9uJ3QgdGhpbmsgc28uIFdlIGNvdWxkIHRyeSByZW1vdmluZyB0
aGUgcmVzdC4gQ2FuIHlvdSBzZW5kIGEgcGF0Y2g/CgpTdXJlIQoKPiAKPiA+IAo+ID4gPiA+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1Pgo+ID4gCj4gPiA+IMKg
fTsKPiA+ID4gCj4gPiA+IMKgJm1hYzAgew==


--=-4jbC+TyzmEn694H+jIEE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYM9uUAAoJEJ0dnzgO5LT59lkP/3FvMqXWyNjaQOHFIjHbLae5
bmrBoPK2RBMaahJ5IDaboManLTm/seH3ZvOl4eysO2+H8ppZ5QFFyZE7J3mVYtyN
/RpiaJWJI1C4VV4+5gDvm1LSzHCD9b2Gi7PV9zk1Vwt5sEpbJurt2MAXK0/sfd3F
xX5nCweeGsr/5Y8QHN3t6mxE739JB/OTle8ygGn4UqPm2cihYhpHtv9ed6G0y1vI
Bn2niV4q5uLJMKMjyu900l6XDg8PguIaICwiBz4H2g6WAWKG5unDzX6NELDVJ0jI
UCZ1xSfBPzN8i4ObPFNattbg/QFkOFWWxQLuuPPWdtkHyBlNY7RyBas4BbWFvcO+
FiHLnMxdinx6IR3tGcCDOzuXNgklNT0xsbKLvrzMfN9p8bHKfa4eteyJIaLyiZgy
FWTv0Vpj6kmdHiQgYcK6A7B2av1pLqyDbvUNoEE/kCxsUR9XhqaO3jFlIGhqzciJ
v7B69saPSC5P9iq/EpZbcx6XVFBHyu2HtZUbfyF3/9HjOA8toC4aj48Lvgu/mKDm
+kefsBG2vXJ0RBWDqVFHLvKHJ+qEH0IJo//GFaCOm9tWad0bubv+0HqC7ox6PLbP
P08SXG79M3pobO7VSX11sqzW9ir1yf7Hgg5IQzB1daUOCQLFMm2Yv6FBn/2lBufa
3hDouCd/rJ1Gg74f11uZ
=xaIl
-----END PGP SIGNATURE-----

--=-4jbC+TyzmEn694H+jIEE--
