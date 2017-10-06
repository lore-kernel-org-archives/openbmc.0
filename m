Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="uooWVc5V"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="r6lJxXdK"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7WJT5DdrzDqlF
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 11:50:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BCFC420E47;
 Thu,  5 Oct 2017 20:50:14 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
 by compute4.internal (MEProxy); Thu, 05 Oct 2017 20:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=fm1; bh=zKsTd4LzF1GiX2K9a+Tf5WDhaLJ8FAUB0Fh4FUeWO
 A8=; b=uooWVc5Vw5GtJdPO3Ni3Qf5sHvfaELx94p/OVc4ZhdD9+D1S2NJJHki/B
 ffm9HMLUZDgoFDmR6mb9Ha22UUA3DByGATWT5GQ2UF9ylyFH7XJGcAmA8IEPsVwe
 SbsMkiCEKb9+nKpcHCNU7JNc3p0202Iy5gRqsf3ELQfrrLjr33PQmviSAk2HidgK
 pjLD7LrTtHUVYh9ZRwEfpVhUxEUuW3biZlFo5QFZbo/I59SicA1THyQTaj9fnwRG
 7ciS/8ZGLynipcOfiKVyyDXjIShkhQXizmlQQC14KIHSpKuRiLe+FRFdZbF8WEak
 l06Kr0bFYYDsiSOSCyDjzYmgRvdvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=zKsTd4LzF1GiX2K9a+
 Tf5WDhaLJ8FAUB0Fh4FUeWOA8=; b=r6lJxXdKGHbhTTXwTFQeW/xiGvuogoLiDG
 Q5eNKFqegaLTkOLLFegbbr4QxtSh7h/surrDte64zLZgn4hDC8dZLl5HlW7Z7k02
 fBdPV1lFOcQb375yNRQgHRHf8G5fTaE9el6K5XOjcvqb95wMd6uvfVJa25pKBzVK
 4clh0WxOBczqf7F2HDqubGn9paHz1hvcYhyhwNKWaDJ+LGuqhDRbszhp5o0ASYgl
 Wl4/9ZxKYatcgznvTN14PUuoG8CUm13UaB0/61ZiYRblqo9LwcBAo4Tp7IyTREVq
 jIOzMovTYG7a7p12nktTq5KCphQ09PjYvnlEF/dRkCTqv0OHgpzA==
X-ME-Sender: <xms:RtPWWTz4-8c-BjH65yljsBxJPo3WV90DruxYVfZws7k8iVE7wvcFWw>
X-Sasl-enc: Fe3d5PRMKI5zNSzmY9lqK8P0ZcEPPRwz18+x96p7ed+y 1507251013
Received: from keelia (ppp14-2-13-235.bras21.adl4.internode.on.net
 [14.2.13.235])
 by mail.messagingengine.com (Postfix) with ESMTPA id F327424813;
 Thu,  5 Oct 2017 20:50:12 -0400 (EDT)
Message-ID: <1507251006.5452.123.camel@aj.id.au>
Subject: Re: [PATCH linux dev-4.10 v3 24/31] drivers: fsi: occ: Remove
 unnecessary platform_set_drvdata call
From: Andrew Jeffery <andrew@aj.id.au>
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
Date: Fri, 06 Oct 2017 11:20:06 +1030
In-Reply-To: <db8ca08a-e913-312a-4aa3-8c503003f00b@linux.vnet.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-25-git-send-email-eajames@linux.vnet.ibm.com>
 <1507245291.5452.111.camel@aj.id.au>
 <db8ca08a-e913-312a-4aa3-8c503003f00b@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-mOqhyK2WDoMvOn7ULWTO"
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
X-List-Received-Date: Fri, 06 Oct 2017 00:50:20 -0000


--=-mOqhyK2WDoMvOn7ULWTO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-10-05 at 19:33 -0500, Eddie James wrote:
>=20
> On 10/05/2017 06:14 PM, Andrew Jeffery wrote:
> > On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
> > > > > > From: "Edward A. James" <eajames@us.ibm.com>
> > > =C2=A0=C2=A0
> > > The purpose was to set that pointer null before probing. However, it =
is
> > > set null by the kernel by default.
> > > =C2=A0=C2=A0
> > > > > > Signed-off-by: Edward A. James <eajames@us.ibm.com>
> > > ---
> > > =C2=A0 drivers/fsi/occ.c | 3 ---
> > > =C2=A0 1 file changed, 3 deletions(-)
> > > =C2=A0=C2=A0
> > > diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> > > index 916c342..561b029 100644
> > > --- a/drivers/fsi/occ.c
> > > +++ b/drivers/fsi/occ.c
> > > @@ -703,9 +703,6 @@ static int occ_probe(struct platform_device *pdev=
)
> > > > > > =C2=A0=C2=A0	mutex_init(&occ->occ_lock);
> > > > > > =C2=A0=C2=A0	INIT_WORK(&occ->work, occ_worker);
> > > =C2=A0=C2=A0
> > > > > > -	/* ensure NULL before we probe children, so they don't hang F=
SI */
> > > > > > -	platform_set_drvdata(pdev, NULL);
> > > -
> >=20
> > Bizarre that it was even there in the first place - do you know the his=
tory of
> > the comment?
>=20
> I made the comment. I wasn't sure if there were situations where that=C2=
=A0
> wouldn't be NULL before probe() somehow. Regarding the hanging FSI...=C2=
=A0
> that was before some FSI core fixes were in that prevent that situation=
=C2=A0
> during probe().

Fair enough.

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

>=20
> >=20
> > > > > > =C2=A0=C2=A0	if (dev->of_node) {
> > > > > > =C2=A0=C2=A0		rc =3D of_property_read_u32(dev->of_node, "reg", =
&reg);
> > > =C2=A0=C2=A0		if (!rc) {
>=20
>=20
--=-mOqhyK2WDoMvOn7ULWTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ1tM+AAoJEJ0dnzgO5LT5brUP/i0i5tZosF/k+/TKJot1P3cz
AlxT1vz4MjPAWV7hBNY5ctVFUtL9hKLaX1lULc6vI3J2lA+iLHFI2VDD59Yz6L91
lRzc17ciwIXlbYKfEUU0+bfIwAARJn95w4o3PAekXYcFSmenTtrtK98CmIRz2+6c
nEuBqegkZX9u22cvMVRb3k/nGQEBCyu0P+anlaly2zHBRENvwEj6qlPLVuaatdTi
XzDRIO/aVoO0WZMLfo1mr0HAhGf77irgP6qsmo5BlGx4kaal1skaCk1cCV36jN3h
c3zLL0mEx2F8BrrVzEmFsNlCQUUjxIrehJQizlnfFAX3/x64OcTbVBCvnG0Vw5l3
GDGEMKQHAx6DcVwzaTs+Pwm5txHYIxbiduOB7HhwIMqZRbj/YT/Yt4P15MMhQdp8
ZcVgNuxxPtXutoNuv7UmUHGFwVeRMklGEhejFagm8xNOXgEcBtW+uxxRL1E55ZZJ
EVBl9a0d/+vCjk1y+DAlyQaBMwD2Nv/YFW1aaZSwMa773SiySprbOes4h8Z4vJNy
AROX8eZjJtWs8W5nVFDCgQIkTXx8E4G+QNnKk68RNfigPbBbUziFR/ADjtJJ3xcQ
4rU3JTQuaoAgBgIhwdGtACKRnos5j5ORHK6bGQ3QEi6XzCqnoELrncqz1ZmWYD3I
upqSC65v4L2oqylwxDFr
=yzXz
-----END PGP SIGNATURE-----

--=-mOqhyK2WDoMvOn7ULWTO--
