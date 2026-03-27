Return-Path: <openbmc+bounces-1735-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D2E10AB838
	for <openbmc@archiver.kernel.org>; Fri, 27 Mar 2026 01:20:32 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fhjWF56yJz2yfs;
	Fri, 27 Mar 2026 12:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1774574425;
	cv=none; b=WazpnnxG7FXlrEdrdoG5VSEKX1d2gqiTo66cw6q3oBC6tGlH+0ZCJUiYlqOpgApyoX+holp7VBH2Bs26Hn8V08Z2Nog8Z4TN+EIqOL56LuFjpsnLivq8XJOBLZv/RoqsxNgkgYsbOMZw12Gxh9GYAEIGHzEhovr/Z3I2XxipBoYoqQVTYaSJ/Log7DGQ8NMXVA4n+ARwlGigumxPMjWOfKFNU8aOre5lMZ73rrR35huIo0rkcVzdbLlhTRqKdLqTqhGZzl3o/jDQeLwkCT+o9kyf9CAJcg3AQyrdBBvsuQwk6Aes0p+EUjNaTvemz/nSyx9/uSATmBYfU4yGm4u0mA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1774574425; c=relaxed/relaxed;
	bh=w3SMzl110oCfDPITW4AHEvNNItFKeElG3dLTy5N38z0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=g8qDduiHHEc4hvtXpisgnhTBpzeGLaviK81ebzZ95Lffl+FUqI672chXLOII9orggtH/ghxzQABYg7jlWD8nR8dnzF9kR1GNt++HA1eA/r6d5TyRfG77s/0xdEy2gQdaW8XJ3xsyhKqETk/QsWuhhSCXUSYXphd/laU06VCDswc/icME6lji/m8x9Nw/MYV7VVEQZCuw07+blh9Ib9w7nMwCRXrFs7NZDrGutbEqms3wX41fVAvx4jTCfCwJ/ZgcMDqW4OXVM5rQc0jbcUEe4R7d1SBVm8Z1lxxuhTSsa4ufNjwok8ZEg5IjGNDZDJAJVea2Ni+ucw19TmZNXlgdWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iCfhDqzk; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iCfhDqzk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fhjWD5rlWz2xLt
	for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2026 12:20:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14FAE60121;
	Fri, 27 Mar 2026 01:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B446DC116C6;
	Fri, 27 Mar 2026 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774574421;
	bh=+mbG3eLMPAF0Yt2+SNkDC2ssfDgwkGm8vxuXyXfcop4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iCfhDqzkhmcNkYGWkj09iFJq6rCEDt1dbAqTatJbEGc1rBoXetzKDZOXuLpBFjiME
	 a9P8LcR9NdgAj8rW2IuLq3wUmWDVOgSGvBI3IBLemkAhxfETD+8YAB5qMQUx0mXxQQ
	 Z1KX0X7a0FY5C/oSovuXJUNuz+9HL9vMTvfhtdmSwUO6tI3WhvJ9uUYU1trF5TKJ1U
	 iq0MgVZUAAMKnMtahTCAX/2yMy7tmHEqIv/Bb+X3JWttgSheCwjeNIi2kSQ0wu+ypW
	 49ihEaPrekoIUMIhBS9G/ZYoXAGC2NF/9eFI+t9r0qQjQGVlVbbvT4QGfSW740gtBt
	 XrNoUx3Y3OyPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FF6E3809A07;
	Fri, 27 Mar 2026 01:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v15 0/3] Add support for Nuvoton MA35D1 GMAC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177457440804.3248049.2435571505438713021.git-patchwork-notify@kernel.org>
Date: Fri, 27 Mar 2026 01:20:08 +0000
References: <20260323101756.81849-1-a0987203069@gmail.com>
In-Reply-To: <20260323101756.81849-1-a0987203069@gmail.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 23 Mar 2026 18:17:53 +0800 you wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.
> 
> Overview:
>   1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
>   the platform's two GMAC interfaces.
>   2. Added device tree settings, with specific configurations for our
>   development boards:
>     a. SOM board: Configured for two RGMII interfaces.
>     b. IoT board: Configured with one RGMII and one RMII interface.
>   3. Added dt-bindings for the GMAC interfaces.
> 
> [...]

Here is the summary with links:
  - [net-next,v15,1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
    https://git.kernel.org/netdev/net-next/c/8454478ef9ab
  - [net-next,v15,2/3] arm64: dts: nuvoton: Add Ethernet nodes
    (no matching commit)
  - [net-next,v15,3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
    https://git.kernel.org/netdev/net-next/c/4d7c557f58ef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



