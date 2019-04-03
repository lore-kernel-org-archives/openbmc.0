Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Z5CG6Q2yzDqHZ
 for <openbmc@lists.ozlabs.org>; Wed,  3 Apr 2019 23:35:37 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 3 Apr 2019 08:36:14 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.linux.com>
Subject: Re: [PATCH u-boot] aspeed: flash: Add MT25QL01GB chip
Message-ID: <20190403123614.4lxtjomfxinky6rc@thinkpad>
References: <1549646915-5300-1-git-send-email-anoo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1549646915-5300-1-git-send-email-anoo@linux.ibm.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 12:35:39 -0000

On Fri, Feb 08, 2019 at 11:28:35AM -0600, Adriana Kobylak wrote:
>From: Adriana Kobylak <anoo@us.linux.com>
>
>The MT25QL01GB is a 128MB NOR flash chip planned to be used on
>a Witherspoon system (AST2500).
>
>Signed-off-by: Adriana Kobylak <anoo@us.linux.com>
>---
> arch/arm/mach-aspeed/flash.c | 14 ++++++++++++++
> 1 file changed, 14 insertions(+)
>
>diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
>index 907e785..54a6059 100644
>--- a/arch/arm/mach-aspeed/flash.c
>+++ b/arch/arm/mach-aspeed/flash.c
>@@ -83,6 +83,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
> #define SST25VF040B		0x8d25bf
> #define AT25DF161		0x02461F
> #define AT25DF321		0x01471F
>+#define MT25QL01GB		0x21ba20
>
> /* SPI Define */
> #define CS0_CTRL			0x10
>@@ -1141,6 +1142,19 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
> 			ReadClk  = 50;
> 			break;
>
>+		case MT25QL01GB:
>+			info->sector_count = 2048;
>+			info->size = 0x8000000;
>+			erase_region_size  = 0x10000;
>+			info->readcmd = 0x0b;
>+			info->dualport = 0;
>+			info->dummybyte = 1;
>+			info->buffersize = 1;
>+			WriteClk = 50;
>+			EraseClk = 25;
>+			ReadClk  = 50;
>+			break;
>+
> 		default:	/* use JEDEC ID */
> 			printf("Unsupported SPI Flash!! 0x%08lx\n", info->flash_id);
> 			erase_region_size  = 0x10000;
>-- 
>1.8.3.1

Hi Joel

Would you be willing to carry this u-boot patch and if so, what all
would you like to see from our end to enable that?

thx - Brad
