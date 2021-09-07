Return-Path: <SRS0=RLI/=N5=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E3CC433EF
	for <openbmc@archiver.kernel.org>; Tue,  7 Sep 2021 18:47:29 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81CAE61103
	for <openbmc@archiver.kernel.org>; Tue,  7 Sep 2021 18:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81CAE61103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3vQR71Zsz2yPF
	for <openbmc@archiver.kernel.org>; Wed,  8 Sep 2021 04:47:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.175;
 helo=mail-oi1-f175.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3vPy4wxtz2xtV;
 Wed,  8 Sep 2021 04:47:02 +1000 (AEST)
Received: by mail-oi1-f175.google.com with SMTP id n27so214525oij.0;
 Tue, 07 Sep 2021 11:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=39RQTTYF/amkcltUtDp9LhMGXFZN1q3yD/uvIqsnXMk=;
 b=NK+Z/E7ePr9UtcGuaCcrqhnSUZd9ayLOfbqQMQ6NGtXeFMaLcmAchFkUbljocnsIpN
 vIpl+ZV3Zs/cqVSkhEVQrn50Epsp1UE5cpUPP+opJC47INgTvmuZ4s2rxNpsYepASWLz
 uS6FvXxXtTA+xAkxtTUzw8OW+VnXowKXxxLSrjRYOZY2a0gnfeQJ1Fvtf84vevoZqwKi
 NUUI/uA1Jzjuljlghs6mnlxfI5IUwXPj7yH/tiKdXbcF3IFBaOafL4boNxy+z1AiIp4b
 y+5ze+ZdsvqmJ0y/TDOQce2JR60uuFIHQh+oxs7t/jomp1B7ERZjrB7r22jfm6veMj1K
 0IvA==
X-Gm-Message-State: AOAM532ftGDC03NH1tdZWo13qEHPPDklBX7IYw4TvyeB47YjD8fDa8y/
 7wNkPzhjRRBV/v+4Ei8BsQ==
X-Google-Smtp-Source: ABdhPJyVUR3P16ERRVW6NSwGEUXMlTh132UXxmCNpEOyGRal5QtTecpj1eeGoYCTESeb/H0aRtjnAA==
X-Received: by 2002:aca:5f09:: with SMTP id t9mr3985991oib.157.1631040418971; 
 Tue, 07 Sep 2021 11:46:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i1sm2384905ooo.15.2021.09.07.11.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 11:46:58 -0700 (PDT)
Received: (nullmailer pid 136986 invoked by uid 1000);
 Tue, 07 Sep 2021 18:46:55 -0000
Date: Tue, 7 Sep 2021 13:46:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: aspeed-lpc: Add UART routing
 compatible string
Message-ID: <YTezn1TDatYs2FMd@robh.at.kernel.org>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210902021817.17506-2-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210902021817.17506-2-chiawei_wang@aspeedtech.com>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, lee.jones@linaro.org,
 linux-arm-kernel@lists.infradead.org, osk@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Sep 02, 2021 at 10:18:14AM +0800, Chia-Wei Wang wrote:
> Add the compatible string and the device tree description for the
> Aspeed AST25xx/AST26xx UART routing control.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)

Either convert aspeed-lpc.txt to DT schema or make this a separate 
schema doc.

> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 936aa108eab4..45d44f812e5e 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -155,3 +155,25 @@ lpc_reset: reset-controller@98 {
>          reg = <0x98 0x4>;
>          #reset-cells = <1>;
>  };
> +
> +UART routing control
> +--------------------
> +
> +The UART routing control manages the RX muxes among the UART controllers
> +and the I/O pins. This is typicall used for the Serial-Over-Lan (SOL)
> +service.
> +
> +Required properties:
> +
> + - compatible:		One of:
> +			"aspeed,ast2500-uart-routing";
> +			"aspeed,ast2600-uart-routing";
> +
> + - reg:			offset and length of the IP in the LPC memory region
> +
> +Example:
> +
> +uart_routing: uart-routing@98 {
> +	compatible = "aspeed,ast2600-uart-routing";
> +	reg = <0x98 0x8>;
> +};
> -- 
> 2.17.1
> 
> 
