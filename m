Return-Path: <openbmc+bounces-1767-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5241D10F92E9
	for <openbmc@archiver.kernel.org>; Tue, 31 Mar 2026 18:21:52 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4flbzs1MhNz2ybR;
	Wed, 01 Apr 2026 05:21:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774981304;
	cv=none; b=DFD0jXiigGXxWz6+KUIiKSAjPB/g2wyCj/Ch4dIMOnreYJc8Qs90gtfoREce+gbHtlMu74wkocv/8d3nej/wbcCLMTSaX9iImcO/KYSR7JNIGUtATllQl1Uxhi7+e8Xe9/kdu4nWy4HOX99ufP9RjLECp8XA+9czF79qkzyuE5QxI1YNbWfPZS+yGlQLQ/wInZhQ8P5R8j+m1D1hM8iklJWmNUgQXHdssjJW7nmIEMVeXwAAdXJPOzK/WN2Vhlt2u6KyiQI4A6pzmo7MjZaycBrACbwQKWYx9mkjQDWbENHlvibD6RfbMASu8k5oDIreF0eyng7Dspn3VvxdR/ltFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774981304; c=relaxed/relaxed;
	bh=FPeQe5lXzBz1CfFLe/GSmE4Xqq8qMIJ2WZ4/kNDrQS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlNU7g60TuHNN/X+5lY4ur/x1WtWERWVBRSjDCvX5wvUQWN9V/Gk1LH8qPJXdG/7C2LnpwOWlv7BUd2hlkxIXDhN79Kaw0HPwAOe0W5jh+NQygcLybM+gwVVcspY8Sv2Tr2OOj5840B1s6+AGSJt4/A7ogU5+d8JLkDlDqB1yEfFz8HfMYe0rnzn5oTixYT34AlnoL0Ujz6lfxi2n1DFUFRQyqJPKSIkLtBnqvmi2CLYVZDQZ0HjZf58ZwRbVYZ5kfeCJucpYDI9LP3DEHN1bzwQMGOTJojfDGYoPkGu1oF6AZfTdcVpKgyKTs+PrSCkGWeoWIl8vyCsuLt3VRHVaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=0KDpyO9f; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S/Vv8jen; dkim-atps=neutral; spf=pass (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=0KDpyO9f;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S/Vv8jen;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4flbzp138kz2yL8
	for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2026 05:21:41 +1100 (AEDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 3707E1D000D9;
	Tue, 31 Mar 2026 14:21:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 31 Mar 2026 14:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1774981297; x=1775067697; bh=FPeQe5lXzB
	z1CfFLe/GSmE4Xqq8qMIJ2WZ4/kNDrQS4=; b=0KDpyO9fauJwM28xrsCa8EMctk
	iG0j0Xe16aawtE4fm3/lwjtfJu5fLdRh7lSZahc/uBl/XL2OMb3WitntlU9MLNpQ
	9KEB/Tou8c4V/be8XNtqsclzYduBvBRgflVDzy37GiQpRcTiFYfEo9SQmoc+YwCl
	pPppvrJPK1pAPDIK9eqwTJqwMleCRrPgWDV6fNV1pqN09+YensysJlmwqaogBLEa
	dJmMwVhL+kpxGFoZp+tJ/oEV6bZ2s3rLgioo/Q2yOVU+F9j4q9R9XS7098VyW6zo
	W39xLI3ezOQ7/oyKJv7of74mGRdGHDRIcHN2hv88FsZqhCJgehd0LNoz3qcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774981297; x=1775067697; bh=FPeQe5lXzBz1CfFLe/GSmE4Xqq8qMIJ2WZ4
	/kNDrQS4=; b=S/Vv8jen6RElTqoXlyDpHRaonqsPsxJIc1f4V11BE7W+6I+b8TZ
	38KGVnQi92BVu3Fbv0JnSpcE74jlg9X+jZUh0A5zxxYeFVupQhT779v9NK7Q4NgD
	iMwnxcvJV8UlfkdW30je6dKgvZBomGuwwytgmcxFU3f7cuJR0jUlx2gl9PtRlDdQ
	nMQDSnOPwtKVGfLv0+1+r42DBdNCc8MwEJ47ylv/cxWPfsq2OVbZ6n7S818VPpVN
	9wFES2dKnoNGfnWqz5bYfj4Jt0r3I3CrHSyqu73xC2/88KbnpPWjNLEp5JqLAeEj
	czk5Y+714wLG4/1ZC4H4oLYvJMF/T6sY+1w==
X-ME-Sender: <xms:sBDMacdUCjd5ieK08G4ojixh7QF5QaUHl3MkmuyRw_eanlpraDA_pQ>
    <xme:sBDMaVOjM9SI7jWR9jbgr5aCQr3awdRjH2ZMkVjygYCF68jEK_bIDJ_Af0FaB0M64
    b-tiWVw1_ooqYWtNmofKjnUeg9-WNF_2-C1oraDlJJv3AzNG2J-ySM>
X-ME-Received: <xmr:sBDMaSgqJ7d-B2yX2dxwXpf0Or8GRb0MNnqDWwq315uyhKhR4OjM4In_J9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvf
    fnffculdejtddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfh
    rhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgi
    drgiihiieqnecuggftrfgrthhtvghrnhepheefjeehfedtjeeivdefkeffheeludekudel
    leffkefgtdeludelvddtgedtheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepvhhinhgtvggptghhrg
    hnghesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepohhpvghnsghmtgeslhhi
    shhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepthhrohihpghlvggvsegrshhpvg
    gvughtvggthhdrtghomhdprhgtphhtthhopehhuhhgohgphhhsuhesrghsphgvvgguthgv
    tghhrdgtohhm
X-ME-Proxy: <xmx:sBDMaQ3xjJEYqIJ4skAyOIVI3943hzP0MVog9QIBMZhkzBPeSJI_kw>
    <xmx:sBDMaUiG0cRl-1ujrpk6rjqxNrvAIzN_YCS7OmsAKelom5zr33ZFOw>
    <xmx:sBDMaYcq0ZQCObcvaIirnkWYN7q7jyrcfCuPzxkjEdzbnsx-piFBqw>
    <xmx:sBDMafl4oxdu-horI8oNEhO-38DTmqldsKpOsFHiTGdQDrY2_ILQSQ>
    <xmx:sRDMaSba_8dgMlvjc3vhbGwYgSAcAigYdWK1_PcfFNTCzReNsv2w5pm0>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 14:21:36 -0400 (EDT)
Date: Tue, 31 Mar 2026 14:21:35 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: Vince Chang <vince_chang@aspeedtech.com>
Cc: "'openbmc@lists.ozlabs.org'" <openbmc@lists.ozlabs.org>,
	Troy Lee <troy_lee@aspeedtech.com>,
	Hugo Hsu <hugo_hsu@aspeedtech.com>
Subject: Re: OpenBMC add meta-zephyr for AST2700 A2
Message-ID: <acwQr0d53omz_2Rl@heinlein>
References: <TY0PR06MB5707D3F95D8E083E479A5FD9E253A@TY0PR06MB5707.apcprd06.prod.outlook.com>
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
	protocol="application/pgp-signature"; boundary="q1UK+C1hHL6Wa8gC"
Content-Disposition: inline
In-Reply-To: <TY0PR06MB5707D3F95D8E083E479A5FD9E253A@TY0PR06MB5707.apcprd06.prod.outlook.com>


--q1UK+C1hHL6Wa8gC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 02:11:07AM +0000, Vince Chang wrote:

Hi Vince,

> Could you help us add meta-zephyr into OpenBMC?
> AST2700 A2 the BootMCU changed from SPL to Zephyr. Because of this change=
, we need meta-zephyr integrated in the OpenBMC build.


We can probably do that.  Which recipes (and/or Gerrit changes) are
going to leverage this?

--=20
Patrick Williams

--q1UK+C1hHL6Wa8gC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmnMEK4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZxmwP/A23GPCtsa0LGicZYBtU
AcK/IBcvg8pS2eIsTIByR8K360pAh6QRRM/d15jKFD5qFjVnEF4PGB5Liy/cSMpY
d/2PX6CJjw1jeH49TbQpOEAiqpZ21xDCIJp0qZ3cTJ2Oi2CSY4bl73siOoALQa7w
YPApoenw7TWgIe1kicfeO2XTvo6TwJ7CIGX4MNN0hg2RihJKqPynz2d0NevqJCKT
SHdAzyUZPLrmCeEN/cjqwyzY+mAcpk8MYNfQXv3vXqrrwzInoxCOhBwX5PMAxSrh
X3jiIO3KtA5X1eSQoVC9Pc+0zqAIncLoTSSyOvBbXL9KzdQHRc+fCY0NL/nIGS4g
TvCOVqWQc134qLxbpNTNkx3t/fNxp8FN1I4N+cu5Q+NYL2/jI3yLrr1q2shgKSDW
aFEaV9E3kVPAQ2YmbKWiXJlVm4voVhrm55IrwdWfhpfrrkWzpBQeQ1vicVBBBc95
owY14hs93p8t+QQ9lDmnVKYddPAhPEm0zJWhrPKwinvBuoYJrvZno3sceO69FXYj
YeT5md3EB9Po2TJE/qtISODiNQdtSTtwZXoHW8XjQ0StgXhb7EXRme+OjnOZj6SO
3cTTi4ZlPssZ5pN3CJtLhpGB/RKFegmR104uV9FlRFNnQQrYzvF6lPrEyRKlSlO/
+E6EEOriW5pERBPDX3K3JO00
=sqmH
-----END PGP SIGNATURE-----

--q1UK+C1hHL6Wa8gC--

