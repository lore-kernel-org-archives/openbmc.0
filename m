Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tQ1GB1GF1zDvxW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Nov 2016 14:07:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JaISbdWI"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="aGuyfBcC"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 58BC92043C;
 Thu, 24 Nov 2016 22:07:26 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 24 Nov 2016 22:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=JH7cr89wc1ur91WiAZnRmsCLnTk=; b=JaISbd
 WI2rtkNhzpa4KKM41iXskzUCN6VXaU1zcaCqVN3wUl+LRQHq1qfiYZwl117DJ6fP
 HLnk2TpMv8qX7CQBlfbosOprmeIj7Id2j6R0FLy+7l7ETpbcss9vypC/L1H/pWS7
 Xk2WAvYK1UZfXW7ccSwkibHRorwCUlBiow6R4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=JH7cr89wc1ur91
 WiAZnRmsCLnTk=; b=aGuyfBcCz/TG6IjcG+bv9wy9dOp/ShYqP/uQ0t2sUaZkwc
 MGFokbV0Snlm9X4HWRYkS3k4UOxRtGMnlUheUMGPiePgJaI4pDXNDS/eE+hGn8V/
 WuB3+PiYSbylyZR/YvMbfU2fhlf88Z7DuUX7kYtvSl/dS0MG2+QcifbopPfMY=
X-ME-Sender: <xms:7qo3WHzl5ClWM4hQ-EulpgtpkIaYWQe8BHkbvCKagVGI_Yf4z8hxsw>
X-Sasl-enc: fvlDQrKcQhme4ZZ6LjPyZSoiA+U10BbeuCxBMaITru8r 1480043245
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3E1124439;
 Thu, 24 Nov 2016 22:07:24 -0500 (EST)
Message-ID: <1480043237.2503.55.camel@aj.id.au>
Subject: Re: [PATCH qemu 14/38] aspeed/smc: autostrap CE0/1 configuration
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Fri, 25 Nov 2016 13:37:17 +1030
In-Reply-To: <1479478938-13267-15-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-15-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LnQu11kGiVlC6JWGi1mz"
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
X-List-Received-Date: Fri, 25 Nov 2016 03:07:31 -0000


--=-LnQu11kGiVlC6JWGi1mz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE1OjIxICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBIVyBhdXRvZGV0ZWN0IHR5cGUgYW5kIHNpemUgb2YgdGhlIGZpcnN0IGFuZCBzZWNvbmQg
Zmxhc2ggbW9kdWxlcyBvZgo+IHRoZSBGTUMgY29udHJvbGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBK
ZWZmZXJ5IDxhbmRyZXdAYWouaWQuYXU+Cgo+IC0tLQo+IMKgaHcvc3NpL2FzcGVlZF9zbWMuYyB8
IDI2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjEgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaHcvc3NpL2FzcGVl
ZF9zbWMuYyBiL2h3L3NzaS9hc3BlZWRfc21jLmMKPiBpbmRleCAxYzZjNTA4OWYyNjUuLjcyYTQ0
MTUwYjBhMSAxMDA2NDQKPiAtLS0gYS9ody9zc2kvYXNwZWVkX3NtYy5jCj4gKysrIGIvaHcvc3Np
L2FzcGVlZF9zbWMuYwo+IEBAIC0zOSwxMSArMzksMTQgQEAKPiDCoCNkZWZpbmXCoMKgwqBDT05G
X0VOQUJMRV9XMsKgwqDCoMKgwqDCoMKgMTgKPiDCoCNkZWZpbmXCoMKgwqBDT05GX0VOQUJMRV9X
McKgwqDCoMKgwqDCoMKgMTcKPiDCoCNkZWZpbmXCoMKgwqBDT05GX0VOQUJMRV9XMMKgwqDCoMKg
wqDCoMKgMTYKPiAtI2RlZmluZcKgwqDCoENPTkZfRkxBU0hfVFlQRTTCoMKgwqDCoMKgOQo+IC0j
ZGVmaW5lwqDCoMKgQ09ORl9GTEFTSF9UWVBFM8KgwqDCoMKgwqA3Cj4gLSNkZWZpbmXCoMKgwqBD
T05GX0ZMQVNIX1RZUEUywqDCoMKgwqDCoDUKPiAtI2RlZmluZcKgwqDCoENPTkZfRkxBU0hfVFlQ
RTHCoMKgwqDCoMKgMwo+IC0jZGVmaW5lwqDCoMKgQ09ORl9GTEFTSF9UWVBFMMKgwqDCoMKgwqAx
Cj4gKyNkZWZpbmXCoMKgwqBDT05GX0ZMQVNIX1RZUEU0wqDCoMKgwqDCoDgKPiArI2RlZmluZcKg
wqDCoENPTkZfRkxBU0hfVFlQRTPCoMKgwqDCoMKgNgo+ICsjZGVmaW5lwqDCoMKgQ09ORl9GTEFT
SF9UWVBFMsKgwqDCoMKgwqA0Cj4gKyNkZWZpbmXCoMKgwqBDT05GX0ZMQVNIX1RZUEUxwqDCoMKg
wqDCoDIKPiArI2RlZmluZcKgwqDCoENPTkZfRkxBU0hfVFlQRTDCoMKgwqDCoMKgMAo+ICsjZGVm
aW5lwqDCoMKgwqDCoMKgQ09ORl9GTEFTSF9UWVBFX05PUsKgwqDCoDB4MAo+ICsjZGVmaW5lwqDC
oMKgwqDCoMKgQ09ORl9GTEFTSF9UWVBFX05BTkTCoMKgMHgxCj4gKyNkZWZpbmXCoMKgwqDCoMKg
wqBDT05GX0ZMQVNIX1RZUEVfU1BJwqDCoMKgMHgyCj4gwqAKPiDCoC8qIENFIENvbnRyb2wgUmVn
aXN0ZXIgKi8KPiDCoCNkZWZpbmUgUl9DRV9DVFJMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKDB4
MDQgLyA0KQo+IEBAIC00MzUsNiArNDM4LDE5IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zbWNfcmVz
ZXQoRGV2aWNlU3RhdGUgKmQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgcy0+cmVnc1tSX1NFR19BRERS
MCArIGldID0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFzcGVlZF9zbWNfc2VnbWVudF90
b19yZWcoJnMtPmN0cmwtPnNlZ21lbnRzW2ldKTsKPiDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKg
wqAvKiBDRTAgYW5kIENFMSBIVyBzdHJhcHBpbmcgZm9yIEZNQyBjb250cm9sbGVycyA6IFNQSSBm
bGFzaCB0eXBlCj4gK8KgwqDCoMKgwqAqIGFuZCA0QllURSBtb2RlCj4gK8KgwqDCoMKgwqAqLwo+
ICvCoMKgwqDCoGlmIChzLT5jdHJsLT5zZWdtZW50cyA9PSBhc3BlZWRfc2VnbWVudHNfZm1jIHx8
Cj4gK8KgwqDCoMKgwqDCoMKgwqBzLT5jdHJsLT5zZWdtZW50cyA9PSBhc3BlZWRfc2VnbWVudHNf
YXN0MjUwMF9mbWMpIHsKPiArwqDCoMKgwqDCoMKgwqDCoHMtPnJlZ3Nbcy0+cl9jb25mXSB8PSAo
Q09ORl9GTEFTSF9UWVBFX1NQSSA8PAo+IENPTkZfRkxBU0hfVFlQRTApOwo+ICvCoMKgwqDCoMKg
wqDCoMKgcy0+cmVnc1tzLT5yX2NvbmZdIHw9IChDT05GX0ZMQVNIX1RZUEVfU1BJIDw8Cj4gQ09O
Rl9GTEFTSF9UWVBFMSk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgLyogV2Ugc2hvdWxkIGJlIGFi
bGUgdG8gZGV0ZWN0IHRoZSBmbGFzaCBzaXplIGluIHNvbWUgd2F5cy4KPiAqLwo+ICvCoMKgwqDC
oMKgwqDCoMKgcy0+cmVnc1tzLT5yX2NlX2N0cmxdIHw9ICgxIDw8IChDVFJMX0VYVEVOREVEMCkp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgcy0+cmVnc1tzLT5yX2NlX2N0cmxdIHw9ICgxIDw8IChDVFJM
X0VYVEVOREVEMSkpOwo+ICvCoMKgwqDCoH0KPiDCoH0KPiDCoAo+IMKgc3RhdGljIHVpbnQ2NF90
IGFzcGVlZF9zbWNfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1bnNpZ25lZAo+IGlu
dCBzaXplKQ==


--=-LnQu11kGiVlC6JWGi1mz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYN6rmAAoJEJ0dnzgO5LT5K44P/j8Jxg1fIoAJB046+6A4Rthj
2Wo2u3F3sSiCv7s0YvBZtHAUWrhidFTOQ8B7Xaxq7RornXIUq/tpvoN1oOA7MlAM
PkziHSkTFx80bIhoAPz2k7k/xAfdFasFariPdSrkRTDySE7nuvKWffsraCShvWEW
LkTnrrw2Rh/uXUWqBOEzHcDWhoU0+zGJT9K/EkQhtGnJt1T1zUKZ+PzjgLm7u6mL
+8LEYTLBzKu3e7nC61zx0571Ih5EeljuehjICdxZDJ2BQg4l7LW+bva9i0QOC1Cs
28Timh7pKyMuuNdGgZL1NHxCzkGjsUmaTRYrBDwDHXSvf34iiq3i98Gp0j5FUygQ
E/y+Jytf6qeImI/1V/dJjb+Xcak4KKQubvborle7T4udB/aTHPZsKWpRz04F2K3p
4bgCyfBSUKYTy/Rjd5Rq9bmgpMd6ZgNlPv+/sQ4jQmMdq1kjSqVSmK/Rc45oH5G7
g4aJF1jpV7WM3FidaNf57Umna8PI6A1drM+MLDJiITo4e49IXplk2oPGoFZ0/Opy
Hx5eyQjJkViImqiPexDyRjUyXTUupUNvKUBqryIQZXbLRONFZPMvGcK+uwf9kXkD
kUOoDsAdMg47z3RGj1P4XmpJ/9qQO+68zDlQMM+bx9ctJSA3ijD48JhZaDNwK0Gf
VJdgtGE6A7zKyC9gb8jb
=u5+W
-----END PGP SIGNATURE-----

--=-LnQu11kGiVlC6JWGi1mz--
