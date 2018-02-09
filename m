Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::230; helo=mail-qt0-x230.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fVtQXN6n"; 
 dkim-atps=neutral
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zcwPK5yBwzF1BW
 for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2018 11:07:48 +1100 (AEDT)
Received: by mail-qt0-x230.google.com with SMTP id z10so8526219qti.5
 for <openbmc@lists.ozlabs.org>; Thu, 08 Feb 2018 16:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=egDqlIroT+3NYRrBSZb4DXUc9bDiJBFeg0FA5BECwrc=;
 b=fVtQXN6nqICdoCQqxwBUr86h91yjbq8PG9vF7oVtpsxtulxVyn5NnGJR+3apM+eUdn
 32TNKxq7wtTBohg6Xf4WW9Fkx0jsQ0/ajy+UF7tMfMrRMWYJWJ826VlbRhbZ+ZuqKuM/
 fD2jKif/3iGtHzDsUOzp7RwSQO33pBAxON0Ms3xMcE8ObwzFKfKY7QLku48sw4Lo6rIS
 4wyd7h1FXX6xQYDwZhHSxQRZhF52aIr4ro3fxtKo9SZuDdsUkFKP95PwBsl0qon2AYiB
 GpHYAZQVyE3UPjRROLVkHppO3k7Wd3pMH7nq8ywtC6aUeTSXNXCf0BvSMRdog/PU8QV+
 1a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=egDqlIroT+3NYRrBSZb4DXUc9bDiJBFeg0FA5BECwrc=;
 b=JWV4AskSQXvohISowlXwnYlOHQYPR1UXKP6QuBcdJFAMiremGgoqLo/XXlSeFxnyXB
 dV0/opH9zZeEkEZZ/5h+p30K59QzHEjykKKKhCbAkBvpPCsLWkvKBfwLBOLHDznCDgBh
 xnG26DfvU4J/T0DWgcCqJSmbKyq2nuVsZslM4FMkIA0hed1UuAK6XiENlsXxihGveOLs
 lT4Bnp7hy1uZn3gJL5MDmVELo6UJWQ+9ZZ5UtyCkT0q1gsffTP5NqlTPQ0kS/ta1+T5D
 JJAlWArDSjO+f1GGjBvZFGX0hRjdheihIbSdxj5+k4V0I5OF+SHL9siTTg+MKlcnhhko
 ItEw==
X-Gm-Message-State: APf1xPBNdySp+fYokVd5I0HSiM0ehpVjGfbxAxC1bJ7Qx/T5HIdkLdU7
 UeQ4bSD5esTOGvAG65EJIG/xmtdy0yHdLzv1okUTxA==
X-Google-Smtp-Source: AH8x22669fsB8ne0N/J7W2KglbTW1+Nlbse009uwXeYlPXSvd2Scq8oe9Lwwlo7nir/qHrOIRHJgciQFdl4s4Yat4NY=
X-Received: by 10.200.47.184 with SMTP id l53mr1544853qta.261.1518134865093;
 Thu, 08 Feb 2018 16:07:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.183 with HTTP; Thu, 8 Feb 2018 16:07:44 -0800 (PST)
In-Reply-To: <CAHb3i=uvj_KS4tZ_qZjQdMZ2CCg9_+11FbmvmF4D5DFGtaAW=g@mail.gmail.com>
References: <1517818975-11427-1-git-send-email-tmaimon77@gmail.com>
 <1517818975-11427-3-git-send-email-tmaimon77@gmail.com>
 <CAFd5g445Ae-uBO52sn1WH67tMgc0n_sbi6cS-SuKLhR__D98kg@mail.gmail.com>
 <CAHb3i=un-LjnV+DWBMkEcDKNFyEi63wh0RR0dHWsHpv2K9erTw@mail.gmail.com>
 <CAHb3i=uvj_KS4tZ_qZjQdMZ2CCg9_+11FbmvmF4D5DFGtaAW=g@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 8 Feb 2018 16:07:44 -0800
Message-ID: <CAFd5g44vTyOciaT5+YcVOdxd0=7sxWb3r+gO6_DFv3bmS=EL-w@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] clk: npcm: add NPCM7xx clock driver
To: Tali Perry <tali.perry1@gmail.com>
Cc: =?UTF-8?Q?=E2=80=8B_Tomer_Maimon?= <tmaimon77@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, sboyd@codeaurora.org, 
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>,
 linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Feb 2018 00:07:50 -0000

<snip>
>> +
>> +       /* Define fixed clocks.
>> +        * Notice: the following clocks are fixed value on NPCM7XX and should
>> +        * not be changed.
>> +        * therefor they are not exposed to the dev tree .
>
> I am not convinced. The top level .dtsi is usually SoC specific.
>
> - CLKREF should be fixed on 25MHz. I didn't want to put it in DT since
> it might appear as something that is changeable.
>  on npcm750 all clocks are set in ROM +BB (several possible settings)
> , so this entire driver is only used for reading the current clock
> settings. All clocks are read only and derived from CLKREF. CLKREF is
> fixed so no point in putting it in DT and exposing it outside of this
> driver.

I understand your rationale, but the *.dtsi is typically used to describe the
SoC, things that cannot change. For example, consider
arch/arm/boot/dts/nuvoton-npcm750.dtsi, it describes the CPU cores, cache
hierarchy, peripherals and what busses they reside on, memory layout, etc. None
of these things are configurable; the *.dtsi just describes the SoC. Typically,
a *.dts is made for a particular board and imports a *.dtsi and does some
configuration, but it is not supposed to override things like what I listed
above (amoung other things).

There are several reasons that you put this information that cannot change in a
*.dtsi. For one it is a convenient, all in one place description of the SoC that
serves as a form of documentation. But more importantly, if you were to create a
variation of the 750 with a different number of cores, a different memory
layout, a different reference clock, etc, you could potentiallly use the same
drivers for both SoCs, and you would only have to write a new *.dtsi. I know you
may have no intention to do this, but many other CPU vendors do. And for this
reason, this is how drivers are expected to be written.

I hope this makes sense.

>
>> +        */
>> +       pr_debug("\tclk register fixed clocks\n");
>> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_REFCLK,
>> +               NULL, 0, 25000000);
>> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_SYSBYPCK,
>> +               NULL, 0, 800000000); // rarely used. mostly testing. TBD: remove
>> +       hw = clk_hw_register_fixed_rate(NULL, NPCM7XX_CLK_S_MCBYPCK,
>> +               NULL, 0, 800000000); // rarely used.  mostly testing. TBD:remove
>> +
>> +
<snip>
