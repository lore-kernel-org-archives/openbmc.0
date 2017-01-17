Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2WJB6VTHzDqSY
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 11:31:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cWxU1c2p"; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id u143so13743697oif.3
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+hLOIk43ycb1RHy/1eU2Xem8HprKUKpGyv/KOcepoaA=;
 b=cWxU1c2pk5i/QfHrcYZ3dowKpt941lAyiGFlRxaNX7Vj3CN8g5gOvtjbhkVLxQRPu/
 PmQ7gFI1VhlT4JdZR2hicJGDXzTVyQ6xxNKRtQFoWBA/Po8UBYNBuTT6Tc72ZO/ivgUH
 Ek8SGyyP+/CdC1918NK7SOitceUhgXvH3UgLei5FEOK42whtwJVF/Y1abhTBZG1jX3HA
 kRi2vAgqkwi6G3uphINu7TOdlzF/7y0pNQB0h3ATVdxMfBcgUqsjcinm05iOoj2I0q3Q
 Q1vNVPc6fI75YImPysO8Wsw50wc5yEoHNayp2im/FA7VUHECN4tKj6N9HeO/l1gwZ7LC
 vSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+hLOIk43ycb1RHy/1eU2Xem8HprKUKpGyv/KOcepoaA=;
 b=YuYa8TV8tMt3CoN1KGk2UlZAsrzVc6K674yPeZGtc1O3FolGVBQ1uAQ2KjUxsVU5fL
 7u3DSS2NOcQo+SgKOIKIWGSe8brzOhOgByZ6RrcuARMq8CQ4eJFIodXiycgAn1OX0Bev
 XaOY+4pJTVGHkehgJnaMOri+lR3tKE/FPTM5YNuQUcj8pqqUbwT4aAohYJxGvI4UN/LH
 8BP04OeCssC+HedE6KQWrZuSXnaiidzwDZGEvOeUOKY4lpXObl+o53wK0+P+fpodRr8K
 0Qlaa3EEKAXy+GuQd81DxXed+Vln/3zX89BK/CfRT7/T2d28KyaNFas1DqNIM9L1f0Av
 byFg==
X-Gm-Message-State: AIkVDXJc0z6i3roMBsYssps7scgU/5QYAtPoRS85YbHeeBD49nw9KITtkCB2c2gvnsKjc0O6tkXFrwcmzfaZUA==
X-Received: by 10.157.37.99 with SMTP id j32mr17113144otd.223.1484613111412;
 Mon, 16 Jan 2017 16:31:51 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Mon, 16 Jan 2017 16:31:31 -0800 (PST)
In-Reply-To: <20170112021328.27200-2-raltherr@google.com>
References: <20170112021328.27200-2-raltherr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 17 Jan 2017 11:31:31 +1100
X-Google-Sender-Auth: KTkcjvV2GhgolWq5B1cOv6UUYcs
Message-ID: <CACPK8XcQe4U5qvJ3QDW=ORUYGA-4ShVxuCajzTr4n=e=fqnvSw@mail.gmail.com>
Subject: Re: [U-Boot,1/2] aspeed: Use HUSH shell
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 17 Jan 2017 00:31:55 -0000

Hi Rick,

On Thu, Jan 12, 2017 at 1:13 PM, Rick Altherr <raltherr@google.com> wrote:
> HUSH is the newer command-line interface that provides scripting
> capabilities.  Those are needed for an boot command that can boot either
> a FIT image that includes a ramdisk or a separate kernel and ramdisk.

For some reason this patch didn't arrive in my mailbox. I found it on patchwork.

I took at look at the code size change with enabling this:

$ size u-boot && ls -la u-boot.bin
   text    data     bss     dec     hex filename
 215567    7152   71048  293767   47b87 u-boot
-rw-r--r-- 1 joel joel 222536 Dec  8 12:03 u-boot.bin

$ size u-boot && ls -la u-boot.bin
   text    data     bss     dec     hex filename
 227643    7448   71448  306539   4ad6b u-boot
-rw-r--r-- 1 joel joel 234908 Jan 16 08:30 u-boot.bin

We go up by 5.6%, or 12KB. We're still well within the 384KB partition
size, so there is no issue there.

I've merged it into our u-boot tree.

Cheers,

Joel


> Signed-off-by: Rick Altherr <raltherr@google.com>


> ---
>
>  configs/ast_g4_ncsi_defconfig | 1 +
>  configs/ast_g4_phy_defconfig  | 1 +
>  configs/ast_g5_ncsi_defconfig | 1 +
>  configs/ast_g5_phy_defconfig  | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/configs/ast_g4_ncsi_defconfig b/configs/ast_g4_ncsi_defconfig
> index ab4907cfe2..54686bee5c 100644
> --- a/configs/ast_g4_ncsi_defconfig
> +++ b/configs/ast_g4_ncsi_defconfig
> @@ -7,6 +7,7 @@ CONFIG_CMD_PING=y
>  CONFIG_EFI_LOADER=n
>  CONFIG_FIT=y
>  CONFIG_FIT_VERBOSE=y
> +CONFIG_HUSH_PARSER=y
>  CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> diff --git a/configs/ast_g4_phy_defconfig b/configs/ast_g4_phy_defconfig
> index 21a56c4b96..f8db39ef13 100644
> --- a/configs/ast_g4_phy_defconfig
> +++ b/configs/ast_g4_phy_defconfig
> @@ -8,6 +8,7 @@ CONFIG_CMD_PING=y
>  CONFIG_EFI_LOADER=n
>  CONFIG_FIT=y
>  CONFIG_FIT_VERBOSE=y
> +CONFIG_HUSH_PARSER=y
>  CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> diff --git a/configs/ast_g5_ncsi_defconfig b/configs/ast_g5_ncsi_defconfig
> index 7cd4fd116d..74029ed514 100644
> --- a/configs/ast_g5_ncsi_defconfig
> +++ b/configs/ast_g5_ncsi_defconfig
> @@ -7,6 +7,7 @@ CONFIG_CMD_PING=y
>  CONFIG_EFI_LOADER=n
>  CONFIG_FIT=y
>  CONFIG_FIT_VERBOSE=y
> +CONFIG_HUSH_PARSER=y
>  CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
> diff --git a/configs/ast_g5_phy_defconfig b/configs/ast_g5_phy_defconfig
> index c686dd2297..767f3af605 100644
> --- a/configs/ast_g5_phy_defconfig
> +++ b/configs/ast_g5_phy_defconfig
> @@ -8,6 +8,7 @@ CONFIG_CMD_PING=y
>  CONFIG_EFI_LOADER=n
>  CONFIG_FIT=y
>  CONFIG_FIT_VERBOSE=y
> +CONFIG_HUSH_PARSER=y
>  CONFIG_OF_LIBFDT=y
>  CONFIG_SPI_FLASH=y
>  CONFIG_SYS_NS16550=y
