Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FACECAAD1
	for <openbmc@archiver.kernel.org>; Thu,  1 Sep 2022 11:27:48 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJJgQ6XxFz2xy1
	for <openbmc@archiver.kernel.org>; Thu,  1 Sep 2022 21:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=fPcxDnf/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dNQ/Ekjk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=fPcxDnf/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dNQ/Ekjk;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJJfd1hwDz2xZ9
	for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2022 21:27:05 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 377A65C01AD;
	Thu,  1 Sep 2022 07:27:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 01 Sep 2022 07:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1662031623; x=1662118023; bh=6mlc0Y0U/c
	Q9/4B3zk236n+2r+XspNM8rP2TmtDImhQ=; b=fPcxDnf/AxlQ/c9kaCOhfPhK7f
	Fl6RoJlRTMy+awsVs9z+u29Ly4lWttPPwry2B4FxF+pyA6whUVFUszPb1nvIo9Tm
	onOxSvv5IOUweV1NHHe2i/w7qj8MNNoQ/t56vXppBQf84UqDuqJHHq/GARWVC/WK
	Z/7gR2xlf1ym9AZBSPNaGYQIzEZBVonPxTAJUQxKcjad16g/9KWs39mNqyuMPZph
	o3Z7f5ILeyWMJkiKYo8XrOSSTpriPjOG38Jji0dZjDwzh49KF4/L/TfviQxquBZd
	Ymy3jYlVPEnRuNgWkZM9DZgpWODMolEZl9+dYLT6MmEjLIf2EjP6lymrtGQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662031623; x=1662118023; bh=6mlc0Y0U/cQ9/4B3zk236n+2r+Xs
	pNM8rP2TmtDImhQ=; b=dNQ/Ekjk1p1jQBr0mji8+btinx6owmeEcmoy0k0Yei3i
	scohAYHikz8UZ8tgA/CzO3f50jR3M415XlU3maHbV1XbhLHjen7CSjI44nGz/wiZ
	YyxWifJX2b68xQ629XaxkHyyrTeh/licy4dISUcnldEND7DWq662OlIkqa9HoTn/
	gViLwnflKJNhoHA33JoEq7TiWWql5VHD3V751JWE3Y75mcI0pBzgZhIym6d/rdGA
	uKvuAeD3OsdaI1HGwP5ZFM5qHx1r7pikkVEXaA7KDootT3luHOmUcqg7fnDlOoN2
	tONnaLOQ2qsz9ICdJH7NifgGQ6fmUFSBEVoPTVOBqg==
X-ME-Sender: <xms:BpcQYw0JXgzORkTwrE-PZuI7NoK22T4u0Jjxvua-OEsJifsMDiWU-g>
    <xme:BpcQY7GkHaapz58SziPorC-CUEegCTnOC3c3JGnNx0QjAHW7vITveBEfact339wr6
    SAJXyqrd096el4Z3Nw>
X-ME-Received: <xmr:BpcQY459IqW3s5jqyPequgTKbR6kEURKXz1DbS1d8SpqSIfcZ9u3NEojCsDLaCcvZDhazTvojFiykpjTtZQnfgTQe1IlzGaO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekkedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddunecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegtdfhheegleejiefgvefhudek
    tdejjefhueehieegvedvtdfgkeeihfejtdelleenucffohhmrghinhepohhpvghnsghmtg
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:B5cQY511SHT6zVg3FQNFUe-fH8hy9eyq8M34Fm0HwG_k0mdtr6_Uqg>
    <xmx:B5cQYzHmhGu73LZg7hMP14fp7WYbTreRmorCYadE5pkVYeVYbz2zbg>
    <xmx:B5cQYy-leGKrCK8v7TkN_-xrEPeqndISyWjSPXMTBW1k3JZc3FIkFA>
    <xmx:B5cQY2N-QDWUeOxBIh3nmcoZXzSDDIuRO1_yJCRw-80zMRpXiDt4iw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 07:27:02 -0400 (EDT)
Date: Thu, 1 Sep 2022 06:27:02 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <YxCXBocd0Uz0u1D7@heinlein.stwcx.org.github.beta.tailscale.net>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dTntFd9kzohm5+Kc"
Content-Disposition: inline
In-Reply-To: <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--dTntFd9kzohm5+Kc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2022 at 01:09:10PM -0500, Joseph Reynolds wrote:

> 2=A0 Proposal for dynamic changes to Redfish authorization rules=20
> https://gerrit.openbmc.org/c/openbmc/docs/+/56401=20
> <https://gerrit.openbmc.org/c/openbmc/docs/+/56401>
>=20
> No discussion.

Does "no discussion" mean?
   - This topic was not covered.
   - Nobody present seemed to have an opinion.
   - Everyone present was onboard with it as-is.

I'm trying to gauge where consensus is at.

--=20
Patrick Williams

--dTntFd9kzohm5+Kc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmMQlwUACgkQqwNHzC0A
wRmD7A//cqcsmLjIWBh8fkDEAUSKHzO6QJvjCWDd02Y7zVY0z2Yi4TCFxz2fsFs9
A8EuqngPyERx0Ulm8bcHcbMtVp3LkbqflskBrWrsbphH5refKL5sgj9mk1dzOBja
kkSggH76PBNW0nDdeCcnCZNdfIvuzdL9xtWLXBaYWctdr94klov/v4AH5QFhfmBA
R1ORcUh9Fd76C5JkPRV4cm6y9s9mVWmV3uStHj4Win31PpOxc4FnutqNj8lFpZle
TF26n1wrpw1teXZyrdgeE4wJMY2yU/N/BDGSqq6NcimiHySofBAonY7d3LR5efdm
mH0ArB2JUzsvpbSlSvjcrXfpmYsVqU6Hmgh+OfJ4YLNftzT246HJPgjxgA6uNy6j
Tp/wN1bPko/aFAGYy72zR11wRO6JW94xcPylby8dcj+2cfPemI5pm5MEJ/f9DXtv
Rn6mYjYsJm7gO1tdTFUc10IaLM83kMx+ePXfAH4tgm7guESX73mAaiz/SiNhRIJA
L4j6ABIcIGecBo8oYAHt8xK2k/YKSrZg+kTIeC3+aE7vaUxzi6lAXMst6kA4dpVL
vxwscfIWxeMMIRegeqxhPEUFx6OWUjElFytHE6+s4/GS8XEFO6rQJctksg1rDZZs
SK/Z+gM2foUd+5EJjIuyVpu9ZBQJ1UA4QNauMhCWdG1CsPvdv4Q=
=Uq6t
-----END PGP SIGNATURE-----

--dTntFd9kzohm5+Kc--
