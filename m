Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Fp4JDLua"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="HQaJhLI7"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y0v430s7kzDr4N
 for <openbmc@lists.ozlabs.org>; Mon, 25 Sep 2017 16:16:33 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F43C20DEF;
 Mon, 25 Sep 2017 02:16:29 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 25 Sep 2017 02:16:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=SfORAXe6YZ84gCKpbTiFuiQjAiLc1jXTGNyJL/s7w
 cA=; b=Fp4JDLuaMu+ilL3102dfkkfBd+ziF7YIFtX1KY+HIUB272ZttzUxhjw9S
 c0du4W9J8pvMo4MZkM/3mDqTGUIdMweZU8r2g4hlVnRgspMQ/cHPjknfdOB+cY9F
 YQ9OOfXF9/tAOWO9Tp6RW4wn5tFPAeyM6P5EPGJTWvGM69/bWZiDbUTUFPBSbCFt
 RS3EqLb0yk8eTvtw2Oqx5hxiYfIzviUCLjRfuSjpf5yt1NhFMojSTT2e/79se3Xl
 uZC9F9OzTG+p2MNrQcXKE4Tp7m3b8rK2ozqhf3Qr8denV1MlHi2VSWkKCh5gTmUP
 Llt4ehT0Na0UksqB+Md60EjwBi8ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=SfORAXe6YZ84gCKpbT
 iFuiQjAiLc1jXTGNyJL/s7wcA=; b=HQaJhLI7V82mx/bNsCTmQVg+FdGLZfopBy
 YL8WGj4vEkjf7bhDhW/N7cKwC+JDD0aSh8LoZXu3ZaS+huIPiFqYUu/ECIZPSNQw
 qFQhQrKkUYVXXJw8obdPxc1BfagM/ctO/l90wtyZo/iXaNn+/TsgZ/ZqhO27h2GJ
 BpARM8LxJcN835ZsIuzskdb2otEPt6jn+jEHX3rPixgvWX1e35LzdbYq5pQMROcZ
 /GMdca1D6RnE98RsyT2yWASOViS2DL0AnT3RlsCrFeuw3MsGLa0acbg83zwfSgQw
 zobgglvzX8xoTFWO4GhsARgSvRQtZszuGPzbn3CjXIiqWRquW76Q==
X-ME-Sender: <xms:PZ_IWdb1NpY3_5Q9HKlz5qIPS-7cTwzgL4mj3rNPydNcRKy6qz7Lww>
X-Sasl-enc: 9X6uRh6YUCqHgvGBi75B7KKK0VxOM8WMCgbGucXP/v7Z 1506320188
Received: from keelia16 (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 965A12479F;
 Mon, 25 Sep 2017 02:16:27 -0400 (EDT)
Message-ID: <1506320183.30138.22.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 1/3] drivers/fsi/sbefifo: refactor to
 upstream list state
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 25 Sep 2017 15:46:23 +0930
In-Reply-To: <1506315435.30138.17.camel@aj.id.au>
References: <1506033838-2078-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1506033838-2078-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1506315435.30138.17.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-iqXaM3BuT/jm4TPKfhiP"
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
X-List-Received-Date: Mon, 25 Sep 2017 06:16:36 -0000


--=-iqXaM3BuT/jm4TPKfhiP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIGl0J3MgbWUgYWdhaW4uCgpPbiBNb24sIDIwMTctMDktMjUgYXQgMTQ6MjcgKzA5MzAsIEFu
ZHJldyBKZWZmZXJ5IHdyb3RlOgo+ID4gwqBzdGF0aWMgaW50IHNiZWZpZm9fcmVtb3ZlKHN0cnVj
dCBkZXZpY2UgKmRldikKPiA+IMKgewo+ID4gLcKgwqDCoMKgwqBzdHJ1Y3QgZnNpX2RldmljZSAq
ZnNpX2RldiA9IHRvX2ZzaV9kZXYoZGV2KTsKPiA+IC3CoMKgwqDCoMKgc3RydWN0IHNiZWZpZm8g
KnNiZWZpZm8sICpzYmVmaWZvX3RtcDsKPiA+ICvCoMKgwqDCoMKgc3RydWN0IHNiZWZpZm8gKnNi
ZWZpZm8gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiA+IMKgwqDCoMKgwqDCoHN0cnVjdCBzYmVm
aWZvX3hmciAqeGZyOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgbGlzdF9mb3JfZWFjaF9lbnRyeV9z
YWZlKHNiZWZpZm8sIHNiZWZpZm9fdG1wLCAmc2JlZmlmb19maWZvcywgbGluaykgewo+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHNiZWZpZm8tPmZzaV9kZXYgIT0gZnNpX2RldikK
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb250aW51ZTsK
PiA+IC0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldmljZV9mb3JfZWFjaF9jaGls
ZChkZXYsIE5VTEwsIHNiZWZpZm9fdW5yZWdpc3Rlcl9jaGlsZCk7Cj4gPiArwqDCoMKgwqDCoFdS
SVRFX09OQ0Uoc2JlZmlmby0+cmMsIC1FTk9ERVYpOwo+ID4gK8KgwqDCoMKgwqB3YWtlX3VwKCZz
YmVmaWZvLT53YWl0KTsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtaXNj
X2RlcmVnaXN0ZXIoJnNiZWZpZm8tPm1kZXYpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgbGlzdF9kZWwoJnNiZWZpZm8tPmxpbmspOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWRhX3NpbXBsZV9yZW1vdmUoJnNiZWZpZm9faWRhLCBzYmVmaWZvLT5pZHgpOwo+ID4gK8Kg
wqDCoMKgwqBtaXNjX2RlcmVnaXN0ZXIoJnNiZWZpZm8tPm1kZXYpOwoKSSB0aGluayB3ZSBzaG91
bGQgZG8gdGhpcyBiZWZvcmUgdGhlIHdha2VfdXAoKSB0byBlbnN1cmUgdGhhdCB3ZSB3YWtlCmFs
bCB0aGUgc3VibWl0dGVkIGpvYnMuIE90aGVyd2lzZSB3ZSBtaWdodCBtaXNzIHNvbWUuCgo+ID4g
K8KgwqDCoMKgwqBkZXZpY2VfZm9yX2VhY2hfY2hpbGQoZGV2LCBOVUxMLCBzYmVmaWZvX3VucmVn
aXN0ZXJfY2hpbGQpOwo+ID4gwqAKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChk
ZWxfdGltZXJfc3luYygmc2JlZmlmby0+cG9sbF90aW1lcikpCj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2JlZmlmb19wdXQoc2JlZmlmbyk7Cj4gPiArwqDC
oMKgwqDCoGlkYV9zaW1wbGVfcmVtb3ZlKCZzYmVmaWZvX2lkYSwgc2JlZmlmby0+aWR4KTsKPiA+
IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2soJnNiZWZpZm8tPmxv
Y2spOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbGlzdF9mb3JfZWFjaF9lbnRyeSh4
ZnIsICZzYmVmaWZvLT54ZnJzLCB4ZnJzKQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGtmcmVlKHhmcik7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBzcGluX3VubG9jaygmc2JlZmlmby0+bG9jayk7Cj4gPiArwqDCoMKgwqDCoGlmIChkZWxfdGlt
ZXJfc3luYygmc2JlZmlmby0+cG9sbF90aW1lcikpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzYmVmaWZvX3B1dChzYmVmaWZvKTsKClNob3VsZG4ndCB3ZSBiZSBkb2luZyB0aGlzIGJl
Zm9yZSBXUklURV9PTkNFKHNiZWZpZm8tPnJjLCAtRU5PREVWKSB0bwplbnN1cmUgd2UgYXZvaWQg
YSByYWNlIG9uIHRoZSB2YWx1ZSBvZiAtPnJjPyBPdGhlcndpc2UgdGhlIHRpbWVyIGNvdWxkCmZp
cmUgYmV0d2VlbiB0aGUgV1JJVEVfT05DRSgpIGFuZCBoZXJlIGFuZCBwb3RlbnRpYWxseSB3cml0
ZSAtPnJjIG9yCmNhdXNlIGFub3RoZXIgam9iIHRvIGhhbmcgaW4gdGhlIEZJRk8u


--=-iqXaM3BuT/jm4TPKfhiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZyJ83AAoJEJ0dnzgO5LT5sesP/AuPi5ofCuU7OjBpNKu7Mb3B
sSgeQp2h6fniIeRQEVxABPdyawhpMZh1YZHlTpNgW0nCzasYKW20GB/Avxk4JiMn
rY+b0LoUNkeJyBv6Gm99BbMN6jjBNV98PLLG1M3NzEKkul8SV2jSVGJEI8opGvr3
y5INsbfbGYiZRmfI/Jme83klhCZvzeIL+lZRp6edhUsHXJulqx1YzVJuRyqfsZCy
1FtCSvMx8Cx3iTk+ZU2IgORKRT7dhoQJp1Swybw9Ag6diez+4ic95l6jXxmhz6NF
5hCpO84KrA1vrm1+kS8XYyS9Bjl9QHujSiXpOg2FgqlWdCdLKx/4nS8Erl6+J8Pr
gU3KKI6GPVfc24NBH2ARTsL9WQ/NmmPlbf8fvft3T0JKZBDlfVuXXaYnkto5Fb8G
TaGpRAhSzqKmT2d3pmCuKfkr43jXPqCmTMz3KzYgxcqjL6/OJ1Q2iTlnNsOmWPS4
eBRsWuyzWCVFoCwFhQKbeUfXJHDccXc1fmzDostxdUdHNr5uUBiruADasRRRhhrd
UVyRiwGPVa2rXWxnMj8X6tpqprTfa1E7mw1anjXigUeVRkaGQ03JevlSLXBztfh9
C8MIntFKftez7lDiGzhPB884iLzqXq9fvRYcLfMy9TTitL8rhC9XAyH4oGhIKdg8
UWfaUyCdMGuqWdlaoN0u
=HDWh
-----END PGP SIGNATURE-----

--=-iqXaM3BuT/jm4TPKfhiP--
