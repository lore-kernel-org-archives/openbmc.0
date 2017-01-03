Return-Path: <andrew@aj.id.au>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tsxKb1K7tzDqCn
 for <openbmc@lists.ozlabs.org>; Tue,  3 Jan 2017 12:33:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="THr3a/gS"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="g9MylDG1"; dkim-atps=neutral
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4FD0D2080B;
 Mon,  2 Jan 2017 20:33:20 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 02 Jan 2017 20:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
 :x-sasl-enc; s=mesmtp; bh=CGS99oMki+OnG8oWFfrHl9J5+zM=; b=THr3a/
 gSGBqIn3ztSwDYyJV+BaVVS9fogRM5WsPtSJzOF3kL55EqduDIdCJ+suqdDwOPJ9
 0ymJuscDFrrifFZbeNT4x/7gIvIsghw+RDv2XVcLVi3QMeaLHtKEBvokbbzusUp2
 9jUPTfDx9F7I1HGCiLgDjfeOXPVnmnXrLR0sU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc:x-sasl-enc; s=smtpout; bh=CGS99oMki+OnG8
 oWFfrHl9J5+zM=; b=g9MylDG1NuMeT5qE3mTdPpctzZ5aWdWS+6EjtPBT8xg8ZZ
 bG0hsfrbHYmQyLnqUvhs2eKSixSyZEhmCshpT3/KSoFthMvu9w6c1DEopViseeGk
 fPRz/QYAnXeWZH8IzM7LBkoRcRIFegZ30OMottgMVnGvO7vMlUhrbuY23XqEY=
X-ME-Sender: <xms:YP9qWLBIp180HJnL8ByoW1Q19H4p9Ig2IDnB1IOrixVbX-vRj0cBqg>
X-Sasl-enc: uXRf+053z7yr0j2yMoRnSmX39a3p4yUeatF8JcP7KNvV 1483407199
Received: from [10.104.0.15] (unknown [203.0.153.9])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E3247E709;
 Mon,  2 Jan 2017 20:33:18 -0500 (EST)
Message-ID: <1483407195.7801.3.camel@aj.id.au>
Subject: Re: [PATCH v2 5/5] drivers/misc: Add aspeed ast2400/ast2500 lpc
 controlling driver
From: Andrew Jeffery <andrew@aj.id.au>
To: Cyril Bur <cyrilbur@gmail.com>, openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Tue, 03 Jan 2017 12:03:15 +1030
In-Reply-To: <1482480266.14044.7.camel@gmail.com>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-6-cyrilbur@gmail.com>
 <1482461737.3419.29.camel@aj.id.au> <1482480266.14044.7.camel@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-WdJZYC+CDR7ftpYBfBKD"
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
X-List-Received-Date: Tue, 03 Jan 2017 01:33:23 -0000


--=-WdJZYC+CDR7ftpYBfBKD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2016-12-23 at 19:04 +1100, Cyril Bur wrote:
> On Fri, 2016-12-23 at 13:25 +1030, Andrew Jeffery wrote:
> > On Thu, 2016-12-22 at 17:06 +1100, Cyril Bur wrote:
> > > +	node =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> > > +	if (!node) {
> > > +		/*
> > > +		=C2=A0* Should probaby handle this by allocating 4-64k now and
> > > +		=C2=A0* using that
> > > +		=C2=A0*/
> > >=20
> > > +		dev_err(dev, "Didn't find reserved memory\n");
> >=20
> > I think this is good enough for the moment?
> >=20
>=20
> Yep, would you prefer I remove the comment? My userspace daemon
> wouldn't handle a buffer smaller than flash so even if we wrote it we
> couldn't use it.

I think removing the comment is the right way to go.

>=20
> > > +static int lpc_ctrl_remove(struct platform_device *pdev)
> > > +{
> > > > +	struct lpc_ctrl *lpc_ctrl =3D dev_get_drvdata(&pdev->dev);
> > >=20
> > > +
> > > +	misc_deregister(&lpc_ctrl->miscdev);
> >=20
> > It feels like there should be a devm_misc_register()...
> >=20
>=20
> Uh sorry?

Just a passing comment on the misc_* interfaces. Nothing to worry
about.

>=20
> > > > > > +	lpc_ctrl =3D NULL;
> > > +
> > > > +	return 0;
> > >=20
> > > +}
> > > +
> > > +static const struct of_device_id lpc_ctrl_match[] =3D {
> > > +	{ .compatible =3D "aspeed,ast2400-lpc-ctrl" },
> >=20
> > Another issue I meant to mention on 4/5 was we'll need bindings
> > documentation for these compatible strings.
> >=20
> > It's probably also worth adding the AST2500.
> >=20
>=20
> True,

Mainly because we should be targeting this at mainline, not the OpenBMC
kernel tree[1]:

    Once you are sure a driver needs to be written, you should develop
    and test the driver, before sending it upstream to the relevant
    maintainers. You should feel welcome to cc the OpenBMC list when
    sending upstream, so other kernel developers can provide input where
    appropriate. Be sure to follow the upstream development process.

    In the past patches underwent 'pre-review' on the OpenBMC mailing
    list. While this is useful for developers who are not familiar with
    writing kernel code, it has lead to confusion about the upstreaming
    process, so now we do all of our development in the community.=20

[1] https://github.com/openbmc/docs/blob/master/kernel-development.md#devel=
oping-a-new-driver

Andrew
--=-WdJZYC+CDR7ftpYBfBKD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYav9bAAoJEJ0dnzgO5LT5NN8P/0rRYZGWdpliCxH3331f7ZBy
/J4BIxuilYhnaUt9501YpuMYmmZGPFPUG2ISv+QFi4QltlRa2pg0JivvHNQ2Dqim
2Odj0mBtG98LV8s1PmOR91Qy5AOyD1tMi2Nq0HhIcb3QQOjB6k8ErxwXGSvzlsj9
ILdSjrhS/rhkiRYfNPzxL08KyGsJcbjHu0QM4pyV+jNYIuIHF4/v04tUFy9Hzziv
i9uV0uFEbo/WfhbBTX1/8GekF5BQcjDjyzbplPY6y75yVuYu4HrpI8msG/0f4YP2
AQHW9FCUNKpG9X+E8eNh/mzRpic9pCYIQ3pihem39VIgxkxR5vsaYN0wid7q4nhe
4VZhsJ2c+XPoQ5z9bWRjSaIWFvhkAxjXb1qxb6WH8zly5+53fsYGEJcU6HzmGkKS
9O6UfB5rIo62RKmFyJu5dYtXa8Tc7ceZGkaHe7tioF6RUb2IZGuSMG8cRjclp8US
5FEacHfry1cXCH09KbCvVCSoXsYpmJ9kJbEcsscuzf8g+cXHSaxYWercBHSLnukF
wm0GN0f28/8a+8h5YKrxafFIkwjO9W2AtechaiFE/zUz87DlHkKUOb+CeLhIi0xc
Alh+VclfhGyYg9+VP32bpkuj279VaCBsTZFqdXNJw4pkVPiJ7nBW8SyjoTshK3xN
qvt0Ou04El9ldZEfqD01
=yKZ1
-----END PGP SIGNATURE-----

--=-WdJZYC+CDR7ftpYBfBKD--
