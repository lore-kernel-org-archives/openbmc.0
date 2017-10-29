Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::244; helo=mail-io0-x244.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dalLh8l6"; 
 dkim-atps=neutral
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQ8qk5G0QzDrcJ
 for <openbmc@lists.ozlabs.org>; Mon, 30 Oct 2017 07:49:38 +1100 (AEDT)
Received: by mail-io0-x244.google.com with SMTP id m16so22906453iod.1
 for <openbmc@lists.ozlabs.org>; Sun, 29 Oct 2017 13:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gHfDK5Ae0e27KHoCxJodkEvjJt+YYLKO5WgDgcHVZuQ=;
 b=dalLh8l60aUcfFSZDUub81Ew5X77qPEmcKGntJGwBFEa1pzooaEedyMxxI5gMHqT5j
 /EbkfUW5EoGBqfCvI4Q3kcQXqz2PYIjGPSQvrvwiaMYisOs3QfX21GV4v1qqryVNNCSH
 4HbxcQClDHmc1ksGHQ5b4pKvLBwLrchQZigUJXPY6ptehw/Ga8NPWBfmJsrKKL+gzCMG
 Qwx/CsLeKTqpGgXo/yj8kyU3upRrZZHeZKzbFeezGIiMI+4I1cr9H3zWbXmMjypTxaWS
 xSMS6KBkalqX9WTYgZ+NznljTEj25eyfBGDIWBeb3JfPVYv2rbrxSzks390mRDRsLpP8
 PVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gHfDK5Ae0e27KHoCxJodkEvjJt+YYLKO5WgDgcHVZuQ=;
 b=jo13jgzzcv6yrdEjcJJBQq+ZkK/JPpc5gCNOAl5sBsxejUZozsMeCIJESbPp3uiqWu
 eR19IN5lZVfWiwM1hQuS2pzkbwhDVh6NRh9pVr1KjQZsGh72HrYJK5SvNqMIhMQ8kHOo
 PYUqle1EWxtuUaRS3R2LvSZQyiNnYJCG0/GuzRMl2EiUtDQgqnSTjr44qlOJ3adoT7jK
 ugVl15sJRc+vaFqz7qVAKcAyMTJwEFVwFbVbFQd1+RMsHKKUBgsXHRt0RX0QYXQHwdLV
 OPnf1g871V23OQTkCiDCbtyA/8ov8AEK8iilyGbqTC+4aCpsf7Xv36gHtHa569Wyubre
 sj5g==
X-Gm-Message-State: AMCzsaUhVO3oaY4f3B8S0nWVIN/E8cJXbDf9Af5oZ5SLCA/WJhr7KfAA
 ZWNb0ypoY1wT9nHpx6paxZqgvQGSa1HKoZyQ9j8=
X-Google-Smtp-Source: ABhQp+RpXow73riGQPWZfEvgM2/sw+apP23HJqSHfZDUj+qwYa+drVNSHY3i7AFBbPtkroYBJVUd57/CzjnFVBk4KpI=
X-Received: by 10.36.74.135 with SMTP id k129mr3634882itb.147.1509310175815;
 Sun, 29 Oct 2017 13:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.28.66 with HTTP; Sun, 29 Oct 2017 13:49:35 -0700 (PDT)
In-Reply-To: <20171010155755.wfklwchg4eg7u6p6@rob-hp-laptop>
References: <1506849098-18290-1-git-send-email-tmaimon77@gmail.com>
 <1506849098-18290-3-git-send-email-tmaimon77@gmail.com>
 <20171010155755.wfklwchg4eg7u6p6@rob-hp-laptop>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 29 Oct 2017 22:49:35 +0200
Message-ID: <CAP6Zq1jKxvQ6bYF+WbxJEKEPb5J8RSS+bM=nH7L812bXJS7k9Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de, 
 Avi Fishman <avifishman70@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>, 
 Rick Altherr <raltherr@google.com>, joel@jms.id.au, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sun, 29 Oct 2017 20:49:39 -0000

Sorry for the delay,


On 10 October 2017 at 17:57, Rob Herring <robh@kernel.org> wrote:
> On Sun, Oct 01, 2017 at 12:11:38PM +0300, Tomer Maimon wrote:
>> Added device tree binding documentation for Nuvoton NPCM7xx timer.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> ---
>>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>>
>> diff --git a/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>> new file mode 100644
>> index 000000000000..d1beea901509
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>> @@ -0,0 +1,25 @@
>> +Nuvoton NPCM7xx timer
>> +
>> +Nuvoton NPCM7xx have three timer modules, each timer module provides five 24-bit
>> +timer counters.
>> +
>> +Required properties:
>> +- compatible      : "nuvoton,npcm7xx-timer" for Poleg NPCM7xx.
>
> Don't use wildcards in compatible strings. Use SoC specific compatible
> strings with a fallback (the string for the 1st SoC which the block
> appeared) if necessary.
>
The SOC NPCM7xx is now on upstream process, I asked Brendan to modify
the NPCM7xx device tree to support the clock source driver

https://www.spinics.net/lists/arm-kernel/msg614424.html

and also the arcitecture name

https://www.spinics.net/lists/arm-kernel/msg614059.html

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
>> +    compatible = "nuvoton,npcm7xx-timer";
>> +    interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>> +    reg = <0xf0008000 0x1000>;
>> +    clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +};
>> +
>> --
>> 2.14.1
>>
