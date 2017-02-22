Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSzkz3CFQzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 01:09:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="r1rRcRh6"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id l16so261107ywb.2
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cSKkFO7e33SjRLOPefFSIVEdqLvNKR9/5GjqxBmpq6g=;
 b=r1rRcRh68igoQsFoq68nY03rj/dDF+3ero+CmyEfQJk69Q7dKiEtEcFEHYdRkcpKUN
 TffiL3jrYTzw6eluj89Z/dHUL8J7C1hStSNfVQCn1Oe1bxMa/hzlD9Dg2j9x1roNBwoI
 bbWtc08JB+g1h+Rwcl2N06IZhSYDqLYrWld58bInsXJoVd57DV1iR1aZkhF52wj4+8yb
 5GWlQqEh9vsEDazarfea/zBicVKley8cs/SuaBf0pP40R8bjQwwag/uAjeVzdD548xuS
 bB2MiWZaBcDkvrHa6y3MmtQoux8Kp1OKhs3bl7lDlrZXUiIbtg8SD7wGjgaP5+6SBwqu
 XXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cSKkFO7e33SjRLOPefFSIVEdqLvNKR9/5GjqxBmpq6g=;
 b=UXa+ConURi95YJ0JD+rqfAsrhQNmxeESX27yThaG05q3o6JYvbodTHstvnoxm+KLio
 1CYFY4Uytc99GroCNwmtxLuRai2xlVnW6eJGa1WukNaLbMVhfz3mGoa3hc5GzV6xgsJT
 zI564DPraqF+YW6fG0tqInq9KcIYLPtkKr5UJUVpFg6hFwTtCnWq9J6l9vN+BKg75bJH
 rFI3aXxHr+DLoJKWu32aie2iTMG9dG5tdXi4a7J4J/YFXAPqzryyKHX0UOZd1Sxl/7UH
 fkxBAgb2BqCx95W5mRKuhhiVkneccde7KhbYub/1owe80X+xjsFiRsJ0QBcCCm8hRfU0
 wgHw==
X-Gm-Message-State: AMke39mH/20bHgTaaao5/U5g2dXWpGrLNPyOFAjJkaXK3W3sK1z+vAsgay7Pe2M74lffEnltuFq9knck9c3Jnw==
X-Received: by 10.13.202.69 with SMTP id m66mr12201706ywd.11.1487772568996;
 Wed, 22 Feb 2017 06:09:28 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 06:09:08 -0800 (PST)
In-Reply-To: <1487733028-77391-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <CACPK8XdKabfxbMt2NZFZ8ShuKzynDqoyke2QEGTnADGqaw8+Jg@mail.gmail.com>
 <1487733028-77391-1-git-send-email-anoo@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 00:39:08 +1030
X-Google-Sender-Auth: 0KZXxtE__7r8cQdrRGBkgPop0_M
Message-ID: <CACPK8Xf2vXmKYfSZvgExPUMu08OsR2g+5EvTHcT9GjpRdOLXeA@mail.gmail.com>
Subject: Re: [PATCH v3] arm: configs: aspeed: Add UBI support
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 22 Feb 2017 14:09:32 -0000

On Wed, Feb 22, 2017 at 1:40 PM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> Add UBI support to aspeed_g4_defconfig and aspeed_g5_defconfig
>
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>

Thanks Adriana. Applied to dev-4.7.

I also enabled CONFIG_MTD_UBI_FASTMAP as I think we want to use this feature.

Cheers,

Joel

> ---
>  arch/arm/configs/aspeed_g4_defconfig | 3 +++
>  arch/arm/configs/aspeed_g5_defconfig | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 2edad5c..4ba778d 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -60,6 +60,8 @@ CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_ASPEED_FLASH_SPI=y
> +CONFIG_MTD_UBI=y
> +CONFIG_MTD_UBI_BLOCK=y
>  CONFIG_BLK_DEV_RAM=y
>  CONFIG_ASPEED_LPC_CTRL=y
>  CONFIG_EEPROM_AT24=y
> @@ -133,6 +135,7 @@ CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_JFFS2_FS=y
>  CONFIG_JFFS2_FS_WBUF_VERIFY=y
> +CONFIG_UBIFS_FS=y
>  CONFIG_SQUASHFS=y
>  CONFIG_SQUASHFS_XZ=y
>  CONFIG_PRINTK_TIME=y
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index a5c6ddb..d02139d 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -62,6 +62,8 @@ CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_SPI_NOR=y
>  CONFIG_ASPEED_FLASH_SPI=y
> +CONFIG_MTD_UBI=y
> +CONFIG_MTD_UBI_BLOCK=y
>  CONFIG_BLK_DEV_RAM=y
>  CONFIG_ASPEED_LPC_CTRL=y
>  CONFIG_EEPROM_AT24=y
> @@ -136,6 +138,7 @@ CONFIG_OVERLAY_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_JFFS2_FS=y
>  CONFIG_JFFS2_FS_WBUF_VERIFY=y
> +CONFIG_UBIFS_FS=y
>  CONFIG_SQUASHFS=y
>  CONFIG_SQUASHFS_XZ=y
>  CONFIG_PRINTK_TIME=y
> --
> 1.8.2.2
>
