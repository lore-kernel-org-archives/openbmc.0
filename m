Return-Path: <andrew@aj.id.au>
Received: from homiemail-a75.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP1Hp5dN6zDq66
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 16:04:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=M3fPyqaI; 
 dkim-atps=neutral
Received: from homiemail-a75.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTP id BECA95EC07F;
 Mon,  6 Jun 2016 23:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=PeELEj1EtzGDq8uMcV8ES
 VYuDEM=; b=M3fPyqaIpBsFqmRk9lxeajx9vsv+B4nPwKP4C/9rQlXP1w/I0wC7G
 V5HUA89+XI4l2Wdaer+WAuosxsTW086hNr5h2uns634VpKmXqnlNpO66JmD0DlsN
 te61UWWN/OiNuhaa+2wa0ovYYKh6FOmFvdiV/Zke8+ARHEEMiH47t4=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a75.g.dreamhost.com (Postfix) with ESMTPSA id C594F5EC07E;
 Mon,  6 Jun 2016 23:04:51 -0700 (PDT)
Message-ID: <1465279477.16048.64.camel@aj.id.au>
Subject: Re: [PATCH qemu 05/12] ast2400: handle SPI flash Command mode (read
 only)
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Tue, 07 Jun 2016 15:34:37 +0930
In-Reply-To: <1464556805-4340-6-git-send-email-clg@kaod.org>
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-6-git-send-email-clg@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-7zAOajGtN7OoflF/x9ej"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2016 06:04:55 -0000


--=-7zAOajGtN7OoflF/x9ej
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gU3VuLCAyMDE2LTA1LTI5IGF0IDIzOjE5ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBXZSBjYW4gbm93IHVzZSBkaXJlY3RseSB0aGUgbTI1cDgwIGZsYXNoIHN0b3JhZ2UgdG8g
aGFuZGxlIG1lbW9yeQo+IGFjY2Vzc2VzIHdoZW4gdGhlIFNQSSBmbGFzaCBzbGF2ZSBpcyBjb25m
aWd1cmVkIGluIENvbW1hbmQgbW9kZS4gT25seQo+IHJlYWQgb25seSBhY2Nlc3NlcyBhcmUgaGFu
ZGxlZC4gQ29tbWFuZCBtb2RlIGlzIG9ubHkgcmVxdWlyZWQgYnkKPiBVLUJvb3QsIExpbnV4IGRv
ZXMgbm90IHVzZSBpdCB5ZXQuCj4gCj4gSGFuZGxpbmcgd3JpdGUgYWNjZXNzZXMgd291bGQgZGVt
YW5kIG1vcmUgY2hhbmdlcyB0byB0aGUgbTI1cDgwIGZsYXNoCj4gbW9kZWwuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KCkFzc3VtaW5nIHRoZcKg
bTI1cDgwX2dldF9zdG9yYWdlKCkgaXMgYWNjZXB0YWJsZSB1cHN0cmVhbSwKClJldmlld2VkLWJ5
OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgoKPiAtLS0KPiDCoGh3L3NzaS9hc3Bl
ZWRfc21jLmPCoMKgwqDCoMKgwqDCoMKgwqB8IDE4ICsrKysrKysrKysrKysrKy0tLQo+IMKgaW5j
bHVkZS9ody9zc2kvYXNwZWVkX3NtYy5oIHzCoMKgMiArKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9ody9zc2kv
YXNwZWVkX3NtYy5jIGIvaHcvc3NpL2FzcGVlZF9zbWMuYwo+IGluZGV4IDQxNzUzNTYxNDFlNy4u
MTU5YWI2OTEwNTFkIDEwMDY0NAo+IC0tLSBhL2h3L3NzaS9hc3BlZWRfc21jLmMKPiArKysgYi9o
dy9zc2kvYXNwZWVkX3NtYy5jCj4gQEAgLTI4LDYgKzI4LDcgQEAKPiDCoCNpbmNsdWRlICJxZW11
L2xvZy5oIgo+IMKgI2luY2x1ZGUgImluY2x1ZGUvcWVtdS9lcnJvci1yZXBvcnQuaCIKPiDCoCNp
bmNsdWRlICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgiCj4gKyNpbmNsdWRlICJody9ibG9jay9mbGFz
aC5oIgo+IMKgCj4gwqAjaW5jbHVkZSAiaHcvc3NpL2FzcGVlZF9zbWMuaCIKPiDCoAo+IEBAIC0y
ODQsOCArMjg1LDkgQEAgc3RhdGljIHVpbnQ2NF90IGFzcGVlZF9zbWNfZmxhc2hfcmVhZCh2b2lk
ICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1bnNpZ25lZCBzaXplKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0ID0gKHJldCA8PCA4KSB8IHNzaV90cmFuc2ZlcihzLT5zcGksIDB4MCk7Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqB9IGVsc2Ugewo+IC3CoMKgwqDCoMKgwqDC
oMKgZXJyb3JfcmVwb3J0KCIlczogZmxhc2ggbm90IGluIHVzZXJtb2RlIiwgX19mdW5jX18pOwo+
IC3CoMKgwqDCoMKgwqDCoMKgcmV0ID0gLTE7Cj4gK8KgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAw
OyBpIDwgc2l6ZTsgaSsrKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldCA9IChyZXQg
PDwgOCkgfCBmbC0+c3RvcmFnZVthZGRyICsgaV07Cj4gK8KgwqDCoMKgwqDCoMKgwqB9Cj4gwqDC
oMKgwqDCoH0KPiDCoAo+IMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+IEBAIC0zMzAsNiArMzMyLDEx
IEBAIHN0YXRpYyB2b2lkIGFzcGVlZF9zbWNfZmxhc2hfcmVzZXQoRGV2aWNlU3RhdGUgKmQpCj4g
wqAKPiDCoHN0YXRpYyBpbnQgYXNwZWVkX3NtY19mbGFzaF9pbml0KFN5c0J1c0RldmljZSAqc2Jk
KQo+IMKgewo+ICvCoMKgwqDCoERldmljZVN0YXRlICpkZXYgPSBERVZJQ0Uoc2JkKTsKPiArwqDC
oMKgwqBBc3BlZWRTTUNGbGFzaFN0YXRlICpzID0gQVNQRUVEX1NNQ19GTEFTSChkZXYpOwo+ICsK
PiArwqDCoMKgwqBzLT5zaXplID0gMDsKPiArwqDCoMKgwqBzLT5zdG9yYWdlID0gTlVMTDsKPiDC
oMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cj4gwqAKPiBAQCAtNDIyLDggKzQyOSwxMyBAQCB2b2lk
IGFzcGVlZF9zbWNfaW5pdF9mbGFzaGVzKEFzcGVlZFNNQ1N0YXRlICpzLCBjb25zdCBjaGFyICpm
bGFzaHR5cGUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgY3NfbGluZSA9IHFkZXZfZ2V0X2dwaW9faW5f
bmFtZWQoZmwtPmZsYXNoLCBTU0lfR1BJT19DUywgMCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgc3lz
YnVzX2Nvbm5lY3RfaXJxKFNZU19CVVNfREVWSUNFKHMpLCBpICsgMSwgY3NfbGluZSk7Cj4gwqAK
PiArwqDCoMKgwqDCoMKgwqDCoGZsLT5zdG9yYWdlID0gbTI1cDgwX2dldF9zdG9yYWdlKERFVklD
RShmbC0+Zmxhc2gpLCAmZmwtPnNpemUpOwo+ICvCoMKgwqDCoMKgwqDCoMKgaWYgKGZsLT5zaXpl
ID4gYXNwZWVkX3NlZ21lbnRzW3MtPnNtY190eXBlXVtpXS5zaXplKSB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGZsLT5zaXplID0gYXNwZWVkX3NlZ21lbnRzW3MtPnNtY190eXBlXVtpXS5z
aXplOwo+ICvCoMKgwqDCoMKgwqDCoMKgfQo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqBtZW1vcnlf
cmVnaW9uX2luaXRfaW8oJmZsLT5tbWlvLCBuZXcsICZhc3BlZWRfc21jX2ZsYXNoX29wcywgZmws
IG5hbWUsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGFzcGVlZF9zZWdtZW50c1tzLT5zbWNfdHlwZV1baV0uc2l6ZSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGZsLT5zaXplKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqBzeXNidXNfaW5pdF9tbWlvKFNZU19CVVNf
REVWSUNFKG5ldyksICZmbC0+bW1pbyk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqBzeXNidXNf
bW1pb19tYXAoU1lTX0JVU19ERVZJQ0UobmV3KSwgMCwKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9o
dy9zc2kvYXNwZWVkX3NtYy5oIGIvaW5jbHVkZS9ody9zc2kvYXNwZWVkX3NtYy5oCj4gaW5kZXgg
MTYyNWRmYjc2YTYzLi4yNjE1Y2U5ZmE4YWEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody9zc2kv
YXNwZWVkX3NtYy5oCj4gKysrIGIvaW5jbHVkZS9ody9zc2kvYXNwZWVkX3NtYy5oCj4gQEAgLTM4
LDYgKzM4LDggQEAgdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkU01DRmxhc2hTdGF0ZSB7Cj4gwqAKPiDC
oMKgwqDCoMKgTWVtb3J5UmVnaW9uIG1taW87Cj4gwqDCoMKgwqDCoGludCBpZDsKPiArwqDCoMKg
wqB1aW50MzJfdCBzaXplOwo+ICvCoMKgwqDCoHVpbnQ4X3QgKnN0b3JhZ2U7Cj4gwqDCoMKgwqDC
oHN0cnVjdCBBc3BlZWRTTUNTdGF0ZSAqY29udHJvbGxlcjsKPiDCoMKgwqDCoMKgRGV2aWNlU3Rh
dGUgKmZsYXNoOwo+IMKgfSBBc3BlZWRTTUNGbGFzaFN0YXRlOw==


--=-7zAOajGtN7OoflF/x9ej
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVmP1AAoJEJ0dnzgO5LT5nZ0QAKGW1AGSZjUixZJqBwDWtO6H
VJbWjWV3uhfIZteozKkljyP1R5hcPyrYawMAttDs6lvjSvmmbVBAbpJzBczEbrSn
IqG9qYJG9Sjh7r4CwM++3Xo2dkjt57Bbx1H5e/4AHNYk246rzJHu9MTD2z6CXAPX
TbMWpe+4E5Cc30FvfzpvFfeMorN3EgHKutWykPF3zgqPcr2ZbNKY9qPlkMeKsdXJ
AYjAwga9gJu1wMM2uvT/fm2RkWA/iO13wwlO3XN8PLnP2uvZEGYegScLs5I9Q6OI
4iQWx+Zy9a0QJFgQQ9Rdtddh1ke/vs6NL76MWrK3cbDAsn1oMxkjmliOndiFYvNb
AqWc9bUjTuGICGUH8J3l7pQUqEhSOuYD8nOZh9B3VS1ObsoRDnVJ8fIB3iOMeubu
RqW5JR6XFoWRIyselPKpOWJaOe8hFRzHy2JeUNcpcfH+50pdaLksmwd5fYpyEJr3
nE4J4xgasU95o633XFqnP8D4DonAuEo3SmprL9vhsTjSibCS0yopqCPOG+3wCgAM
DHpBbu491Kj2ZBo1fVTWAtdMbq6gVsU8+ZSz7oXz6i2qHmShvAzqeERfO/Bg9JNT
gY9lV/7ih/8VhU7yu7kv0gP9o7xdOe05P3T+8SJsqWS5rrUAWzlMo/P3PtaFQ2+Y
JHYyF1d0BjzaRxSzU6/i
=kyut
-----END PGP SIGNATURE-----

--=-7zAOajGtN7OoflF/x9ej--
