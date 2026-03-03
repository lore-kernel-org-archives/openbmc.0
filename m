Return-Path: <openbmc+bounces-1424-openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AADAEC1420
	for <openbmc@archiver.kernel.org>; Tue,  3 Mar 2026 10:25:16 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQBks2r2qz3bp0;
	Tue, 03 Mar 2026 21:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772533509;
	cv=none; b=HIRqFETY+AXrsk8iVdEUu+xS9fOCzhWgkHi/v5BJ/p1XLXylSyWMCZe8L82bOPwI+nA2RFGM60jFhHuJGREJXxlcozP407s0c5T6kOZDyd/z+wXF8iuIwATOmKZ3pQq4QSRDlOglD97RMcZJMvOKczho6gxddqSbPvPzXMts+FUVBtQ4BwmtPfAQ5ndv43hznjjDb6/00czXuR4OIzxDfPF3vB+bO3jbqb74rytnffmHI07vs5RBuX5pIasbBX9+SaMApMR6jxlZh+Mpb318rOsehReFzGlhS9mXqgIlapM4zZpl30OKtKgQGydY/9/V5QpSHl6RDfl9Awp6A2yE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772533509; c=relaxed/relaxed;
	bh=zPeRkSjhbNWqtJHb9jil+lTxENl1QGT3qIeSCGkwoGI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=G32NjZBjaXSXC1OynWkKkdA7iWQN2XTJ+pwaTVhBN99W2+mQRDZdQhLDLEF2m7hDh9UaaKg2ev33F+/R2FeG0ARxebDgTpl8wQmObGwVr0hCf2dpQiESp86Xin+dKOL2J8YGoYx+xJBQVzF1IhP22i81xNNZB5qC4f6zGSb7HuAvQjTclqfHoYflkRWV6c91OzI0uQULBOsHvqX1Nr413t6w6Pk4Jngs/Z+GbS2S8bB8UlwGwGC+mXKmSxk621KNdXBO4EOFqiGhYph0E6WKgeAgwo0aveE/CSvwun4sJdBEe8wTtVRaw5bSwTo1RTrWBQxu9i5DeSofrpzNGYZvZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3rWd6fX; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3rWd6fX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQBkq5wbJz30Lw
	for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2026 21:25:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDF0541A1A;
	Tue,  3 Mar 2026 10:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5447C116C6;
	Tue,  3 Mar 2026 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772533504;
	bh=uxFljM7pcMFjhzJ6RseFVsjslvhZGb2NJyw+vlNRGhs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y3rWd6fXtsIGM1sr8FApey+l37uLXjatv4xXSwDwaMKzooOCNEAViYiNnPpmVNDBB
	 NIXDwOaaqyvKOjx7h32Rlc9y1vDkBMYj0+GQN3xSi7PjbIcc2gO54/j3gAlaXepTig
	 80zPjuEO/Ad8Hpsn+JuOJCKd7vq+d7wHU+rh5SGsOK88Jqt4BzrFRLU/4MQDHNdchM
	 FRtebd55imzoumqqQ9ku1A6uXtwXwKqOiy4wgIP1fEDEBNlOKVAWxe4ecFZTmgjGDF
	 FTJBa2pUTL6OI/ziZhDOlVUmD2ZnzKtglgSA5BVSAztd+pR+Z8eHZMktiHVagHhr/a
	 hpDT/yu2f3xQA==
Date: Tue, 03 Mar 2026 04:25:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: schung@nuvoton.com, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, 
 pabeni@redhat.com, richardcochran@gmail.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
 linux-kernel@vger.kernel.org, edumazet@google.com, openbmc@lists.ozlabs.org, 
 ychuang3@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, 
 davem@davemloft.net, kuba@kernel.org, krzk+dt@kernel.org, yclu4@nuvoton.com, 
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
 peppe.cavallaro@st.com
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260303092006.263715-2-a0987203069@gmail.com>
References: <20260303092006.263715-1-a0987203069@gmail.com>
 <20260303092006.263715-2-a0987203069@gmail.com>
Message-Id: <177253350380.2382800.5887598716151731479.robh@kernel.org>
Subject: Re: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC


On Tue, 03 Mar 2026 17:20:04 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 131 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clock-names: ['stmmaceth'] is too short
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): clocks: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac'] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): phy-mode:0: 'sgmii' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.example.dtb: ethernet@ff700000 (altr,socfpga-stmmac): Unevaluated properties are not allowed ('altr,sysmgr-syscon' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): clocks: [[4294967295, 1], [4294967295, 2], [4294967295, 3]] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): reg: [[3875995648, 8192], [3959435264, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'resets' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): 'reset-names' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,th1520-gmac.example.dtb: ethernet@e7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.example.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): 'nuvoton,sys' is a required property
	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260303092006.263715-2-a0987203069@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


