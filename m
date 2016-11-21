Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMqQR1QZYzDvjG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:37:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jcLy5SOm"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="RrTBaORD"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B97A20506;
 Mon, 21 Nov 2016 08:37:01 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 08:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=3ZAebbqS10ITS3tnphz+y/PQQgU=; b=jcLy5S
 OmzF2SB6oNj1IZMlk2iKADrJpdhUURpxuFfZb69PaicLs+Fs7ZqyixkDuZbOAfXc
 ccMn0RS0s4+7OSVAEsQH/gl47kuNSounlJnqwMOJ3GhKShB5iIATPFrsa0REJT74
 GoYqUUE3JSFL3gxQNumaPq6/D50C0w5g5uFZI=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=3ZAebbqS10ITS3
 tnphz+y/PQQgU=; b=RrTBaORD/00RXMlLUwl2zzfy8kBtQ1724xyr5fViQ9Kz5Y
 Jlxa93ybnRyyaL8ly4t3cyc3SA43fJGXPfr9c/0Wkfy4DjyaYWV8OjAhspPRpATU
 YgULOMyKHOwH1Ywk5OOibsLSSBaLjo7sW3a2oYsdg+IQCHXbMPSfUFb5yxJv0=
X-ME-Sender: <xms:ffgyWNBEKobKU-HsVYhDChOOCNTBdKD63p77h7R2XJrEluKUFbSFBw>
X-Sasl-enc: eCtwD8KpLYDLHvE25Vo4K4PhSswYVsLR+PY4zOvXqwhl 1479735420
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9BF3224CD2;
 Mon, 21 Nov 2016 08:36:59 -0500 (EST)
Message-ID: <1479735399.2503.11.camel@aj.id.au>
Subject: Re: [PATCH qemu 13/38] aspeed/smc: introduce a
 aspeed_smc_flash_update_cs() helper
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 22 Nov 2016 00:06:39 +1030
In-Reply-To: <1479478938-13267-14-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-14-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-LdH0R4L3oyey1mA1+Nco"
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
X-List-Received-Date: Mon, 21 Nov 2016 13:37:03 -0000


--=-LdH0R4L3oyey1mA1+Nco
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE1OjIxICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBhc3BlZWRfc21jX3VwZGF0ZV9jcygpIHdhcyB1c2VsZXNzbHkgbG9vcGluZyBvbiBhbGwg
Q1MgdG8gdXBkYXRlIHRoZWlyCj4gc3RhdHVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMg
TGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFu
ZHJld0Bhai5pZC5hdT4KCj4gLS0tCj4gwqBody9zc2kvYXNwZWVkX3NtYy5jIHwgMTYgKysrKysr
LS0tLS0tLS0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L3NzaS9hc3BlZWRfc21jLmMgYi9ody9zc2kvYXNw
ZWVkX3NtYy5jCj4gaW5kZXggOTFjZGMwYmYxYWM3Li4xYzZjNTA4OWYyNjUgMTAwNjQ0Cj4gLS0t
IGEvaHcvc3NpL2FzcGVlZF9zbWMuYwo+ICsrKyBiL2h3L3NzaS9hc3BlZWRfc21jLmMKPiBAQCAt
NDA4LDE0ICs0MDgsMTAgQEAgc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBhc3BlZWRfc21j
X2ZsYXNoX29wcyA9IHsKPiDCoMKgwqDCoMKgfSwKPiDCoH07Cj4gwqAKPiAtc3RhdGljIHZvaWQg
YXNwZWVkX3NtY191cGRhdGVfY3MoY29uc3QgQXNwZWVkU01DU3RhdGUgKnMpCj4gK3N0YXRpYyB2
b2lkIGFzcGVlZF9zbWNfZmxhc2hfdXBkYXRlX2NzKEFzcGVlZFNNQ0ZsYXNoICpmbCkKPiDCoHsK
PiAtwqDCoMKgwqBpbnQgaTsKPiAtCj4gLcKgwqDCoMKgZm9yIChpID0gMDsgaSA8IHMtPm51bV9j
czsgKytpKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqBxZW11X3NldF9pcnEocy0+Y3NfbGluZXNbaV0s
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFzcGVlZF9zbWNf
aXNfY2Vfc3RvcF9hY3RpdmUoJnMtPmZsYXNoZXNbaV0pKTsKPiAtwqDCoMKgwqB9Cj4gK8KgwqDC
oMKgQXNwZWVkU01DU3RhdGUgKnMgPSBmbC0+Y29udHJvbGxlcjsKPiArwqDCoMKgwqBxZW11X3Nl
dF9pcnEocy0+Y3NfbGluZXNbZmwtPmlkXSwgYXNwZWVkX3NtY19pc19jZV9zdG9wX2FjdGl2ZShm
bCkpOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgdm9pZCBhc3BlZWRfc21jX3Jlc2V0KERldmljZVN0
YXRlICpkKQo+IEBAIC00MzEsNiArNDI3LDcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NtY19yZXNl
dChEZXZpY2VTdGF0ZSAqZCkKPiDCoMKgwqDCoMKgLyogVW5zZWxlY3QgYWxsIHNsYXZlcyAqLwo+
IMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwgcy0+bnVtX2NzOyArK2kpIHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqBzLT5yZWdzW3MtPnJfY3RybDAgKyBpXSB8PSBDVFJMX0NFX1NUT1BfQUNUSVZFOwo+
ICvCoMKgwqDCoMKgwqDCoMKgcWVtdV9zZXRfaXJxKHMtPmNzX2xpbmVzW2ldLCB0cnVlKTsKPiDC
oMKgwqDCoMKgfQo+IMKgCj4gwqDCoMKgwqDCoC8qIHNldHVwIGRlZmF1bHQgc2VnbWVudCByZWdp
c3RlciB2YWx1ZXMgZm9yIGFsbCAqLwo+IEBAIC00MzgsOCArNDM1LDYgQEAgc3RhdGljIHZvaWQg
YXNwZWVkX3NtY19yZXNldChEZXZpY2VTdGF0ZSAqZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqBzLT5y
ZWdzW1JfU0VHX0FERFIwICsgaV0gPQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXNwZWVk
X3NtY19zZWdtZW50X3RvX3JlZygmcy0+Y3RybC0+c2VnbWVudHNbaV0pOwo+IMKgwqDCoMKgwqB9
Cj4gLQo+IC3CoMKgwqDCoGFzcGVlZF9zbWNfdXBkYXRlX2NzKHMpOwo+IMKgfQo+IMKgCj4gwqBz
dGF0aWMgdWludDY0X3QgYXNwZWVkX3NtY19yZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIs
IHVuc2lnbmVkIGludCBzaXplKQo+IEBAIC00ODksOCArNDg0LDkgQEAgc3RhdGljIHZvaWQgYXNw
ZWVkX3NtY193cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1aW50NjRfdCBkYXRhLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoGFkZHIgPT0gcy0+cl9jZV9jdHJsKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgcy0+cmVnc1thZGRyXSA9IHZhbHVlOwo+IMKgwqDCoMKgwqB9IGVsc2UgaWYgKGFkZHIg
Pj0gcy0+cl9jdHJsMCAmJiBhZGRyIDwgcy0+cl9jdHJsMCArIHMtPm51bV9jcykgewo+ICvCoMKg
wqDCoMKgwqDCoMKgaW50IGNzID0gYWRkciAtIHMtPnJfY3RybDA7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgcy0+cmVnc1thZGRyXSA9IHZhbHVlOwo+IC3CoMKgwqDCoMKgwqDCoMKgYXNwZWVkX3NtY191
cGRhdGVfY3Mocyk7Cj4gK8KgwqDCoMKgwqDCoMKgwqBhc3BlZWRfc21jX2ZsYXNoX3VwZGF0ZV9j
cygmcy0+Zmxhc2hlc1tjc10pOwo+IMKgwqDCoMKgwqB9IGVsc2UgaWYgKGFkZHIgPj0gUl9TRUdf
QUREUjAgJiYKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFkZHIgPCBSX1NFR19B
RERSMCArIHMtPmN0cmwtPm1heF9zbGF2ZXMpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgY3Mg
PSBhZGRyIC0gUl9TRUdfQUREUjA7


--=-LdH0R4L3oyey1mA1+Nco
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMvhnAAoJEJ0dnzgO5LT5ViAP/1eCNPpaCWyt0lmoBSL0eR+Z
fV/ivlKLiY8JE3mfHT1AwOF8sGDK846jfr9w+/psaJMNMxX5lTJnvSxHcb8ac3vy
4JMX+xTMmj2v+hoHRe1oBuOJkELRwZmUxkK3RjGROXu41dnnHNfMw5beiGITs7A3
khwEHn37I2VlkoAW73h/Dlq8IalXZUpES5cULkswpwOjoMjqjYWFgbjPHJGAjIwW
OfDNbcvOFPvT6ElMpaadmsKiPsrSvVlIx5RjHqQe2DdASrG0iYgAmExuefLYXdKs
WMc4QEDrIHClDreh7cOxH5+u/SolP+X7gFCVZXB4Lma3SjgceMfPE0OaRlzs2JKt
ZIyMiJg8LxyX9gbT8hr/UYNrjCI0bwf7Peq6ZKt5WFqbzGdi0SaDpL42zsrqA4QY
kX/Kz6yTNOB7SL3GJUwvgInSuXGG1Co90WgoX5UelCVvcD5WsVw1Wi+6u+Oi8kjT
d9oZ0XkUYVnOgb7w6mS8MhtUwFLMM52T8xXG8Yccevc+NfD7jj2cDLtxLGLOEYmj
ZahrdRfKeVr0So8QZIemMlSVHpUTJiEqGKJdxGc3IoP8b8z6ceEjDlUymHniWZFW
TizY+AXaJut+/RFPF/ZfzrpawwFEx1gW8b3r+Vkh2upbcNMSARdE7p473yGGFcM4
bHLPdnvibAKMndsktAAH
=Wzsj
-----END PGP SIGNATURE-----

--=-LdH0R4L3oyey1mA1+Nco--
