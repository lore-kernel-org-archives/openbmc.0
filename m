Return-Path: <clg@kaod.org>
Received: from mo5.mail-out.ovh.net (mo5.mail-out.ovh.net [178.32.228.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYlbc0TzRzDvk7
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 04:19:23 +1100 (AEDT)
Received: from player760.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 7B3A452A77
 for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2016 18:19:16 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: postmaster@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 5CCFC39C;
 Wed,  7 Dec 2016 18:19:12 +0100 (CET)
Subject: Re: [PATCH u-boot v3 2/3] bootm: relocate ramdisk if
 CONFIG_SYS_BOOT_RAMDISK_HIGH set
To: Rick Altherr <raltherr@google.com>, openbmc@lists.ozlabs.org
References: <1480961822-6631-1-git-send-email-raltherr@google.com>
 <1480961822-6631-3-git-send-email-raltherr@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <92898875-6461-b5bd-dac8-a50540d93bef@kaod.org>
Date: Wed, 7 Dec 2016 18:19:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480961822-6631-3-git-send-email-raltherr@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4941293216300108546
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrhedvgdeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 07 Dec 2016 17:19:25 -0000

On 12/05/2016 07:17 PM, Rick Altherr wrote:
> In 35fc84f, bootm was refactored so plain 'bootm' and
> 'bootm <subcommand>' shared a common implementation.
> The 'bootm ramdisk' command implementation is now part of the common
> implementation but not invoke by plain 'bootm' since the original
> implementation never did ramdisk relocation.  Instead, ramdisk
> relocation happened in image_setup_linux() which is typically called
> during the OS portion of 'bootm'.
> 
> On ARM, parameters to the Linux kernel can either be passed by FDT or
> ATAGS. When using FDT, image_setup_linux() is called which also triggers
> ramdisk relocation.  When using ATAGS, image_setup_linux() is _not_
> called because it mostly does FDT setup.
> 
> Instead of calling image_setup_linux() in both FDT and ATAGS cases,
> include BOOTM_STATE_RAMDISK in the requested states during a plain
> 'bootm' if CONFIG_SYS_BOOT_RAMDISK_HIGH is set and remove the ramdisk
> relocation from image_setup_linux().  This causes ramdisk relocation to
> happen on any system where CONFIG_SYS_BOOT_RAMDISK_HIGH regardless of
> the OS being booted. Also remove IMAGE_ENABLE_RAMDISK_HIGH as it was
> only used by the now-removed code from image_setup_linux().
> 
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
>  cmd/bootm.c     | 3 +++
>  common/image.c  | 7 -------
>  include/image.h | 6 ------
>  3 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/cmd/bootm.c b/cmd/bootm.c
> index 16fdea5..8da750e 100644
> --- a/cmd/bootm.c
> +++ b/cmd/bootm.c
> @@ -131,6 +131,9 @@ int do_bootm(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
>  	return do_bootm_states(cmdtp, flag, argc, argv, BOOTM_STATE_START |
>  		BOOTM_STATE_FINDOS | BOOTM_STATE_FINDOTHER |
>  		BOOTM_STATE_LOADOS |
> +#ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
> +		BOOTM_STATE_RAMDISK |
> +#endif
>  #if defined(CONFIG_PPC) || defined(CONFIG_MIPS)
>  		BOOTM_STATE_OS_CMDLINE |
>  #endif
> diff --git a/common/image.c b/common/image.c
> index 0be09e5..6584f7f 100644
> --- a/common/image.c
> +++ b/common/image.c
> @@ -1470,13 +1470,6 @@ int image_setup_linux(bootm_headers_t *images)
>  			return ret;
>  		}
>  	}
> -	if (IMAGE_ENABLE_RAMDISK_HIGH) {
> -		rd_len = images->rd_end - images->rd_start;
> -		ret = boot_ramdisk_high(lmb, images->rd_start, rd_len,
> -				initrd_start, initrd_end);
> -		if (ret)
> -			return ret;
> -	}

you might to clean up these warnings first: 

../common/image.c: In function 'image_setup_linux':
../common/image.c:1543:8: warning: unused variable 'rd_len' [-Wunused-variable]
  ulong rd_len;
        ^~~~~~
../common/image.c:1541:9: warning: unused variable 'initrd_end' [-Wunused-variable]
  ulong *initrd_end = &images->initrd_end;
         ^~~~~~~~~~
../common/image.c:1540:9: warning: unused variable 'initrd_start' [-Wunused-variable]
  ulong *initrd_start = &images->initrd_start;
         ^~~~~~~~~~~~

Thanks,

C. 


>  
>  	if (IMAGE_ENABLE_OF_LIBFDT) {
>  		ret = boot_relocate_fdt(lmb, of_flat_tree, &of_size);
> diff --git a/include/image.h b/include/image.h
> index d788c26..a16187f 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -99,12 +99,6 @@ struct lmb;
>  
>  #endif /* IMAGE_ENABLE_FIT */
>  
> -#ifdef CONFIG_SYS_BOOT_RAMDISK_HIGH
> -# define IMAGE_ENABLE_RAMDISK_HIGH	1
> -#else
> -# define IMAGE_ENABLE_RAMDISK_HIGH	0
> -#endif
> -
>  #ifdef CONFIG_SYS_BOOT_GET_CMDLINE
>  # define IMAGE_BOOT_GET_CMDLINE		1
>  #else
> 
