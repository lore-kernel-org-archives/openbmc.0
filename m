Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="PxmdFpTR"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="rU9DS3DQ"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yD5f32CvzzDqlv;
 Fri, 13 Oct 2017 22:51:23 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FD9320780;
 Fri, 13 Oct 2017 07:51:21 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Fri, 13 Oct 2017 07:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=5fQF/65EDjkcs6EpGtJpexeDp6uJL2tx90FRyA53Nzs=; b=PxmdFpTR
 xIFCkf/a47nBtowZ/pWNcjaT6bz+d294suQet2c1b7xZShfLFRdz2Kdt2d9pzJY2
 N73lx42w56zOEnhtk2O0Si97THJE35FZEWAEK0d81WXFNM7AzRUSx2p5isGj/gxP
 JGmpzFsuK2FcoJgGJ3Tfm51XQnSvpeZLwjPDGx4X/tK0bkTYIhMCLihV0I5bowXw
 hoOtXU4BfpSIqtFpblKLFdBwr8VSphHRwemWNwhDQVC6BM1jGSazy5WxoSW9emnA
 9v9j6O6TSaxw1Ew3UvY8GQTYdPSrsbc6TMwEmDzv76YViIM2VJXRbp4wyyxerGBz
 D4af49anoLIY4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=5fQF/65EDjkcs6EpGtJpexeDp6uJL
 2tx90FRyA53Nzs=; b=rU9DS3DQD9DfXV1EQVsqymANCWrVq9oyBhkTeL6ZNX5nf
 RgXDwLDFDt481bn+TB3LxJYN//TmBu7rZKoshfJrXg3SLp+F3PQzL7k047PcIJwP
 GZQLGi7x7585As9Rfy5lz3tUiPMFwJU5Z+CUbpowyYWKJ6ZVz+Vkqfe59Cnwrr+6
 H6xFDTdXJVrGVylALOVOGWAvgF+lSpPtzo4k32hSHe3lDIL7v7A8kJfmQsbTtIv/
 MxpHN8sjbrqsFwmFBAK3IbL70+eizNLxIOQ3mNpaSrNOrZX1saNr7J6GY/UvYJe4
 8dfd0Xs/R14neS7DOH8vq9hEGd8yhvRt4ZEWjuA+Q==
X-ME-Sender: <xms:uajgWarKlJhQClQ0zdny-Idxg1bytCa2VenkkmXru6CiunmavW0SHA>
Received: from keelia23 (220-253-53-78.dyn.iinet.net.au [220.253.53.78])
 by mail.messagingengine.com (Postfix) with ESMTPA id 873617F9A9;
 Fri, 13 Oct 2017 07:51:19 -0400 (EDT)
Message-ID: <1507895476.5452.209.camel@aj.id.au>
Subject: Re: OpenBMC helper scripts repositories
From: Andrew Jeffery <andrew@aj.id.au>
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+austenc=us.ibm.com@lists.ozlabs.org>
Date: Fri, 13 Oct 2017 22:21:16 +1030
In-Reply-To: <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
References: <1507254940.5452.129.camel@aj.id.au>
 <OFDFEB18C7.4CBB979B-ON002581B1.000FD8A2@LocalDomain>
 <OF921CDA64.CB068039-ON862581B1.00153196-862581B1.0015746A@notes.na.collabserv.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-lKyE3hVQIp/La65PNype"
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
X-List-Received-Date: Fri, 13 Oct 2017 11:51:24 -0000


--=-lKyE3hVQIp/La65PNype
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Chris,

On Thu, 2017-10-05 at 22:54 -0500, Chris Austen wrote:
>=20
> https://github.com/causten/tools/tree/master/obmc I've also got those
> files. things have evolved and I not kept the error logging or code
> update refreshed to any of the new xyz paths. However, leds.py still
> can toggle the LEDS on a system and obmcrequests.py (my library for
> bmc communication) can work offline if the data has been captured.
>=20

I took a quick look at the history of the repository and I'm hesitant
to pull it in right away. We need to sort out Signed-off-by tags for it
and fix your name (to be your actual name and not 'causten') in the
commits. Once that's done though I'll pull it in.

Cheers,

Andrew
--=-lKyE3hVQIp/La65PNype
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ4Ki0AAoJEJ0dnzgO5LT5UhoP/16PoawH33m4TU3XRKTVDfec
mMj2Zhr0uVKdDfyBdubSU9m83z2imJZmAHxlwiILdCEG0iUPnUAfZ/moPyNOY82f
xL2gx1WxW/8dgt2UyQOurooRXQ2lK/TuvZM4Qbv9Az9/pGGbkJjXqt/UqcUL69cb
S8y023vbm8iNzdJ0NdKWZxJiL1FIUNo5OBs+mV5i7DtgqegxduXN0s7vfkn9GMwc
P9UMAdlXg5pddOm6E60rCZKkArVmUqmpg/0+vwK9v1FdvbMNyWbaVV9VOTyiSg2I
mRUobV+7tLwloSEwqlDpcxNtyjPETJXTVS4mTWtcPOtCo2miK6zystPr4hDOw3/J
Upy9mvrzIrKTlrJQ8p8mrkvHLBPisVSpymDIJjdOw3d47tWdV4aJr5ssqYRa8s9L
khLUO9WwDkF6ihzveyLkHSu1KaSRLvi1tAb6oPIj6aqNebKL66kehuVTbEogxK7L
MhZhtIgdg6yTNF71PC09EqBEQ0BW8yekWVsbb0zW9qrifv26FOYDRq3SpGioiKFA
gGFw4ZghZoL+Yzc/pnAY+ghNuhaF9W/vK+fhyngU/39/9AvSnD14VHq/Jk8PI28t
40gTdKUigHcXQPvs3yWKBY7pSxKvGWItxeLWB8jXHUnn/ZiQU1lJ0xmdz+MsJo2p
dGLPgZ6SLU0uhiuKXoiV
=YKTL
-----END PGP SIGNATURE-----

--=-lKyE3hVQIp/La65PNype--
