Return-Path: <tmaimon77@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::241; helo=mail-it0-x241.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ndhJZR2X"; 
 dkim-atps=neutral
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zx9085gglzF1XS
 for <openbmc@lists.ozlabs.org>; Wed,  7 Mar 2018 21:30:40 +1100 (AEDT)
Received: by mail-it0-x241.google.com with SMTP id j7so2773831ita.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Mar 2018 02:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tXFSgcbM5GVvXgnLOfRc8T/E5ZFMWhEVyAu5+oKBUD8=;
 b=ndhJZR2XxZyX53kx3Bg1orb4UYqWjW93fFE2ATFQSDJJ4wXS/rohmrBlg2lpflYE7J
 /gem1yWeQKx19IxXh2Dr7u/GfBV8IZSYZAxr9DnAZ1fGJH7GGwcznq9axq3MwSj2bsJx
 uTTsmEIFbK01DhizjUO7F8O/PAve1qLCJPc8kMzFAKu+4/qWtQUtGWM5qR6XGYQSSQDY
 z33/8vUKug49jqzTj/2Ssep3OIbCkX7jwWj2jNTqpMC+A7wOe5KxDDe8z0WFzNVy4JdM
 auT2G6RC+sQMP3qdMyLlfRYzE6o4eeyzjU6U67ioK6l1i3Ze6O/7NZ546Vfsjv3l8DaE
 //Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tXFSgcbM5GVvXgnLOfRc8T/E5ZFMWhEVyAu5+oKBUD8=;
 b=GEMOGfDL4lYkPv0pxwkLEJIekc4fKVwul+mDs+/L2G5l3NO7BQd6bTu7gyc/ryFH1x
 yR5aX89v1Q4lPy+150T4sEVj9MGX69a/KzOUGgrRbP3hGuA7H1e+tHAVDSwie4XHSg8y
 f25W5KiMKMLrRk50A434fvl5aJHVeR+WXVgOapevbSJlfJzbqV2AB0aLX3k3PkhxM+k5
 YAX4EtpZTuHNUauUmoqa7XISs0A3H6ar/2/mlLLqHN+bVk0J5xQriDXnX4gD8PG9gZ9f
 DCMvZqVE2Dx790sPsYLzAI+vCkXMjUcn5ImeMXC1JmXaJmIWgCY2Bmf8OPWsHo5FK1+v
 piiA==
X-Gm-Message-State: AElRT7FLWomd6K4tjnKn2MQ+OMEJElZAajJgzF8/WMIUQmmDijOofXiA
 50XxjGf99jl/ke+zHzWQs2F+ovymzBz425aaKv8=
X-Google-Smtp-Source: AG47ELtevs7CFk89noceRDW1sYZWAuzfeiDJUO6AxYkTs9QGRp+Qrd6O6zimgHQHX3DzWRnHvErQnO4mwG11g6ddJyE=
X-Received: by 10.36.77.143 with SMTP id l137mr23331762itb.118.1520418637697; 
 Wed, 07 Mar 2018 02:30:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.183.17 with HTTP; Wed, 7 Mar 2018 02:30:37 -0800 (PST)
In-Reply-To: <CACPK8Xeb3ryfi+FXr+mdpk2fPtSTwJXkuBjRhW76vx1SxGQfYQ@mail.gmail.com>
References: <1519655769-25836-1-git-send-email-tmaimon77@gmail.com>
 <1519655769-25836-2-git-send-email-tmaimon77@gmail.com>
 <CACPK8Xeb3ryfi+FXr+mdpk2fPtSTwJXkuBjRhW76vx1SxGQfYQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 7 Mar 2018 12:30:37 +0200
Message-ID: <CAP6Zq1io9rLytqkyo5BBFw1Hf24c-r9PuH5ORsKu-j2brzbZHQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Wed, 07 Mar 2018 10:30:49 -0000

Sorry for the late response

On 2 March 2018 at 03:51, Joel Stanley <joel@jms.id.au> wrote:
> Hi Tomer,
>
> On Tue, Feb 27, 2018 at 1:06 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Added device tree binding documentation for Nuvoton NPCM7xx timer.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>> ---
>>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>> new file mode 100644
>> index 000000000000..c5150522e618
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>> @@ -0,0 +1,25 @@
>> +Nuvoton NPCM7xx timer
>
> Would it make more sense to all this Nuvoton NPCM Timer? This way the
> name stays generic for when you add other systems.
>
we cant promise the timer will stay the same in the next generation, I
will leave this for NPCM7xx
>> +
>> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
>> +timer counters.
>
>
> I notice the timer has a register in the middle of it that is used for
> the watchdog. Should we describe this in the same binding? Even if we
> just add some text that adds
>
>  ... and one watchdog register.
>
I'm not sure, because the binding is only for the timer I dont think I
need to describe what is the
register contains
>> +
>> +Required properties:
>> +- compatible      : "nuvoton,npcm750-timer" for Poleg NPCM750.
>> +- reg             : Offset and length of the register set for the device.
>> +- interrupts      : Contain the timer interrupt with flags for
>> +                    falling edge.
>> +
>> +Required clocking property, have to be one of:
>> +- clocks          : phandle of timer reference clock.
>> +- clock-frequency : The frequency in Hz of the clock that drives the NPCM7xx
>> +                    timer (usually 25000000).
>> +
>> +Example:
>> +
>> +timer@f0008000 {
>> +    compatible = "nuvoton,npcm750-timer";
>> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>> +    reg = <0xf0008000 0x1000>;
>
> This can probably be <0xf0008000 0x50>, as tthe timer hardware only
> has registers up to base + 0x50.
Thanks,
I will modify it in the next version, waiting fro more comments.
>
>> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +};
>> +
>> --
>> 2.14.1
>>

Cheers,

Tomer
