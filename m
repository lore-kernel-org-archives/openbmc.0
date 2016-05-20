Return-Path: <clg@kaod.org>
Received: from mo178.mail-out.ovh.net (mo178.mail-out.ovh.net [178.32.228.178])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rB1Gz1RbwzDqCW
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 18:26:01 +1000 (AEST)
Received: from player791.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 0B361FFAE08
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2016 10:25:57 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player791.ha.ovh.net (Postfix) with ESMTPSA id 6C1B6420096;
 Fri, 20 May 2016 10:25:53 +0200 (CEST)
Subject: Re: [PATCH] aspeed_defconfig: Enable SHMEM and TMPFS
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <1463729360-4883-1-git-send-email-andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <573ECA04.5050509@kaod.org>
Date: Fri, 20 May 2016 10:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1463729360-4883-1-git-send-email-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14561544971117431554
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrfeeggddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 20 May 2016 08:26:03 -0000

Joel, 

We do need these for OpenBMC. Don't we ? 

C.  

On 05/20/2016 09:29 AM, Andrew Jeffery wrote:
> Without enabling these options we get strange behaviour under qemu,
> where it appears uevents aren't generated to create device nodes for
> ttyS{0,4,5}. As a consequence we don't receive a getty on the console.
> 
> Cédric narrowed down the list of options initially at [1],
> and with a patch to the qemu timer model[2] we can retain the
> CONFIG_NO_HZ_IDLE=y configuration.
> 
> [1] https://github.com/openbmc/qemu/issues/4
> [2] https://lists.ozlabs.org/pipermail/openbmc/2016-May/003209.html
> 
> Cc: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/configs/aspeed_defconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/aspeed_defconfig b/arch/arm/configs/aspeed_defconfig
> index cd4cdeb07fd9..f08064c64cb2 100644
> --- a/arch/arm/configs/aspeed_defconfig
> +++ b/arch/arm/configs/aspeed_defconfig
> @@ -13,7 +13,7 @@ CONFIG_BLK_DEV_INITRD=y
>  # CONFIG_RD_LZ4 is not set
>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>  CONFIG_BPF_SYSCALL=y
> -# CONFIG_SHMEM is not set
> +CONFIG_SHMEM=y
>  # CONFIG_AIO is not set
>  CONFIG_EMBEDDED=y
>  # CONFIG_COMPAT_BRK is not set
> @@ -128,6 +128,9 @@ CONFIG_FIRMWARE_MEMMAP=y
>  CONFIG_FANOTIFY=y
>  CONFIG_OVERLAY_FS=y
>  CONFIG_CONFIGFS_FS=y
> +CONFIG_TMPFS=y
> +CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_TMPFS_XATTR=y
>  CONFIG_JFFS2_FS=y
>  CONFIG_JFFS2_SUMMARY=y
>  CONFIG_NFS_FS=y
> 
