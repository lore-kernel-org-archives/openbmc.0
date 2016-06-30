Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x241.google.com (mail-pa0-x241.google.com
 [IPv6:2607:f8b0:400e:c03::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9nP4Mf8zDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=WAeQpsWW; 
 dkim-atps=neutral
Received: by mail-pa0-x241.google.com with SMTP id us13so6440094pab.1
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QsOHaLbcSp6CG7LgoIL3J9naqQ+1Mx9d7VKUY9wJLzw=;
 b=WAeQpsWWyZwP3/GeCIno8sjGPHEEX4fOFhSij2+cSgPh0IXn6Kz9Jyc5iSS+vUfY0L
 zN6IJWV8RH4Pv+EvAV7DS38TagqqTPJ8GzZARCPFd50IDysw+hP9XC9VkmgIS2PHmEvN
 8ypKb2egdxV58ROEJ1wRtd4Ss2RQ+de5vISiSBgT4Y0Xbkt0UIDpslf9GhUtLEUuELsv
 EcRY4P1NT0JhLTN8ozCJrsLvNrgY/M6yriLm6nOIQw4Y1EsGUwhjc1vujYXQSxerKPd0
 y8Q1Eq8tw5KjXYmz4dJvDSzCd43r+j8L+t1lRoN5wusrxAwtJ9dUdXwFieVdHa8f+ooR
 3K/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QsOHaLbcSp6CG7LgoIL3J9naqQ+1Mx9d7VKUY9wJLzw=;
 b=mgEqZHO1kwO+sQXZPGcZRQOKM4p4Fp9wmYI7IMCFuBMsMuR5ZMw+6tV+h67z0C4t/5
 VkXSC/VCoyHGfBQPpdSZMRmt0Y1jWYKCkR0Mwv6o3o2reBUkMPCGD3lXHchxnJndXXp1
 XqQeaCvZfnMax0E95O5ehhURpII6rgfZ3SlDLEnheM+JCROEVf+nJooDpPVyWJAj83DW
 ZelJMhM3WZpawAW5n+nfRNe8xSUFXMtZoYj5pMmHvo3Oo7uBlxjgzuAeb+U987S3w/Du
 O3T0Mb4Z4Sbd0hHlmiyWLiO9cgKYUOyLBAqsUSdxb8S7wmUOEVqBLULwagrYx6X9sbHY
 VyDw==
X-Gm-Message-State: ALyK8tID2sMiFOrok6vkwUP4AhDOZWZN5AkSYwxQnVT2AaQ38BJWegRnnxKvV6Gny6JSqw==
X-Received: by 10.66.127.47 with SMTP id nd15mr18930515pab.74.1467270967908;
 Thu, 30 Jun 2016 00:16:07 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id v62sm2885397pfv.50.2016.06.30.00.16.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2016 00:16:07 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1467270963.6386.33.camel@jms.id.au>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 6/9] aspeed/ast-g4: use
 literal defines in misc_init_r()
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 30 Jun 2016 16:46:03 +0930
In-Reply-To: <1467216591-8616-7-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-7-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 30 Jun 2016 07:16:10 -0000

On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
> and also make sure the routine is called: CONFIG_MISC_INIT_R still
> needs to be defined in the platform config file.

Good cathc. I removed CONFIG_MISC_INIT_R from the g5 boards as it was
empty, but we do need it on the g4s.

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  board/aspeed/ast-g4/ast-g4.c | 15 +++++++++------
>  include/configs/ast-g4.h     |  1 +
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/board/aspeed/ast-g4/ast-g4.c b/board/aspeed/ast-g4/ast-
> g4.c
> index c4fa76d216be..c632af70b9e1 100644
> --- a/board/aspeed/ast-g4/ast-g4.c
> +++ b/board/aspeed/ast-g4/ast-g4.c
> @@ -7,7 +7,10 @@
>  
>  #include <common.h>
>  #include <netdev.h>
> +#include <asm/arch/platform.h>
>  #include <asm/arch/ast-sdmc.h>
> +#include <asm/arch/regs-ahbc.h>
> +#include <asm/arch/regs-scu.h>
>  #include <asm/io.h>
>  
>  DECLARE_GLOBAL_DATA_PTR;
> @@ -36,14 +39,14 @@ int misc_init_r(void)
>  	u32 reg;
>  
>  	/* Unlock AHB controller */
> -	writel(0xAEED1A03, 0x1E600000);
> +	writel(AHBC_PROTECT_UNLOCK, AST_AHBC_BASE);
>  
>  	/* Map DRAM to 0x00000000 */
> -	reg = readl(0x1E60008C);
> -	writel(reg | BIT(0), 0x1E60008C);
> +	reg = readl(AST_AHBC_BASE + AST_AHBC_ADDR_REMAP);
> +	writel(reg | BIT(0), AST_AHBC_BASE + AST_AHBC_ADDR_REMAP);
>  
>  	/* Unlock SCU */
> -	writel(0x1688A8A8, 0x1e6e2000);
> +	writel(SCU_PROTECT_UNLOCK, AST_SCU_BASE);
>  
>  	/*
>  	 * The original file contained these comments.
> @@ -53,10 +56,10 @@ int misc_init_r(void)
>  	 * PCLK  = HPLL/8
>  	 * BHCLK = HPLL/8
>  	 */
> -	reg = readl(0x1e6e2008);
> +	reg = readl(AST_SCU_BASE + AST_SCU_CLK_SEL);
>  	reg &= 0x1c0fffff;
>  	reg |= 0x61800000;
> -	writel(reg, 0x1e6e2008);
> +	writel(reg, AST_SCU_BASE + AST_SCU_CLK_SEL);
>  
>  	return 0;
>  }
> diff --git a/include/configs/ast-g4.h b/include/configs/ast-g4.h
> index ed182e0c8829..ab0a4bb7654d 100644
> --- a/include/configs/ast-g4.h
> +++ b/include/configs/ast-g4.h
> @@ -20,6 +20,7 @@
>  
>  
>  #define CONFIG_ARCH_CPU_INIT
> +#define CONFIG_MISC_INIT_R
>  #define CONFIG_MACH_TYPE		MACH_TYPE_ASPEED
>  
>  #include <asm/arch/platform.h>
