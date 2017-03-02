Return-Path: <xow@google.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYY0h1BL5zDqP6
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 11:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="i5zvHOSG"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id u188so99237444qkc.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 16:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=A139fu8hEwWLMtf4W2xy4XdLPOSmWzBlqOVO4mlQhqA=;
 b=i5zvHOSG0qR+1tktleQg1UNd2DiPeeaBfz0u5qpCsvft1Dj5sjasUHFBhkns2W7EgW
 cUODPoR/ONi8L3yvPZGbj9fi/Hz3K/I87/iseBx7wib5/okRbPlo8DETjbtSFpCRA9Oh
 OtiEu+fCOaYhN/Kmb/FoBfmGifh6M52BDpGM2gWNOlD6yGeMwH5dO2MFXYkJM8iQUCZq
 0GWkxzV3HTXkmOeQEbIOoKhVVqeHbsBG+Nhwdd9a+yMUNUPIsjSPtzddFq2q1mJTdZmk
 IHXtgZM3jXYoio4lMssk6NteSYEUpjNneG4g1+hkrZjGZiWe3Iur7JB54VAWoU11C4Yz
 Ab9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=A139fu8hEwWLMtf4W2xy4XdLPOSmWzBlqOVO4mlQhqA=;
 b=NQxwvQoLMyR/g8CEufkHPDs2xFjSSyZShcvuiNBnhv1AHhj168+qNporWSdam1A6vJ
 wZdfczb/gZEbpfk7e2u41mXtSoR5N4EuefFzrQXwbq8x/HTqmmk3LBDudqa6Lcw5sep3
 UwrZb88kARJGUY4xSLVfckQGd2Zo4TY9yC5tr5PRNNCi+ylLCnG4piJBZeb3woyI8fP3
 sRjt17c1BOlJTy6TAu8wmBuNJEQ/aChEXfysJKDEk0HT1YQdno4BsPBEzikaspGelegN
 +2UG32NYZIbmVtbFWJ63dp6f5wzdegPpPcDR+of3oX15z7EjSaUj1QfGBcRYS5tluXlw
 l7Hg==
X-Gm-Message-State: AMke39kylJAG2L0Dom/3/HPhCWZquCzQSWKLozHBzHKnsmCcVJWDfXx+b0h1RDaRAHeYIfIyWXmrQNR51lOHAPd6
X-Received: by 10.200.56.248 with SMTP id g53mr13843149qtc.172.1488414129541; 
 Wed, 01 Mar 2017 16:22:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Wed, 1 Mar 2017 16:22:09 -0800 (PST)
In-Reply-To: <20170301224312.21540-1-emilyshaffer@google.com>
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
From: Xo Wang <xow@google.com>
Date: Wed, 1 Mar 2017 16:22:09 -0800
Message-ID: <CAPH-5w4CrWiVCCbznBu75yrTQMd9of0GP-YRYqjCeAyxnUS4OA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 02 Mar 2017 00:22:12 -0000

On Wed, Mar 1, 2017 at 2:43 PM, Emily Shaffer <emilyshaffer@google.com> wrote:
> I2C mux pca9541a@70 for Zaius was incorrectly configured, preventing
> hotswap@10 LM5066I hotswap controller from being configured at startup.
> Adding the missing field results in the hotswap controller being present
> immediately at boot.
>
> Signed-off-by: Emily Shaffer <emilyshaffer@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 548ef1e939fe..7015863751e0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -258,6 +258,7 @@
>                 i2c-arb {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       reg = <0x0>;
>
>                         hotswap@10 {
>                                 compatible = "ti,lm5066";
> --
> 2.12.0.rc1.440.g5b76565f74-goog
>

Reviewed-by: Xo Wang <xow@google.com>
