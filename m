Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNsSR0wpnzDqLS
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 22:12:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fYHsrgno"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id d72so840550ybh.0
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=vXqtkFgfcPC2naJ7vTG11yOPZg5F9KedCL1euNOKJP4=;
 b=fYHsrgnoDTDPA0F8RqXLI7L/LJzPd/HpTc6zmIzTsqpXtTeLAKm/SeuWZZ8YekYK/a
 vzNHQYuzWWRxhl/27OAIsOqnrHOz0mHLxYqVTv+IV/XhERvCrSHVKZzYZhwc9gSj6oke
 WV3/WBBC06nWxZKa0W1G3WzmPcNc1vvEevEKlVpy86+nuPW2hsemMMPou4/OQbkCgExz
 YKrCYOffPrlxVpDwhlx2VFDVAohqpw/NCEJGjjGZ0sNeP4e0IJpuGQPUp0MCb9k6EoVZ
 8gATrqbDZcYtZdRHMq9/SARyk5EQ+iWKLKkeqOHFIjmn78+yqQVeonzElXu1GcvUT16l
 cfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=vXqtkFgfcPC2naJ7vTG11yOPZg5F9KedCL1euNOKJP4=;
 b=VcHqnKwNsK7RSsomxn1zA6jpxIvpq91r4kG6kOqq89v3C98JS3se5aZKurvCh6Xe+x
 7SiM1Q+C21Oreiuax53Z8jKHybbtfYMiRIFLCDrUALWs2ZA8JA4hKalBleZcpIFQ/LyG
 3PBQYz1SbFf5wOaUiDnvQoXibYV72muJTzCYfDWvE65X0cWXK9a+fYGpldAS4yqUo/lx
 ugEwp9a7oNaoktYsyqPb6yzDspfv+G69MzBR2DKXAj/fJ/TTKv2PBVfVpOARdLVaArCM
 vtLE1U2U/XlYUa7D6nUXQKpl20Q/tyE6iVSYjrOp3Qt/W8vvWpTewEaoqoq0x+Pdp/nr
 TQFQ==
X-Gm-Message-State: AODbwcD5EYsxATpdTGA2zaPnaMev0ZuBpJRQEnFfL1S21SMjzXIVmPjk
 TVfu7qn6iVLSWcP5IAtf0H9M0j8fnwJF
X-Received: by 10.37.33.193 with SMTP id h184mr9411478ybh.57.1494504772760;
 Thu, 11 May 2017 05:12:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 11 May 2017 05:12:32 -0700 (PDT)
In-Reply-To: <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
References: <1493913487-7482-1-git-send-email-anoo@linux.vnet.ibm.com>
 <14B306E8-EFC9-4BD5-B2DD-D892CB459439@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 May 2017 21:42:32 +0930
X-Google-Sender-Auth: 4rqgvLDmzhRsEFiHlqfhLpnDuQw
Message-ID: <CACPK8XeNtDWLmx2qeHshd=Bg4JCNLd45CriVYLuNmGOMb-qqdg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
 CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 11 May 2017 12:12:55 -0000

On Thu, May 11, 2017 at 7:31 AM, Adriana Kobylak
<anoo@linux.vnet.ibm.com> wrote:
> Milton stopped by and mentioned that you had tried to modify the 4K erase
> sector previously for a perhaps bmc chip and saw some flash corruption wh=
en
> moving to an image that changed it?
>
> Just wanted to add that this change only changes the pnor setting and I
> didn=E2=80=99t see any issues powering on a system after updating the BMC=
 with an
> image with this change. Then I updated the pnor with an image that had th=
e
> mbox enabled. Also checked with AndrewJ and the hostboot team and there=
=E2=80=99s no
> hard-coded assumptions in their side about the erase size.
>
> With all this info let me know if you have any thoughts or concerns.

I recall issues relating to this option. I didn't record what they were tho=
ugh.

Cedric, can you remind me what the issues are with the 4K kconfig option?

Cheers,

Joel

>
> Thanks!
>
>
> Begin forwarded message:
>
> From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> Subject: [PATCH linux dev-4.7] arm: configs: aspeed: Disable
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
> Date: May 4, 2017 at 10:58:07 AM CDT
> To: openbmc@lists.ozlabs.org
> Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>
>
> Disable the 4KB erase block size from the spi nor to be able to
> use UBIFS, since UBIFS requires the erase size to be at least 15KB.
>
> Signed-off-by: Adriana Kobylak <anoo@linux.vnet.ibm.com>
> ---
> arch/arm/configs/aspeed_g4_defconfig | 1 +
> arch/arm/configs/aspeed_g5_defconfig | 1 +
> 2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig
> b/arch/arm/configs/aspeed_g4_defconfig
> index 4350f67..6538993 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -69,6 +69,7 @@ CONFIG_MTD=3Dy
> CONFIG_MTD_BLOCK=3Dy
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> CONFIG_MTD_SPI_NOR=3Dy
> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> CONFIG_ASPEED_FLASH_SPI=3Dy
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_FASTMAP=3Dy
> diff --git a/arch/arm/configs/aspeed_g5_defconfig
> b/arch/arm/configs/aspeed_g5_defconfig
> index b6b3ca0..7063949 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -68,6 +68,7 @@ CONFIG_MTD=3Dy
> CONFIG_MTD_BLOCK=3Dy
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> CONFIG_MTD_SPI_NOR=3Dy
> +# CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> CONFIG_ASPEED_FLASH_SPI=3Dy
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_FASTMAP=3Dy
> --
> 1.8.2.2
>
>
