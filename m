Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9Lc5w2czDq5j
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 22:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="usIrsZPr"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id h82so864460ywb.3
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/nIYCdrvtQUgPT/acXiW1AuzmEKJtjrJlhZC9BcNmcI=;
 b=usIrsZPrRg+C9wMJtX4fGcXqNLwjYRyVhossyBeI1mOZQj8tpw56qJQj4ZTlcEHyl1
 W1NN9/Xm9TZfZZ29YmAwN32++XoyjiRH0QUHHviqg5oTWEY3Da+FYK+GwnNSLIvfV70/
 ORDGk0DuejoPfZLzhjy48fXLlKePU7M95Ap1INN7USSHgsMjHFCqfArCegoF4MZrZ5g7
 KijJmPMrIM/fOPIGtM1kE9+vMpwkXPTapXtrXVDILh5BbT2Gyd75vEovjUewwrV4kjl/
 fUPl0willOvw82la0SDD8kx+5rHVIh7/rugNDu2S3AaWuwIfM/+vtEuGmtmJGQfSm8IS
 zPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/nIYCdrvtQUgPT/acXiW1AuzmEKJtjrJlhZC9BcNmcI=;
 b=rR0Qb7XON94yG4Fy4PdaU2HgC1/fNqrGbAJCURnWCtSR4GsOMGQcTihJa/UivamZbf
 fm4VYS2pcIuaSLpSp6Q3Kh9pYMRcbdiIAdiBPTKWJ2pv4Xy0XJNwWzguKTOdfIb3J9c4
 iS7jSqiF4HKtV/8CsMhH739bgAjykxlQRcssUvVgq1ESfNoOW4YFeTwJ9HnO1y0e73oI
 mpWYcSie20YmfBQvfnI0A5F9VsKLEaED7wUm9lX8bkXExC4hHBaVkfR2LDv9F1VIcbuJ
 2pJc86A68LWKAoHNFgltspc78wiSUAjLXgOIgjRBtu8OUd1VH/o7KSQTw2T1/tQAwxSU
 CSBw==
X-Gm-Message-State: AODbwcAI8Gxw3LlYHsmp0/saAmG/9g8LLQsCqUbeowW7+uTpQv4bBivB
 AZVcdWv1rv7b+iORIjmwMjXgD/1QAg==
X-Received: by 10.129.108.215 with SMTP id h206mr19003797ywc.329.1496235030850; 
 Wed, 31 May 2017 05:50:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 05:50:10 -0700 (PDT)
In-Reply-To: <1495998826-18227-1-git-send-email-anoo@linux.vnet.ibm.com>
References: <1495998826-18227-1-git-send-email-anoo@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:20:10 +0930
X-Google-Sender-Auth: b6m3zxeRXHYF-3GwVGjEJGw0A_k
Message-ID: <CACPK8XeQFXkHrw+QdbacwZLmo8Qa5C4HQDkcn=zC33izQRUYRQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 31 May 2017 12:50:33 -0000

On Mon, May 29, 2017 at 4:43 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> Disable the 4KB erase block size from the spi nor to be able to
> use UBIFS, since UBIFS requires the erase size to be at least 15KB.
>
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>

As we discussed, I will take this into the tree later in the week.
Once we do that everyone will need to do a full system update to
ensure they re-write their JFFS2 ro partitions, as the old ones will
not work.

Cheers,

Joel


> ---
>  arch/arm/configs/aspeed_g4_defconfig | 1 +
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 806004d..47f284c 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -68,6 +68,7 @@ CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_SPI_NOR=y
> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
>  CONFIG_SPI_ASPEED_SMC=y
>  CONFIG_MTD_UBI=y
>  CONFIG_MTD_UBI_FASTMAP=y
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 25332b0..17f8825 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -61,6 +61,7 @@ CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_PARTITIONED_MASTER=y
>  CONFIG_MTD_SPI_NOR=y
> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
>  CONFIG_SPI_ASPEED_SMC=y
>  CONFIG_MTD_UBI=y
>  CONFIG_MTD_UBI_FASTMAP=y
> --
> 1.8.2.2
>
