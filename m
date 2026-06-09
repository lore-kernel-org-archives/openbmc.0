Return-Path: <openbmc+bounces-2056-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D51CD8CAC
	for <openbmc@archiver.kernel.org>; Tue,  9 Jun 2026 07:16:56 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gZKwM622Yz2yRF;
	Tue, 09 Jun 2026 17:16:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780989411;
	cv=none; b=Tp6BXeg4Uq+3qkcKMbLgg/2VNt1SE3XK0qp2AjaA8JQAffHMuzybYqL6XWt4p97MOzn06NhgNQ+RqwFoQyDDDE9yD/eToKyEnvKXr8qZgbpcU0AsUaWD2vVlzSpA4H5OCXq63VrSYGOdiv8mvP+kGAzHtyvQMceF2FinVs/7dewlhrLnvdYSyrz6wkcpOKEracWJjiaPQdVvsW2+3rj+v/s8iOFpq5C329nFK+FKytjAAuGQYR1xe+7vqbIZ4QncinvMuqUChYjKs2dffN8qJmviJBA5bYMGIlw2llRz88/3UhGE0wwCrFyaC6Zsf5UxTbYAyRYDDUYlToI32/K/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780989411; c=relaxed/relaxed;
	bh=m+KYGZ93ysAEFhs7M5BXdkdm6DTM61sC1UfDRdKiois=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS9aznLpXOIaOjhfukAfX0FfCNwj3pEbLLpDhPbWXZJQKegjGVg8OILZzybk6LL8yloyNcTNVAjPRpUrRQiJEDM+ZPrl+uilBAKAsNJkl7wkH+hi9J0xwktzzhGmG3oZv3WEbQMozexGjDovI16v6frnKZ8mLhu6zNgD5mpcqbntHqoQ6eIX2/X7W6TwwBRipIcudYjrDCRSPCZDaWNYR4uTC5JkKlksuQcaZnWBe4Gmzi+knkLdBsE3Kirrs58uxczypmdno6f3mFhmnqd86Rvh6XwYQZgeMwn0YUbwgLF7XAPYtX7fOKb0ursL5OVzJSzMrmub5zEMt1zesRNJ2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7QO27FR; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7QO27FR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gZKwL4Rlnz2xM7
	for <openbmc@lists.ozlabs.org>; Tue, 09 Jun 2026 17:16:50 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EBF7F601E6;
	Tue,  9 Jun 2026 07:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEF21F00893;
	Tue,  9 Jun 2026 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989407;
	bh=m+KYGZ93ysAEFhs7M5BXdkdm6DTM61sC1UfDRdKiois=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z7QO27FRIpcJ24ft+sWDzgKUTcoa1pgWP/jk9ZHVAy8Gvy8mC4uJClcJTRrnH982n
	 8AcJQ2RiqPDWSDLyZ435L8T5HSFZKd72aXCFrs7Vk3CJ6Jc5u8IzbRNNW/XzrxXAzi
	 GFRMlhMlZa55bivA5ht3O1j7KCqDjTVc67ce6rrRC1NoM/eecxpv8NeyVjnZbvHEbu
	 Oo7pKUIah5EePRFtOgCdTc+HsuyVngIKxhUZfL3zpfeHX3V1IGwoDU5WbcJxZCMCgD
	 lTH3t1Jl7Bp7uiJxZm3rRe5OBXnsypvOXzsl3my/xRkv9w0GQ031aHngVF0epaInoh
	 bIZiopGYuNz/Q==
Date: Tue, 9 Jun 2026 09:16:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: andrew@codeconstruct.com.au, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com, yuenn@google.com, 
	benjaminfair@google.com
Subject: Re: [PATCH v2 2/2] spi: dt-bindings: nuvoton,npcm-fiu: Convert to DT
 schema
Message-ID: <20260609-rebel-advanced-dragonfly-efdafe@quoll>
References: <20260608175418.1936892-1-tmaimon77@gmail.com>
 <20260608175418.1936892-3-tmaimon77@gmail.com>
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
In-Reply-To: <20260608175418.1936892-3-tmaimon77@gmail.com>

On Mon, Jun 08, 2026 at 08:54:18PM +0300, Tomer Maimon wrote:
> Convert the Nuvoton NPCM FIU binding to DT schema format.

You should explain here why second 'reg' is optional. It wasn't in
original binding, so you made a change to the binding during conversion.


...

> -
> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml
> new file mode 100644
> index 000000000000..0f95def01910
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.yaml

Filename: nuvoton,npcm750-fiu.yaml

> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/nuvoton,npcm-fiu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton NPCM Flash Interface Unit (FIU) SPI Controller
> +
> +maintainers:
> +  - Tomer Maimon <tmaimon77@gmail.com>
> +
> +allOf:
> +  - $ref: spi-controller.yaml#
> +
> +description: |
> +  NPCM FIU supports single, dual and quad communication interface.
> +
> +  The NPCM7XX supports three FIU modules:
> +    FIU0 and FIUx support two chip selects
> +    FIU3 supports four chip selects.
> +
> +  The NPCM8XX supports four FIU modules:
> +    FIU0 and FIUx support two chip selects
> +    FIU1 and FIU3 support four chip selects.
> +
> +  Alias convention:
> +    The '/aliases' node should define:
> +      For NPCM7xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux;
> +      For NPCM8xx:  fiu0=&fiu0; fiu1=&fiu3; fiu2=&fiux; fiu3=&fiu1;
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nuvoton,npcm750-fiu # Poleg NPCM7XX
> +      - nuvoton,npcm845-fiu # Arbel NPCM8XX
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: FIU registers
> +      - description: Memory-mapped flash contents (optional)
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: control
> +      - const: memory
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - enum:
> +          - clk_spi0
> +          - clk_spi1
> +          - clk_spi3
> +          - clk_spix

This wasn't in the original binding. Nothing explains why it was added.

> +
> +  nuvoton,spix-mode:
> +    type: boolean
> +    description: Enable SPIX mode for an expansion bus to an ASIC or CPLD.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nuvoton,npcm7xx-clock.h>
> +    spi@fb000000 {
> +        compatible = "nuvoton,npcm750-fiu";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
> +        reg-names = "control", "memory";

reg and reg-names follow compatible.


Best regards,
Krzysztof


