Return-Path: <andrew@aj.id.au>
Received: from homiemail-a19.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQkSG5s2zzDqHH
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 11:03:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=IH4autik; 
 dkim-atps=neutral
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 851A1604078;
 Thu,  9 Jun 2016 18:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=RqSFykxNoSyfibHE1ajkR
 Zp+WHo=; b=IH4autikycTbqsSRcUbSzknYxGXFNUpYiRbPLBkLKio2LWgN2b+QZ
 yAg9IerU9Rhdc8U69k58531pqvg4ThmpmpyMq0zV4Id0bmn026/BGAbGSAMePp6/
 uPXN0SS5S25PtXDxeu3eQ02yBaqgTbDA0Iyou3B5SDIcbpcnMzplwM=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 56D33604069;
 Thu,  9 Jun 2016 18:03:06 -0700 (PDT)
Message-ID: <1465520569.16048.181.camel@aj.id.au>
Subject: Re: [PATCH qemu 2/2] ast2400: Integrate the SCU model and configure
 reset values
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, OpenBMC
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2016 10:32:49 +0930
In-Reply-To: <57595540.8060203@kaod.org>
References: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
 <1465460046-7692-3-git-send-email-andrew@aj.id.au>
 <57595540.8060203@kaod.org>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-DvMvTIsr3IzXj56qt/5c"
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
X-List-Received-Date: Fri, 10 Jun 2016 01:03:11 -0000


--=-DvMvTIsr3IzXj56qt/5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDE2LTA2LTA5IGF0IDEzOjM4ICswMjAwLCBDw6lkcmljIExlIEdvYXRlciB3cm90
ZToKPiBPbiAwNi8wOS8yMDE2IDEwOjE0IEFNLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToKPiA+IAo+
ID4gQWxtb3N0IGFsbCBjb25maWd1cmVkIHJlc2V0IHZhbHVlcyBhcmUgc3BlY2lmaWVkIGJ5IHRo
ZSBkYXRhc2hlZXQuIFRoZQo+ID4gZXhjZXB0aW9uIGlzIEFTUEVFRF9TQ1VfU09DX1NDUkFUQ0gx
LCB3aGVyZSB3ZSBtYXJrIHRoZSBEUkFNIGFzCj4gPiBzdWNjZXNzZnVsbHkgaW5pdGlhbGlzZWQg
YnkgdGhlIFNvQyB0byBhdm9pZCB1bm5lY2Vzc2FyeSBkYXJrIGNvcm5lcnMgaW4KPiA+IHRoZSBT
b0MncyB1LWJvb3Qgc3VwcG9ydC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEplZmZl
cnkgPGFuZHJld0Bhai5pZC5hdT4KPiA+IC0tLQo+ID4gwqBody9hcm0vYXN0MjQwMC5jwqDCoMKg
wqDCoMKgwqDCoMKgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gwqBpbmNsdWRlL2h3L2FybS9hc3QyNDAwLmggfMKgwqAyICsrCj4gPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaHcv
YXJtL2FzdDI0MDAuYyBiL2h3L2FybS9hc3QyNDAwLmMKPiA+IGluZGV4IDRhOWRlMGUxMGNiYy4u
MjQwZGExODBiZWZhIDEwMDY0NAo+ID4gLS0tIGEvaHcvYXJtL2FzdDI0MDAuYwo+ID4gKysrIGIv
aHcvYXJtL2FzdDI0MDAuYwo+ID4gQEAgLTI0LDEyICsyNCw0NiBAQAo+ID4gwqAjZGVmaW5lIEFT
VDI0MDBfSU9NRU1fU0laRcKgwqDCoMKgwqDCoMKgMHgwMDIwMDAwMAo+ID4gwqAjZGVmaW5lIEFT
VDI0MDBfSU9NRU1fQkFTRcKgwqDCoMKgwqDCoMKgMHgxRTYwMDAwMAo+ID4gwqAjZGVmaW5lIEFT
VDI0MDBfVklDX0JBU0XCoMKgwqDCoMKgwqDCoMKgwqAweDFFNkMwMDAwCj4gPiArI2RlZmluZSBB
U1QyNDAwX1NDVV9CQVNFwqDCoMKgwqDCoMKgwqDCoMKgMHgxRTZFMjAwMAo+ID4gwqAjZGVmaW5l
IEFTVDI0MDBfVElNRVJfQkFTRcKgwqDCoMKgwqDCoMKgMHgxRTc4MjAwMAo+ID4gwqAjZGVmaW5l
IEFTVDI0MDBfSTJDX0JBU0XCoMKgwqDCoMKgwqDCoMKgwqAweDFFNzhBMDAwCj4gPiDCoAo+ID4g
wqBzdGF0aWMgY29uc3QgaW50IHVhcnRfaXJxc1tdID0geyA5LCAzMiwgMzMsIDM0LCAxMCB9Owo+
ID4gwqBzdGF0aWMgY29uc3QgaW50IHRpbWVyX2lycXNbXSA9IHsgMTYsIDE3LCAxOCwgMzUsIDM2
LCAzNywgMzgsIDM5LCB9Owo+ID4gwqAKPiA+ICtzdGF0aWMgY29uc3QgQXNwZWVkU0NVUmVzZXRD
Zmcgc2N1X3Jlc2V0W10gPSB7Cj4gPiArwqDCoMKgwqAvKiBWYWx1ZXMgYXJlIGRlZmF1bHRzIGZy
b20gdGhlIGRhdGFzaGVldCBleGNlcHQgd2hlcmUgbm90ZWQgKi8KPiA+ICvCoMKgwqDCoHsgQVNQ
RUVEX1NDVV9TWVNfUlNUX0NUUkwswqDCoMKgMHhGRkNGRkVEQ1UgfSwKPiA+ICvCoMKgwqDCoHsg
QVNQRUVEX1NDVV9DTEtfU0VMLMKgwqDCoMKgwqDCoMKgwqAweEYzRjQwMDAwVSB9LAo+ID4gK8Kg
wqDCoMKgeyBBU1BFRURfU0NVX0NMS19TVE9QX0NUUkwswqDCoDB4MTlGQzNFOEJVIH0sCj4gPiAr
wqDCoMKgwqB7IEFTUEVFRF9TQ1VfRDJQTExfUEFSQU0swqDCoMKgwqAweDAwMDI2MTA4VSB9LAo+
ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX01QTExfUEFSQU0swqDCoMKgwqDCoDB4MDAwMzAyOTFV
IH0sCj4gPiArwqDCoMKgwqB7IEFTUEVFRF9TQ1VfSFBMTF9QQVJBTSzCoMKgwqDCoMKgMHgwMDAw
MDI5MVUgfSwKPiA+ICvCoMKgwqDCoHsgQVNQRUVEX1NDVV9NSVNDX0NUUkwxLMKgwqDCoMKgwqAw
eDAwMDAwMDEwVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX1BDSV9DVFJMMSzCoMKgwqDC
oMKgwqAweDIwMDAxQTAzVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX1BDSV9DVFJMMizC
oMKgwqDCoMKgwqAweDIwMDAxQTAzVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX1BDSV9D
VFJMMyzCoMKgwqDCoMKgwqAweDA0MDAwMDMwVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NV
X1NZU19SU1RfU1RBVFVTLCAweDAwMDAwMDAxVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NV
X1NPQ19TQ1JBVENIMSzCoMKgwqAweDAwMDAwMEMwVSB9LCAvKiBTb0MgY29tcGxldGVkIERSQU0g
aW5pdCAqLwo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX01JU0NfQ1RSTDIswqDCoMKgwqDCoDB4
MDAwMDAwMjNVIH0sCj4gPiArwqDCoMKgwqB7IEFTUEVFRF9TQ1VfUk5HX0NUUkwswqDCoMKgwqDC
oMKgwqAweDAwMDAwMDBFVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX1JFVl9JRCzCoMKg
wqDCoMKgwqDCoMKgwqAweDAyMDAwMzAzVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NVX1BJ
Tk1VWF9DVFJMMizCoMKgwqAweDAwMDBGMDAwVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURfU0NV
X1BJTk1VWF9DVFJMMyzCoMKgwqAweDAxMDAwMDAwVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BFRURf
U0NVX1BJTk1VWF9DVFJMNCzCoMKgwqAweDAwMDAwMEZGVSB9LAo+ID4gK8KgwqDCoMKgeyBBU1BF
RURfU0NVX1BJTk1VWF9DVFJMNSzCoMKgwqAweDAwMDBBMDAwVSB9LAo+ID4gK8KgwqDCoMKgeyBB
U1BFRURfU0NVX1dEVF9SU1RfQ1RSTCzCoMKgwqAweDAwM0ZGRkYzVSB9LAo+ID4gK8KgwqDCoMKg
eyBBU1BFRURfU0NVX1BJTk1VWF9DVFJMOCzCoMKgwqAweEZGRkYwMDAwVSB9LAo+IMKgwqDCoMKg
wqDCoMKgeyBBU1BFRURfU0NVX1BJTk1VWF9DVFJMOSzCoMKgwqAweDAwMEZGRkZGVSB9LAoKQWgg
eWVzLiBUaGFua3MuCgo+IAo+IFJldmlld2VkLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGth
b2Qub3JnPgoKQ2hlZXJzLAoKQW5kcmV3


--=-DvMvTIsr3IzXj56qt/5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXWhG5AAoJEJ0dnzgO5LT5g5gQAJQzJ4l7D7WFuXRpv8gvC097
rO/DJpxbu6umFCjtAcV5JNUL1FGQJRv2erEUJyJWv71jtbe89nfAJQET8JaAem2f
jvC5wYFaqbl/9HjaFAzkFP1WJ8yc6l9Um1DhUVQrOOCw22qzbcxRni8B1MQPDQC3
Mww4wynv2nRe3jO8Nfht4+p9WLHvEOjqvc6yZrAHomn1OjII91CTAbBd1PIeFkcU
zdnylvdLlem6MmhHKR9V6N8YYb3ZkP1mQa9aWElaIqme4dcJZ3I/V0hea79h93Cm
CA3Xs9/FEal+sLNZqU1qSVy9kszwGx5rCL3TAIjbpMvcayBzXQE282YcMnfD51Jd
9MJ9L4C30nlzBOiiteOAdyEAJUzF43fHNWEbwUkzllbjiyk5+O/GQoRBcaVzBh9q
YYh5tBopHikjRLkxy3+/18vo0ju7zGdvYobCMSy9A9WBOcuRUsWJnvZA1IN7GhJa
LhRsg1jIdhy4+/08unMt1bzKRiy8SUJ3A5yqXrXeJwWL4vPg/aQ/lcjlDJId1OgY
+NvnKx05+RogIPOUBZrBc5Q/jzb7M4+d33bD3NZ0o/BaPWpTkLn0HJ0Ee+lfpF6r
G5yFxRnyHg6JEe1CU8q82OZfHlofffw7utg2R+0+1XC+TJKFl2PFc3dt5ft3d++g
W9tRP4b3Oxt1rHk6krbb
=f620
-----END PGP SIGNATURE-----

--=-DvMvTIsr3IzXj56qt/5c--
