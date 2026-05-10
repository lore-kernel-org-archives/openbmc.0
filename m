Return-Path: <openbmc+bounces-1907-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BE2CD37B2
	for <openbmc@archiver.kernel.org>; Mon, 11 May 2026 00:06:26 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gDKky3cmHz2xrC;
	Mon, 11 May 2026 10:06:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1778416309;
	cv=none; b=izMcDPT5HIWZbWhFukuZOhEgFlf0SOg0J3aCFL1akzSJYtx8r397hAzQjJJD4kCUCIhnlRCoaElTQ4qoZcDLKhtZAhhwe8rzTTelXIOOlZfx/JHzcdYw3ABfaFddmFoNVktuI9mN627/PeGw7+U2PWRQXA0xZ4MhsYuvo1XuHVNzEg1fa650HWPxMB2X8oo7JShPxkzD/2tFlEEsHHq63EJftXBYzZoMXJWIL2mKsQhh29jh2YrwQjtTvxWJPje7iCpH5R0qKJFOz37KUMikozzMcpYOiTz+AyJMaixrZO0/W83WYxj/YRVK6d5aCcV8xIvUwhu1WVUVmQe620oykg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1778416309; c=relaxed/relaxed;
	bh=CcDit2766yGx3WiHTpW3nOgNzjxcblP26K4FyWST/hI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ITL9sB4EjSfzUMn2ZWZvCZ6jh+kmtbgaKx+i5mi5agUgivdb46f+vQCXcIQjh2f9QuC1tmHIA4otZ1FcwXNEx2kkv7NcLj4FBz3D+I5GAnRcxkF92G1kWnw6OCxBKofu1Pr3rhuhDDtN037/cZmQp5MI7XKOX7LwuZVBbwU8+mw/0J10DG71U8iLexnbZBYveLRjoOKgtt2AqGSJZUMPFxdtbDb7PXutJ4/qqDgwWTaKUSm/7lcEa5FISVI5oHqbzIm6gn42BVMtCuOg11EvEWMIV5I9Vm+8oXKMViHlChGHTPY4cvUNk4b2VotmBu+nNRf2dtbBXl/ZfP3atnMoIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iwN6jy38; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iwN6jy38;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gD2Kc12kLz2xS2
	for <openbmc@lists.ozlabs.org>; Sun, 10 May 2026 22:31:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F033E6001A;
	Sun, 10 May 2026 12:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E04CBC2BCB8;
	Sun, 10 May 2026 12:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416304;
	bh=4sTIU6geCY/ofxbF1Nh9piJovvy17EjyERLoBxmWfXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iwN6jy38FZsJGhyHrd3rGfDNTGiQp/9tOIrvIHRK8/NOPNZLFYqnKAYMudEYwFesC
	 WqKhjTBM9MsbBOIkj7SQX2vWr4lBjnIlpETIUB65A1Vn8NXeiAYrg2inrHscyzQSMA
	 fb+PM0HqQitNTnq5uPzNakka+yA5SvHzBOShXVpRW8VhnA1eGnexRF1hqFw4oNoFtG
	 4/K3BOJhjE4VsfLy122sCWfYm+t37sbw0R0d+F3MtzZEBfZsTjqnIzC0fuAQRpLNAS
	 8t152qSjsT9S1hw3PtLncacqzc6jfUdyyykxejokl1/hagWZQEbr3JeeUEMCIi6pgf
	 6H7JbMmt55auQ==
From: Vinod Koul <vkoul@kernel.org>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
References: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
Subject: Re: (subset) [PATCH RESEND v3 0/4] Add eMMC PHY support for Axiado
 AX3000 SoC
Message-Id: <177841630053.434434.9292071839258247877.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:01:40 +0530
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 04 May 2026 09:38:31 +0800, Tzu-Hao Wei wrote:
> Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
> HS200 eMMC controller.
> 
> This series includes:
> 1. Add bindings for Axiado AX3000 eMMC PHY
> 2. Add Axiado AX3000 eMMC phy driver
> 3. Update MAINTAINERS for the new driver
> 4. Update Axiado AX3000 device tree
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
      commit: 1a75ecefa4fbedefc1600e43445de4e1e7f03b55
[2/4] phy: axiado: add Axiado eMMC PHY driver
      commit: 9e7dfa4bcd4e2c3541c4ee954ea5e66edab94d3f
[3/4] MAINTAINERS: Add Axiado AX3000 eMMC PHY driver
      commit: 13ee293a904b7b7b0507aaa8c71f7be7e683800e

Best regards,
-- 
~Vinod



