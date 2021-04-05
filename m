Return-Path: <SRS0=/F2o=JC=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67434C433B4
	for <openbmc@archiver.kernel.org>; Mon,  5 Apr 2021 17:27:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF74613B3
	for <openbmc@archiver.kernel.org>; Mon,  5 Apr 2021 17:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF74613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDcz66Nlpz30Bv
	for <openbmc@archiver.kernel.org>; Tue,  6 Apr 2021 03:26:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=leu1NZKA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=leu1NZKA; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDcyf42R9z2yjc
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 03:26:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617643557;
 bh=8QwlMiwX64oOcfsj2nl07gpYTlnVUHSkHQ00+qKlIHA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=leu1NZKA83oVQvBax3fQh8/KhBIOpgI8yFH0XR7YiVCUTBDumqdfxFet68gu4HFqh
 7QjX8gNLS3Bpxumn+Ll2r8qOZF3QVq56u0oPoA+4F29qY/WiIg2GIrMZRCIEvkBZHu
 eHrgS9Lw89IRNyGMS2X8Y24aQJJiZFi66Xe90Twc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEV3C-1lMMVb0QSA-00G3rl; Mon, 05
 Apr 2021 19:25:57 +0200
Date: Mon, 5 Apr 2021 19:25:54 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 08/14] irqchip: Add driver for WPCM450 interrupt controller
Message-ID: <YGtIItromiJcS+D5@latitude>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-9-j.neuschaefer@gmx.net>
 <87sg4kiia4.wl-maz@kernel.org> <YF4tV+L71Lso94kT@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4AQSdZ92OjkaqPvH"
Content-Disposition: inline
In-Reply-To: <YF4tV+L71Lso94kT@latitude>
X-Provags-ID: V03:K1:p1zHUkzRzxzWhOD4bcMwkzAZtO7KGswuN37odQTC0atpBMA8ci5
 LEc6MhivxABtKuMCX57keE9YN0S3rc6kPe6HJY6RfqY9PGU3iapjVthzFUtlMZJT9QUSvPU
 jSSPVdIwOI0/oUr7gk0brc3cmXvyCDFdyHHJ9cMW3tsYym96GHhDK23aMBtFvN1nBQHu+9B
 Ip1j6UZ6Ca1X5cDneGXNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LEYGygEwAss=:nAcSOgt9vVvnKzvM2NKjWi
 DWCgDTDGySGY/P0pl5rDlA75Jq/4JAYlwjaPbi4dfh/zrlHb3soauvWeUzueFKBNeVkQUFNDn
 zXTFx7FhJDMYA+aMUL4Yrw8RLOzPPoTPEESHx9JrQCAdf/alqdR4sNEWjxIhiCEpv4fO+zy9Z
 lJkP1v9om9FTqbrfabh5kvnCoxxisqFVBuQQtlXFtria89Mn7gSwDtl+RmudRXkffstv+ujOm
 mkPvk0lzpsBSDHC87FmYHtITnR9R7R/+4kzktGhQ+Fq8i7HTX3jkFEbkeSjaTkCCPtDNdRAs7
 k/vBnLyO/0IuZXDG2JwzRWIWa4J1o3+jqw6TkYeBumOJ/jZJOrQqa4F8LHv9rLOx5v0guDhfd
 8zc2lx9V5rRDDQRnE2mJXURKln/di0722mI9VIVSEFhvpde87ZfrP41wRd0srDdvuFgPsE2mA
 pWynGs+eNMQmZwWq7x3XpcfVYeorfnfov06Wrvy/5SQux3iCUzabVbXygtvF0j5zSKx8nYGl7
 TrFrJM8pKQMOUPqntS4RC3aFY/r29Klae3Z4yvnlWLZcyYZ4YnQezQASj2pnst4umO6KZ7Tij
 Wmdp8Eq56U0JG67wISWEtcQXqc2ig+Q9MbXfm0k9cJo6NMNVgRHTkyhbHWct4Y5cvAlKPsdhK
 tiUlhJ4UPRgUpSyvgYWPWlkRYt3LRh1axUvaXqNBU0LUIChtqfupjXwK76DLF5+8VJlLV1b2A
 TN2Uvh3nzg3fV5xgmcaRsUE+Z5KZiqdWx2LWuZ7ykaQQSc5wFJZgzqRnOJ9vS4RWxvOfTJZQQ
 oy5X37tQdHvZrUlywakBKH80o2McRs+BRxSn0TlE2B0MixJq22k5hUJWNY5ClwZ8p9xqCBBs4
 JoaLwFGFReYWw9vGauMskXp/24sA1BMpo+EYmsz1aMjRsI/Shqew639tqmXExBGjVPbtF5RAM
 q4yA0bmPMG5uNRdXJOFCIMCdbD/VF4Ctv2voG0S4ihg40y6i5M4995a5Na7ddJXOTg+nRk9ua
 xr//z3T3EztUAKczBTVz2ZVEf9CaLkbeP/WOwCZQd3G9HTOgXZQWXxu4/QcMTGqwqxyEj3TE5
 OOU9GL8hZfitFi1eAKY4VjEUtHins3VnkEsH/BEYjE8OgB03+/zFhSAh29m7TseOu9A0l4xJ6
 iPh2k90ybYZCZ3ma9EJBnAZB+TAlOIfZk0EaWGRD2CoOjUX8/sfaSLwcoWM9jUoXzaxmnwXhq
 rwC9IXGN5eU41O0MG
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Marc Zyngier <maz@kernel.org>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


--4AQSdZ92OjkaqPvH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 07:52:07PM +0100, Jonathan Neusch=C3=A4fer wrote:
> On Wed, Mar 24, 2021 at 05:16:35PM +0000, Marc Zyngier wrote:
> > On Sat, 20 Mar 2021 18:16:04 +0000, Jonathan Neusch=C3=A4fer <j.neuscha=
efer@gmx.net> wrote:
[...]
> > > +	/* Disable (mask) all interrupts */
> > > +	writel(0xffffffff, aic->regs + AIC_MDCR);
> >=20
> > Consider using relaxed accessors throughout this driver.
>=20
> I'll read up on how to use them correctly.

Upon further consideration, I decided not to bother with relaxed MMIO
access, because it doesn't make a difference on the target platform =E2=80=
=94
Nuvoton WPCM450 with ARM926 (ARMv5).


Best regards,
Jonathan Neusch=C3=A4fer

--4AQSdZ92OjkaqPvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBrSBkACgkQCDBEmo7z
X9svMA//YAXiLbUioLglHMBqqALp913Rk+qnWGFNbggq+N/o12D5AgmjEMuXRMqj
9r2hi0SE0lMlyjpG+7Q70vFsMJKPiWMgvwpMLcxWaJLKGwL6759OW2jUBFrjwZbw
Vg3eIVsojbGs/hzMc82tt8C4IX/W7VQQLm1EXAiV7sPGbxphtUNW0OzNCY6KxfmU
5oe9klAgO+wONS78TNYK3Z9/o+036xkE4KuZFCpgZv8ix1HVwe2rThUkWoh732j/
d9Nz3NPib84pW+UtVMuKFqvuLdT3j9QgdXV5cBVw04cHDhGfwsXyUDjATan4l5+Z
9i6wmQ8IPXcH2pYfC+6bPjBDB2clfl7iUtS3wUPAdUDwlqi4CLt4dYr3PyspxlIv
3YVsXQdQz69yibd1Y4UazSkGgTPZ9hSVYTUTfDPIU2XYPQPQjXytm6UZt0L9pGIk
SGqgt7o/5Dfry/quguTYLhBZ0YrNFZwBsfSWVMqbEa7ulXqswCAtRQ7vcpaRpf0v
2k7Rb6ATpA3ZCGUrued2urctadlw/JwTJb4+7/lnOS1AUpEjWbBmyWuhkcmBV5GW
Kj2cSEwsFatxri77E5KNE1gSK/dp1PLuYaUEuh+WWBJkouYojtflNwKkl69Jd2Vp
q1SupFHoy/jzmqJb6wrrvJJtyEHxB6og0uWNFFilj/fNpuw54cY=
=javG
-----END PGP SIGNATURE-----

--4AQSdZ92OjkaqPvH--
