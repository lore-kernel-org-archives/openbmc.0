Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F024606A338
	for <openbmc@archiver.kernel.org>; Mon, 16 Nov 2026 02:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J0yzZH2t
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jSWrZ5ZDfz2y32;
	Mon, 16 Nov 2026 13:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1794795838;
	cv=none; b=YInIR9lUAuEVuB5n/9NL66I3fJjD2LMVfX5s2ZMsnTLiQa09RWRq5GNNDzZrrZfKgg4k11q1DEKvpsWJpVcszMRlLoCFu1EJzx5U8KwuZJA3f3ym7f3fUhUhDKC4alwqczMey7Ys8iU/y0HvHN3NWQpmmccaGs2cRp6AabbkvTpjtbWypdXOM8LAFA8tSd3qHUcId9IIeuNfSNfdjaadT3y+Z7PHNx9eq+dVbUICK10kd2WlL76trpjhI/MljaoliyreexlRSsMTbG4j9B1H8g0sQjzoWsNNZATVheS6Oos3K6ihZfeIiPaPgwJXhC60TSZVvRjOhOf/Uqek2Ln2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1794795838; c=relaxed/relaxed;
	bh=EDZwOZg3Q588TfuL6t6I4Cnp8t5eHtm06GoFr0ORVGw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VWE67NXb8qiUBOxrh7eWwymSnSO8oxtZVwqRc9VkdLPWpcaTidKIXfW9D3Gb2xNwrubEX2382RQSVnC3b/ve/4tPZ56Qu/fAPleYa9o10lSDextcNLJ0uVGaFHNUlKjMclIbEn+OoZ4mWBGSrdD2ivcIRhg7SjI2aysvHIJrS0IJpg62/lUgiecPQORrbrWUi5XDuqHEwRl9osVfffkGCfSYUIOGIxq755vGSZOfP8OoklGZkmYbrTd+3A98VOds5mkvM89Emfyw1WaPCH+FAABGwyQfITeStsqgGGaP4WMUQL2a+6823aVERYKy04pfNu7t7sxih+kkHFqABDuJ4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J0yzZH2t; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=J0yzZH2t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jSWrY5D47z2xnS
	for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2026 13:23:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794795836;
	bh=EDZwOZg3Q588TfuL6t6I4Cnp8t5eHtm06GoFr0ORVGw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=J0yzZH2tpszw9jZfgMqWkW7cdyUQyx/N3Hj6z5k9lO9xoPxhRjFZsZsdkVoXU3QSU
	 KtV0WDezw2K8WwEawaNgJv055iJP533IryI8Y2A/yU0nTrkRr1bXP3N4kqpWWd9vze
	 G43DfaNmRVCeOdh6QGcQOqcOQf6hPG8fI5/tmcgilTgQlwPotEAj51dBgpRkxKtnbf
	 3RrlHabfCFbolRCZ6/kfovjiPDqvyxCuSFETrrVpPSv5yeP5H/S6JVr+3btlJSObf5
	 KpUEmJlVlSmSTNniZxwgzR1bumZ743UqZ3jsmM+AasvHKZMC84h0UF0btB7tAPMDse
	 m5rfUyZAFD9fw==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F007160070;
	Mon, 16 Nov 2026 10:23:54 +0800 (AWST)
Message-ID: <c258e51ae4639bf269aa9d2cedd50a625ddf0968.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 v1] eeprom: at25: fix read_poll_timeout()
 arg order
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, eajames@linux.ibm.com
Date: Mon, 16 Nov 2026 12:53:53 +1030
In-Reply-To: <20261015172656.2586295-1-ninad@linux.ibm.com>
References: <20261015172656.2586295-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
Precedence: list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ninad,

On Thu, 2026-10-15 at 12:26 -0500, Ninad Palsule wrote:
> The arguments to read_poll_timeout() in at25_wait_ready() are in the
> wrong order. "false" is passed as sleep_us, while the macro expects
> sleep_us, timeout_us and sleep_before_read in that order.
>=20
> This makes the loop busy-poll instead of sleeping 1 ms between reads,
> and shortens the timeout from EE_TIMEOUT ms to 1 ms, so the wait can
> fail early.

The fail-early behaviour was what you observed? What were the broader
impacts? Put another way, what circumstances lead you to discovering
the bug? I feel the commit message could benefit from more context
there.

>=20
> Pass USEC_PER_MSEC as sleep_us, USEC_PER_MSEC * EE_TIMEOUT as
> timeout_us, and false as sleep_before_read.
>=20
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

I recommend adding a Fixes: tag too.

> ---
> =C2=A0drivers/misc/eeprom/at25.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
> index e2868f7bdb03..df8daa40b0e1 100644
> --- a/drivers/misc/eeprom/at25.c
> +++ b/drivers/misc/eeprom/at25.c
> @@ -209,9 +209,9 @@ static int at25_wait_ready(struct at25_data *at25)
> =C2=A0					=C2=A0=C2=A0 SPI_MEM_OP_DATA_IN(1, bounce, 1));
> =C2=A0
> =C2=A0	read_poll_timeout(spi_mem_exec_op, status,
> -			=C2=A0 status || !(bounce[0] & AT25_SR_nRDY), false,
> +			=C2=A0 status || !(bounce[0] & AT25_SR_nRDY),
> =C2=A0			=C2=A0 USEC_PER_MSEC, USEC_PER_MSEC * EE_TIMEOUT,
> -			=C2=A0 at25->spimem, &op);
> +			=C2=A0 false, at25->spimem, &op);
> =C2=A0	if (status < 0)
> =C2=A0		return status;
> =C2=A0	if (!(bounce[0] & AT25_SR_nRDY))

I can't find that your fix exists upstream.

Can you please send it there first? Then we can backport it once it's accep=
ted.

That said, it looks correct to me.

Andrew

