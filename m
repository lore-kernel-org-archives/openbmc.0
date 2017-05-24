Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wXZvB0lSxzDqcP
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 11:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AkBaRAyh"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id y64so10566973ywe.0
 for <openbmc@lists.ozlabs.org>; Tue, 23 May 2017 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VUs/xq1qqwqYOr+aw7GIRhZqrQWseBa5+CIGLD/dvcI=;
 b=AkBaRAyhkI+XBC/iSL74tCqK45to4PxedyugjNZ31tNt7XGl8qPj6BvOPlzLeMCKmR
 NhmPAanhJl9p8bubOK0HTPHQiysTW/OPJL0RPZZgWwSqHUhkB1e1Ti58/GEqVFGrnpul
 ieE7UNyRs5ezvurBXKP/o4baB0TWySOLHwAzAisL4U8F5EuWhlwkOigawECLaWBD6gPl
 NU042AY/m7uPAGcsYvUdlf88fwShxM1v3dMFbprkEPc/py/002SVB5cLgVCA8ShJcJuY
 zdl1XWxPas3FgTrhvT1UaZnEmhwaP++FDNPuNCtChj3qchn5SbrNM+BmzHF6meEESmFw
 42Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VUs/xq1qqwqYOr+aw7GIRhZqrQWseBa5+CIGLD/dvcI=;
 b=FVSj+z1Mq7EDwe9/r4UlpXjRI/wvFAb3sB8d08+nly0VIPXoQcdN9SARAMu5hGDIM8
 Y+upx3aW/K+RRUc8bNKiUYOAfXo8HsWDodWNgxrrXkBi7hway0lZizGJNhrkgIKK9kxw
 5QHARGlr6HFvzXBt1isd567LrEXbPHd34V8ssT6GPjRnnnSIqcUyrW96tWivHkuSUxQ4
 h/VJFUGAliuT2EjPZPT7JOYy9KYHkPi5T06AYR74d7mlGEZvBB65LV1GW4aktMojWFte
 9iGh7tooQNwIqGqcwZKIX/BIQgVLsf1hgKRO67bkSMekqxYVjoF5XS+BlAsIEVphjUqI
 lycQ==
X-Gm-Message-State: AODbwcBZ+V+sM3v3jBTpuvJCYKZFSql2u++sz56iHzBVckSThbJ2wYlG
 vzRDIpnEpmkQXcBhRd0a6ZtWX2uTl+xZOUc=
X-Received: by 10.129.108.215 with SMTP id h206mr24758434ywc.329.1495590259732; 
 Tue, 23 May 2017 18:44:19 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Tue, 23 May 2017 18:43:59 -0700 (PDT)
In-Reply-To: <20170523113410.192036-1-c_mykolak@mellanox.com>
References: <20170523113410.192036-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 24 May 2017 11:43:59 +1000
X-Google-Sender-Auth: 3qC5JXx0QrNIfxXsaB7QJ32kV_k
Message-ID: <CACPK8XfQW2MTdPSkh0HZd6=C3yMYUFA03HrmvH0Jt1+U-WqdjA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc] Add extended configuration
 for ast-g5 board
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 24 May 2017 01:44:22 -0000

On Tue, May 23, 2017 at 9:34 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add defconfig extends ast_g5_ncsi_defconfig with the number of options:
> It allows 2-nd  boot partition, memory testing, boot, image info option,
> extra filesystem and environment commands.
> Add WATCHDOG_RESET macro support for aspeed g5 boards for cases when
> HW watchdog is configured.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  board/aspeed/ast-g5/Kconfig         |  1 +
>  board/aspeed/ast-g5/ast-g5.c        | 17 +++++++++++++++++
>  configs/ast_g5_ncsi_2boot_defconfig | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 configs/ast_g5_ncsi_2boot_defconfig
>
> diff --git a/board/aspeed/ast-g5/Kconfig b/board/aspeed/ast-g5/Kconfig
> index 9bd3e7de49..0a8b38b9db 100644
> --- a/board/aspeed/ast-g5/Kconfig
> +++ b/board/aspeed/ast-g5/Kconfig
> @@ -18,5 +18,6 @@ config SYS_SOC
>  config SYS_CONFIG_NAME
>         default "ast-g5-phy" if ASPEED_NET_PHY
>         default "ast-g5-ncsi" if ASPEED_NET_NCSI
> +       default "ast-g5-ncsi-2boot" if ASPEED_NET_NCSI && FIRMWARE_2ND_BOOT
>
>  endif
> diff --git a/board/aspeed/ast-g5/ast-g5.c b/board/aspeed/ast-g5/ast-g5.c
> index da79d7b79a..2965ffea0e 100644
> --- a/board/aspeed/ast-g5/ast-g5.c
> +++ b/board/aspeed/ast-g5/ast-g5.c
> @@ -46,3 +46,20 @@ int board_eth_init(bd_t *bd)
>          return aspeednic_initialize(bd);
>  }
>  #endif
> +
> +/*Called by macro WATCHDOG_RESET*/
> +#if defined(CONFIG_HW_WATCHDOG)
> +
> +#define AST_BASE_WD 0x1E785000 /* Watch DOG */
> +#define WDT_28 0x28 /*WDT2 Counter Restart Register*/
> +#define WDT_RESTART_VALUE 0x4755 /*value to write into WDT restart register.*/
> +
> +void hw_watchdog_reset(void)
> +{
> +       u32 reg = 0;
> +       /*restart WD2 timer*/
> +       reg = WDT_RESTART_VALUE;

You can just use WDT_RESTART_VALUE instead of creating the local variable.

Can you explain what you're doing here. You're setting the magic
reload value, but not the WDT enable or the count.

> +       writel(reg, AST_BASE_WD | WDT_28);
> +}
> +
> +#endif /* CONFIG_WATCHDOG */
> diff --git a/configs/ast_g5_ncsi_2boot_defconfig b/configs/ast_g5_ncsi_2boot_defconfig
> new file mode 100644
> index 0000000000..f919f237b4
> --- /dev/null
> +++ b/configs/ast_g5_ncsi_2boot_defconfig

The defconfig looks okay. If you send that change in a separate patch
I can merge it.

Cheers,

Joel

> @@ -0,0 +1,36 @@
> +CONFIG_ARM=y
> +CONFIG_TARGET_AST_G5=y
> +CONFIG_SYS_PROMPT="ast# "
> +CONFIG_CMD_BOOTEFI=n
> +CONFIG_CMD_DHCP=y
> +CONFIG_CMD_PING=y
> +CONFIG_EFI_LOADER=n
> +CONFIG_FIT=y
> +CONFIG_FIT_VERBOSE=y
> +CONFIG_HUSH_PARSER=y
> +CONFIG_OF_LIBFDT=y
> +CONFIG_SPI_FLASH=y
> +CONFIG_SYS_NS16550=y
> +CONFIG_FIRMWARE_2ND_BOOT=y
> +CONFIG_AUTOBOOT=y
> +CONFIG_AUTOBOOT_KEYED=y
> +CONFIG_AUTOBOOT_PROMPT="\nBooting the BMC in %d seconds. Type the password to stop autoboot.\n"
> +CONFIG_AUTOBOOT_STOP_STR="0penBmc"
> +CONFIG_CMD_SAVEENV=y
> +CONFIG_CMDLINE=y
> +CONFIG_BOOTDELAY=5
> +CONFIG_NETDEVICES=y
> +CONFIG_CMD_GREPENV=y
> +CONFIG_CMD_MEMINFO=y
> +CONFIG_CMD_EXT2=y
> +CONFIG_CMD_FAT=y
> +CONFIG_EXPERT=y
> +CONFIG_REGEX=y
> +CONFIG_CMD_IMI=y
> +CONFIG_CMD_IMLS=y
> +CONFIG_CMD_MEMORY=y
> +CONFIG_CMD_CRC32=y
> +CONFIG_LOOPW=y
> +CONFIG_CMD_MEMTEST=y
> +CONFIG_CMD_MX_CYCLIC=y
> +
> --
> 2.11.0
>
