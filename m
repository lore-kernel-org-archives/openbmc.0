Return-Path: <joel.stan@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com
 [IPv6:2607:f8b0:400e:c03::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rnrX63s1lzDqxS
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2016 13:42:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fQKeF4Ta; 
 dkim-atps=neutral
Received: by mail-pa0-x244.google.com with SMTP id hh10so2496937pac.1
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jul 2016 20:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxdVN371tAIXrgZFBcttNeQlsleeqFs+1WMRGsiuMjo=;
 b=fQKeF4TaN9q0jpeaPVs3yalu5DnTnrDLvHEataxJHN/iUKoQwyr0D6FEMReXFIh3Z3
 6LaD0TIJHZrRJTEQ5i71tJOMqavcJbv6gG5W8zu0xy9qPTLIN7rT2lzXEf/O7EugtNC8
 qDi63O2Rj5utRWYV4pZ7zOrIiNspQXtg1kaB5UP+RoHwPPy0eq2HOj9t/tMhtMygo3ju
 9COWB+2gm9Lk+Mn4GH1Z1RzWMYCw6rpDxCgq3YBCPJJ+MFmZHDqaUhKYAZop90uqzyH9
 /dlHMh8gKOA6ea18AvvWRxVhL576a6+xe3lgbyk1Z/t+dc6LqZa1XvcAYhp3gRdF4A+Z
 1flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lxdVN371tAIXrgZFBcttNeQlsleeqFs+1WMRGsiuMjo=;
 b=BEJKxllwLaCgBHaZlD1sMyMgk0uKfJ2M3FqNZFEo6d7Qtje7UL/HZqjqPF1Z8CVfED
 Q6R3AfUNP4l2sRBF3CHAL+VTf6h/UmswynXFiHFjHPHc5ApHHMq8Ocq50kVPCrPCDDRi
 0l3IrRoMbdN3GqDB8F98sJUhJYkiORD6ZryYbNpuQXRT/MQWT99GOT85XLrkHOOFGLGW
 nBCFbuAZo6LwCS7WPqaVeF+QhJUEazjucuteyZFevBsNBxG5zGwASz5ohnQoFTjq2iWL
 HqS2Mki9xpU1mdRa0S5C8P5hUWTGnJMHefNURnP97UWA9qrc8wxEGNHMSuu3TMwNz0fr
 h2cQ==
X-Gm-Message-State: ALyK8tJ4WU0gek0RRp/pRkG7OhgDXgQauv5P8ASpbNdSz6Dn59CALMtQlYmEhDCHZDWK8w==
X-Received: by 10.66.218.234 with SMTP id pj10mr31070391pac.81.1468208564445; 
 Sun, 10 Jul 2016 20:42:44 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id g80sm4432044pfk.51.2016.07.10.20.42.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Jul 2016 20:42:43 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1468208559.10852.0.camel@jms.id.au>
Subject: Re: [PATCH v2 uboot v2016.05-aspeed-openbmc] aspeed/ast-g4: fix
 typos in hardware strapping register1
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Mon, 11 Jul 2016 13:12:39 +0930
In-Reply-To: <1467958708-30770-1-git-send-email-clg@kaod.org>
References: <1467958708-30770-1-git-send-email-clg@kaod.org>
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
X-List-Received-Date: Mon, 11 Jul 2016 03:42:47 -0000

On Fri, 2016-07-08 at 08:18 +0200, Cédric Le Goater wrote:
> This adds also some bit definitions. The list should be clean enough
> to be used in other projects, such as in the qemu SCU device model.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Thanks, merged as 66f534ae1d7d364d88abf18ad2d86b02cf9eda47 to
the v2016.05-aspeed-openbmc branch of openbmc/u-boot.

Cheers,

Joel

> ---
> 
>  ast-g5 will need some checks also.
> 
>  Changes since v1:
> 
>  - included fixes from Milton on SCU_HW_STRAP_SW_DEFINE_MASK and
>    SCU_HW_STRAP_SET_CLK_SOURCE(x
> 
>  arch/arm/include/asm/arch-aspeed/regs-scu.h |   87 +++++++++++++++
> -------------
>  1 file changed, 47 insertions(+), 40 deletions(-)
> 
> Index: u-boot-v2016.05-aspeed-openbmc.git/arch/arm/include/asm/arch-
> aspeed/regs-scu.h
> ===================================================================
> --- u-boot-v2016.05-aspeed-
> openbmc.git.orig/arch/arm/include/asm/arch-aspeed/regs-scu.h
> +++ u-boot-v2016.05-aspeed-openbmc.git/arch/arm/include/asm/arch-
> aspeed/regs-scu.h
> @@ -571,20 +571,24 @@
>  #define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2)& 0x3)
>  #define SCU_HW_STRAP_VGA_MASK		(0x3 << 3)
>  #define SCU_HW_STRAP_VGA_SIZE_SET(x)	(x << 2)
> -
> -#define VGA_8M_DRAM			0
> -#define VGA_16M_DRAM			1
> -#define VGA_32M_DRAM			2
> -#define VGA_64M_DRAM			3
> +#define     VGA_8M_DRAM			    0
> +#define     VGA_16M_DRAM		    1
> +#define     VGA_32M_DRAM		    2
> +#define     VGA_64M_DRAM		    3
>  
>  #define SCU_HW_STRAP_DIS_BOOT 		(1)
>  #else /* !AST_SOC_G5 */
>  #define SCU_HW_STRAP_SW_DEFINE(x)	(x << 29)
> -#define SCU_HW_STRAP_SW_DEFINE_MASK	(0x3 << 29)
> -#define SCU_HW_STRAP_DRAM_SIZE		(x << 29)
> -#define SCU_HW_STRAP_DRAM_SIZE_MASK	(0x3 << 29)
> +#define SCU_HW_STRAP_SW_DEFINE_MASK	(0x7 << 29)
> +
> +#define SCU_HW_STRAP_DRAM_SIZE(x)	(x << 27)
> +#define SCU_HW_STRAP_DRAM_SIZE_MASK	(0x3 << 27)
> +#define     DRAM_SIZE_64MB                  0
> +#define     DRAM_SIZE_128MB                 1
> +#define     DRAM_SIZE_256MB                 2
> +#define     DRAM_SIZE_512MB                 3
>  
> -#define SCU_HW_STRAP_DRAM_CONFIG	(x << 24)
> +#define SCU_HW_STRAP_DRAM_CONFIG(x)	(x << 24)
>  #define SCU_HW_STRAP_DRAM_CONFIG_MASK	(0x7 << 24)
>  
>  #define SCU_HW_STRAP_GPIOE_PT_EN	(0x1 << 22)
> @@ -593,60 +597,63 @@
>  #define SCU_HW_STRAP_ACPI_DIS		(0x1 << 19)
>  
>  /* bit 23, 18 [1,0] */
> -#define SCU_HW_STRAP_SET_CLK_SOURCE(x)	((((x&0x3) >>
> 1)<<23)||((x&0x1) << 18))
> -#define SCU_HW_STRAP_GET_CLK_SOURCE(x)	(((x>>23)&0x1<<1) |
> ((x>>18)&0x1))
> +#define SCU_HW_STRAP_SET_CLK_SOURCE(x)  ((((x & 0x3) >> 1) << 23) |
> \
> +                                         ((x & 0x1) << 18))
> +#define SCU_HW_STRAP_GET_CLK_SOURCE(x)  ((((x >> 23) & 0x1) << 1) |
> \
> +					 ((x >> 18) & 0x1))
>  #define SCU_HW_STRAP_CLK_SOURCE_MASK	((0x1 << 23) | (0x1 <<
> 18))
> -
> -#define CLK_25M_IN			(0x1 << 23)
> -#define CLK_24M_IN			0
> -#define CLK_48M_IN			1
> -#define CLK_25M_IN_24M_USB_CKI		3
> -#define CLK_25M_IN_48M_USB_CKI		3
> +#define     CLK_25M_IN			(0x1 << 23)
> +#define     CLK_24M_IN			    0
> +#define     CLK_48M_IN			    1
> +#define     CLK_25M_IN_24M_USB_CKI	    2
> +#define     CLK_25M_IN_48M_USB_CKI	    3
>  
>  #define SCU_HW_STRAP_2ND_BOOT_WDT	(0x1 << 17)
>  #define SCU_HW_STRAP_SUPER_IO_CONFIG	(0x1 << 16)
>  #define SCU_HW_STRAP_VGA_CLASS_CODE	(0x1 << 15)
>  #define SCU_HW_STRAP_LPC_RESET_PIN	(0x1 << 14)
> +
>  #define SCU_HW_STRAP_SPI_MODE(x)	(x << 12)
>  #define SCU_HW_STRAP_SPI_MODE_MASK	(0x3 << 12)
> -#define SCU_HW_STRAP_SPI_MASTER		(0x1 << 12)
> -#define SCU_HW_STRAP_SPI_M_S_EN		(0x2 << 12)
> -#define SCU_HW_STRAP_SPI_PASS_THROUGH	(0x3 << 12)
> +#define     SCU_HW_STRAP_SPI_DIS            0
> +#define     SCU_HW_STRAP_SPI_MASTER	    1
> +#define     SCU_HW_STRAP_SPI_M_S_EN	    2
> +#define     SCU_HW_STRAP_SPI_PASS_THROUGH   3
>  
>  #define SCU_HW_STRAP_SET_CPU_AHB_RATIO(x)	(x << 10)
>  #define SCU_HW_STRAP_GET_CPU_AHB_RATIO(x)	((x >> 10) & 3)
>  #define SCU_HW_STRAP_CPU_AHB_RATIO_MASK		(0x3 << 10)
> +#define     CPU_AHB_RATIO_1_1		    0
> +#define     CPU_AHB_RATIO_2_1		    1
> +#define     CPU_AHB_RATIO_4_1		    2
> +#define     CPU_AHB_RATIO_3_1		    3
>  
> -#define CPU_AHB_RATIO_1_1		0
> -#define CPU_AHB_RATIO_2_1		1
> -#define CPU_AHB_RATIO_4_1		2
> -#define CPU_AHB_RATIO_3_1		3
> -
> -#define SCU_HW_STRAP_GET_H_PLL_CLK(x)	((x >> 8 )& 0x3)
> +#define SCU_HW_STRAP_GET_H_PLL_CLK(x)	((x >> 8) & 0x3)
>  #define SCU_HW_STRAP_H_PLL_CLK_MASK	(0x3 << 8)
> -#define CPU_384MHZ			0
> -#define CPU_360MHZ			1
> -#define CPU_336MHZ			2
> -#define CPU_408MHZ			3
> +#define     CPU_384MHZ			    0
> +#define     CPU_360MHZ			    1
> +#define     CPU_336MHZ			    2
> +#define     CPU_408MHZ			    3
>  
>  #define SCU_HW_STRAP_MAC1_RGMII		(0x1 << 7)
>  #define SCU_HW_STRAP_MAC0_RGMII		(0x1 << 6)
>  #define SCU_HW_STRAP_VGA_BIOS_ROM	(0x1 << 5)
>  #define SCU_HW_STRAP_SPI_WIDTH		(0x1 << 4)
> -#define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2)& 0x3)
> +
> +#define SCU_HW_STRAP_VGA_SIZE_GET(x)	((x >> 2) & 0x3)
>  #define SCU_HW_STRAP_VGA_MASK		(0x3 << 2)
>  #define SCU_HW_STRAP_VGA_SIZE_SET(x)	(x << 2)
> -
> -#define VGA_8M_DRAM			0
> -#define VGA_16M_DRAM			1
> -#define VGA_32M_DRAM			2
> -#define VGA_64M_DRAM			3
> +#define     VGA_8M_DRAM			    0
> +#define     VGA_16M_DRAM		    1
> +#define     VGA_32M_DRAM		    2
> +#define     VGA_64M_DRAM		    3
>  
>  #define SCU_HW_STRAP_BOOT_MODE(x)	(x)
> -#define NOR_BOOT			0
> -#define NAND_BOOT			1
> -#define SPI_BOOT			2
> -#define DIS_BOOT			3
> +#define     NOR_BOOT			    0
> +#define     NAND_BOOT			    1
> +#define     SPI_BOOT			    2
> +#define     DIS_BOOT			    3
> +
>  #endif /* AST_SOC_G5 */
>  
>  /* AST_SCU_RAMDOM_GEN			0x74 - random number
> generator register */
