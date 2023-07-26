Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE288C001DF
	for <openbmc@archiver.kernel.org>; Wed, 26 Jul 2023 20:15:06 +0000 (UTC)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k3OGYtf9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RB4rT0l1Pz30dw
	for <openbmc@archiver.kernel.org>; Thu, 27 Jul 2023 06:15:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k3OGYtf9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=x1it=dm=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RB4qN0961z2yGn
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2023 06:14:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF07961CB8;
	Wed, 26 Jul 2023 20:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32403C433C8;
	Wed, 26 Jul 2023 20:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690402444;
	bh=V0dsiba/e/EnWiicMuiFyHjsCtALuYmHLxQ6ywscESg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k3OGYtf9ftfUYzRIhz7LE0jPUBbksDpL2oAA9F3Y328+aQMLfAJk3MTaoZ8VgoKvm
	 RpgFMB0xJ6nJZSWY0HzIql3URUNjzSBmy1FdKj5vbBWezH3VTNdapSyPeh98amhN3m
	 sDsh5fI7X7YQk67e/GqDw+s9FP3QpM9Ghh+iI/9sTUlF4PhoxS5//f3+wO7415jK6Z
	 EfavjH31WWGmW/X/0rKa78m4P1TqgqDexoJLUS20k4Hv8V7RcWTZFccizLr00qe8n9
	 89BxjKkzLxEUmtoa+kWmpbDRCwwDicB2tW0Jn0qqane79xoyWaampPKLPWQS6CiAm1
	 Ow/rH+mQAsizw==
Received: (nullmailer pid 1980658 invoked by uid 1000);
	Wed, 26 Jul 2023 20:14:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Iwona Winiarska <iwona.winiarska@intel.com>
In-Reply-To: <20230726192740.1383740-2-iwona.winiarska@intel.com>
References: <20230726192740.1383740-1-iwona.winiarska@intel.com>
 <20230726192740.1383740-2-iwona.winiarska@intel.com>
Message-Id: <169040244201.1980325.11685396975848728495.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: Add bindings for peci-npcm
Date: Wed, 26 Jul 2023 14:14:02 -0600
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>


On Wed, 26 Jul 2023 21:27:37 +0200, Iwona Winiarska wrote:
> From: Tomer Maimon <tmaimon77@gmail.com>
> 
> Add device tree bindings for the peci-npcm controller driver.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Signed-off-by: Tyrone Ting <warp5tw@gmail.com>
> Co-developed-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---
> Changes v1 -> v2:
> 
> * Renamed binding filename to match compatible (Krzysztof)
> ---
>  .../bindings/peci/nuvoton,npcm-peci.yaml      | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/peci/peci-npcm.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/peci/nuvoton,npcm-peci.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230726192740.1383740-2-iwona.winiarska@intel.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

