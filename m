Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7yth4wKWzDt2S
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 17:31:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=YYlwHont; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id v84so584844oie.2
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=F7EsFet3WoV268XAjK9M75aEGYmE6Gmvg1cUCA1b/EA=;
 b=YYlwHontRE4ift4KT7JY92T3RWlSYKuysCrQ5avuaR38HN9ubv2jSpjB5xyfPiezZX
 qQFbMdADIYJA9oSApDF5SzFj0ZYmkP4OilhDJfdv1sKCcHzLk63HhvYsdoeoPDJ9lppl
 KbORcHYPp4Scyb6t+9byzqIeH6mgecI0ThHpMKJ3852CwqV81qVw3ciZY7WIczD9gGUT
 kW7ZAVElAe9FUsH47FyiwiS5ElbmGCyFkFusNbr0EY5Q8T8I5dDkaCIXvjecFzN93ssT
 gEjgGjbs/z8CIVwLwtAxVzHtLcPKtOEtN6qO3DrommuvyqlwupwjLLccKndIghKJ1uYa
 Wbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=F7EsFet3WoV268XAjK9M75aEGYmE6Gmvg1cUCA1b/EA=;
 b=A3+Xwx9imKTglqFAE/UYISkuHjxC3ZmbwAsW6WIbKL2U3wWa1C3I37FG11ACB4FP/E
 HuLmah04k9gv8y2aTlMLh7dBLrbboiCybIMLf/xY2+t6uNb/NpeM+9b9lL1lGbvNL0MB
 QDpf43dRQ6osPK7dYj2wysCG/VuqqnBJq85iy9NR9uPWXkpY6dIN6Rnw3U3G20jeS+rp
 RxAq71wJ0gVP00PL2JvWH4vayCGqJDT1CXOtlqopv+6xeOndTlj/VXToMMb3cV9MRTsC
 MbUnB+6N4/DhT0/yXro3oDVUG/Pux8H+pG0XrNCKdcRs0YpUUCAFCSYedq4aoWU2BFvt
 qRCQ==
X-Gm-Message-State: ABUngveuKzV9W/AQryN2mXRN3u/iNCFRu8g6VIIeVIJbviw1wSDKCu8Cw31kaJmfZ9Ywi8+a8kz5r06D2bk+hg==
X-Received: by 10.157.22.200 with SMTP id s8mr1156969ots.14.1478068314893;
 Tue, 01 Nov 2016 23:31:54 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Tue, 1 Nov 2016 23:31:34 -0700 (PDT)
In-Reply-To: <1478064386-29575-1-git-send-email-raltherr@google.com>
References: <1478064386-29575-1-git-send-email-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 2 Nov 2016 17:01:34 +1030
X-Google-Sender-Auth: 1kJ3amFdq19h85CvGAq5oV2no-I
Message-ID: <CACPK8XerVGJ06h2nOTbTxW396yt0Go3N5roYjWeH9RXmOAwvOg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2] Enable FIT image support and FDT loading for
 AST2400/AST2500
To: Rick Altherr <raltherr@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 02 Nov 2016 06:31:57 -0000

Hi Rick,

On Wed, Nov 2, 2016 at 3:56 PM, Rick Altherr <raltherr@google.com> wrote:
> FIT is the modern u-boot native image format for kernels, device trees,
> and ramdisks.  Enabling FIT only compiles in support for the image
> format.  For these devices, the kernel+dtb and ramdisk are loaded from
> separate locations in flash and can be any mix of legacy or FIT images.
> When using FIT images, the dtb is stored as a separate entry that
> requires CONFIG_OF_LIBFDT to load it into RAM and pass it to the kernel.
>
> Tested under qemu with both legacy and FIT kernel+dtb images for
> palmetto and witherspoon.

The changes look good to me.

Is the FIT support in v2016.07 new enough for us? Is there any reason
to move to a v2016.09 base?

It does introduce a warning in a hack we carry for loading the
initramfs, which I think points to a legitimate issue:

common/image.c: In function =E2=80=98boot_get_ramdisk=E2=80=99:
common/image.c:1078:4: warning: =E2=80=98rd_load=E2=80=99 may be used unini=
tialized in
this function [-Wmaybe-uninitialized]
    memmove ((void *)rd_load, (uchar *)rd_data, rd_len);
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This code an Aspeed hack we carry. It is required to copy the
initramfs from flash. Cedric was doing some investigation into why we
need the hack, and it appears to be an upstream bug.

If I read the code correctly, prior to enabling FIT we only accepted
IMAGE_FORMAT_LEGACY. If we move the hack to be part of that case we
should be ok, as we don't need to do the hack when loading from FIT.

Can you try that and add a second patch to your series that moves the hack?

Finally, I took a look at the impact on code size. I used
arm-linux-gnueabi-gcc (Ubuntu 6.2.0-5ubuntu12) 6.2.0 20161005 from
Ubuntu 16.10.

$ size u-boot
   text   data    bss    dec    hex filename
 151636   4576  61620 217832  352e8 u-boot
 222302   7952  62768 293022  4789e u-boot

Wow, the FIT image is fatter. What does FIT support pull in that
increases the code size so much?

The on disk size suggests that size isn't lying:

Unfit: 156012
FIT: 230056

Did we expect the change to be that large?

This is not a blocker, as we currently set aside 384KB for u-boot.

Cheers,

Joel


>
> Signed-off-by: Rick Altherr <raltherr@google.com>
> ---
> Changes since v1:
> - Fixed commit message grammar
> - Clarified config option needed for FDT loading
> ---
>  configs/ast_g4_ncsi_defconfig | 3 +++
>  configs/ast_g4_phy_defconfig  | 3 +++
>  configs/ast_g5_ncsi_defconfig | 3 +++
>  configs/ast_g5_phy_defconfig  | 3 +++
>  4 files changed, 12 insertions(+)
>
> diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfi=
g
> index 4ee71c5..70cd3c2 100644
> --- a/configs/ast_g4_ncsi_defconfig
> +++ b/configs/ast_g4_ncsi_defconfig
> @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G4=3Dy
>  CONFIG_SYS_PROMPT=3D"ast# "
>  CONFIG_CMD_DHCP=3Dy
>  CONFIG_CMD_PING=3Dy
> +CONFIG_FIT=3Dy
> +CONFIG_FIT_VERBOSE=3Dy
> +CONFIG_OF_LIBFDT=3Dy
>  CONFIG_SPI_FLASH=3Dy
>  CONFIG_SYS_NS16550=3Dy
> diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
> index 61fd69b..468fbc4 100644
> --- a/configs/ast_g4_phy_defconfig
> +++ b/configs/ast_g4_phy_defconfig
> @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=3Dy
>  CONFIG_SYS_PROMPT=3D"ast# "
>  CONFIG_CMD_DHCP=3Dy
>  CONFIG_CMD_PING=3Dy
> +CONFIG_FIT=3Dy
> +CONFIG_FIT_VERBOSE=3Dy
> +CONFIG_OF_LIBFDT=3Dy
>  CONFIG_SPI_FLASH=3Dy
>  CONFIG_SYS_NS16550=3Dy
> diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfi=
g
> index 6d11afb..8a9c297 100644
> --- a/configs/ast_g5_ncsi_defconfig
> +++ b/configs/ast_g5_ncsi_defconfig
> @@ -3,5 +3,8 @@ CONFIG_TARGET_AST_G5=3Dy
>  CONFIG_SYS_PROMPT=3D"ast# "
>  CONFIG_CMD_DHCP=3Dy
>  CONFIG_CMD_PING=3Dy
> +CONFIG_FIT=3Dy
> +CONFIG_FIT_VERBOSE=3Dy
> +CONFIG_OF_LIBFDT=3Dy
>  CONFIG_SPI_FLASH=3Dy
>  CONFIG_SYS_NS16550=3Dy
> diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
> index 20f62e0..fd450b9 100644
> --- a/configs/ast_g5_phy_defconfig
> +++ b/configs/ast_g5_phy_defconfig
> @@ -4,5 +4,8 @@ CONFIG_ASPEED_NET_PHY=3Dy
>  CONFIG_SYS_PROMPT=3D"ast# "
>  CONFIG_CMD_DHCP=3Dy
>  CONFIG_CMD_PING=3Dy
> +CONFIG_FIT=3Dy
> +CONFIG_FIT_VERBOSE=3Dy
> +CONFIG_OF_LIBFDT=3Dy
>  CONFIG_SPI_FLASH=3Dy
>  CONFIG_SYS_NS16550=3Dy
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
