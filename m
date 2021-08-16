Return-Path: <SRS0=yABl=NH=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCF6C4338F
	for <openbmc@archiver.kernel.org>; Mon, 16 Aug 2021 14:26:20 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F5260EBB
	for <openbmc@archiver.kernel.org>; Mon, 16 Aug 2021 14:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50F5260EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpGgG3wbbz3bX8
	for <openbmc@archiver.kernel.org>; Tue, 17 Aug 2021 00:26:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=qShr+H07;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VDbeIbQZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=qShr+H07; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VDbeIbQZ; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpGfN14dJz30K7
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 00:25:31 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C00F5C0063;
 Mon, 16 Aug 2021 10:25:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 16 Aug 2021 10:25:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=b0tGzM/GeljnIA/exKQwNIDPIHW
 ClCDTv5Z8D2x0Uk8=; b=qShr+H07u/H6ng6CwStdlYqV6EjO0MDFScOzwSBF5si
 QTwXjK9erC9EWUgbfTidOcZzxHrPx/DHY8Fa4vLKa6KFaWW09Q3jUZSNGVDA4zSl
 ChpFLpGxZYjeCsirg03Cvnew5E4+IvekLFJxJtAUIJWiOLmfZC6RBzUYVtkVQQfJ
 tM2i9sxKAdm6ZxAZULdev/9gnE75mDtUqQx3C1fEgZo/qq20iwPFe3A5MV7BhrZz
 RB7aYxuUmKm+v90qcKoMQjpeRfizw6p1namRHpt0naeLbS5pHJZVMyLaAKw06HWk
 U4GPL+50eQUwRWnWVKrQS0X5vwadyoBzcpfxUURJO0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=b0tGzM
 /GeljnIA/exKQwNIDPIHWClCDTv5Z8D2x0Uk8=; b=VDbeIbQZuuAchbDGuXFlU1
 UPXgz5Z8lECN1ZTUEnzhmBWOPLU0kstZXgPaaGiBJz0zZ9v/bSbbNUulPomb2P7F
 JTX/2d2K7KarEej3t5QMQkuU1I6//Upp5RE0WPJ6jUYj6NzzSVNQACh6hNYNnLQ6
 BVAARefVry4L5PlR117Yd/7uVqL7oqnFR+GuNOvnKQDa8rcMBN7ivxTWwCkd4tr9
 KvEvwlI8J+wvjFBvFC08u9YAbDxqlKIMuhZvpNN2HUj9GkhJ3eW6qzLlzSL70xDL
 RLh1Dv/oXM/5Vy8opkH6cityzhVzwirrHt/F6rgNWsbhIywM2IGvA93xaAEyXsdg
 ==
X-ME-Sender: <xms:VnUaYeku61SMe4Ckwc9DsY-5uDa1F0AzspMUVeQeGcqtsIQThOS7HA>
 <xme:VnUaYV1rCgn1Qvk13mu9ReEFSdrj1ycEtjsQpoIb31k2nXKi3bCzMASiyvk7lB_rR
 RHVbPiUm1y-wPHhDyk>
X-ME-Received: <xmr:VnUaYcqcAc12urqxaFBXgaWcwiSqKb3i-u2wS72nctoZUi3YmfLAEy1g-9__L2aBSr8ymb5hTq1T6vkotmR7HGSP1uHiONlrqwkfZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledugdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehgedttdelteeggeffveehjeejgeef
 ueevueegleffffetkefhvddvudfgkeeiueenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhphhhoshhphhhorhdqrghuughithdrmhgupdhrvggufhhishhhqdhlohhgghhinhhg
 qdhinhdqsghmtgifvggsrdhmugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:VnUaYSmqqLdlk42d2CJUIdeHVuhpyPqGYwEbfNEknT_5YXyscWYt-A>
 <xmx:VnUaYc0NwWNwCM0EvZPHZ6WcYjp0U5s0ZcwC23jKEoUmPrKMP-FuWA>
 <xmx:VnUaYZuqe-v5vkoEu5mcAo6QNCX_OuEN5IavwqsKUxRg_LEaF2mfcw>
 <xmx:V3UaYZ9xsZh7TzqSizk1P0fOLiOyMlmNqmFTy3XMNxSVu9Gp6En5uQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 10:25:26 -0400 (EDT)
Date: Mon, 16 Aug 2021 09:25:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: Request new repo for Audit function
Message-ID: <YRp1VMAJ6TcDzTz5@heinlein>
References: <CANFuQ7AOMpqhpa_Upn5toNeSDzZK_TADbc4ikqjbZBjmrMoBSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cix74Gnwy9ymnvxp"
Content-Disposition: inline
In-Reply-To: <CANFuQ7AOMpqhpa_Upn5toNeSDzZK_TADbc4ikqjbZBjmrMoBSA@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--cix74Gnwy9ymnvxp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 13, 2021 at 08:51:32AM +0800, George Liu wrote:
> Hi Brad:
>=20
> We have a requirement to implement an Audit function, I found that
> there is a design doc[1], but there is no code to implement it.
>=20
> Could you create a new repo for Audit function?
> eg: phosphor-audit
>=20
> [1]: https://github.com/openbmc/docs/blob/master/designs/phosphor-audit.md
>=20
> thx - George Liu

George,

Are you planning to implement the design as-is?  It has been quite a while =
since
this design was proposed and it feels to me like there may be some overlap =
with
the Redfish logging proposal[1].

With how old this design doc is, I think we should have an update / re-revi=
ew
of it.  If you are willing to take on this development effort, could you re=
place
yourself as the "Primary Assignee" and make any necessary updates?

1. https://github.com/openbmc/docs/blob/master/architecture/redfish-logging=
-in-bmcweb.md


--=20
Patrick Williams

--cix74Gnwy9ymnvxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEadVIACgkQqwNHzC0A
wRnp0Q/+I9jfjLdBK5kczjhEJPJ56bXjlu5uhMVmwkduvhAjB7PqJEjpsFU18io3
FODlZnS31PbufbT5UEXxrf8riXHR6QbRrY3cZpdh2+cu2efhSJ4Acoo/tSCOfJv/
QEm1T/uX0fpdD3Tpf/BgI1tKfXOFzRRGAR8T3nZGHbwTIhuibgJ6z0Px9COSlNMm
67GU3NThIMRqkQkbsEOoRFohgadvryOD6zyp4/o6TDCCyEhdM+a0pIQwPAMPHKD8
0S98uWRGJnEp6AFZJBoEtC/eJRqnyeSRnZyhYiN9AHa+UJBbQyG7PaMmvZv6lAcQ
7+T3TBmhrgnOSrpDV0Hfv1/FDdkETGHY5fyMLzeJ2Dm/omAZjXns+i5TwhmFhMkz
+b609y7xH6JJ5pcBEOEp1h2SavCfd+esluPUjg2JBjdPad/Kjr35jEo+vV0B7E6T
EID9Hah60bEM9DivdhM7PSCivKEeCfF9gBZNaoA25GJ90eM6pYrUwah1HoBmHe93
nHolXVWOKDFm2aJ0Kgn8dVgYOUen8rJoJqhiGv0GyYWNjK1TXvLts5MQlVBavKO3
JhyDkjgK1gymiUWkRooO5DUDrIWcJgi8A/6EmfwA2XKZjVhIKATd98g6RDKQTehH
zcd874Y8vDeKGCwWCP+Tm5h/9oGAYEq7OT1tJz6tbWeDWoXGbmw=
=sDlc
-----END PGP SIGNATURE-----

--cix74Gnwy9ymnvxp--
