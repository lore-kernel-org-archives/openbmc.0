Return-Path: <robherring2@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.68; helo=mail-oi0-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBMG00Vm1zDr69
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 02:57:59 +1100 (AEDT)
Received: by mail-oi0-f68.google.com with SMTP id 82so4025775oid.4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 08:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7Xa5cR1TBGd2vSAWMIixCp2oUh6E7WGMdy+JsXrw134=;
 b=OQbvCHLfrAEvTLoEyVK/PQHIQyLERiWsUa8H610WGTG+aon7SLxqqGSTOxkS5e1FD+
 95xduBLpGKFlyBYyvYMN7E6TwM4RXLj+qTReACDsaVyQqKcFHUzdLqynXDThFeNCxOh0
 l6OYS1l34PacprifVtLwSTsIf7D9Bl/et2dnUpNIlk/elbNVCFG/5RjAEzBJ6dSAE4sx
 w7If6b/T+qtxRqcDfUlbrOMxa0Hy+dd7dfZYurv3GVriE8Wuv1yEEmdZ77+NTsFt5H6s
 2W8W0KQd3IFdB9D2NfBAQlQsnRCn7oEGqPM7Q5ZDAi6v+jvgXXbp70Ir/ZYmkZUqYacY
 BkSQ==
X-Gm-Message-State: AMCzsaW+PFQ64z4665vh5xwsV674cGkTz1EdR7bTuNSBlcDHlvaVV7Ra
 9x7G9kL4GK5XMtN/qbpVWg==
X-Google-Smtp-Source: AOwi7QCt/KxE7rozG2x//mQHrRI7lzMqHKNAo5xvz+pIk9+o9WSN0pSnHQBDMdhVoZWuUOQkd3mmDA==
X-Received: by 10.157.69.10 with SMTP id w10mr1559701ote.79.1507651077035;
 Tue, 10 Oct 2017 08:57:57 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net.
 [216.188.254.6])
 by smtp.gmail.com with ESMTPSA id q7sm4284765oif.44.2017.10.10.08.57.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Oct 2017 08:57:56 -0700 (PDT)
Date: Tue, 10 Oct 2017 10:57:55 -0500
From: Rob Herring <robh@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de,
 avifishman70@gmail.com, brendanhiggins@google.com,
 raltherr@google.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 2/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
Message-ID: <20171010155755.wfklwchg4eg7u6p6@rob-hp-laptop>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
 <1506849098-18290-3-git-send-email-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506849098-18290-3-git-send-email-tmaimon77@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 15:58:00 -0000

On Sun, Oct 01, 2017 at 12:11:38PM +0300, Tomer Maimon wrote:
> Added device tree binding documentation for Nuvoton NPCM7xx timer.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> 
> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> new file mode 100644
> index 000000000000..d1beea901509
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
> @@ -0,0 +1,25 @@
> +Nuvoton NPCM7xx timer
> +
> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
> +timer counters.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm7xx-timer" for Poleg NPCM7xx.

Don't use wildcards in compatible strings. Use SoC specific compatible 
strings with a fallback (the string for the 1st SoC which the block 
appeared) if necessary.

> +- reg             : Offset and length of the register set for the device.
> +- interrupts      : Contain the timer interrupt with flags for
> +                    falling edge.
> +
> +Required clocking property, have to be one of:
> +- clocks          : phandle of timer reference clock.
> +- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
> +                    timer (usually 25000000).
> +
> +Example:
> +
> +timer@f0008000 {
> +    compatible = "nuvoton,npcm7xx-timer";
> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    reg = <0xf0008000 0x1000>;
> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
> +};
> +
> -- 
> 2.14.1
> 
