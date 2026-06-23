Return-Path: <openbmc+bounces-2129-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38A9CDB470
	for <openbmc@archiver.kernel.org>; Tue, 23 Jun 2026 08:05:38 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gkyL33kN3z2yT0;
	Tue, 23 Jun 2026 18:05:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782201931;
	cv=none; b=ZA8LJpcHrTlGny9yvtXCJDowLw8X9yOKQM+ZUI7EWgCFnCvVZ8rd0mZcymwgSs/nww3eThw/1RgrFNzPUZmCwPXyimIHvq+P5ZKxAia68/iHcV9tWMz/GeJBl5eHjpPvVoWc2OeXwihHBLGhTuPIjnlhLc1E1EZZwEuyx8Wa58UmfRiMBoDhdb01JoLuzubRiFTjV2mo94LYj7B2kJldAPxp9UgXIGQFICFBeYWXaBvvHwlbINtIG+c1SwFi4Hb89JQFC5nNxbRY8lE6/uFj1TefwYWk0o7rF9LQMgfDdnL+bRWs6ofmyOwi5+1NzGI/j77phMOT2JI5wCiRZ08bCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782201931; c=relaxed/relaxed;
	bh=1aHtGofhHLMB8j7InSkqYYRn7GlNQy+IpF/+m73egvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBEbLvKCXBJJKH/kXAgru9mVxs4anI+DoKBKC/yDH0eHVZHpSBJw2rrJCO3fh0aTLPvPBkm1vk8FRYoRu21KRIEm/jFKRygm4cZtlzytO0oXnhhegeXR/9LRPGCMlmMxuCjvuv1AeB/KUYz/JkNMnB/Y0dPYMZtL7cLABlPReIe49rD7bScMJ2W1fuXJ1qG6BHqakos2ANRl/j/z/Adl/EngGxaWullDaB9KpWQPwKSNxR/apLhpaGujMJ3SfrpawTg83gowywOPylUIgEfmbUYrj9XI2j2A+dGvRrrKQzn400+McqaM07J9ju5IjIBiTg47++69UOZ88EfJzyZkQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpPTKrrU; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UpPTKrrU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gkyL23vdCz2y71
	for <openbmc@lists.ozlabs.org>; Tue, 23 Jun 2026 18:05:30 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BC3E60052;
	Tue, 23 Jun 2026 08:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A6D1F000E9;
	Tue, 23 Jun 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782201927;
	bh=1aHtGofhHLMB8j7InSkqYYRn7GlNQy+IpF/+m73egvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UpPTKrrUW1rshvAn7yi8V2OoPID98lpOrMAsL+vXA8/m3fBcsYLSJUaFRhKdMj3BS
	 yrQ+N/zkwkx1TL9mJF59PUNwuIeGb6eQO832wNTCO9Ydik+Iqb++Y68khZ2fmZPSB3
	 8lx8UcdaQPcpOAj/iXTAE5LDcTgGdsRePdjpu/+8fh+9tWkmvOyuzFPMCH8bWgdVz1
	 u6rwIcHrAKjMLkOFQKCVhQJN574oBHShYVIAuaBQHfSDtysW8Q8OEHl1helhH8vvzw
	 Fz6QiM9vg6WEU80bozpJplfrkx0PNNqbdphZs13yExwrTj9kZ/p5mat2h5XHPcVHHY
	 IarHs2rY6eoSA==
Date: Tue, 23 Jun 2026 10:05:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, wim@linux-watchdog.org, 
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, avifishman70@gmail.com, 
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, joel@jms.id.au
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon
 property
Message-ID: <20260623-ochre-spoonbill-of-security-a4bc42@quoll>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
 <20260622083046.3189603-2-tmaimon77@gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622083046.3189603-2-tmaimon77@gmail.com>

On Mon, Jun 22, 2026 at 11:30:44AM +0300, Tomer Maimon wrote:
> Describe syscon property that handles general control registers (GCR) in
> Nuvoton BMC NPCM watchdog driver.

Why? Well, you try to answer by saying something about driver, but we do
not add bindings for drivers. Instead hardware should be the reason.

Anyway, why is this needed now?

> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> index 7aa30f5b5c49..4f00f099b2d2 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> @@ -40,6 +40,12 @@ properties:
>    clock-frequency:
>      description: Frequency in Hz of the clock that drives the NPCM timer.
>  
> +  nuvoton,sysgcr:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
> +      instances.

Here you write also for what purpose.


Best regards,
Krzysztof


