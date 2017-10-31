Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kfl/hngr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="T0VATzaz"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQzCn59CGzDqwZ
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 15:39:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A0A82209D5;
 Tue, 31 Oct 2017 00:39:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Tue, 31 Oct 2017 00:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=xhCLBOR4V1xm2Zqlw8Ztji5zBN5/9sAvZ+Zeyols2rU=; b=kfl/hngr
 niJOP32Vk1M14WyR5IwhgmH+MQUbtkajqpRsIpYpcWoFWbT7vlF/pX+PDqlQXcUY
 jPTFzI12w42wXfhnPZm6LzvQap5+MHEd3tg1mLvTFuOy1JMwM/e1bWDKGluPDv5f
 /8QVGM/NhbY7Fq2xSAlXREBmF55DmQ2eZKy5o2LUTL6YEfLkgh1YCe+Zg+Gm2IXd
 wdtX7+stNMd2sjHUTrMeeZgoFlk/pr5Zy8FF5eEyqEzF+AoY8KbNzqRReCLDCvOv
 C1z5AtHw5OopIIpuzcOlB3w9+EDdEjwpDtNJ8qtLd71FiAGYzr96Ly5qhgpZp9qQ
 hzG9rq/8SzTkyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=xhCLBOR4V1xm2Zqlw8Ztji5zBN5/9
 sAvZ+Zeyols2rU=; b=T0VATzaz8/jnhbSqJg1Q3AHuL33fkN73nhpqhC8sgAkS6
 s1MgdDrbFGWItIzCP8IF4gG+j5JnvSrNgEao6lTAiaPJcxdHzQgkDsCelUxUhPuB
 462Za8Mkzz7pfd9GCzqclT5vQsQcfdCoTtODPZZo/ugQ7LGYu1fkiLQMLeWiUudp
 MVA9prjPbLh2+jQByCkaxGLkBuWzrcucl0TTKaa4jC9qHo7Cg2oo18yVQLxipg6k
 q3zZLTNoe2H0+hpy7bwDiqChzKJdJECs/6X9TWAUSVtg5BGHpFD/OVYNWW/tZQn9
 QeA9kp5Yeh3S4dRfJcJi41j0VPTpSIfc0PbepXrvA==
X-ME-Sender: <xms:k_73WRqjgRmptXMUUmRxyH7B-5B5DKfxncBXObsAb6lePGLBiJ68-g>
Received: from keelia (unknown [45.124.203.19])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C2617E404;
 Tue, 31 Oct 2017 00:39:45 -0400 (EDT)
Message-ID: <1509424783.2263.3.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: romulus: Add aspeed
 fan tach
From: Andrew Jeffery <andrew@aj.id.au>
To: Lei YU <mine260309@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 31 Oct 2017 15:09:43 +1030
In-Reply-To: <1509355284-28799-1-git-send-email-mine260309@gmail.com>
References: <1509355284-28799-1-git-send-email-mine260309@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-HFxovhu4zsscaG8NBhYX"
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
X-List-Received-Date: Tue, 31 Oct 2017 04:39:50 -0000


--=-HFxovhu4zsscaG8NBhYX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2017-10-30 at 17:21 +0800, Lei YU wrote:
> Romulus uses aspeed fan tach instead of max31785:
> * Pass1's max31785 is always reset by CPLD;
> * Pass2's max31785 is not connected.
>=C2=A0
> The board has 7 fan taches connected to BMC_FANTACH8~14,
> and controlled by two PWMs.
>=C2=A0
> This commit also change "enabled" to "okay" for the i2c devices.
>=C2=A0
> Signed-off-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.10.

Thanks,

Andrew
--=-HFxovhu4zsscaG8NBhYX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ9/6PAAoJEJ0dnzgO5LT5yNoP/0EGGETCR70ufVO5edBiMMDf
yje2PQALe699aOF0FD0+hg9PrPuQVHDE50VEJ520dFqoc1QSGw0VEzy/GwgeONoC
w18fapXFC3HmkK1MW7HKrcaZvQMEGECJ8sbrDbrwcV/v+njJpTVenT6NdSf9bMNa
xNZvqo0eHK+j/jbGaCMNSLQkDnA5o+j8k1w/k/D0IzoixRdIXuloMCpMmM1ynw2r
0URIsPIMDgvNncDlOX9EcNsR+JiTpsLMwP5vpPvjrO2t2hiTq/cfVP/5XEO14OAZ
HjDuS0R80Z0KhKaW8fveH5s/mKAJZJXVUT5m44un8iA0DcwU7U9NdRsbkGSr7q+1
uFxOZuSZ9uxdGvKziNiM7I03EO6LZCxMflaowIRiuBa474+6s0uSCDY35grS5KK0
YpwqE7JEQiBCMECSugCqGH/qghfFMMbL4h3u5tau54uZ5xUOI5bHsNB8c7RHjSWQ
Pok+ZyNurU/1i309ki6lGoozrSk+bP0FX2ks8PjuytRJIRbizxdFY065zg9np/bl
gJXusScge20d/WKhJPLNlmn6JiuTbzqeS1M9wnMOjD8w9GjChs86HOchQOKrx0Et
5QjpoewsLTYCc3yjMVpefAKuQ8a2KbH9HbfTiToWUgaUHxcWhrM69ubhe1YBZkYe
utG0w3E+1Xf1KgjnSTPu
=0Ia7
-----END PGP SIGNATURE-----

--=-HFxovhu4zsscaG8NBhYX--
