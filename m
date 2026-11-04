Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8FA606A326
	for <openbmc@archiver.kernel.org>; Wed,  4 Nov 2026 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JI9ehEr8
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jKhfN71J2z2yHD;
	Thu, 05 Nov 2026 10:36:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793816630;
	cv=none; b=oJRB7ZllsJRl/Nz2zJQ/k7/xjJXphufg8CnV0Vfbbrti8JE1Vksu45TTzbJIAP9GfqKwmf4/418LQFBy2eCloYxGDGEcjrMMSP9+ok4u6imzgRIP3iD/P30w0erkDpLvEis29S2m85zOZGVb8/tm+JvC+3r6SXaCQoixwLfpQ2Z4hUkX7XBcymjvQXQ/S3LM+JE234hZg4/v9vl8giCQrCy1yApmkis31CKb+EpFtCjFVeC92kcfmUdy9eyHjQXHoCKmYL1PI8xmbXlvtaDprdwsyci4fP2kvSJUK0Hf02lqSKNbCMuiQyegg4sfXTFM6n1h+dhDDArkCmTf1UMudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793816630; c=relaxed/relaxed;
	bh=vXyx2T4UR72mVWVvmoBUBv3HGxL71fOOQ94CZu64Cro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PftTecEKwV4ReKzsVmo1212VCNCrU7IN/+HLShVuadfwPiakA5hrtisPBrjp/a5m5McWC9/MM6IW6GLG0i18tL5OWrHFZxNpiVOSSnnf2Dazl4vZssFkOiUmoXkGsfFe8S7Nxxz9KIR9Ww1yL4Ev6eNEZFfNTY5Fbit0x7fnCFf2PhMZUhJ6R9npivEnR7Rlq6SRmVkpzsxKoFQZVAMbZLQoILJaWbigmtlRq5ECRGZ3/zTSPnP/icg052pOh7Vb7r02pn3IANe5SuVJYaxoobQlneH1X2nSgmXr/H6/JUvRpBimMqn1gAllrqE65G1j1KG9pu/AjqzMPvo5SkJ96g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JI9ehEr8; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JI9ehEr8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=lee@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jKYjd0t2pz2xfX
	for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2026 05:23:48 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 601706061B;
	Wed,  4 Nov 2026 18:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887961F000C1;
	Wed,  4 Nov 2026 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816626;
	bh=vXyx2T4UR72mVWVvmoBUBv3HGxL71fOOQ94CZu64Cro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JI9ehEr8eTuaXJxJTip0PDNwG3c0pChwMKgzIFOscNO5pB7vuyVqWXYs+GPAG+qLG
	 i/HRTxSBY5PWQjj8DITE/tGEaB/D8AxMnWFX9nRe29phuP4ZivWxY5DXN/utwkDg5v
	 W1Hl2zrAX5jeCSPjAVh9xg/GisHWFS2P6ctGF/raCKG4kvJdWGBupgfpIwc2aMmwNJ
	 AXvNmZueQ0ggXlJ68dmpO2T7+rWb6UOFOq17Svt9ECcd6T6DIqDrj13ay8sXul9kpy
	 NF3EFQqGdYI7sPu5fvsn/3FjL7CWYX0iqf16Tjw8ZAwOS0D66cScfdwqND++PaGzWC
	 s9hIFyyBtDimA==
Date: Wed, 4 Nov 2026 18:23:42 +0000
From: Lee Jones <lee@kernel.org>
To: Vince Chang <vince_chang@aspeedtech.com>
Cc: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au,
	tan.siewert@9elements.com, Billy Tsai <billy_tsai@aspeedtech.com>,
	joel@jms.id.au, Rob Herring <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH linux dev-6.18 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Message-ID: <20261104182342.GF1650678@google.com>
References: <20261029031552.515601-1-vince_chang@aspeedtech.com>
 <20261029031552.515601-3-vince_chang@aspeedtech.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029031552.515601-3-vince_chang@aspeedtech.com>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, Vince Chang wrote:

> From: Billy Tsai <billy_tsai@aspeedtech.com>
> 
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
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Linus Walleij <linusw@kernel.org>
> Link: https://patch.msgid.link/20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com
> Signed-off-by: Lee Jones <lee@kernel.org>
> (cherry picked from commit 2611c4d623ba867e196a4146f1927c3c468ac2bc)
> Signed-off-by: Vince Chang <vince_chang@aspeedtech.com>
> ---
>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 114 ++++++++++++++++++
>  1 file changed, 114 insertions(+)

What is this?

Why are you sending downstream patches to upstream contributors?

Please check your `git send-email` settings.

-- 
Lee Jones

