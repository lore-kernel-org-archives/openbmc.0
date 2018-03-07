Return-Path: <daniel.lezcano@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:400c:c0c::242; helo=mail-wr0-x242.google.com;
 envelope-from=daniel.lezcano@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="HCI9QPu6"; 
 dkim-atps=neutral
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zxLCB48ZzzDrLS
 for <openbmc@lists.ozlabs.org>; Thu,  8 Mar 2018 04:25:53 +1100 (AEDT)
Received: by mail-wr0-x242.google.com with SMTP id m12so2959454wrm.13
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 09:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pcHnDWjG00DZE4UyGjxaj965MC9ytugaaCAIVUiR64E=;
 b=HCI9QPu6c42X1+PnYAAgGjClMEO874Qlm47hgXOJ9Ygma23SIPwHnS2L84Wljzl1c1
 leGTCxK9V+tMmbp/fbrvdCCfplZsNfkSUBoDQ2mgWHiCH8pWRqh35PGdlF/zCycTBW22
 euu/nQdBDXmkqAuY2wKoUWFDQ4dtvIlGOWVaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pcHnDWjG00DZE4UyGjxaj965MC9ytugaaCAIVUiR64E=;
 b=ch72VfQlbekCkX7LImxPz64e8x5pa3V61JlpWFuEE+nmNEd7tfmARUG1bf2vq/NTO1
 7m8uaFSKv7whRJcvO+fVm3nBoy549XAtpch21d51beCPImE5vPDLsi43yoYHHNd3wrbY
 vY8Xn5c1IdkTEAUhIEiAW229DCg3CRqTetfdQbQUXmipV57L5Lf1jD6Q7YE/pif00Tio
 qLVL+GHQCYX3duqmC0H2bdhTxNh3WeI9ief8nlEvkPFXtO8sdMNmcqoNR9gG0vyMDGMg
 HQDJhGk1u5MjrsxnpzGo1DPdtqpewMEqH/bhrPDX16+jg5boiQYjLJfmG+vzhHeFLi2m
 Ct/Q==
X-Gm-Message-State: APf1xPAMFPdf5KH14Erz6bAH6pFjlKFQk4vLRrjtFdfgWe7mncD65sWV
 E7K4y5QQOkkAFs1TJWck9bp1A5TMfow=
X-Google-Smtp-Source: AG47ELvxe0vWoCYLafvSeDqYRTiLMp3FB2mU5v4AIrqMw75Rqwd+o6mwka+gR4fnxlEHQghghkuJOA==
X-Received: by 10.223.187.199 with SMTP id z7mr20702950wrg.58.1520443550828;
 Wed, 07 Mar 2018 09:25:50 -0800 (PST)
Received: from [192.168.1.75] (lft31-1-88-121-166-205.fbx.proxad.net.
 [88.121.166.205])
 by smtp.googlemail.com with ESMTPSA id d23sm15538184wma.20.2018.03.07.09.25.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Mar 2018 09:25:49 -0800 (PST)
Subject: Re: [PATCH v4 1/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, tglx@linutronix.de, avifishman70@gmail.com,
 brendanhiggins@google.com, joel@jms.id.au
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <1519655769-25836-1-git-send-email-tmaimon77@gmail.com>
 <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ff6b0bbb-31b1-b683-3061-4ad55a57eaa9@linaro.org>
Date: Wed, 7 Mar 2018 18:25:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2018 17:26:00 -0000

On 26/02/2018 15:36, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton NPCM7xx timer.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> new file mode 100644
> index 000000000000..c5150522e618
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> @@ -0,0 +1,25 @@
> +Nuvoton NPCM7xx timer
> +
> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
> +timer counters.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
> +- reg             : Offset and length of the register set for the device.
> +- interrupts      : Contain the timer interrupt with flags for
> +                    falling edge.
> +
> +Required clocking property, have to be one of:
> +- clocks          : phandle of timer reference clock.
> +- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
> +                    timer (usually 25000000).

Why one of these and not the phandle only ? That will make the driver
cleaner.

> +
> +Example:
> +
> +timer@f0008000 {
> +    compatible = "nuvoton,npcm750-timer";
> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    reg = <0xf0008000 0x1000>;
> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
> +};
> +
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
