Return-Path: <SRS0=JHGv=NR=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BBEC4320E
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 13:26:40 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE7E60EE0
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 13:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CEE7E60EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwNsp1dvVz2ybK
	for <openbmc@archiver.kernel.org>; Thu, 26 Aug 2021 23:26:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.179;
 helo=mail-oi1-f179.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwNsC22T7z2yPb;
 Thu, 26 Aug 2021 23:26:06 +1000 (AEST)
Received: by mail-oi1-f179.google.com with SMTP id h133so4511290oib.7;
 Thu, 26 Aug 2021 06:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=yGrmY0Wm9zImGOy/o3LCoKO0Ng/hLTcj4XnHAPE/eDs=;
 b=KHk1n+8pczQ+cVPIfxuSVIeEy2BtVb0tfxXemvJnE2T5fQmudxQXKO2f1dAbx3C4iX
 Bt3pch0wQtQzjc1RbVDizNrkRHuHXxeq1oLLmKvy1YWuQwFUnxuY8MKZEn3sCPn2pHe4
 P+6z5XqqMk5kAPH2AO4enVgC1jEjq62bXh8ouXO+yXnjeIIdx5RQ+AwlikAL3wCjy1+f
 QItW2u+1GYuuoDppsnyPFWuVJb1TKbT+beNkLlIgmmRNNQKk5N3PjLm4LDK+cVwHd5dd
 L9UKtL94P7gbN//78BtwKUqQuZiqrW2T5MG1+eGfYm2ECNBtPkmcGKAYoqPIhIra/tQ0
 ekHA==
X-Gm-Message-State: AOAM531iOLF4rJSUJ3aHWq4YhhRSPGKbBViG+R8CMZJ//D1msbeLCfJH
 /z7txHPqeRiPaA+/2K1now==
X-Google-Smtp-Source: ABdhPJwolzkhSzZMufONuxtdvIMwlkvhTNBvyCc9Y5tP4vHtKhzTpiQyufCG5WCn30VqdDSpmGRVXg==
X-Received: by 2002:a05:6808:690:: with SMTP id
 k16mr2382166oig.152.1629984363205; 
 Thu, 26 Aug 2021 06:26:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c24sm576169otf.71.2021.08.26.06.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:26:02 -0700 (PDT)
Received: (nullmailer pid 1033383 invoked by uid 1000);
 Thu, 26 Aug 2021 13:26:01 -0000
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
In-Reply-To: <20210826061623.6352-2-chiawei_wang@aspeedtech.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
 <20210826061623.6352-2-chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: aspeed: Add eSPI controller
Date: Thu, 26 Aug 2021 08:26:01 -0500
Message-Id: <1629984361.334223.1033382.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, 26 Aug 2021 14:16:20 +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed eSPI controller
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/soc/aspeed/espi.yaml  | 157 ++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/aspeed/espi.example.dt.yaml: espi@1e6ee000: 'espi-ctrl@0', 'espi-mmbi@800' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/aspeed/espi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1520968

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

