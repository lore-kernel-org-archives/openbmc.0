Return-Path: <openbmc+bounces-1908-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F95CD4855
	for <openbmc@archiver.kernel.org>; Mon, 11 May 2026 23:51:35 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gDxMC0xtfz2yGT;
	Tue, 12 May 2026 09:51:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778529907;
	cv=none; b=EEJZjs9k1g9YlG0N3+V6nEY6l4/Pm5s2XG55+okku6NNuLdSNbKHZL/IXHgtDtCujOtzzVF1BW7YXMCJTe8vAx5J1FtCtOxrQ3AeiT53W6umaTScyoawMUJh1W/oIj1+CyVGSqaMyE/P5vOQQhpcM11LhRdorh2oC8CXLdAbEuDt3g9cq42rjVxza2RVSYITAyzWfS4P7A2/5MJbduOLEavl4Al2C/e4+Imynmn3Rwd0TXPENwRnCkRPFSZ967ChkMqaoBmQXlbnBsz5WRSbcMYzpBvqjcg86oh7MINGi9xBwdyQvKYApWgHg7bq9JymmKBlXzlxPykhCtB/bhL8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778529907; c=relaxed/relaxed;
	bh=vifrlnSm2hwvPtyavVza6RSqJuHvkSa7YEqnDg6i8hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihzAaTGy3e8VTyrQiZnHuxB3KtcDRKqQxTrp5xRFJKb7wtUhLBt3NVsIfL4+D2XUa+XZ1dm13uwn1XiJc9Rx2cZ5N9KsPv8zTGcmKfV8/bYBA6r1VixMmszCs5RZLXl7WPtxsfWVuttkAIpZUV4cyYLkyKkOwOAi1+tv5bmriryrHRZvethle9yiZkSWtzaI3EB44s+NzaTAzRKC5xZeX6zKJDPMXpygxDfOQtiTRlnTxSdAEh/6Dtn+hc4ZvwboEvpqoMBjuvg113gKdurkIXyCO2n0ohwMcVSIq0djTDHgHZp10Zd70qgT2KUn2PBLnJSmbHctoUiWzb6NhxShxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nt3Ua8ch; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Nt3Ua8ch;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gDrLC0HLkz2xQB
	for <openbmc@lists.ozlabs.org>; Tue, 12 May 2026 06:05:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AC8660120
	for <openbmc@lists.ozlabs.org>; Mon, 11 May 2026 20:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48226C2BCC9
	for <openbmc@lists.ozlabs.org>; Mon, 11 May 2026 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529904;
	bh=vifrlnSm2hwvPtyavVza6RSqJuHvkSa7YEqnDg6i8hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nt3Ua8chsChWviUtf3nByVpkkunRyWEk+lT4AotDC9Y05Z3PHcf4uvVkTAmdFJuDv
	 s0KcDVTcLlF6KKv723rdN5giJIJLedqFepwwUSt9yplhxFPiNWsVhOtEd0OUoygCsC
	 9A+yD2JsJ2gqpGysBftNJ27epa4O4oyINB0D6HGTZ/355ObItcJrciIx4zF8LAJRBd
	 H1PPFlmgr/uTHGxyIpf6cX+sDcQhcPLsYt6YhCoOQwAigAocoMdMXzoCO75pyc8V5u
	 Iz5LD9vcUWvh8HzOLBEuXOZIw23m8RPWXzpxADikZnwyd4o5qsM2hf3wIENp7X0URd
	 jMXZsTsI0YMpg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e97e73234so43580551fa.1
        for <openbmc@lists.ozlabs.org>; Mon, 11 May 2026 13:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Q0a9SqM6kqRx0XLyy8ICAO7nfKDdfqmkwxkDyRAgjH7CPMV1fERstjoQxYO8N9vXY/u9GtMAy@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwYNjnWarYOdaTuUwUYiUiKrmRqq+j8/VwIYfJxzEvXhk6jDOz5
	/f3kCCFsrjafSPF0bXRW5tGf3yYFjVS3KJANT9fCsadpAt+6dIfEeiSGiKIG+vgLRKoULkjswof
	i+R5pWBnB533tF6WLJxW4RGzluG1o3PY=
X-Received: by 2002:a05:6512:3b21:b0:5a8:6793:e701 with SMTP id
 2adb3069b0e04-5a887ce64c1mr7724276e87.33.1778529903006; Mon, 11 May 2026
 13:05:03 -0700 (PDT)
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
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com> <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:04:50 +0200
X-Gmail-Original-Message-ID: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
X-Gm-Features: AVHnY4JtxK2F1JLguIEb3zBOcAZHVynLHNdMopJnlqbcSYRx0cEplr-yGb19hdA
Message-ID: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 10:07=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
>
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
>
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
>
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is an MFD patch in the middle of a pinctrl series, I think Lee
should apply this.
FWIW:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

