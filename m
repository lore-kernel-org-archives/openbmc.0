Return-Path: <SRS0=Ykvi=HY=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4238AC433E0
	for <openbmc@archiver.kernel.org>; Mon, 22 Feb 2021 09:05:23 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9428464DE5
	for <openbmc@archiver.kernel.org>; Mon, 22 Feb 2021 09:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9428464DE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dkbqh5l3fz3cMS
	for <openbmc@archiver.kernel.org>; Mon, 22 Feb 2021 20:05:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yL7TzNgX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yL7TzNgX; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkbq760rdz30LL
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 20:04:50 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id n4so18228719wrx.1
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 01:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ibd7IrQ6fNOcWrwjYRZXsDAGOxYzONB2z6r0IEqUmQU=;
 b=yL7TzNgXytnTO6Go+i6klhnStgxH8xwdTDTXSlkHTZW3OM+XGilppMKuTdHTwqL+k7
 6PAJUBv7U86Kxu4+T0MGuOe7BctjORCj2iA8e9BK2rrkx/JsOQ7rhl+IWsO7EwzE5h9Z
 SdsRmTr38GYgbYvNXEmGmMvQwEeI7bPyW8B6irLr3ltRF8FvrZNpacs8KLLAlRmOF6lz
 Qd+bynAs7gR33jdNfKhpfQrnz7C8U+yw+RQ3EA71oM7VwFmv+H3crW17LurcXZnQ69Zh
 bUN6GevDuuY0JYwnQ1pV1pMsk9SPue+arcBYe36VlgItDmpjikMiLxwV3Goy29wbsDa6
 zh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ibd7IrQ6fNOcWrwjYRZXsDAGOxYzONB2z6r0IEqUmQU=;
 b=MhUE3Fx5/h0hGrTHTlkqWfNuiP9d78lS8vTFlpxTy+vxq7kSINJlMOO2H83tkBXLNl
 oxlZacMMbS9+zhY6E9BvAc5gkRflwGdUGOisNcJnap0/QYGxKk+BNex8XqhvwMKT36Co
 X61TV6LAGQaO8ij/JnBPaACocZHBbsKliWEv/iM4KRIlOYZJrc+aPVpNyfFlZox9IaLU
 EUSwLjx4ZbCBmrkghTBgask8r23XEukeHaO5Xor0Z6sI7MrjaUn2+C1Rgw7YW16+nRqB
 nhFzTstYdhSra4rqRBNxgvaAdvtxx7V54P4O85/ozc8cWPfbNpcgvO9e8idA65einYud
 hrCQ==
X-Gm-Message-State: AOAM530OUvSU4LXcyZFakWREfdpl6E2uDSP0i772lQRlgmQJSTiSXqrY
 X2yu3WsjRdqmAysKHSwLAGdjVA==
X-Google-Smtp-Source: ABdhPJwOHue/t3T/Gsj5IrX0E90nO1og7r9e8V4bXyiNtpeeZqzFVoqABJfZlXM2xJY6LhyUPWUd5w==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr20403648wro.73.1613984681888; 
 Mon, 22 Feb 2021 01:04:41 -0800 (PST)
Received: from dell ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id u12sm1410725wmq.38.2021.02.22.01.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 01:04:41 -0800 (PST)
Date: Mon, 22 Feb 2021 09:04:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH 01/19] dt-bindings: aspeed-lpc: Remove LPC partitioning
Message-ID: <20210222090439.GB376568@dell>
References: <20210219142523.3464540-1-andrew@aj.id.au>
 <20210219142523.3464540-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219142523.3464540-2-andrew@aj.id.au>
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, tmaimon77@gmail.com, minyard@acm.org,
 linux-gpio@vger.kernel.org, avifishman70@gmail.com, venture@google.com,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Sat, 20 Feb 2021, Andrew Jeffery wrote:

> From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
> 
> The LPC controller has no concept of the BMC and the Host partitions.
> This patch fixes the documentation by removing the description on LPC
> partitions. The register offsets illustrated in the DTS node examples
> are also fixed to adapt to the LPC DTS change.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    | 100 +++++-------------
>  1 file changed, 25 insertions(+), 75 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
