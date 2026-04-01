Return-Path: <openbmc+bounces-1770-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82684D35176
	for <openbmc@archiver.kernel.org>; Wed,  1 Apr 2026 11:39:01 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fm30Z607gz2yZ3;
	Wed, 01 Apr 2026 22:38:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775043534;
	cv=none; b=Zmn5xG2pk9+50aV8mngBSAmUsjMlFzSfVfg7XLb2gAVMqrhA73ym8P5AR/1YQlO+bZ+owjnq3jeTeD57R3bltWtaD4rSQJTUqugWPx3iECUUqakuhuxGfSTyEErjYBXGcLzD7M9yuKrq8O7Xd5A0Iw11GbcL23atVpM5lRMWwm8DXaqbwYU/bDpX1MDIymTAAAEh+OjcDO37yjd6WtsFIsQr6ZEs2tqhGozZ4jF1qgCsCdwDSIxHthpqH6wO5BDIKV8gcPnXjqQGL1HZNC8hxhZcbF/PHLas9s9VhsW+/+jCf0N7ACGw6uHGib6FxgtZ62IWPI1pSjEW57fX/dnTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775043534; c=relaxed/relaxed;
	bh=WZlK0l2SQ5n6NAHhyhxOVABRZk0Ta297xVqlhIniAOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UrtkHwDF2fFWCZFhukexda3FrhIlgQ4IQMXNI2nEXkPdK1R235cQITYJRKNilY8QTo0rNlt45+m4GKrcOFO3x1v5ydubsmXvMwtD12qx6Zwpv+aZqv8JrL/k3SxN7f5NflSUB5abaK/IGI8Hg3Zau5jnS6v47Rrrqi2lo3vMx5bTqd0qk9p8QCQJVNCD9U2bpLbbX2lPD0CZA2bLcr0a7m/SaFZNost4PnfcJdKRM4INWzIWqHweL5TO59LLbBwsAT5ZNPo0wZ6KTaTegpXdc97HsRHeJuJty8seMS66w3ErWh4o56gye2LgmwRirCI98h6QPbn5TbzBApkFymjBAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bGi3bXl3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bGi3bXl3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fm30Y593rz2xLt
	for <openbmc@lists.ozlabs.org>; Wed, 01 Apr 2026 22:38:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1365F60142;
	Wed,  1 Apr 2026 11:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65000C4CEF7;
	Wed,  1 Apr 2026 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043530;
	bh=vwnSiQZ99mUCmzzXqPBktCwlYG0prAlCiZI4JiplVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGi3bXl32jS6aAj8wQqLELCva0RyJe3oApGysu2vvy4MKOmnhuzOReKgG2geCtADl
	 sSSu8CFoh3SJEMn5flLhlSoJlngkewar/8WjmgrNbf6UOsDJrgE3MNsvy2D2YtGbb5
	 e8xe6hOfsyhZze60TlyAFpyvzFEAqZrs7j3EH5vf+RHiL8AIjuteCtzhA1hQAs62ix
	 S0iTLks/UZRSg9im5ctkGUeW7mB469OR6X9BWgSFNiLQw69QOGsNFaa8bm0eIQSHGl
	 geFaPwwd+rQQasVz7H+Mj5pk9/GnJMOGxRUDrjCTqwHcyDocvilnEJ2U/UoRZ+536i
	 YiolfgPQ+DDxA==
Date: Wed, 1 Apr 2026 13:38:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for
 v7.1
Message-ID: <20260401-resourceful-fabulous-marmot-e26db2@quoll>
References: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
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
In-Reply-To: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>

On Thu, Mar 26, 2026 at 01:56:03PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> Just the one Nuvoton devicetree change for v7.1
> 
> Please pull.
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoton-arm64-7.1-devicetree-0
> 
> for you to fetch changes up to 6ee3f20368a4a6198988a54c1a744cbae1354359:
> 
>   arm64: dts: nuvoton: drop unused syscon property from watchdog node (2026-02-23 09:43:36 +1030)
> 
> ----------------------------------------------------------------

Thanks, applied

Best regards,
Krzysztof


