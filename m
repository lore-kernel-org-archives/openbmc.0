Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wYtLy5G3GzDqQQ
 for <openbmc@lists.ozlabs.org>; Fri, 26 May 2017 14:24:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZJkXIcU/"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id n198so8155577yba.3
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 21:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=us3zPA4jbjvPjQyB+TjNiIshXLYo/MwC4PvObXln/LA=;
 b=ZJkXIcU/MMEwgLyMfTBS0JydwfPw95Uos+2oAancsn4zXAbqjUYfp+bmmgTljARPyf
 zy4fPY8S1xtpOuViNS+PvJWIqpAQxohGIJFImzVQdZHxfLUe6P9WHcOCoG698AazKuAX
 ivpvSRD2aPeCYyk1+wunCU9FaWx/JDiy5P9uyJZYbImdT//yQsenVKBaA/n8Ughdorag
 4+DI9N2wRawgCy00oiZXlIjWpgwjQ6df1pffOF0Ll32h1Fso21ZyiKVmpKakLmaRxydH
 u4ELBMHGnFQxkExbp98CTjXiHB5+hLHULpGFBjsWWUCEuSEyOoWhbvPnleqM2Sb5lDCr
 qlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=us3zPA4jbjvPjQyB+TjNiIshXLYo/MwC4PvObXln/LA=;
 b=lNf8mg2EQlxsnas/0MLAaB+5r0Y8b4tVtTlCOChGLp8u3fTPsZGiV4Mnu78lxyCc7V
 VTCm7tDINJFmssv9GVTqfyPWx9Zij1VabL6pmRidIfa9gmMxJ1IeVYRhNDzqgwkHolSH
 GPvc+K4369Qx9OPeJ9qqlHloMc5ILBGiIDsQJnAdyRjzp7QII94UsVoa4ictp+jUjQ4V
 iB0PWHxM9TNGjZFNQ0GnzNqaHZZmUkUJuRCkUooFsg7ocfvJ9W7z7DJt8AJbd/kRXmjo
 Dw1LIk7tsdyni7Ky75ILwNq2ViHbrDb0EYCX2T9YBiit588ts7pVPovT+Jif4iRoDgUy
 PO1w==
X-Gm-Message-State: AODbwcArnA1Po+5dh8A0YG4gdtNtqcoTGYBHciPa5KC4A5AGDU01DPcK
 rnuRj0HMoMRgIFlfm18eHnuNFIqZ9r3IHcA=
X-Received: by 10.37.219.20 with SMTP id g20mr34841768ybf.135.1495772663640;
 Thu, 25 May 2017 21:24:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 25 May 2017 21:24:03 -0700 (PDT)
In-Reply-To: <20170524120556.34365-1-c_mykolak@mellanox.com>
References: <20170524120556.34365-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 26 May 2017 14:24:03 +1000
X-Google-Sender-Auth: 82tOKa95YgDpt6TNMtg38-JEbKk
Message-ID: <CACPK8Xf-q+oDzUfSLAxRsJN8Y5m5CE8czpVvrbdhcVTCdmhibg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc v2] Add extended
 configuration for ast-g5 board
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
X-List-Received-Date: Fri, 26 May 2017 04:24:27 -0000

On Wed, May 24, 2017 at 10:05 PM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Add defconfig extends ast_g5_ncsi_defconfig with the number of options:
> It allows 2-nd  boot partition, memory testing, boot, image info option,
> extra filesystem and environment commands.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Applied to the v2016.07-aspeed-openbmc u-boot tree.

Cheers,

Joel

> ---
>  board/aspeed/ast-g5/Kconfig         |  1 +
>  configs/ast_g5_ncsi_2boot_defconfig | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
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
> diff --git a/configs/ast_g5_ncsi_2boot_defconfig b/configs/ast_g5_ncsi_2boot_defconfig
> new file mode 100644
> index 0000000000..f919f237b4
> --- /dev/null
> +++ b/configs/ast_g5_ncsi_2boot_defconfig
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
