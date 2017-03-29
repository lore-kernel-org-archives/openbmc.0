Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtP4057W5zDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 21:23:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="csmAI1cC"; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id d10so8574220qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lWjBsPmTuAu8zaKKmXOh0PPi/NMMZV2yRBExotDdLPY=;
 b=csmAI1cCMK1ypZcPyil1xruDfys12TbZzBTD8n1x0B01vQ8bNHP9HNTpSx/zWEzaqb
 11YowBVPQG46zxaekjflzOQYnnNnDd4I9PjLgJHPMmU7C4wfMBn94CETPbyE37gd7PUn
 ptTCeme2BwfJjm5TyeQPAQjpJWrmc8gpt56CEmzwmHlcRk75L506MR5Mq4FnN3GR/ATT
 xOdbOf5shd/e/fryBpvlZ4Q6AZN0EQv4y/DdyMSXBV0sEdj0R+m/uO3j0L0LBb4Wtta8
 jrmHTsPbbPjH5MavEunDDpWUpT6CJB+41vvRFFAdHpYpNHO9JhnhFaI5LhljKFXpmQc/
 wypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lWjBsPmTuAu8zaKKmXOh0PPi/NMMZV2yRBExotDdLPY=;
 b=NgEAUAsUIbtF79PjTbq5QOm8W/Q9TuAdG02P8MgNvc/+A03uUaJxwuKZ15XeLactTd
 sUGNrbcvEvOWTRHT7fNkrUYErGO8dh7+pX0iqCRZgYAMf7bQemPAstBwpMcNdyfDADEa
 +Buuz98zZjiPVhwaBf/NLNEwUYD10LO9cmaeY3shoJd9nce1G0QMMPqlhDJGAIDQasMG
 KX85p379BGBXwo84857jQZgBfqSX/yNm33w6yhjhhFaXYoRDKt7PEtuXkjHkmrOYakDC
 5NzNWTknDwcIxNruDevFLddEnBLeM85eVEj12FDyy7VjJQPO9mHXjkfwdydbOrulXfV+
 TfhQ==
X-Gm-Message-State: AFeK/H2EguAfjMMnunM3ZoyEsGX3L6GVILP27tOAmYQ76pTQHqZmqwPJqGY5leum0eNwVv1U4krVOrtJqaUBTlV6
X-Received: by 10.55.130.135 with SMTP id e129mr26846392qkd.111.1490783005885; 
 Wed, 29 Mar 2017 03:23:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Wed, 29 Mar 2017 03:23:25 -0700 (PDT)
In-Reply-To: <1490692168.3177.117.camel@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-5-brendanhiggins@google.com>
 <1490692168.3177.117.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 29 Mar 2017 03:23:25 -0700
Message-ID: <CAFd5g44LhP98nzVoKKN8J3rvBTnA-tXLFP+ActTBwn8UFqCgWA@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 10:23:29 -0000

>> +                               ASPEED_I2CD_M_HIGH_SPEED_EN |
>> +                               ASPEED_I2CD_M_SDA_DRIVE_1T_EN |
>
> s/ASPEED_I2CD_M_SDA_DRIVE_1T_EN/ASPEED_I2CD_M_SCL_DRIVE_1T_EN/
>
> (and in the definition too)

Will fix.

>
>> +                               ASPEED_I2CD_SDA_DRIVE_1T_EN,
>> +                               ASPEED_I2C_FUN_CTRL_REG);
>> +
>> +               aspeed_i2c_write(bus, 0x3, ASPEED_I2C_AC_TIMING_REG2);
>> +               aspeed_i2c_write(bus, aspeed_i2c_get_clk_reg_val(divisor),
>> +                                ASPEED_I2C_AC_TIMING_REG1);
>> +       } else {
>
> I don't think that's right. AFAIK ASPEED_I2CD_M_HIGH_SPEED_EN is about
> ignoring the timing register completely and going for full speed which
> is a few Mhz (I forgot how much). At least from my (possibly incorrect)
> reading of the spec and the SDK driver.
>
> Or maybe that's what you intend by the above ? Anything above 1Mhz ?
>
> I think there's a blurb somewhere that says that setting that bit makes
> it ignore the timing register completely. The definition is:
>
> <<
> Enable High Speed master mode
> 0 : normal speed mode
> 1 : high speed mode (3.4Mbps)
> High speed mode can only use buffer mode for transfer. And only master
> mode supports speed switching capability
>>>

Yeah, I was picking an arbitrary cutoff and 1MHz seemed reasonable in
part because in order to get above 1MHz you would set the divisor to 0
(1 << 0) anyway because you will only modify the SCL high and low time
for anything less than that. Also because that was the cutoff for fast
mode (as opposed to high speed).

>
> The spec of the base clock field of the timing register also says
>
> <<
> When switch to High Speed (HS) mode, the divisor will be switch to 0 by
> hardware automatically
>>>
>
> Note also that we aren't use buffer mode anyway so this can't work as-
> is, we're using byte mode.
>

Good catch. Yeah, I did not realize it. I should probably remove this
until that is supported then.

> The other interesting question is what is the frequency threshold for
> setting ASPEED_I2CD_M_SCL_DRIVE_1T_EN (and the SDA one) ?

I would guess that we should make them correspond to the cutoff for
high speed mode, or fast mode plus. Not really sure though, the
documentation is not clear on this (or a lot of other things :-P)

>
> Those bits are somewhat orthogonal to ASPEED_I2CD_M_HIGH_SPEED_EN. They
> make the device drive the signals for a clock when they go up to "speed
> up" the rising edge more than a normal pull up would do.
>
> If you have some fast devices, it would be interesting to scope the
> signal see from what speed it becomes interesting to set the 1T enable
> bits to speed up rising edges.

Agreed.
