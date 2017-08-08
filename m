Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRZVD3vjxzDqp8
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 23:09:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AQ5FGBjI"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id u207so2344636ywc.0
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EdizQ5x5+5O/TWR8hzPKI0yfrSREg5k5TYVtynGQrFU=;
 b=AQ5FGBjIXppvetuHfHu1z8fBOb4FRfkM4aPtuSlrh0xuM78hEkMVM2ITSgPKJXSHye
 6fY/vLBw3iZiqz1Kl8/iSFRbMp2naEAlLx0MpNauuGRNymhiJHpuMEy3Tp2o0N4UEsmg
 RMOQejRR2Hryp02PGmpCCR0OmFhKLlImRH1kZSTGvMkyq5NKCuQKhtfYO0yfxh6XJ+bW
 9f0P/nyeV9hY/nvR35FefJWXLRaiaPXz3roUqC9+z1J7y3aO7BlOBTJsh0CWr+yPiA1m
 GXQKGNcM7JqAgp3osix/W9jR0viNDAOEMbIEY1PRevDZ1zkGOzA3cODf0Iy+Rj2MzuIA
 UlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EdizQ5x5+5O/TWR8hzPKI0yfrSREg5k5TYVtynGQrFU=;
 b=XH+mixS0s2p6EkVSI6gQwagEOuCQL2m7HO5tsziQkmuOX2NjHNUlELQJYcvw8R88hF
 s00lH5IadmGb00YpGXjHTG1nnsZUo9llfPtEXTZGOnr+AM8xkvRfh2rxvhsQshcD7Ufz
 QIZI3il+7AHBpN7uEVprz3IAjQ/vBl17UsqocDwaxHWTLvfAvQqhKX72bc0jcnpf45FJ
 hT1fPZDu6pnPkRCDwqLSK/FjLpvmYDyWdnjya1MgAcj8TGI+FXPcGZzydgdVHhhwwlBS
 FNeYHj/daAh+zSlot0KRl3PSAzrDgyNskO8Al1YqQttAvNxJIDXJqecTtT3rkdmWrF8a
 rASA==
X-Gm-Message-State: AHYfb5iQWYij1jdwUUENx1VvyoZTu8SVPhu08iP0LoEf7tR9OB/9XBoV
 vb3xgFAf9Qm4fhDBhJAFhsJVMes/d7KGj3IP7Q==
X-Received: by 10.129.42.138 with SMTP id q132mr3320171ywq.276.1502197746560; 
 Tue, 08 Aug 2017 06:09:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Tue, 8 Aug 2017 06:08:46 -0700 (PDT)
In-Reply-To: <20170803144813.28010-1-c_mykolak@mellanox.com>
References: <20170803144813.28010-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Aug 2017 23:08:46 +1000
X-Google-Sender-Auth: Ip6tGdi-UiKP2S4kdpluXizWlMM
Message-ID: <CACPK8XfC6=K7MUak2AQa9c1L-C4WBBWoxd8AbpXiM2KukQMUVQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed_g5_defconfig: add CONFIG_OF_DYNAMIC.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vadim Pasternak <vadimp@mellanox.com>, 
 Ohad Oz <ohado@mellanox.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 08 Aug 2017 13:09:09 -0000

Hey Mykola,

On Fri, Aug 4, 2017 at 12:48 AM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add CONFIG_OF_DYNAMIC for hotplug operations.
> It requires CONFIG_OF_UNITTEST so it added too.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 2025e45..e78e306 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -215,3 +215,5 @@ CONFIG_DEBUG_USER=y
>  # CONFIG_XZ_DEC_POWERPC is not set
>  # CONFIG_XZ_DEC_IA64 is not set
>  # CONFIG_XZ_DEC_SPARC is not set
> +CONFIG_OF_UNITTEST=y
> +CONFIG_OF_DYNAMIC=y

I'm not sure that this is something we want enabled:

CONFIG_OF_UNITTEST:
 This option builds in test cases for the device tree infrastructure
 that are executed once at boot time, and the results dumped to the
 console.

CONFIG_OF_DYNAMIC:
 On some platforms, the device tree can be manipulated at runtime.
 While this option is selected automatically on such platforms, you
 can enable it manually to improve device tree unit test coverage.

Can you explain what you're wanting to do here?

I've added some of our device tree experts to cc so they can offer advice.

Cheers,

Joel
