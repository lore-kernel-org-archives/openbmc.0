Return-Path: <openbmc+bounces-1766-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9D5109B474
	for <openbmc@archiver.kernel.org>; Tue, 31 Mar 2026 14:26:20 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4flVm53Nwxz2yfK;
	Wed, 01 Apr 2026 01:26:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774967173;
	cv=none; b=Jyo+UvR7vi/ATauDBlMqaBWq3qCtoR+N2gTBhIXB0ZgW76FS85chfw7Urm3limLqC1IawQV5hjsHfboeCHAwyfu9NnPjhoFdWrx5rY+aMlSmwnfEfQT2kji5tki4vnFSLxHrn1iIMop9yIaqIYumI/j+sal6qeLcfqaY+fuizJeIAcnZJL0PCZNwXUv6kEp/UzDDcrLS4WL74MaF7K+kPtzm3zmbvGTUX05KzckYkY9Zooh0oKmgxs+M2gF908zLGSh8TQL8cHdpwYbRXIB5I7OJE7LLwqTeGW3s4nQmVY7AlB+2FzUn3KjVlSfgf5fsKbeRRMsJabaZHZEL8qufvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774967173; c=relaxed/relaxed;
	bh=PO3n77KrkiPyW95c35TEzBR7r8L4DSH3lephygYATl0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4DdOqtKZ16WsMU3+IGPCkCM9TlPERYkCqb198QlnFT6roH0Ao1MhsroI53E8AbcV9w5jY/vCrQNdrzQYIu10Xt6Y5/s0ivPtLk4SEb7AA5fwYk7SyT5ijISyCcA5mY1rq4606nRLZusZv2N3SnMsh3/2ROCbcrIZH3V1yD+BCkGiZ/Q0NO7RbSb3SedRiwfkMXkTx+nXFrL2es2yVxFDW+TxkW05/c/v+C77wp459YriD7IfqelXHowuJT7cH5mhhckYwCp55o19dNnB7JiCzqLJpuFZt5ai2/W3Y1jdCSom98d4oRyxUyPCAELYCbkmSXKMIvFFHR6Z3fGLuv56g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=gf5w3+nn; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RP01UaB3; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=gf5w3+nn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RP01UaB3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 515 seconds by postgrey-1.37 at boromir; Wed, 01 Apr 2026 01:26:11 AEDT
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4flVm311Ksz2xSb
	for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2026 01:26:11 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 211E4140011C
	for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2026 10:17:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 10:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774966652; x=1775053052; bh=PO3n77Krki
	PyW95c35TEzBR7r8L4DSH3lephygYATl0=; b=gf5w3+nnaAVcnrkJpf/rN5wWKs
	+M6uamCE8/A3n4LTTDspGUnCVMsCglpdI1QH45farxcYHXjHJMkqNSp7KKxcQkGs
	rynmSKjoq2TNAZP1jgxuNoG+TMyONbHvfMGxg8j961CL+2Lu+LFcE31Vx7lGZBAI
	MzO2/aKcUMzyK1rq2e54lbBQHgMO2sKnKovFBvfsTb60jiSevDXoXKGraRQ4TJDH
	HVsIabdxlzNKuzKAVg+YUui+Qn9jVDR6O0WghO08RL0m0Y9m9JxUdx++A5ssdSga
	o2bk9UxKq67yQExBQ2eoGo/dtXO9udMapYeBn3/+NJQSeUgQ/AjkVIZGHrVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774966652; x=1775053052; bh=PO3n77KrkiPyW95c35TEzBR7r8L4DSH3lep
	hygYATl0=; b=RP01UaB3VM7D3MHlPz13YvPk4lnJ/DAnGeYbi+fberj8BmRF3jC
	eaFUb8EPfl7hkhj1VDIqqNOdFMYwgUeRtOHlkrqxE+mkiT10ip+sXqaMLqwAFPtQ
	40qKzF4GG+b80Ir+kAQ+/NtL6PrmRZxT6pQBbwTtRtir66aRSj+37HeqKEK1kVJt
	P1M+o5ykklqNCWLJWBVyeX+Hwz3xOmghLG2BIt5VFaC1iFRHc+NkqkzUajVGI017
	67Y344Vc+KliZEWsatFrKKSHnDcEQLzU9jCN+0lohNi3PbIhu6uAsrLgpuLPIZJF
	bpNgysvoFeXcGuywN6XHQ5R603CKr+HkZ6A==
X-ME-Sender: <xms:e9fLaZPVqLcAPsKy-7tSLfnkVfiwtg2cfni_pZDOtS_3bv-lgOXMuQ>
    <xme:e9fLaS4W6eZBnJDbO4LcRk9buF2x2Hsonhi1K9M-pXpi7iUTKPJQFtis35-tQvRtT
    57i0ISTkIQBpVDL-MiAtJT30Lnoeg9qn0jDDGaMbD9Lz5_gfadI>
X-ME-Received: <xmr:e9fLad4wto3yQOcTX8ydLjWjOnN_31wmJGAOjI7Bim3QeB4rnvFHSBsYsao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvf
    fnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhr
    ohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrd
    ighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfegfefgtdeh
    hfektdelffevkefgueffhedtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphht
    thhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgsmhgtsehlih
    hsthhsrdhoiihlrggsshdrohhrgh
X-ME-Proxy: <xmx:e9fLaa3Dl_-eWxvXCkjEAyJWZt5tnPZ_qjaN2NeLD3z0a827kkKkkA>
    <xmx:e9fLaRW0DDjMctPwtiXJDboRbMyPYlDFou-2Enw_htrHrNGJzjaV2Q>
    <xmx:e9fLad53OkIo_oE7WNio9hnIDDAaOEKHQYxIScBJ4TzG7fXk1QuDXg>
    <xmx:e9fLaQKHPc5SmV-nRyR_M0NgppVzOxSYlLYxQccJEQXoZA0MK1Bk_A>
    <xmx:fNfLaVOkkNZ9twqpi7SO_kUgwB7Dzh-YieuN-9ax0jLHbhQwJalnJFtK>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2026 10:17:31 -0400 (EDT)
Date: Tue, 31 Mar 2026 10:17:30 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2026H1
Message-ID: <acvXeuKAOlv3vNf5@heinlein>
References: <aXDmS4BmR6AGXKGW@heinlein>
 <absG_8pQilMHGMnO@heinlein>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KEsxb9dfb0y/Woal"
Content-Disposition: inline
In-Reply-To: <absG_8pQilMHGMnO@heinlein>


--KEsxb9dfb0y/Woal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 04:11:43PM -0400, Patrick Williams wrote:
> Votes will be accepted until April 1st, 2026 at 12:00 GMT from qualified
> votes[4].

Reminder that there are a little less than 22 hours left to vote.

--=20
Patrick Williams

--KEsxb9dfb0y/Woal
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmnL13gbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZIUQP/2IMXIXZwVHKRjtmyIJl
2c8jNDbVe5/5pWR2EhQI6VrOjkByLNRJvPtD571HCpRJSrxXIYVcKannqBSnZQuj
qh0WTrHMwDFGW6yd46bzjcImUgJRAs454DDAUL1jhEP45qmzhO2Wv0p5JsyXO129
lna9hJk4U0g84w9JDytWfep1Sqf3GDb0oMDK2koVYwy0oYZ71PjoBkNuWet5o7JN
CbDRZ6Qp5K2GAYs9Y5MmhwYh6F9Oh6tAUS6rvcuyxFgXY8DaRGsYH2OT2xIpoRYr
4d/O/i4tvRIDhcjtmQWVPWiJRn0s3b11y9VWCQXgql0176NKSXIkZfd86kh07emG
R7p5pDE1MZ50K2UVcBW+B9JvAky4zQ+aVVQ1czm63bbF/VF3wgsx+51e7hYaEora
UsCqeix1bspu2EU41dayCBPNCXCc4ef/BywDqBNIkTVF3XLwKTxSug/vHzMm/1Jj
wO/53PubVXegCL76SBVJ+C6wlDW56rOl3WGsQohiqn0oLdzAsm9F1uYWGIJU48r5
TudLxrLOsZ7MGH4NI1eOzbOPdkvI5OYGOQy0x4mxYajkNGU8zCf4onQPpZdheIra
PaIK/7lNv3i+/AZpBPKjT23XW3zfp5FRAqYQ6HOl7YGOWE7on/8fa/AI8kza8y6/
7Si8xq3yVG2VS3P6aMru9yKZ
=mqPx
-----END PGP SIGNATURE-----

--KEsxb9dfb0y/Woal--

