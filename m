Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x241.google.com (mail-qg0-x241.google.com
 [IPv6:2607:f8b0:400d:c04::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQwtb0NnpzDqHY
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 18:53:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ZRSqooTR; 
 dkim-atps=neutral
Received: by mail-qg0-x241.google.com with SMTP id p34so4780181qgp.0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fCR6vR02hQ0VpuyDQ4Kyet6EqnSSF6vx/hpePtyyaUQ=;
 b=ZRSqooTRP6iUZHZtMU4wjlak1tzmq+SreAyYeTycyRWPfXOpX7ZArYv2QJHx+HGpH8
 47TrUBvrPt4sv+bg/p0rlhAQPhShcLuJ0Ts51/bopSQu19tE23y5BVjMyNeJNGkAb8qu
 Xp6cDP2VUylI7blG2Rmm6YJ0ybtnU5PeN4lAdZdC0PXYK0JxJjfyeoHXgibdXshLr2/1
 ymdzhqFv/2UvQOxc4AMLwxMFv8hUitbcSBaV+EN1V+yWN+9PUG+21pqJU3r+/Yf7hA7t
 Vn1nn5h8mUoAcQ++NHQC51TZCNwiJTExYCWZh6wqwTCExh4znPfeBbwA5uTYD9N/INCf
 9ZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fCR6vR02hQ0VpuyDQ4Kyet6EqnSSF6vx/hpePtyyaUQ=;
 b=KjagPWab8XxMKJZapUPqLLPcnVyhAmq1/qjtc22SqJjiPmAmeImiKwqbtcsxfJ+uk+
 /eb53Sc8280zZwZ+AFflkIOXQqVicfTadmw2ez021ZhoFrt2gyJ8WeDg5XwagmzOPDNq
 3bL6PAxSGP8S1gaTi1lnH9Z/cFqQ1aa0BiTDEECPbojGnYVYz8vcdjHJA60a0Bh+Is9Q
 vtL4Phls4+kx+5VLNnjJOyaj2PwsAizEMgzJPIVq0Zb7/4XqfYtDchUAV+L/sC+SQgSI
 +zZ+GTPgtrwp2JzNPu025xA5ZZh/7rfM2IxFVuqaWnoIktmCQVVQpX55kENOckRT16UI
 cJ/Q==
X-Gm-Message-State: ALyK8tJB9lU+FBkP35ABIdPqTnANKQVO3pd1v/HMOcz5eDEQxXc4FSkuVAxNTIPOnr0X4Rj2kE29UYj/x/ODwg==
X-Received: by 10.140.129.82 with SMTP id 79mr715545qhb.28.1465548788871; Fri,
 10 Jun 2016 01:53:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Fri, 10 Jun 2016 01:52:49 -0700 (PDT)
In-Reply-To: <1465460046-7692-3-git-send-email-andrew@aj.id.au>
References: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
 <1465460046-7692-3-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Jun 2016 03:52:49 -0500
X-Google-Sender-Auth: tbZ6otwuX5kIqFKG_JqBeTLuehE
Message-ID: <CACPK8XdAUJASVLi_F0CNbuALYEY1pzHAA7UbxOMZK+Wks41qwQ@mail.gmail.com>
Subject: Re: [PATCH qemu 2/2] ast2400: Integrate the SCU model and configure
 reset values
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Teddy Reed <teddy.reed@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jun 2016 08:53:11 -0000

On Thu, Jun 9, 2016 at 3:14 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Almost all configured reset values are specified by the datasheet. The
> exception is ASPEED_SCU_SOC_SCRATCH1, where we mark the DRAM as
> successfully initialised by the SoC to avoid unnecessary dark corners in
> the SoC's u-boot support.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/ast2400.c         | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/ast2400.h |  2 ++
>  2 files changed, 49 insertions(+)
>
> diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
> index 4a9de0e10cbc..240da180befa 100644
> --- a/hw/arm/ast2400.c
> +++ b/hw/arm/ast2400.c
> @@ -24,12 +24,46 @@
>  #define AST2400_IOMEM_SIZE       0x00200000
>  #define AST2400_IOMEM_BASE       0x1E600000
>  #define AST2400_VIC_BASE         0x1E6C0000
> +#define AST2400_SCU_BASE         0x1E6E2000
>  #define AST2400_TIMER_BASE       0x1E782000
>  #define AST2400_I2C_BASE         0x1E78A000
>
>  static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
>  static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
>
> +static const AspeedSCUResetCfg scu_reset[] = {
> +    /* Values are defaults from the datasheet except where noted */
> +    { ASPEED_SCU_SYS_RST_CTRL,   0xFFCFFEDCU },
> +    { ASPEED_SCU_CLK_SEL,        0xF3F40000U },
> +    { ASPEED_SCU_CLK_STOP_CTRL,  0x19FC3E8BU },
> +    { ASPEED_SCU_D2PLL_PARAM,    0x00026108U },
> +    { ASPEED_SCU_MPLL_PARAM,     0x00030291U },
> +    { ASPEED_SCU_HPLL_PARAM,     0x00000291U },
> +    { ASPEED_SCU_MISC_CTRL1,     0x00000010U },
> +    { ASPEED_SCU_PCI_CTRL1,      0x20001A03U },
> +    { ASPEED_SCU_PCI_CTRL2,      0x20001A03U },
> +    { ASPEED_SCU_PCI_CTRL3,      0x04000030U },
> +    { ASPEED_SCU_SYS_RST_STATUS, 0x00000001U },
> +    { ASPEED_SCU_SOC_SCRATCH1,   0x000000C0U }, /* SoC completed DRAM init */
> +    { ASPEED_SCU_MISC_CTRL2,     0x00000023U },
> +    { ASPEED_SCU_RNG_CTRL,       0x0000000EU },
> +    { ASPEED_SCU_REV_ID,         0x02000303U },
> +    { ASPEED_SCU_PINMUX_CTRL2,   0x0000F000U },
> +    { ASPEED_SCU_PINMUX_CTRL3,   0x01000000U },
> +    { ASPEED_SCU_PINMUX_CTRL4,   0x000000FFU },
> +    { ASPEED_SCU_PINMUX_CTRL5,   0x0000A000U },
> +    { ASPEED_SCU_WDT_RST_CTRL,   0x003FFFF3U },
> +    { ASPEED_SCU_PINMUX_CTRL8,   0xFFFF0000U },
> +    { ASPEED_SCU_FREE_CNTR4,     0x000000FFU },
> +    { ASPEED_SCU_FREE_CNTR4_EXT, 0x000000FFU },
> +    { ASPEED_SCU_CPU2_BASE_SEG1, 0x80000000U },
> +    { ASPEED_SCU_CPU2_BASE_SEG4, 0x1E600000U },
> +    { ASPEED_SCU_CPU2_BASE_SEG5, 0xC0000000U },
> +    { ASPEED_SCU_UART_HPLL_CLK,  0x00001903U },
> +    { ASPEED_SCU_PCIE_CTRL,      0x0000007BU },
> +    { ASPEED_SCU_BMC_DEV_ID,     0x00002402U }

I can't see the strapping register in here. We use that to configure
the clock driver I'm writing, so it would be handy to have.

Cheers,

Joel
