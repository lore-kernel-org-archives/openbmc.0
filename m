Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564E9606A33F
	for <openbmc@archiver.kernel.org>; Mon,  2 Nov 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxhzywtJ
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4jJ8rq0fvYz2ygg;
	Mon, 02 Nov 2026 22:40:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1793619610;
	cv=none; b=kf52Zgio+imPkXdVP9iPn3qA/2he6xyHqgjgBnEqJkex4UiIlL6pf2qWsBaT4fYaCsOGcnxZUYNAJtZ5CucdbPlIavhAq3E8zhmnpglKrvmSxRRvXLANT8FZCXBmkOJDlvlCdSuOzJFoBRmeFb78mNJ4jzURfgR6sMn6EBQNtrTbxgUrC/q2/6hgmUQSJ5dU+c93Ldl+G0r1nT37yRU2E9DLlbMp/uQ019zXY3KPH56NpWyA1NR5G5wuFbqoPLkZ2eMfDIGdhc7NbrGJjkdosY9XLuk03Wjtj+JRCv5wwVj6JVkHjx/k+BzadeBRFOA5FcUKiORudoeddOR1RUHsSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1793619610; c=relaxed/relaxed;
	bh=PGaY0Pa3HUYVclQJqjBeSI20mWGTsICDiHVjhHNeV1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/SXttIZitoEH5be5b5StCYSmOmeAbhGQfavMRdUSyPZE21HEXbKJzatmmirNASah8gXiEsU+FGcDgeD/rQiW6O6hNbnxy2hfhSijeSJ/e2+zyr6yOVRQ+lZdgD31TkfrC/B01OCbRnyDMqMeXmbLo87BUkOCoLQs2nx2s5yVRXLr6sAsOk4atx0d9av5wFFAvZ7DjfJSypp8CSdeDW28GoSiN/poyIxqFNOAp2DN4N42sqtdd3Dm5Nuv1dt78xP7WvDiwQYzgWcTboifiQrL1vPNGZPJlqnKEgKnmO5t9yCWwpGeWdP0uo7ppZ/bnSoOW3WxR4DK1qJPPzgPS4FYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxhzywtJ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MxhzywtJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4jJ8rn66QGz2xqh
	for <openbmc@lists.ozlabs.org>; Mon, 02 Nov 2026 22:40:09 +1100 (AEDT)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D5F54243E;
	Mon,  2 Nov 2026 11:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8761F00A21;
	Mon,  2 Nov 2026 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619606;
	bh=PGaY0Pa3HUYVclQJqjBeSI20mWGTsICDiHVjhHNeV1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxhzywtJBHiisWhAANnkA8vgHE9oI5DEKKmoc/nAm5eLjve7s+fjBjbY3sJi+iMVk
	 513dCavz/UvlAVM+dYF87jXDBwrmV4AY9r/xfuDry/43mW11avQyQtaUBN/mNachnL
	 VUj1BE2lmHejeUaAfvF8cRfwsnq0HtAxRQtXnPrqJm9g6RD3TibbGg5Nsft22QIOcw
	 By7RHFA807z9xRshcCcKZEiIe660/h9MLluJp4ekrksYbR2q9XZfztahkzBZxAggW7
	 DBeJdb4EEPNJYJ8wFDp9UkUxaTo/0EzB+XzzDDbc/kxOaQP35dADO1Kkpfa4HfxTgQ
	 gOPxz4D5mcCBg==
Date: Mon, 2 Nov 2026 12:40:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhila Kavi <akavi@axiado.com>
Cc: Sammai Chakravarthy <schakravarthy@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tzu-Hao Wei <twei@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Axiado AX3005 IRoT
 MCTP transport
Message-ID: <20261102-nightingale-of-legal-superiority-fda313@quoll>
References: <20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
 <20261101-mctp-transport-irot-ax3005-v1-1-36ceb822f01e@axiado.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101-mctp-transport-irot-ax3005-v1-1-36ceb822f01e@axiado.com>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 06:00:57AM -0800, Akhila Kavi wrote:
> The Axiado AX3005 SoC has an integrated root-of-trust (IRoT)
> co-processor next to the application processor. The two exchange MCTP
> packets through a no-map carve-out in DRAM, and use one channel in each
> direction of the AX3005 mailbox controller as doorbells.
> 
> Add a binding for this link. The node has no registers of its own. It
> describes the fixed pairing of a TX and an RX mailbox channel with the
> reserved-memory carve-out that the IRoT places its packet windows in.
> The IRoT firmware chooses the window addresses inside the carve-out and
> reports them at runtime, so they are not described in the devicetree.
> 
> Also add a MAINTAINERS entry covering the binding.
> 
> Signed-off-by: Akhila Kavi <akavi@axiado.com>
> ---
>  .../bindings/net/axiado,ax3005-mctp-irot.yaml      | 60 ++++++++++++++++++++++
>  MAINTAINERS                                        |  8 +++
>  2 files changed, 68 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


