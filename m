Return-Path: <joel.stan@gmail.com>
Received: from mail-qg0-x243.google.com (mail-qg0-x243.google.com
 [IPv6:2607:f8b0:400d:c04::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rN3lP6m0dzDq7w
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jun 2016 02:52:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bl85xDN9; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=LSGl3777; 
 dkim-atps=neutral
Received: by mail-qg0-x243.google.com with SMTP id p34so5158109qgp.0
 for <openbmc@lists.ozlabs.org>; Sun, 05 Jun 2016 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Me7hGrXuLSUla2lk5O+jD80zG5tqM59QHMPGL6lnfkM=;
 b=bl85xDN9uKKdBx26ra4ju/z4pT6nbTmLx0xA35Vxq+RzFYWCrRAG4iFrVjsju7qBxe
 JjXbPAZNJOoVwOzGZXDHwe/K6WL2wbCzIAxIkwlqi5UUVzkhN2ayxZapD6jKfVozlAQe
 mMLn/d4UsP3RmI++YqfkI8RoLcKVPY9WYWFWAjvEenxabybECKOTZS70Vs5mdbU1GB8Z
 LRaf74B+U6k1jfMKYWUSBZGyzq3ojvVWT3Rek8trjptj2ghCTVe+8NMr/KjTlFCKocaM
 XVP7hH1NoQbuPW5+IQnGVEMbt/TVsDBER5VFexPFFTx+M6jdP3atLwWJM4XhZzVO0yfa
 SViQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Me7hGrXuLSUla2lk5O+jD80zG5tqM59QHMPGL6lnfkM=;
 b=LSGl3777BSqpesm4vWNLes+bb/RmtraRAnNPUetdSMTSx88fsnc+iDSkL3RZiV0ue5
 ddI+D4SQNbWEwJxZ/uxjlLb1AITJihktKCnH/OL2d1OeJ5JuDaGfR9q7bv7dBBdsYPOH
 BQhTwA2M8+glmE7Xo0eA0h/oJ+OhcZaEJFVh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Me7hGrXuLSUla2lk5O+jD80zG5tqM59QHMPGL6lnfkM=;
 b=RYZSdQb0CQV0D9RjV0dBLLxNH/WOKlJOITY5HILrLjwGkczEXPYKqPkwGni0t4uV7G
 efnDw4i0rTKimdpbdrflsLzxPsRqNTBQvrKxeGydw3gMl8r+BJzbCHOt971gklKv7Odz
 2W3IXnLEzFL/YJOh7RRlk7hx70zAWSklLUUXqORSViTAnTDo+bLiHWvSDdRjgZBuzpua
 QrUpVGU49RTmQ3W6fOFSoa0llidP3v6rbZgWr+nTBc6sp2CtWn1FLhl8mJm/MQp02UcF
 uJbmUX5T1jGOTaP5IwqrERtSUH5h+xgef68FsZ7+sbevuQy/wM8gTAF5skL0R7pi5ArZ
 8xmA==
X-Gm-Message-State: ALyK8tJ2p425zizT094tswoXdEzUzJNHtRDbqQbMbDYBuVWtETEJZvLHbTPOEsirg2NETSVqcprHbMcZqQ+GNg==
X-Received: by 10.140.42.65 with SMTP id b59mr11482272qga.48.1465145515795;
 Sun, 05 Jun 2016 09:51:55 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 09:51:36 -0700 (PDT)
In-Reply-To: <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
 <20160604052039.6581-10-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 11:51:36 -0500
X-Google-Sender-Auth: mv9QASz2REPoMPgmY_JH5fXjJwg
Message-ID: <CACPK8XdM7nOBbSOF80G2q=hN6K9DwczvJzNO+mQ+00dtANhn4w@mail.gmail.com>
Subject: Re: [PATCH openbmc 09/10] AST2500: Initial AST2500 BSP layer
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Sun, 05 Jun 2016 16:52:02 -0000

Hi Brad,

On Sat, Jun 4, 2016 at 12:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Brad Bishop <bradleyb@fuzziesquirrel.com>
>
> The AST2500 is an ARM SOC made by Aspeed.
>
> This is only a stub; there are a couple missing bits of support
> from the kernel/uboot.

I think you beat the Google guys to the punch. Pending major
objections to the structure you've chosen from others I propose we
merge your changes and any improvements can be added as future
patches.

> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>


> ---
>  .../meta-aspeed/meta-ast2500/conf/layer.conf       |  10 ++
>  .../meta-ast2500/conf/machine/include/ast2500.inc  |  14 +++
>  .../recipes-kernel/linux/linux-obmc/defconfig      | 104 +++++++++++++++++++++
>  .../recipes-kernel/linux/linux-obmc_%.bbappend     |   2 +
>  .../meta-aspeed/meta-ast2500/recipes.txt           |   2 +
>  5 files changed, 132 insertions(+)
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
>  create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
>
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
> new file mode 100644
> index 0000000..ad1858a
> --- /dev/null
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/layer.conf
> @@ -0,0 +1,10 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .= ":${LAYERDIR}"
> +
> +# We have recipes-* directories, add to BBFILES
> +BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
> +            ${LAYERDIR}/recipes-*/*/*.bbappend"
> +
> +BBFILE_PATTERN_ast2500 = "^${LAYERDIR}/"
> +BBFILE_COLLECTIONS += "ast2500"
> +LAYERVERSION_ast2500 = "1"
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
> new file mode 100644
> index 0000000..ef55bf7
> --- /dev/null
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/conf/machine/include/ast2500.inc
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: Aspeed AST2500
> +#@DESCRIPTION: Common machine configuration for the Aspeed AST2500 Chip
> +
> +PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
> +
> +UBOOT_MACHINE ?= "ast2500_config"
> +UBOOT_ENTRYPOINT ?= "0x80001000"
> +UBOOT_LOADADDRESS ?= "0x80001000"
> +
> +INITRD_IMAGE_ENTRYPOINT = "0x80800000"
> +INITRD_IMAGE_LOADADDRESS = "0x80800000"
> +
> +require conf/machine/include/tune-arm1136jf-s.inc
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
> new file mode 100644
> index 0000000..84d9fa2
> --- /dev/null
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
> @@ -0,0 +1,104 @@
> +CONFIG_KERNEL_XZ=y
> +CONFIG_SYSVIPC=y
> +CONFIG_USELIB=y
> +CONFIG_IRQ_DOMAIN_DEBUG=y
> +CONFIG_NO_HZ_IDLE=y
> +CONFIG_HIGH_RES_TIMERS=y
> +CONFIG_LOG_BUF_SHIFT=14
> +CONFIG_CGROUPS=y
> +CONFIG_BLK_DEV_INITRD=y
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_RD_LZO is not set
> +# CONFIG_RD_LZ4 is not set
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> +CONFIG_BPF_SYSCALL=y
> +# CONFIG_SHMEM is not set
> +# CONFIG_AIO is not set
> +CONFIG_EMBEDDED=y
> +# CONFIG_COMPAT_BRK is not set
> +CONFIG_SLAB=y
> +CONFIG_CC_STACKPROTECTOR_STRONG=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLOCK is not set
> +CONFIG_ARCH_MULTI_V6=y
> +# CONFIG_ARCH_MULTI_V7 is not set
> +CONFIG_ARCH_ASPEED=y
> +CONFIG_MACH_ASPEED_G5=y
> +CONFIG_DEBUG_RODATA=y
> +CONFIG_AEABI=y
> +CONFIG_UACCESS_WITH_MEMCPY=y
> +CONFIG_SECCOMP=y
> +# CONFIG_ATAGS is not set
> +CONFIG_ZBOOT_ROM_TEXT=0x0
> +CONFIG_ZBOOT_ROM_BSS=0x0
> +CONFIG_ARM_APPENDED_DTB=y
> +CONFIG_ARM_ATAG_DTB_COMPAT=y
> +CONFIG_KEXEC=y
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_NET=y
> +CONFIG_PACKET=y
> +CONFIG_PACKET_DIAG=y
> +CONFIG_UNIX=y
> +CONFIG_UNIX_DIAG=y
> +CONFIG_INET=y
> +CONFIG_SYN_COOKIES=y
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +CONFIG_INET_UDP_DIAG=y
> +# CONFIG_IPV6 is not set
> +CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
> +CONFIG_DEVTMPFS=y
> +CONFIG_DEVTMPFS_MOUNT=y
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +CONFIG_NETDEVICES=y
> +CONFIG_FTGMAC100=y
> +# CONFIG_INPUT is not set
> +# CONFIG_SERIO is not set
> +# CONFIG_VT is not set
> +# CONFIG_LEGACY_PTYS is not set
> +# CONFIG_DEVKMEM is not set
> +CONFIG_SERIAL_8250=y
> +# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> +CONFIG_SERIAL_8250_CONSOLE=y
> +CONFIG_SERIAL_8250_NR_UARTS=6
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=6
> +CONFIG_SERIAL_8250_EXTENDED=y
> +CONFIG_SERIAL_8250_SHARE_IRQ=y
> +CONFIG_SERIAL_OF_PLATFORM=y
> +# CONFIG_HW_RANDOM is not set
> +CONFIG_I2C_CHARDEV=y
> +# CONFIG_USB_SUPPORT is not set
> +CONFIG_RTC_DRV_DS1307=y
> +# CONFIG_IOMMU_SUPPORT is not set
> +CONFIG_FIRMWARE_MEMMAP=y
> +CONFIG_FANOTIFY=y
> +CONFIG_DYNAMIC_DEBUG=y
> +CONFIG_STRIP_ASM_SYMS=y
> +CONFIG_PAGE_POISONING=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_SHIRQ=y
> +CONFIG_LOCKUP_DETECTOR=y
> +CONFIG_WQ_WATCHDOG=y
> +# CONFIG_SCHED_DEBUG is not set
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_DEBUG_RT_MUTEXES=y
> +CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> +# CONFIG_FTRACE is not set
> +CONFIG_MEMTEST=y
> +CONFIG_UBSAN=y
> +CONFIG_UBSAN_ALIGNMENT=y
> +CONFIG_DEBUG_USER=y
> +CONFIG_DEBUG_LL=y
> +CONFIG_DEBUG_LL_UART_8250=y
> +CONFIG_DEBUG_UART_PHYS=0x1e784000
> +CONFIG_DEBUG_UART_VIRT=0xe8784000
> +CONFIG_EARLY_PRINTK=y
> +CONFIG_DEBUG_SET_MODULE_RONX=y
> +CONFIG_CRYPTO_ECHAINIV=y
> +# CONFIG_XZ_DEC_X86 is not set
> +# CONFIG_XZ_DEC_POWERPC is not set
> +# CONFIG_XZ_DEC_IA64 is not set
> +# CONFIG_XZ_DEC_SPARC is not set
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
> new file mode 100644
> index 0000000..6d7ae27
> --- /dev/null
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc_%.bbappend
> @@ -0,0 +1,2 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +SRC_URI += "file://defconfig"
> diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
> new file mode 100644
> index 0000000..149509f
> --- /dev/null
> +++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes.txt
> @@ -0,0 +1,2 @@
> +recipes-bsp          - Anything with links to specific hardware or hardware configuration information
> +recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
> --
> 2.8.3
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
