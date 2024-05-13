Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153DDC25B10
	for <openbmc@archiver.kernel.org>; Mon, 13 May 2024 15:54:28 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieDlxfXp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdPDy43xXz3cXR
	for <openbmc@archiver.kernel.org>; Tue, 14 May 2024 01:54:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ieDlxfXp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdPD11Q0pz2yvs
	for <openbmc@lists.ozlabs.org>; Tue, 14 May 2024 01:53:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB68ACE0F80;
	Mon, 13 May 2024 15:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25109C32782;
	Mon, 13 May 2024 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715615611;
	bh=QSJ9adYiyENvXrlQE+wO4TcEhBc9/Ph17/BE6YNfe6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieDlxfXpA9mxINnKrBrM2GCwrkLA9HNJPKbLm9C/lqpQFq0LO17JxHQ5uZA+KL6rT
	 fJyNrr4u65gmS8FFm3lb5931uxXg2yS9xUTJoCWACUw6M/nAKyrIP8HaZmVGIvIaQ+
	 bfOQZ2bKhDtjDd5XX23odoR30gx6gTCdsLQ3ZWzdH1SSBSKBM/fR7wTnddJ42JOgC+
	 baHJi9lP2OF4w6InqIIQnayFq9bNTna2TackQajsyBnp0ql54m+U08BEocIAcTCzIX
	 3c9N+3FvSE8SxUcuaUm0v3ONTToHAGatMO9OikwYDDGZhIaDGKNSwVOP+ZUQs1UGik
	 E6oy83RDLePNg==
Date: Mon, 13 May 2024 10:53:30 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v24 4/4] dt-binding: clock: remove nuvoton npcm845-clk
 bindings
Message-ID: <20240513155330.GA2676859-robh@kernel.org>
References: <20240509192411.2432066-1-tmaimon77@gmail.com>
 <20240509192411.2432066-5-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509192411.2432066-5-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, May 09, 2024 at 10:24:11PM +0300, Tomer Maimon wrote:
> Remove nuvoton,npcm845-clk binding since the NPCM8xx clock driver
> using the auxiliary device framework and not the device tree framework.

Again, this is an ABI break. Changing driver architecture for 1 OS is 
not a reason to change DT.

Rob
