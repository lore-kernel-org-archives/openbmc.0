Return-Path: <SRS0=88my=NL=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FA3C4338F
	for <openbmc@archiver.kernel.org>; Fri, 20 Aug 2021 20:02:34 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A62361040
	for <openbmc@archiver.kernel.org>; Fri, 20 Aug 2021 20:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A62361040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrsxN2ZV7z3cPk
	for <openbmc@archiver.kernel.org>; Sat, 21 Aug 2021 06:02:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grswn5Ycsz3cGT;
 Sat, 21 Aug 2021 06:02:00 +1000 (AEST)
Received: by mail-oo1-f54.google.com with SMTP id
 z3-20020a4a98430000b029025f4693434bso3226219ooi.3; 
 Fri, 20 Aug 2021 13:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wlbFPYPY/Xtj1KW5rp0UccGo9s5jQlV0fCqX0LEM8rA=;
 b=V0hNBxdfnlqD9aPxjGgjw/LcGxNR5VVCahEHRcoz82RFM7S2Vlyj/ZMLa3emrlWbR4
 lwE19Cod1mWmJ9aiHefALZJWlkn5Fo8bys3K/8WSw+8PGEvbnc5IS3zceamXxIiK2JTG
 QaQS+6/MSnTv4b31Ed5Kt46lX3HspI7FYLIquuJoX3PohqBvvwQtYrLSofxPY+M/cm6B
 cn9o9jNSAOPh7E3RhYP9V8cMFxDrmwKlTmh/EhQcHveWHeiEn2TwcHic5havoU4RfdDD
 eLo0eQOgiWp/duHKUTbwF34QymqMvBU0VB553Apx4kUAGVUb0JV3eVCXt58EnlpBiqDh
 nWQg==
X-Gm-Message-State: AOAM5336sWuxGECrUAqDef1dopT2y6iAUcxFZRmGbKm5dIYltleBrytW
 bbeRW7C0aznQHtPqyjMT/w==
X-Google-Smtp-Source: ABdhPJys2nyF9UYQYqZJu3h13pyM0x7e7+IP1RxgPq7sPk58kOG6bqF1k5cdEbYjpsmGblW/KXee2Q==
X-Received: by 2002:a4a:bc90:: with SMTP id m16mr17240148oop.33.1629489717171; 
 Fri, 20 Aug 2021 13:01:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w15sm1385177oiw.19.2021.08.20.13.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 13:01:56 -0700 (PDT)
Received: (nullmailer pid 3886974 invoked by uid 1000);
 Fri, 20 Aug 2021 20:01:55 -0000
Date: Fri, 20 Aug 2021 15:01:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: aspeed: Add eSPI controller
Message-ID: <YSAKM16WLx4UWIQu@robh.at.kernel.org>
References: <20210819080040.31242-1-chiawei_wang@aspeedtech.com>
 <20210819080040.31242-2-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819080040.31242-2-chiawei_wang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, ryan_chen@aspeedtech.com,
 linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Aug 19, 2021 at 04:00:36PM +0800, Chia-Wei Wang wrote:
> Add dt-bindings for Aspeed eSPI controller
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/soc/aspeed/espi.yaml  | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/aspeed/espi.yaml b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> new file mode 100644
> index 000000000000..fec3d37f3ffd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/aspeed/espi.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# # Copyright (c) 2021 Aspeed Technology Inc.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/aspeed/espi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Aspeed eSPI Controller
> +
> +maintainers:
> +  - Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +description:
> +  Aspeed eSPI controller implements a slave side eSPI endpoint device
> +  supporting the four eSPI channels, namely peripheral, virtual wire,
> +  out-of-band, and flash.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,ast2500-espi
> +          - aspeed,ast2600-espi
> +      - const: simple-mfd
> +      - const: syscon

Is this really 2 sub devices that could be used individually or in a 
different combination? If not, then I'd make all this 1 node.

Rob
