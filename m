Return-Path: <SRS0=7bNB=KG=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6884AC433B4
	for <openbmc@archiver.kernel.org>; Tue, 11 May 2021 21:41:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD72A61432
	for <openbmc@archiver.kernel.org>; Tue, 11 May 2021 21:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD72A61432
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ffrwb6xM5z301t
	for <openbmc@archiver.kernel.org>; Wed, 12 May 2021 07:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=gNqMzpbE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DCvlZl2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=gNqMzpbE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DCvlZl2Q; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffrvz5Gy2z2y8F
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 07:41:18 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id AD4275C0035;
 Tue, 11 May 2021 17:41:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 11 May 2021 17:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=SN6pRD+hBikGhp6PA1/CF7JXt9p
 BDje9yVZv1wCwtBw=; b=gNqMzpbE/lixp02ImeTKNdw6On+eBon3NiMKc3vxPNs
 Cdlbv5NRMyw44tzM/J0HWW/B1BB5sENUWoXlSxBzlqtCUHSP9K4dt8jIhQ8lRPqz
 YHqwgjopIpSUXvGzTkyjInECS0ejmIuL3/tyXQ+IIeyu5dUvefWWGDifXXlTyOdC
 EIoV5Eyc+ebpgs5ksfGeKMg8KpHwC0L+A7WUYmKsov6jAQMvqyUaDiYdebBEyNka
 ifI9zycs066eJc+bXSl7vg3DniPOnHmZe31jICv8Thro1JDaZiMXU8XrevEkjAFZ
 v4E8vWlv6dkprvMMY4l7QjUZZLJ9iuvlPyUFKuGazoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SN6pRD
 +hBikGhp6PA1/CF7JXt9pBDje9yVZv1wCwtBw=; b=DCvlZl2Q9tqHbpZcv7+w/P
 hWp6/sRsphbZb5LTYsQkeqB+SxxLpXlGT0e9E9fG1RTsc2tUumwXw3J790G+WJpg
 1r075r5QyX50r+qY/Q8w8qXGh/iru9FIWaFS3cPcY45V/ELkP2Wbxrd2btbI7k97
 /PS0u90ZGlfNeoPBvJ3SvfVBNqYXhm7OIjpHz4V/z7muCQ++M0+JoOQ9GqddrxmG
 zWpU+J+8ekZNcPYn0tKQK9xAUU8s/8UZVpNPznt1Y+BU+UBgrkggx2irH4ZZbfzr
 rzF1icVRgkGt5g0UWusEiYeogb63corLa9N0IxfkqZkgZWBo5PdTzoGsEveY8Gnw
 ==
X-ME-Sender: <xms:-vmaYCnkSdbZrnSYIaFK36G8RWPMK-QtXrH4_Fl4X2tw7G9BifgnnA>
 <xme:-vmaYJ0XNcyTdxbm4g5E0rGrw6ZSHEu4j7pasx6Xg-akF6Z6GS4KC_ksx1O2eIP3w
 Dt-txDqbBS2_4Bgt1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehudcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlh
 cuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecu
 hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
 igrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfegfefg
 tdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejvddruddvuddrvdehud
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:-vmaYAp07oflRTEMitW0WmKr8EJH3YgfmAmrogjVQuHqNjnf3i4Qew>
 <xmx:-vmaYGnQ4wYW6MdzN77L-oqGe8hcwTXOiV41U8Z1tUDuKnmpnFTIlg>
 <xmx:-vmaYA3XTQchRJNkmMEaEU7oA_DoRB9kZLyf08ys9QRVV1ccPHcJ_w>
 <xmx:-vmaYBjB96hSDNcgWi2PTm8fbyH-3QuHrIUKhldAtBey0I2Aay631A>
Received: from localhost (mobile-166-172-121-251.mycingular.net
 [166.172.121.251]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 17:41:14 -0400 (EDT)
Date: Tue, 11 May 2021 16:41:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Mike Jones <proclivis@gmail.com>
Subject: Re: mtools bitbake failure
Message-ID: <YJr5+PsBEvGtJGfB@heinlein>
References: <CC4AD3DB-396E-4D9D-93D6-26EBF70FD356@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OgQ4zmPSUWnvPWbz"
Content-Disposition: inline
In-Reply-To: <CC4AD3DB-396E-4D9D-93D6-26EBF70FD356@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--OgQ4zmPSUWnvPWbz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 03:30:24PM -0600, Mike Jones wrote:
> A solution is to use a newer version of the build tools, say 3.2.3, like =
this:
> So if openbmc moved to poky 3.3, it would solve this problem.

I'm slightly confused by this question.  We started using the 3.3 branch
of Yocto by at least ~Jan of this year.  We tend to track upstream's
master branch, which now is the pre-3.4 development.

What is it you'd be looking for?

--=20
Patrick Williams

--OgQ4zmPSUWnvPWbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmCa+fYACgkQqwNHzC0A
wRmuIA/9F/5ccx5ID+k8L3RDJdhcCGdzrFyySGihiEM3cyvNmSwSQDXEFZBSUef3
/63eM5vce/Y73ScZcz0DSjp1EhkB4AQTsy9APqKpZmJixyxEnahQLtAdiLf+xx0b
Vnfj/8C2Saf0jWxC7TVbHNDfD9S4RmDgdTOGL7Y6viXVcfo65q558/iT0TdFRzMl
XWJcx2SIhIIJ5aEFejtJMw4/EeGV9fBIRyQObN4nhAXTuHaJtmoh1M81TAfOfFC4
9dS050dWmqjp2D0WTu0MkG25os+tTJdVV4TLD/wyR8TxJpuEONtaeQ6907ogEte4
uKkD6gzY3WTJWViNNFiHGtn98QdtgjMVxaupgAwCtEGvi9SSGdBR7z5bGaJG3/K1
x2R02s8SDl4DT+u+l32ZdmsOj3WECIX4+grf5d9B1KlZYUYhS8SWbAWjm0N27wbb
WoizyMUk1Em22o6b6/kv8dwYX0dMYLkug7b1eM7RtwUB0+nqa0Wzvf23yfawqgcb
+ufBedfdLqc+0gawBmSHp0CN2U/xj64IpPPrwqEYLzAjrOKLZ2KRf3dYlJpnw3LV
38ypu3hElH4MCKnnyUgwMSp3n5L8FcHFHAFSOM/5IUdswdGS0avmY2vOFo7IA+0p
b5njohQB2vNZjLLpj4kgV17VMjbD7zRU7ev7kyft6XU+NDuLSxQ=
=vglr
-----END PGP SIGNATURE-----

--OgQ4zmPSUWnvPWbz--
