Return-Path: <andrew@aj.id.au>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMlwY5NsLzDvj0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:59:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="gymjxCA5"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QUYpUg3O"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EA73B206F4;
 Mon, 21 Nov 2016 05:59:21 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 21 Nov 2016 05:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=cZkKs2sx8T8T6/0ZJ0yneLIGSiw=; b=gymjxC
 A5EX6I2E3WN8fOb9y0Lvv3qL+HNDyjDw/EfdUEAZbKLuvLSlm4GD/BTAzzDKd2U+
 8reCHkczSMGeMZzZ5aWLPradpneYPlDWIa2vuYpWY8oKF+Cd64IoNBDINyXJVtDq
 OX7bzfyj1AnAZF+u38as3CyR1fKqQNdIOxB/E=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=cZkKs2sx8T8T6/
 0ZJ0yneLIGSiw=; b=QUYpUg3O+gyNa66+nS2jGB8TzMx9lJj+OjsAWm9zA8AHyy
 YUe/FVFL+tybtMLrDNG9m+28Rc07juP6ISb9F5hI/vRxI3TOMcOFPN+NMb+XKTdN
 J6jKkMGaCSv6JpapAr/hSQ1xbLF/ccbpg3FIGWs6ri0lcO8EEcVxHY2oki4vo=
X-ME-Sender: <xms:idMyWBBG0Fv6B3Ezq6g7MxTMv6yyJG2w811G1_WYtbaYgIjaCWT31Q>
X-Sasl-enc: t9r6JixRrDeFqk9Dgqde2yRO3N6Xom4GCc9h6NQCTS4k 1479725960
Received: from [172.16.172.59] (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 by mail.messagingengine.com (Postfix) with ESMTPA id D5E687E046;
 Mon, 21 Nov 2016 05:59:19 -0500 (EST)
Message-ID: <1479725953.5215.24.camel@aj.id.au>
Subject: Re: [PATCH qemu 02/38] aspeed: QOMify the CPU object and attach it
 to the SoC
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2016 21:29:13 +1030
In-Reply-To: <1479478938-13267-3-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-3-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-hNd5psd9x8EJHvaqB+D8"
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
X-List-Received-Date: Mon, 21 Nov 2016 10:59:26 -0000


--=-hNd5psd9x8EJHvaqB+D8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE2LTExLTE4IGF0IDE1OjIxICswMTAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKV2l0
aCB0aGlzIEkgdGhpbmsgd2UgY2FuIGZpbmFsbHkgZHJvcAoKICAgIGRjLT5jYW5ub3RfZGVzdHJv
eV93aXRoX29iamVjdF9maW5hbGl6ZV95ZXQgPSB0cnVlOwoKZnJvbSBhc3BlZWRfc29jX2NsYXNz
X2luaXQoKSBpbiBody9hcm0vYXNwZWVkX3NvYy5jLiBTZWUgY29tbWl0CgogICAgY2U1YjFiYmY2
MjRiIGV4ZWM6IG1vdmUgY3B1X2V4ZWNfaW5pdCgpIGNhbGxzIHRvIHJlYWxpemUgZnVuY3Rpb25z
CgpSZXZpZXdlZC1ieTogQW5kcmV3IEplZmZlcnkgPGFuZHJld0Bhai5pZC5hdT4KCj4gLS0tCj4g
wqBody9hcm0vYXNwZWVkX3NvYy5jwqDCoMKgwqDCoMKgwqDCoMKgfCAxNyArKysrKysrKysrKysr
Ky0tLQo+IMKgaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oIHzCoMKgMiArLQo+IMKgMiBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9ody9hcm0vYXNwZWVkX3NvYy5jIGIvaHcvYXJtL2FzcGVlZF9zb2MuYwo+IGluZGV4IGUx
NGY1YzIxN2VhYi4uZGIxNDVlMjAxNDUxIDEwMDY0NAo+IC0tLSBhL2h3L2FybS9hc3BlZWRfc29j
LmMKPiArKysgYi9ody9hcm0vYXNwZWVkX3NvYy5jCj4gQEAgLTg3LDkgKzg3LDEzIEBAIHN0YXRp
YyB2b2lkIGFzcGVlZF9zb2NfaW5pdChPYmplY3QgKm9iaikKPiDCoHsKPiDCoMKgwqDCoMKgQXNw
ZWVkU29DU3RhdGUgKnMgPSBBU1BFRURfU09DKG9iaik7Cj4gwqDCoMKgwqDCoEFzcGVlZFNvQ0Ns
YXNzICpzYyA9IEFTUEVFRF9TT0NfR0VUX0NMQVNTKHMpOwo+ICvCoMKgwqDCoGNoYXIgKmNwdV90
eXBlbmFtZTsKPiDCoMKgwqDCoMKgaW50IGk7Cj4gwqAKPiAtwqDCoMKgwqBzLT5jcHUgPSBjcHVf
YXJtX2luaXQoc2MtPmluZm8tPmNwdV9tb2RlbCk7Cj4gK8KgwqDCoMKgY3B1X3R5cGVuYW1lID0g
Z19zdHJkdXBfcHJpbnRmKCIlcy0iIFRZUEVfQVJNX0NQVSwgc2MtPmluZm8tPmNwdV9tb2RlbCk7
Cj4gK8KgwqDCoMKgb2JqZWN0X2luaXRpYWxpemUoJnMtPmNwdSwgc2l6ZW9mKHMtPmNwdSksIGNw
dV90eXBlbmFtZSk7Cj4gK8KgwqDCoMKgb2JqZWN0X3Byb3BlcnR5X2FkZF9jaGlsZChvYmosICJj
cHUiLCBPQkpFQ1QoJnMtPmNwdSksIE5VTEwpOwo+ICvCoMKgwqDCoGdfZnJlZShjcHVfdHlwZW5h
bWUpOwo+IMKgCj4gwqDCoMKgwqDCoG9iamVjdF9pbml0aWFsaXplKCZzLT52aWMsIHNpemVvZihz
LT52aWMpLCBUWVBFX0FTUEVFRF9WSUMpOwo+IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfYWRk
X2NoaWxkKG9iaiwgInZpYyIsIE9CSkVDVCgmcy0+dmljKSwgTlVMTCk7Cj4gQEAgLTE0Niw2ICsx
NTAsMTMgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYs
IEVycm9yICoqZXJycCkKPiDCoMKgwqDCoMKgbWVtb3J5X3JlZ2lvbl9hZGRfc3VicmVnaW9uX292
ZXJsYXAoZ2V0X3N5c3RlbV9tZW1vcnkoKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgQVNQ
RUVEX1NPQ19JT01FTV9CQVNFLCAmcy0+aW9tZW0sIC0xKTsKPiDCoAo+ICvCoMKgwqDCoC8qIENQ
VSAqLwo+ICvCoMKgwqDCoG9iamVjdF9wcm9wZXJ0eV9zZXRfYm9vbChPQkpFQ1QoJnMtPmNwdSks
IHRydWUsICJyZWFsaXplZCIsICZlcnIpOwo+ICvCoMKgwqDCoGlmIChlcnIpIHsKPiArwqDCoMKg
wqDCoMKgwqDCoGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBlcnIpOwo+ICvCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuOwo+ICvCoMKgwqDCoH0KPiArCj4gwqDCoMKgwqDCoC8qIFZJQyAqLwo+IMKgwqDCoMKg
wqBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKCZzLT52aWMpLCB0cnVlLCAicmVhbGl6
ZWQiLCAmZXJyKTsKPiDCoMKgwqDCoMKgaWYgKGVycikgewo+IEBAIC0xNTQsOSArMTY1LDkgQEAg
c3RhdGljIHZvaWQgYXNwZWVkX3NvY19yZWFsaXplKERldmljZVN0YXRlICpkZXYsIEVycm9yICoq
ZXJycCkKPiDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqBzeXNidXNfbW1pb19tYXAoU1lTX0JVU19E
RVZJQ0UoJnMtPnZpYyksIDAsIEFTUEVFRF9TT0NfVklDX0JBU0UpOwo+IMKgwqDCoMKgwqBzeXNi
dXNfY29ubmVjdF9pcnEoU1lTX0JVU19ERVZJQ0UoJnMtPnZpYyksIDAsCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxZGV2X2dldF9ncGlvX2luKERFVklD
RShzLT5jcHUpLCBBUk1fQ1BVX0lSUSkpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcWRldl9nZXRfZ3Bpb19pbihERVZJQ0UoJnMtPmNwdSksIEFSTV9D
UFVfSVJRKSk7Cj4gwqDCoMKgwqDCoHN5c2J1c19jb25uZWN0X2lycShTWVNfQlVTX0RFVklDRSgm
cy0+dmljKSwgMSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHFkZXZfZ2V0X2dwaW9faW4oREVWSUNFKHMtPmNwdSksIEFSTV9DUFVfRklRKSk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBxZGV2X2dldF9ncGlv
X2luKERFVklDRSgmcy0+Y3B1KSwgQVJNX0NQVV9GSVEpKTsKPiDCoAo+IMKgwqDCoMKgwqAvKiBU
aW1lciAqLwo+IMKgwqDCoMKgwqBvYmplY3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKCZzLT50
aW1lcmN0cmwpLCB0cnVlLCAicmVhbGl6ZWQiLCAmZXJyKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9ody9hcm0vYXNwZWVkX3NvYy5oIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oCj4gaW5k
ZXggNTQwNmI0OThkN2VmLi42ZjFiNjc5Yzk3YjEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9ody9h
cm0vYXNwZWVkX3NvYy5oCj4gKysrIGIvaW5jbHVkZS9ody9hcm0vYXNwZWVkX3NvYy5oCj4gQEAg
LTI3LDcgKzI3LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgQXNwZWVkU29DU3RhdGUgewo+IMKgwqDCoMKg
wqBEZXZpY2VTdGF0ZSBwYXJlbnQ7Cj4gwqAKPiDCoMKgwqDCoMKgLyo8IHB1YmxpYyA+Ki8KPiAt
wqDCoMKgwqBBUk1DUFUgKmNwdTsKPiArwqDCoMKgwqBBUk1DUFUgY3B1Owo+IMKgwqDCoMKgwqBN
ZW1vcnlSZWdpb24gaW9tZW07Cj4gwqDCoMKgwqDCoEFzcGVlZFZJQ1N0YXRlIHZpYzsKPiDCoMKg
wqDCoMKgQXNwZWVkVGltZXJDdHJsU3RhdGUgdGltZXJjdHJsOw==


--=-hNd5psd9x8EJHvaqB+D8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYMtOCAAoJEJ0dnzgO5LT5HowP/jMZg7PwzXIB9+8hR7UaLX83
wqaV302EHsOrigpDXb+aIwxU7mX1lwz/M/aKzS8+TY3hO6OW1qLfFbmfuqXjF1Wo
Bz/sBVOlNYqGbpuCLrUd31dIJKjyMhZTj7qKJPOSG1xK6ebIQ1YdaR+M07A3CahF
Pq+obPRsEeb/vT6AQ/Z+0MxsTfVLEoln9JJb8cpx93ZAvkcTT8pZxKpinIaFFNUn
KnffdpBcHfvIvGcKNK9df2nUpdBfRkY8CRu2wbHjMK5dvEBCUHPm4yjZo1Y3UISs
fqHv6I1MrzUxrtlZW3rdUyW5Bl0AalEwjwrOndsQ86sdTBdetmopFliRvXc35AD8
1lcGDVnMF1dl0OFuQ0BmFapdUnGdke7fl0xtd9Q/OjX9Ycpu34Xx2+ezXczx1BUZ
hJMW5AHgPqAUfutHhP4tKMfqtEiEQ7DmaOAEPBb2Keb5lLHHqPQaSaHxnEpfV+X1
Y4WdbSfJ5nf59vAeUBpKlpqaOy3wdNK0PFYdOKZ/RNdU59c3Bl1hSxUdQXSMB3wF
+pCYL9nXduZQAR1QHGh+k6UIcVz/CdoLGm1DWt6g47hC1iwD4qfktN4lgbKoNWd6
NCDp99UKJqbzZbS30BDuFwJ07MqoN3qytCYJqVyxILwhTaWy5BQigTcTb+rZtCsL
aeQ5RObzDZgsbQWI1RdS
=7QSb
-----END PGP SIGNATURE-----

--=-hNd5psd9x8EJHvaqB+D8--
