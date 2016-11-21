Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMm5q4xw0zDvs3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:07:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EWhQq7Vo"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="db4RXeLV"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7FBCF204AB;
 Mon, 21 Nov 2016 06:07:25 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 06:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=FjqsigkSxepQUNp3+sXcKR5zKkk=; b=EWhQq7
 VornsIxwYv4qE7PFbhkRb+m2rdlqsHUl0RlEw8BpryILcxlus6DnqO7rvpfihp/d
 7rd/CdgFX8y5BrnDXUcSSnBKCGvlkTkV6E2BsylzZM6HkFyCoFVUW7moWSt9kmrB
 G8kW7xu+ctmpIilZYpuxfpDakQQ+59EpaWgIA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=FjqsigkSxepQUN
 p3+sXcKR5zKkk=; b=db4RXeLVulDk+2CCqzjRb1Skw2YAddyj9A/sNqNu65uhKs
 J66px4+N7WLgkXcMCaaf743Sb0makm468i3HrocsOpGs+1yoGGsIgm4+VmLt3VYu
 Jy+MYVZ8CLeqVf6N5InOOhnBpvyAfyOyhhsPF/XLAswE8ruDgJNLjyXYOBY2M=
X-ME-Sender: <xms:bdUyWAEWS56UNXGQ2M_FjTFsbZ5dAr4vWQArp5CpOULuKX0INk3DkQ>
X-Sasl-enc: 5GIwqkXFgySN1mxxDIAeNt/TiHsJmxmp8QzRLGNDtrgd 1479726444
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0305724CD4;
 Mon, 21 Nov 2016 06:07:23 -0500 (EST)
Message-ID: <1479726439.5215.28.camel@aj.id.au>
Subject: Re: [PATCH qemu 04/38] aspeed: extend the board configuration with
 flash models
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 21:37:19 +1030
In-Reply-To: <1479478938-13267-5-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-5-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-ZfWzB6vFWvqiDukiTyq4"
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
X-List-Received-Date: Mon, 21 Nov 2016 11:07:28 -0000


--=-ZfWzB6vFWvqiDukiTyq4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE1OjIxICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBGdXR1cmUgbWFjaGluZSB3aWxsIHVzZSBkaWZmZXJlbnQgZmxhc2ggbW9kZWxzIGZvciB0
aGUgRk1DIGFuZCB0aGUgU1BJCj4gY29udHJvbGxlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ8Op
ZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KClJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVy
eSA8YW5kcmV3QGFqLmlkLmF1PgoKPiAtLS0KPiDCoGh3L2FybS9hc3BlZWQuYyB8IDIwICsrKysr
KysrKysrKysrKystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvYXJtL2FzcGVlZC5jIGIvaHcvYXJtL2Fz
cGVlZC5jCj4gaW5kZXggYzcyMDZmZGE2ZDg1Li4xNTlkNTYyZTg5MTIgMTAwNjQ0Cj4gLS0tIGEv
aHcvYXJtL2FzcGVlZC5jCj4gKysrIGIvaHcvYXJtL2FzcGVlZC5jCj4gQEAgLTM0LDYgKzM0LDgg
QEAgdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkQm9hcmRTdGF0ZSB7Cj4gwqB0eXBlZGVmIHN0cnVjdCBB
c3BlZWRCb2FyZENvbmZpZyB7Cj4gwqDCoMKgwqDCoGNvbnN0IGNoYXIgKnNvY19uYW1lOwo+IMKg
wqDCoMKgwqB1aW50MzJfdCBod19zdHJhcDE7Cj4gK8KgwqDCoMKgY29uc3QgY2hhciAqZm1jX21v
ZGVsOwo+ICvCoMKgwqDCoGNvbnN0IGNoYXIgKnNwaV9tb2RlbDsKPiDCoH0gQXNwZWVkQm9hcmRD
b25maWc7Cj4gwqAKPiDCoGVudW0gewo+IEBAIC02NSw4ICs2NywxOCBAQCBlbnVtIHsKPiDCoMKg
wqDCoMKgwqDCoMKgwqB+U0NVX0hXX1NUUkFQXzJORF9CT09UX1dEVCkKPiDCoAo+IMKgc3RhdGlj
IGNvbnN0IEFzcGVlZEJvYXJkQ29uZmlnIGFzcGVlZF9ib2FyZHNbXSA9IHsKPiAtwqDCoMKgwqBb
UEFMTUVUVE9fQk1DXSA9IHsgImFzdDI0MDAtYTAiLCBQQUxNRVRUT19CTUNfSFdfU1RSQVAxIH0s
Cj4gLcKgwqDCoMKgW0FTVDI1MDBfRVZCXcKgwqA9IHsgImFzdDI1MDAtYTEiLCBBU1QyNTAwX0VW
Ql9IV19TVFJBUDEgfSwKPiArwqDCoMKgwqBbUEFMTUVUVE9fQk1DXSA9IHsKPiArwqDCoMKgwqDC
oMKgwqDCoC5zb2NfbmFtZcKgwqA9ICJhc3QyNDAwLWEwIiwKPiArwqDCoMKgwqDCoMKgwqDCoC5o
d19zdHJhcDEgPSBQQUxNRVRUT19CTUNfSFdfU1RSQVAxLAo+ICvCoMKgwqDCoMKgwqDCoMKgLmZt
Y19tb2RlbCA9ICJuMjVxMjU2YSIsCj4gK8KgwqDCoMKgwqDCoMKgwqAuc3BpX21vZGVsID0gIm14
MjVsMjU2MzVlIiwKPiArwqDCoMKgwqB9LAo+ICvCoMKgwqDCoFtBU1QyNTAwX0VWQl3CoMKgPSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqAuc29jX25hbWXCoMKgPSAiYXN0MjUwMC1hMSIsCj4gK8KgwqDC
oMKgwqDCoMKgwqAuaHdfc3RyYXAxID0gQVNUMjUwMF9FVkJfSFdfU1RSQVAxLAo+ICvCoMKgwqDC
oMKgwqDCoMKgLmZtY19tb2RlbCA9ICJuMjVxMjU2YSIsCj4gK8KgwqDCoMKgwqDCoMKgwqAuc3Bp
X21vZGVsID0gIm14MjVsMjU2MzVlIiwKPiArwqDCoMKgwqB9LAo+IMKgfTsKPiDCoAo+IMKgc3Rh
dGljIHZvaWQgYXNwZWVkX2JvYXJkX2luaXRfZmxhc2hlcyhBc3BlZWRTTUNTdGF0ZSAqcywgY29u
c3QgY2hhciAqZmxhc2h0eXBlLAo+IEBAIC0xMjgsOCArMTQwLDggQEAgc3RhdGljIHZvaWQgYXNw
ZWVkX2JvYXJkX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lLAo+IMKgwqDCoMKgwqBvYmplY3Rf
cHJvcGVydHlfYWRkX2NvbnN0X2xpbmsoT0JKRUNUKCZibWMtPnNvYyksICJyYW0iLCBPQkpFQ1Qo
JmJtYy0+cmFtKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAmZXJyb3JfYWJvcnQpOwo+IMKgCj4gLcKgwqDC
oMKgYXNwZWVkX2JvYXJkX2luaXRfZmxhc2hlcygmYm1jLT5zb2MuZm1jLCAibjI1cTI1NmEiLCAm
ZXJyb3JfYWJvcnQpOwo+IC3CoMKgwqDCoGFzcGVlZF9ib2FyZF9pbml0X2ZsYXNoZXMoJmJtYy0+
c29jLnNwaVswXSwgIm14MjVsMjU2MzVlIiwgJmVycm9yX2Fib3J0KTsKPiArwqDCoMKgwqBhc3Bl
ZWRfYm9hcmRfaW5pdF9mbGFzaGVzKCZibWMtPnNvYy5mbWMsIGNmZy0+Zm1jX21vZGVsLCAmZXJy
b3JfYWJvcnQpOwo+ICvCoMKgwqDCoGFzcGVlZF9ib2FyZF9pbml0X2ZsYXNoZXMoJmJtYy0+c29j
LnNwaVswXSwgY2ZnLT5zcGlfbW9kZWwsICZlcnJvcl9hYm9ydCk7Cj4gwqAKPiDCoMKgwqDCoMKg
YXNwZWVkX2JvYXJkX2JpbmZvLmtlcm5lbF9maWxlbmFtZSA9IG1hY2hpbmUtPmtlcm5lbF9maWxl
bmFtZTsKPiDCoMKgwqDCoMKgYXNwZWVkX2JvYXJkX2JpbmZvLmluaXRyZF9maWxlbmFtZSA9IG1h
Y2hpbmUtPmluaXRyZF9maWxlbmFtZTs=


--=-ZfWzB6vFWvqiDukiTyq4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMtVnAAoJEJ0dnzgO5LT5u8sQAJdIkWusaKCGD6vZ1Es3uYB0
vWxJBBk++70yKIgfSabwPhEasz3JT6ZvuDPGGXH3s1fmLz5tp9VWKRSrBByDLqzh
3Mx9OJ/gV5OHWZQrIj2mtQ/eztkJsl+vL5J5QEOOGvcPLhpjuZ6xtcHcIOcwjCPW
tJN5WrG/1BFUHJb8wsqKkx7F7FOLqjNzbdlsyorXSY6q3k85Ll++KNgGFTb70lzk
QNmZEbNlkkPMAWfNCOQv+b2HRNBEQW3LNVVxuxa7IRU09zSn+Z0+d70yHUvU3NwE
4i1ZbaC1lo0ZlDsCZ2KGZHDZYwYfTTT+MqMwoo/B9gHgJBJrIeV6b1dgSkMclhHh
4FYbJ/xjBKX6HGellxl5Y5Ea5w1HIJQ6X6ER+p+TR+K+IzwASpmk8PkmQkHd0y7T
s/ukVzldcp9kB4rwE6AlKx4PVwkNf5B+jIoOfoS/XdBDc1gPn2W6Rfm7cLmrLEQd
HnUVcrZUjZyJrOVoCix5b8UcA1OdDhRKhbRas4jOM+I4w/pNfzyG20j9DPVPZzcF
/CgnUXVYNoQnLNgqN1WGD+O5WJzjDA7YQyqt3ZVpHLq2WviO/Gj93r7VIatBmYto
sv/BZBelVf3G9Zoym6ougGt1sMj7C3BSehLUEK2I6qoX3yfzeMeL58+TNzLgk7cl
aVUp6mOrXPFt/6EzKFeE
=1Btb
-----END PGP SIGNATURE-----

--=-ZfWzB6vFWvqiDukiTyq4--
