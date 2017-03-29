Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtBWr29MQzDq7N
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 13:28:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bic7sGyq"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id i203so272777ywc.3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1HBo+rFmkZvb6bMNzkiv3p55UyrD+PeTCACr5gP/s6E=;
 b=Bic7sGyqo14HOH8JXYUlievzlICT5oPU0ckIrKwiw7iMC2bSpFsd7gzyJwXwGtYbw5
 4veEtlx66LoqzTNU9rut20Km9HczAO4HriehMGPDOsbG/BEL0UM+xHFB3bgMfwU3mDt/
 //lQePk1zPBJ9qdsluooy4Rs8/4luZQKoUA7OQi7/K/8vchfaZg3DUqj8Dt7biMdkoPI
 WkPqRcD2G2Y4MQHg1wSCuSE6kskOcEC0E+83gQrDjwOadsnJN8EjTPwDQq2ap7N4Fwt/
 nXZ/IqCw4qOjolxhH+ijIyj6BZVEqYMUAfLfubQp00Hown34GBTDdvGIEiOrdJIS4q6W
 fpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1HBo+rFmkZvb6bMNzkiv3p55UyrD+PeTCACr5gP/s6E=;
 b=ABOU4cuGbnxKlNaYk2SNft01LLF2+942HQXb9cMlhMheq4wWhkd4e1qM995izrSPyk
 qSrwML0fa3isLpWS+Ob7cbEwOmvqT1k/Q+HFjm08xK81DHruPF1bKM2/eR19rUOao013
 fivxbmCq3a+w2CRU2geVq6d+bmzNOZczXk04wxLFK9/r72jcRdmEd3uKALvoEG1Pjt/P
 gAhzR7kTkgpoV5W7TK21T8fahkA4N88u66KjcTEOh2RcaDJ4XPPUTly8hiTXV6+WQm+p
 ppEai3+z24vVxn300RhzjZTC/80zj/CFPNytFYsbQznwZmfYV5D15cBZBwvvM4F/qu9J
 hVMA==
X-Gm-Message-State: AFeK/H2sClZu8liHPPpj/zVz5swWqug/eBqAspNCTZ1d6pVsd2Lw1VZb9ZTbJRybX6PHhDFUq5AhRS3DW4pIbA==
X-Received: by 10.129.101.195 with SMTP id z186mr22517836ywb.11.1490754501366; 
 Tue, 28 Mar 2017 19:28:21 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Tue, 28 Mar 2017 19:28:00 -0700 (PDT)
In-Reply-To: <1490706638-5782-2-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1490706638-5782-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <1490706638-5782-2-git-send-email-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Mar 2017 12:58:00 +1030
X-Google-Sender-Auth: pWY-LzAb79F8w0Rleck90F-_-T0
Message-ID: <CACPK8XdSMTNBOvvQCbDVnyLv+DbLNRBhkVrSjafE_nM9Q9zNgA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/2] ARM: configs: aspeed: Enable hwmon-iio
 bridge
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 29 Mar 2017 02:28:25 -0000

On Tue, Mar 28, 2017 at 11:40 PM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Some OpenBMC systems will be using iio-hwmon so enable it
> in our configs.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Looks good. Applied to dev-4.7.

Don't forget that the yocto images have their own version of the
configuration that you will need to update.

Cheers,

Joel

> ---
>  arch/arm/configs/aspeed_g4_defconfig | 1 +
>  arch/arm/configs/aspeed_g5_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g4_defconfig b/arch/arm/configs/aspeed_g4_defconfig
> index 45dee41..552297b 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -127,6 +127,7 @@ CONFIG_I2C_ASPEED=y
>  CONFIG_W1=y
>  CONFIG_W1_MASTER_GPIO=y
>  CONFIG_W1_SLAVE_THERM=y
> +CONFIG_SENSORS_IIO_HWMON=y
>  CONFIG_SENSORS_MAX31785=y
>  CONFIG_SENSORS_LM75=y
>  CONFIG_SENSORS_NCT7904=y
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 69d51f2..c5e7295 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -126,6 +126,7 @@ CONFIG_I2C_ASPEED=y
>  CONFIG_W1=y
>  CONFIG_W1_MASTER_GPIO=y
>  CONFIG_W1_SLAVE_THERM=y
> +CONFIG_SENSORS_IIO_HWMON=y
>  CONFIG_SENSORS_MAX31785=y
>  CONFIG_SENSORS_LM75=y
>  CONFIG_SENSORS_NCT7904=y
> --
> 1.8.3.1
