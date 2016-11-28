Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRqXP2B3bzDvk0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 12:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="RWyWzhvx"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="P2jbPLVv"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFE652093E;
 Sun, 27 Nov 2016 20:56:02 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Sun, 27 Nov 2016 20:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=YKzAx6jBqbsBmKPeg/LyPGTwLWA=; b=RWyWzh
 vx122E8OTvUCDtgubWxzOoTVlNDQd/vngI1D25+OV3abSXEFqdG+2KYB5s02OwAr
 BYMtwZXIlaicl/kVtAH8aA4pJTHQwV4Lb3HhkOlOX8e7D+cxXr6axqZGMWCjHRn4
 clVnkqr77Uurd1vp/awmoiQn1KopAYYGp9QZE=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=YKzAx6jBqbsBmK
 Peg/LyPGTwLWA=; b=P2jbPLVvRS394qxOt4R9xxwic5vG5rHAtsAUeKZMotJadx
 hn69ziyRbWsm90q1vAlRsIoU3kEcD180ZjkfrohPMD906GjLs8xUnGlMOV5xx323
 6zRPQQdBKPd19DsWvwNKpxWTW4GufFYm9WUpYF6faZcG7ylpdlHPW2X8R2ywo=
X-ME-Sender: <xms:so47WH0toWno2Xw3arSlCphOM_eCuDAIt5NlCvKPUBMg1Dmv4Nhyhg>
X-Sasl-enc: CjiilW1hZDZ6pW/OFhJhcW+ozS6HAZeQ9KlYImnYTHQ0 1480298161
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DE64245D2;
 Sun, 27 Nov 2016 20:56:00 -0500 (EST)
Message-ID: <1480298155.2503.68.camel@aj.id.au>
Subject: Re: [PATCH qemu 25/38] aspeed/sdmc: rework the locking register of
 the memory controller
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 28 Nov 2016 12:25:55 +1030
In-Reply-To: <1479478938-13267-26-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-26-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hcgtskbjagc6okaf2/Tw"
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
X-List-Received-Date: Mon, 28 Nov 2016 01:56:05 -0000


--=-hcgtskbjagc6okaf2/Tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE1OjIyICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBUaGUgbG9jayByZWdpc3RlciBpcyB1bmxvY2tlZCB3aXRoIGEgd3JpdGUgb2YgYSBzcGVj
aWFsIHZhbHVlIGFuZAo+IGxvY2tlZCB3aXRoIGEgd3JpdGUgb2YgYW55IG90aGVyIHZhbHVlLiBX
aGVuIHVubG9ja2VkLCByZWFkcyByZXR1cm4KPiBvbmUgYW5kIHdoZW4gbG9ja2VkIGEgemVyby4K
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+Cj4g
LS0tCj4gwqBody9taXNjL2FzcGVlZF9zZG1jLmPCoMKgwqDCoMKgwqDCoMKgwqB8IDI4ICsrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0KPiDCoGluY2x1ZGUvaHcvbWlzYy9hc3BlZWRfc2RtYy5o
IHzCoMKgMSArCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2h3L21pc2MvYXNwZWVkX3NkbWMuYyBiL2h3L21pc2Mv
YXNwZWVkX3NkbWMuYwo+IGluZGV4IDVmM2FjMGI2ZjYwOC4uODY3Y2FhMmQ2NGRjIDEwMDY0NAo+
IC0tLSBhL2h3L21pc2MvYXNwZWVkX3NkbWMuYwo+ICsrKyBiL2h3L21pc2MvYXNwZWVkX3NkbWMu
Ywo+IEBAIC04MywxNyArODMsMjIgQEAKPiDCoHN0YXRpYyB1aW50NjRfdCBhc3BlZWRfc2RtY19y
ZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsIHVuc2lnbmVkIHNpemUpCj4gwqB7Cj4gwqDC
oMKgwqDCoEFzcGVlZFNETUNTdGF0ZSAqcyA9IEFTUEVFRF9TRE1DKG9wYXF1ZSk7Cj4gK8KgwqDC
oMKgdWludDY0X3QgdmFsID0gMDsKPiDCoAo+IMKgwqDCoMKgwqBhZGRyID4+PSAyOwo+IMKgCj4g
LcKgwqDCoMKgaWYgKGFkZHIgPj0gQVJSQVlfU0laRShzLT5yZWdzKSkgewo+ICvCoMKgwqDCoHN3
aXRjaCAoYWRkcikgewo+ICvCoMKgwqDCoGNhc2UgUl9QUk9UOgo+ICvCoMKgwqDCoMKgwqDCoMKg
dmFsID0gcy0+dW5sb2NrZWQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKgwqBk
ZWZhdWx0Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoHFlbXVfbG9nX21hc2soTE9HX0dVRVNUX0VSUk9S
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiJXM6IE91
dC1vZi1ib3VuZHMgcmVhZCBhdCBvZmZzZXQgMHglIiBIV0FERFJfUFJJeCAiXG4iLAo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX2Z1bmNfXywgYWRkcik7
Cj4gLcKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+
IMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqByZXR1cm4gcy0+cmVnc1thZGRyXTsKPiArwqDC
oMKgwqByZXR1cm4gdmFsOwoKVGhpcyBzdWdnZXN0cyB3ZSBvbmx5IGNhcmUgYWJvdXQgUl9QUk9U
IC0gdGhlIGNoYW5nZSByZXR1cm5zIDAgZm9yIHRoZQp2YWx1ZSBvZiBvdGhlciByZWdpc3RlcnMu
IFRoYXQgZG9lc24ndCBzZWVtIHJpZ2h0LgoKQW5kcmV3Cgo+IMKgfQo+IMKgCj4gwqBzdGF0aWMg
dm9pZCBhc3BlZWRfc2RtY193cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1aW50NjRf
dCBkYXRhLAo+IEBAIC0xMDMsMTkgKzEwOCwxOCBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2RtY193
cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1aW50NjRfdCBkYXRhLAo+IMKgCj4gwqDC
oMKgwqDCoGFkZHIgPj49IDI7Cj4gwqAKPiAtwqDCoMKgwqBpZiAoYWRkciA+PSBBUlJBWV9TSVpF
KHMtPnJlZ3MpKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqBxZW11X2xvZ19tYXNrKExPR19HVUVTVF9F
UlJPUiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiJXM6
IE91dC1vZi1ib3VuZHMgd3JpdGUgYXQgb2Zmc2V0IDB4JSIgSFdBRERSX1BSSXggIlxuIiwKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX2Z1bmNfXywgYWRk
cik7Cj4gK8KgwqDCoMKgaWYgKGFkZHIgPT0gUl9QUk9UKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqBz
LT51bmxvY2tlZCA9IChkYXRhID09IFBST1RfS0VZX1VOTE9DSyk7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuOwo+IMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqBpZiAoYWRkciAhPSBSX1BS
T1QgJiYgcy0+cmVnc1tSX1BST1RdICE9IFBST1RfS0VZX1VOTE9DSykgewo+ICvCoMKgwqDCoGlm
ICghcy0+dW5sb2NrZWQpIHsgLyogVE9ETyBwcm90ZWN0IDogTUNSMDQg4oi8IE1DUjdDICovCj4g
wqDCoMKgwqDCoMKgwqDCoMKgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJST1IsICIlczogU0RN
QyBpcyBsb2NrZWQhXG4iLCBfX2Z1bmNfXyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+
IMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqBpZiAoYWRkciA9PSBSX0NPTkYpIHsKPiArwqDC
oMKgwqBzd2l0Y2ggKGFkZHIpIHsKPiArwqDCoMKgwqBjYXNlIFJfQ09ORjoKPiDCoMKgwqDCoMKg
wqDCoMKgwqAvKiBNYWtlIHN1cmUgcmVhZG9ubHkgYml0cyBhcmUga2VwdCAqLwo+IMKgwqDCoMKg
wqDCoMKgwqDCoHN3aXRjaCAocy0+c2lsaWNvbl9yZXYpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqBj
YXNlIEFTVDI0MDBfQTBfU0lMSUNPTl9SRVY6Cj4gQEAgLTEyOCw2ICsxMzIsMTIgQEAgc3RhdGlj
IHZvaWQgYXNwZWVkX3NkbWNfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIgYWRkciwgdWludDY0
X3QgZGF0YSwKPiDCoMKgwqDCoMKgwqDCoMKgwqBkZWZhdWx0Ogo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4g
K8KgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKgwqBkZWZhdWx0Ogo+ICvCoMKgwqDCoMKg
wqDCoMKgcWVtdV9sb2dfbWFzayhMT0dfR1VFU1RfRVJST1IsCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIiVzOiBPdXQtb2YtYm91bmRzIHdyaXRlIGF0IG9m
ZnNldCAweCUiIEhXQUREUl9QUkl4ICJcbiIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgX19mdW5jX18sIGFkZHIgPDwgMik7Cj4gK8KgwqDCoMKgwqDCoMKg
wqByZXR1cm47Cj4gwqDCoMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqBzLT5yZWdzW2FkZHJdID0g
ZGF0YTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9taXNjL2FzcGVlZF9zZG1jLmggYi9pbmNs
dWRlL2h3L21pc2MvYXNwZWVkX3NkbWMuaAo+IGluZGV4IDU1MWM4YWZkZjRiZS4uYTQ0MTVkOWVm
YzJmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvaHcvbWlzYy9hc3BlZWRfc2RtYy5oCj4gKysrIGIv
aW5jbHVkZS9ody9taXNjL2FzcGVlZF9zZG1jLmgKPiBAQCAtMjgsNiArMjgsNyBAQCB0eXBlZGVm
IHN0cnVjdCBBc3BlZWRTRE1DU3RhdGUgewo+IMKgwqDCoMKgwqB1aW50MzJfdCByYW1fYml0czsK
PiDCoMKgwqDCoMKgdWludDY0X3QgcmFtX3NpemU7Cj4gwqAKPiArwqDCoMKgwqBib29sIHVubG9j
a2VkOwo+IMKgfSBBc3BlZWRTRE1DU3RhdGU7Cj4gwqAKPiDCoCNlbmRpZiAvKiBBU1BFRURfU0RN
Q19IICov


--=-hcgtskbjagc6okaf2/Tw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYO46rAAoJEJ0dnzgO5LT5t8AP+wUgfZ3eJKTRcoPotj/AZzED
YprGqAKf55IbIs5lAwA0XQbJvNVh4KFVD6Pq9me8VmlVIuNJrkvzjcstKUYVB23s
WOBwaqXwYiFEceLx/Z2eFyxj6POuJHOrncAFr+anTSPU+qUdPWpx31OU5SYBIPsu
uaHEnmRpKuV7G+2tTHk6L3oUW/nCKJxZNgcu5UuBlKIA9Bu+o06KYJg/YO+1L3KF
LJB7WOBQtYyyTttJGeLj9gO+AuZXEtOqR3zFRu5O4alt009Q3VOFyNuI/WUivoRj
bxsZPHFrewiJN2gt97h6Iln933dvoSbwtme6VWwPW13dr8j+U03cz/TYsJJUfGWs
JnYVBGexbig/lsg95X8YjOtLiQXPfzHexJclaYabB3yXwk4R9r36L3S/s8x7n5rW
EH757FctyJytWLwF3yge6pRK/pcu0vlqQ7YSau1MxwLCVumRPgvfxoMiWJdAIv/Z
t+GNX8qObBhv7mwxbFxq3eBeQIKAevj5/xE1pjYf53wXMziHy2dSS88Qr+K0T/8E
2xjIWUUXJf8FP8dMFkOmP4zHZO87DGVGPmuC8nLuZjDEsVQJOpC0Wy7OpD5U4Ntm
6qeUvb0jf7pArzCU+rdMvHl0Fz/5vXbOzCJEa4kIM7vTQGPiJYoLOBvFKrVdb3jH
i1xWz/UUvcP36xwBPP5W
=hxz7
-----END PGP SIGNATURE-----

--=-hcgtskbjagc6okaf2/Tw--
