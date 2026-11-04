Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F6606A32C
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2026 23:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKhfL6FZMz2yMK;
	Thu, 05 Nov 2026 10:36:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793794800;
	cv=none; b=C2TepIF6YRvtb3x8b0ZtmxSw86KzstThi2dDin6BYrTDvPAp+I/XT3VD2+XEjjdte+Q+Y9HDAXkd8XczV0+iZN9l3rxgl9Jf+N4oqa3TyllSttg3M0C0q+UnFQUOw/CfVKaqWv22dHFKWNK9DjcQAYA4Feg23kfZMee+KBRnHEXiKxIGjCvXfMmFrlKrWAeW1QvR7edZ0P0uLwdXlEvOfFD4vlDeSUo8+liHlwyI8OEXY61XEYv5dNpEOMs8OjAmkkxFwnnDMZB/K4/pnJLTWRcO0xnC4gcJyheR5XJcd67uGu3gGyRltQ981COO18u5DiNMYNyIZ9/yRER95ipk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793794800; c=relaxed/relaxed;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceyDfovl/ZD2AR+26sJbHHF7xrsQhBAd7tMJLDXmgfQ8oDDlGon+tv2QMtY7i02otSJdxTYb3YkRrHqq574tDrJjch5kSXPndYSqU7W+1sdUh17C3qY8BgmB8hQZMxnnvrCDI8lS7+BrnNht3kRdyFMtRFzx1JKiDQUkhqrq2/uX1Nboq2xkQSkQhJGKDL3FzyrnQOrodbEZV1hP/+eGnTFoERqgcJM6PTEHVgekAKDsPVtilqYDwa1SeyRDNRmF/g5ytIsFJaM2gZR+U9Y8BgMyPQpPL3IWRsQH1/OFjj+H+COCMitXEDazChuoebdejUGcfhSBOvc3lZ53C/ROdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKPdq6GQCz2x9c
	for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 23:19:59 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B923360F28
	for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E171F00A16
	for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794796;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bYBN35i8rT5dyUuhJZ8BzmjlTk4ZuycAfAqFlWU0WkCYVmOaCqBtzm8g/W+99MB1/
	 75sEn6/l6QCC6cm9mgv7+2/mTAygCddkOUJHO+aSQ87vRvTjJUjW7o0zea5fOEKj+E
	 vUYzsmn2G/ZaqqzaK0U2n6pm12ZXxe6AaeQQfxHSKFTIh9cEJYOVNL9DHT6KLwBvFC
	 bbehIR7G3CAieHZv/3LCeSNp1CUOflXI7nZhFCXjxEUXe/lgBQD/WG5OFBZnzBaFQC
	 HNKZUEXuWn+/hM19KbSogcIUgtj+m+qfc4v6Ggym4gonZ6fbzK9XD9+zTv3FKs4Phs
	 1M/I0a5yEN2YQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be416e603cso379089e87.2
        for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2026 04:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxgiVDS4SvuvpjEFbUT+Xz8SDpNgWuy+5vbqvhmV1Haqal5CG8Sp1zjgtMKVx+j/JKHmBK7kF4C@lists.ozlabs.org
X-Gm-Message-State: APuU4Z8pPmTVhdhPhTtmpAEGv+wStfZGrVL4dRfe50JxfGWinMdQkwRv
	m1LWSfX5mfKFehqlyPyhJKH3L9ErqTTrPfrzBDsSuzMt/h/KlIrH+zA9b0ZQe+ouvq3f6LlER8D
	jlvhzxcwhJKgqfTDF1BiIbrOvSdGj3JA=
X-Received: by 2002:a05:6512:114c:b0:5bf:a28e:4ef with SMTP id
 2adb3069b0e04-5bfd956e555mr5361214e87.38.1793794795200; Wed, 04 Nov 2026
 04:19:55 -0800 (PST)
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
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:19:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
X-Gm-Features: AclHuK-CfwS_0wnxINSAmHAEPIJvv97Wm-Obrw2TLjMQq_EQye6jjyYuZrMjHRE
Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, linus.walleij@linaro.org, joel@jms.id.au, 
	brgl@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Prasanth,

On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> not provide working host power control when the GPIOZ6 pass-through
> strap in SCU51C[9] is set.
>
> With the existing GPIO request path, SCU4BC reads zero, but a host
> power-on request through x86-power-control times out waiting for
> power-good:
>
>   SCU4BC =3D 0x00000000
>   SCU510 =3D 0x00000000
>   SCU51C =3D 0x00001e80
>
> The AST2600 A3 datasheet describes SCU51C[9] as an additional
> pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> SCU510[30] is clear.
>
> A diagnostic experiment that cleared only SCU51C[9], preserving all
> other bits, allowed the same GPIO-only power-control implementation
> to power on the host:
>
>   SCU51C: 0x00001e80 -> 0x00001c80
>
> SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> or additional userspace delay was required.
>
> Add an AST2600-specific GPIO request callback that performs the
> existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> when SCU510[30] is clear. Check register access errors and verify
> that the strap bit cleared. Other GPIOs retain the existing path.
>
> This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> GPIOP0-P5 requests when SCU510[28] is set.
>
> Hardware testing on B650D4U with this pinctrl candidate confirmed:
>
>   - Remote power-on: power-good asserted.
>   - Remote graceful power-off: power-good deasserted.
>   - Physical power-button power-on.
>   - Physical power-button shutdown.
>
> These tests used x86-power-control with software button forwarding.
> The earlier board-specific SoC driver, its DT node, custom sysfs
> interface and diagnostic boot parameter were not used.
>
> This replaces the approach explored in the withdrawn B650D4U
> power-passthrough RFC. The new proposal changes the existing pinctrl
> driver and introduces no DT binding or userspace interface.
>
> Feedback is requested on two unresolved issues:
>
>   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
>      Clearing it for one GPIO request may affect forwarding on
>      another pair. How should that shared control be represented
>      and coordinated with existing mux ownership?
>
>   2. The SCU510[28] enable path has not been validated. Returning
>      -EOPNOTSUPP is a limitation of this candidate, not a proposed
>      complete solution for every AST2600 configuration.
>
> Is the GPIO request callback the appropriate place to handle this
> strap interaction, or should it be modeled through the existing
> signal-expression mechanism?
>
>
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

I don't quite understand the status of this patch, if it is still up for
grabs, please rebase it on v7.4-rc1 and resend so we can restart
the review.

Yours,
Linus Walleij

