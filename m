Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e7GD99db"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="kwFwz6n1"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zsskD0HKMzDqZs
 for <openbmc@lists.ozlabs.org>; Fri,  2 Mar 2018 12:52:19 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id v90so10142549qte.12
 for <openbmc@lists.ozlabs.org>; Thu, 01 Mar 2018 17:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hJU/ndnISZyG0jE2xOEMGsaLhSa/1hFJHUPDV8Nuw0k=;
 b=e7GD99dbAibF2uPnJFZYIp5r/fqijmY5fhTyFTlfBNlaZUHovWOIPmXJSuqIlvmY2f
 jXIZyDUsuyLHtlr1Lk6WNys2sq69xheLhaRCVbq1nBwve5SHBx49YITMqM1dalF7v5a2
 C8U56CZTtmRis7QNratQ92gu0XbY2/chc0n0jKQ5CiHGP4adgrX2gUIcA1kO3PM8H3rY
 TNGmNeVZoalXOcv6NN7LFTUVT7GefJ+sEYJkSN//DheJKnu8YlT0/qCuRn2pLOHf4hfE
 dW6DTmvwd/C524VJiV0Wa2e/JDahWv5XAeasYBETVvKUw/mDXKZ/qM6TD+6hkSza5gUa
 UG+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hJU/ndnISZyG0jE2xOEMGsaLhSa/1hFJHUPDV8Nuw0k=;
 b=kwFwz6n1qcdtwVjGyI7WvB3c67OqhtUaSbf8vbIPfhmVr14D5N3YhlkN+aP7Yzp9Yn
 bXJsuFL6JO5ivMaQVusaqPEkc0JgqrGGpm0G1fYSKrfyf0K8A4NTAlsxaVCVTDw3jGWk
 d7cZqoNH8T5ZugTrECSNtQUXbwhEoQZ8b1xBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hJU/ndnISZyG0jE2xOEMGsaLhSa/1hFJHUPDV8Nuw0k=;
 b=fD4kHessSTJ5uqCcyLIKOyDzEywpUisndqj/c5UrvCRbQ/E3jBMH0n24U4Q7q8oCO/
 usJZ7kJz5PW7WNqtxY+1p+lcgmUWFJ2ubErVUb3SahwgWuUuYSlW5TDqGhDm5BdRnOjb
 etvoZ1FL1ePizLLZmiZmzJ19asaQeJEJCnFm/UOyHojsAoK8Z25qDMpJ5sNkoyRhIHtB
 i1mzDN3pzSyG8bBqAncdQFl+Wc1X6Ema5sVW1izm5WrRDKqrBBOleNpy4YdjaGDccmrq
 ++QvaCcjBc1lBHNGXTXFOV78jlIGdLD+l3L6Vmkb9iI3ftyz4EluAalIf4NuXgBDq6RO
 ZmsQ==
X-Gm-Message-State: AElRT7Gtf0BCoPg4d8hWMv9FAKyMjFtrW5rcRVT9WwS0hFYc3Sd1rdtN
 GcbRGRWtYp1e8sQOqg26+gLwS4vx2YhKhaurwWM=
X-Google-Smtp-Source: AG47ELvrzyLxkjCp9xhHOCgM0J0jpFX0vr42yB4Le/m8QpZLTdbRsqh5KlwzeIe8XtVADciDjHlqdDVkPBN4laUgfaI=
X-Received: by 10.237.36.110 with SMTP id s43mr6278590qtc.23.1519955537360;
 Thu, 01 Mar 2018 17:52:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Thu, 1 Mar 2018 17:51:57 -0800 (PST)
In-Reply-To: <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
References: <1519655769-25836-1-git-send-email-tmaimon77@gmail.com>
 <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 2 Mar 2018 12:21:57 +1030
X-Google-Sender-Auth: pNjvUWkc9RTOb91wocDVyV7bXEE
Message-ID: <CACPK8Xeb3ryfi+FXr+mdpk2fPtSTwJXkuBjRhW76vx1SxGQfYQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Avi Fishman <avifishman70@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 02 Mar 2018 01:52:21 -0000

Hi Tomer,

On Tue, Feb 27, 2018 at 1:06 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
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

Would it make more sense to all this Nuvoton NPCM Timer? This way the
name stays generic for when you add other systems.

> +
> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
> +timer counters.


I notice the timer has a register in the middle of it that is used for
the watchdog. Should we describe this in the same binding? Even if we
just add some text that adds

 ... and one watchdog register.

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
> +
> +Example:
> +
> +timer@f0008000 {
> +    compatible = "nuvoton,npcm750-timer";
> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    reg = <0xf0008000 0x1000>;

This can probably be <0xf0008000 0x50>, as tthe timer hardware only
has registers up to base + 0x50.

> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
> +};
> +
> --
> 2.14.1
>
