Return-Path: <xow@google.com>
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t9S5Y4t3szDvYk
 for <openbmc@lists.ozlabs.org>; Sat,  5 Nov 2016 03:31:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="QmoaNRTx"; 
 dkim-atps=neutral
Received: by mail-qt0-x236.google.com with SMTP id p16so51328655qta.0
 for <openbmc@lists.ozlabs.org>; Fri, 04 Nov 2016 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dOm3koRQFlXQ/syR/CVECwYeoWy3QUS1SuvedAEPMT4=;
 b=QmoaNRTxI2Cz7X5zViqBJZN/okHyPR3SWg+SU7pe2HDig7Op5ZvSnV1tuNOxn+AUud
 r+v2QJq7GBlFs9MgDCpW8TEC5XV90yMwbRi3O64zyUOTZCMBJh/Wb/TviVY6Rl36tFP/
 HMQVit3nM6wbfXP/6FGxiYG6zmf0E23SchTxwzvIRXMPGF0pz/2piXvgi30/ftQOY5nS
 ILQl4vqHJx2Jj0yjgVx6mVwIAN+WUlneapmFrKag0RPtTxsTU6/egscHtpfcnKqRHVIA
 FIzMzZBCgM+b5Fk4xYylvQATjRRv3vnVlA3Hvh/f47tkmGbFMGlba25Pqx6BoSlf1JOK
 Ztrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dOm3koRQFlXQ/syR/CVECwYeoWy3QUS1SuvedAEPMT4=;
 b=I/s1a62nMkZjou0Kf7p0pSpUmGiQLvVOtjpeh0sIXI7z9Q30N3cqqal4Djngx5tRPn
 IVoTbMrpKEpeZU9LdFxT4Je/fXdYMfX2pM56rwl4sRgoYvSiDCrPN37w0ljfYaImUAq1
 dPa/kE88fCbQmh2SoOO1hvl5Vws6sl62Evx1YEQuyhZwMmNcdyL8TkH3GAkd+dXaItsM
 XLw0TZ4/e7QrFSfLhDB99ViO4zNNIrVpoAhg+jhxnPD4CnZAAK5nsWSWf807LDsEBEDi
 yPy9HPvWRUwG3t8b80C7RHXTgsCxnzz2rv0r8C2c+rRXtdeSu5L9tMtP8JzYr35JPQh5
 tRzw==
X-Gm-Message-State: ABUngvdmGQ2vQ0HTBH8gUoWPZOZa8ZmNQtWWzBd1WMVj1FGDZYK7fGSLFTDIa/NDHroS8aP2uCO4cSF+aJCaiA12
X-Received: by 10.237.53.119 with SMTP id b52mr14993893qte.74.1478277086166;
 Fri, 04 Nov 2016 09:31:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Fri, 4 Nov 2016 09:31:25 -0700 (PDT)
In-Reply-To: <1478234347.27396.87.camel@aj.id.au>
References: <20161104033042.32562-1-joel@jms.id.au>
 <20161104033042.32562-2-joel@jms.id.au>
 <1478234347.27396.87.camel@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 4 Nov 2016 09:31:25 -0700
Message-ID: <CAPH-5w6hyUtfKiceS+oHXCkP0gKyv6nHhSFHtsD9+=-QKArbOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: aspeed: Remove SPI1 strapping hacks
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 04 Nov 2016 16:31:30 -0000

On Thu, Nov 3, 2016 at 9:39 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 2016-11-04 at 14:00 +1030, Joel Stanley wrote:
>> Now that we have device tree and pinmux support for setting the
>> strapping we can remove these from the board file.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Xo Wang <xow@google.com>

>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 13 +------------
>>  1 file changed, 1 insertion(+), 12 deletions(-)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index ebb2224dcd13..2100e54ffbc2 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -160,13 +160,8 @@ static void __init do_ast2500evb_setup(void)
>>
>>       do_ast2500_common_setup();
>>
>> -     reg = readl(AST_IO(AST_BASE_SCU | 0x70));
>> -
>>       /* Set strap to RGMII for dedicated PHY networking */
>> -     reg |= BIT(6) | BIT(7);
>> -     /* Enable SPI Master and SPI Slave to AHB Bridge */
>> -     reg |= BIT(13);
>> -     writel(reg, AST_IO(AST_BASE_SCU | 0x70));
>> +     writel(BIT(6) | BIT(7), AST_IO(AST_BASE_SCU | 0x70));
>>  }
>>
>>  static void __init do_witherspoon_setup(void)
>> @@ -190,12 +185,6 @@ static void __init do_zaius_setup(void)
>>               /* D3 in GPIOA/B/C/D direction and data registers */
>>               unsigned long phy_reset_mask = BIT(27);
>>
>> -             /* Set strap[13:12] to 01, Enable SPI master */
>> -             /* Set bits in writes to SCU7C are cleared from SCU70 */
>> -             writel(BIT(13), AST_IO(AST_BASE_SCU | 0x7C));
>> -             /* SCU70 is set-only, so no read-modify-write needed */
>> -             writel(BIT(12), AST_IO(AST_BASE_SCU | 0x70));
>> -
>>               /* Disable GPIO I, G/AB pulldowns due to weak driving buffers */
>>               reg = readl(AST_IO(AST_BASE_SCU | 0x8C));
>>               writel(reg | BIT(24) | BIT(22), AST_IO(AST_BASE_SCU | 0x8C));
