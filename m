Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCgML6Z4RzDrD9
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jul 2017 14:06:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XFvcAkfz"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id a12so707399ywh.1
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 21:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rejPKE7KXGLMKBf7rlXzJNUqRPb3St6CEEryD8GLxGg=;
 b=XFvcAkfz4hxJ7VDdlRQ/justjTiLwa62P4h7ZJ9XAb1Q4sDwDDiUaYER1RvWgsDNqf
 z0rUDBxUpGx3E3AwMLLUGHLVH2QRDxi7xzczXfQhIicnhvmdSSyiaDQWlBpNBfw1v1Jj
 Df9rB6UKEw1OhHwiDnbJcYiFmHI9QCKGhfK8EBY/Wx9jsfdqa84ywKP6eMYnirJJ4Smx
 c1J1xWeyGAI6pSnMyfRAE5kZHZx5hDH7ChBZaThiJ7HcrRWlifURo5XimR1mSitPJJNm
 GzkNITOQFFsT5XDblyyFcbVichKWCkvPtKDcx79wW8B2owcZfc3aZgIl5Zk0C4IC5z1N
 uBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rejPKE7KXGLMKBf7rlXzJNUqRPb3St6CEEryD8GLxGg=;
 b=QyzNUTjyws0nBhSQ6jm7KKa7ezt4upCVrGH31PCd+DLaJYx/yW5Ms5eLvXhuoL/NR/
 XzF0sh3Q9bKsOHdbwZBT8kfAt15Up1tzKNsPmFJnTXL+Deh2pNyoYcC62PtwQheNFmv5
 Bo8xY3VI5pXphALk1BV3JFueT+z2VU9YWH3c1MaSDqtqeCgezLH/ATlAFEVnngY/rNYr
 mXaNK9CIPglT+H1uI3MQSuFLY7s3qSnVPJRNDScD9bopCxVg4/MSRvs3zCXTnm0w6if2
 0fUPZ62bC+YwaQbtzi7zKbXOqaKBHSUUFeDgqf1n86OwOW4pw3cBv2Pe2ljlkdK1Vz/r
 NXXA==
X-Gm-Message-State: AIVw112fLy0xa5wWHgvtcWt4uQ1ZjDZN3QItARAjKsvyJb8WVOKQE4kE
 AqNyLwNAZxfBUymdrd/68SB1ugp0sw==
X-Received: by 10.129.101.213 with SMTP id z204mr2217305ywb.144.1500523612780; 
 Wed, 19 Jul 2017 21:06:52 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 21:06:32 -0700 (PDT)
In-Reply-To: <1500499373-12184-1-git-send-email-mspinler@linux.vnet.ibm.com>
References: <1500499373-12184-1-git-send-email-mspinler@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jul 2017 13:36:32 +0930
X-Google-Sender-Auth: wxOIyl0XGxPEiXUHlSi0oroIxB4
Message-ID: <CACPK8XfHmgwF8n7GUwy_aRPRDJ2fuAEykwmSKaLJ8y7wp0Di3Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: witherspoon: Add
 iio-hwmon node for dps310
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <spinler@us.ibm.com>
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
X-List-Received-Date: Thu, 20 Jul 2017 04:06:55 -0000

On Thu, Jul 20, 2017 at 6:52 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> From: Matt Spinler <spinler@us.ibm.com>
>
> This is needed so hwmon knows about the dps310 iio device.
>
> Signed-off-by: Matt Spinler <spinler@us.ibm.com>

Thanks, applied to dev-4.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 2efad39..4ae0cfe 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -72,7 +72,12 @@
>                 trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
>         };
>
> -       iio-hwmon {
> +       iio-hwmon-dps310 {
> +               compatible = "iio-hwmon";
> +               io-channels = <&dps 0>;
> +       };
> +
> +       iio-hwmon-bmp280 {
>                 compatible = "iio-hwmon";
>                 io-channels = <&bmp 1>;
>         };
> @@ -195,9 +200,10 @@
>                 reg = <0x52>;
>         };
>
> -       dps310@76 {
> +       dps: dps310@76 {
>                 compatible = "infineon,dps310";
>                 reg = <0x76>;
> +               #io-channel-cells = <0>;
>         };
>
>         pca0: pca9552@60 {
> --
> 2.7.2
>
