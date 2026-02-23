Return-Path: <openbmc+bounces-1405-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA3AEC1115
	for <openbmc@archiver.kernel.org>; Mon, 23 Feb 2026 18:00:47 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKTD75jnyz3bTf;
	Tue, 24 Feb 2026 05:00:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771869639;
	cv=none; b=dccYUu9zkC3yOu+G2gaSp4UqM20C3gqh/tjDFqrM2mGVLL34xyb4LGhL8ia1XRkeswrCWLFElv4BfWF5c8JR5eeTTqtvtJjFdGj/XMTHhf53xoMcfVzFPFgg6BV/u/PXS8+muNqNlAqrEirTEJ2dq7UsNY7UgFLFoIhpeEMi98xYgQVuALz2yJGXWZt9hV06gaGrhg465on+aZHXAPwSjkUE5sZhYGkWRr7ReWono7rrhDCdqytvOV6jKZKd071Ghy+b12LJEjxE0wwb9vdRrKnZIhmPyi7VXdbxdq3auoTY0BuLQaWOLelDETTEWaRW1/sJuHyx8MuFQD/kmuLM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771869639; c=relaxed/relaxed;
	bh=kG5N/e/6D2lUCiUI1R4Zu0n/CQpAxLefFd3GZFBP8Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3DbV6//hL0BRFWeCtrBkfsvroCby/4Z74lpgkTwPH9vLMX66YR92F4UtbAizAlkO3tU7IYhgVhP6YdA90J9bFPEzrybLSbNGNoC2AoDLLdK9TgBHC2Mgp876A9rPCO+B+K+GOZEDGNZXaThJ3qkcNFTHwHAvmfUyse/7rFEx+g68ImyBhFOQGXGY/R3iwEOuD/zzRtw1DVV6AuKj++xw+iYSdark/H8UwinySPX75nNuFn1vwzRZHaTLQZbVDQ+XeSJoWkAnDXHPfv1FEH7EmNk3h4NBnAUN4oEN9/IGtE7u2P6RVj+CDoiN8aC813Yl3gSwjm/jNPxaN0xcEk+mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TNgkQZMT; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TNgkQZMT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKTD61vFqz2xRq
	for <openbmc@lists.ozlabs.org>; Tue, 24 Feb 2026 05:00:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D36EE43EF6;
	Mon, 23 Feb 2026 18:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961CEC116C6;
	Mon, 23 Feb 2026 18:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771869635;
	bh=MJ69pmRtG+9KKJhOnIGYtKUDC06lDh6YD0E4+8ELgEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNgkQZMTlfBzpmFs9NItNEkPZARD1V38/QKAZDczfkCLSkhvG4Z8CcUJWlhACjJxX
	 JqnNYH80Dtgs6WE+D7CRbRDnNZKiQ1/2lfEQ/2kK94RRo5HA7gENHQpDRdl4kj8QPp
	 6SZDlUjM+jPLzJgVuYbFTF/LZ+WC2SiUmeMit2H9lgkFL+scmd8lzShz2TRAc8RqY7
	 yoQEnrdWD0TX9Kt7j9WlvYb6jrk/LDABG5Mg7Uv07UU6H8qqMS3Foeo4/GLo9RD8UZ
	 pv0ricwFjLD22GrryVmgiBfjurMivu8Bz4ZH/WbzMlvBp8n8ED7Zgokl9BDngUeBzj
	 1ZwY3/bMOQnTA==
Date: Mon, 23 Feb 2026 12:00:34 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
	andrew@codeconstruct.com.au, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, yuenn@google.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-hwmon@vger.kernel.org, linux@roeck-us.net,
	benjaminfair@google.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: convert npcm750-pwm-fan to DT
 schema
Message-ID: <177186963391.4186070.17923016714184398720.robh@kernel.org>
References: <20260215163553.1334475-1-tmaimon77@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215163553.1334475-1-tmaimon77@gmail.com>


On Sun, 15 Feb 2026 18:35:53 +0200, Tomer Maimon wrote:
> Convert the Nuvoton HWMON PWM and FAN controllers binding to schema
> format.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
> Addressed comments from:
>  - Rob Herring : https://www.spinics.net/lists/kernel/msg6047623.html
> 
> Changes since version 1:
>  - Modify yaml file.
>  - Remove unnecessary symbols.
>  - Add items.
> 
>  .../bindings/hwmon/npcm750-pwm-fan.txt        |  88 -----------
>  .../hwmon/nuvoton,npcm750-pwm-fan.yaml        | 139 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/npcm750-pwm-fan.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,npcm750-pwm-fan.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


