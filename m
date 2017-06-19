Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrcqC5GwCzDq7c
 for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2017 14:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iFxXZIT8"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id e142so785222ywa.2
 for <openbmc@lists.ozlabs.org>; Sun, 18 Jun 2017 21:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fBEQknlUw2Ef4Isvo30HE3I7quVht2cfKMLExZsWpto=;
 b=iFxXZIT8XQE6VWP/WDti2aUJaXy+S0kTjunAdDpQ5Lo1AsZU6r01wn2ZMX/Jgi60b9
 SGM35UuF2hMqevurpZkTyJ5UBvmj1xH0NiCJ9ZaZxIbT429mDeYdvQaX9RtTdT6vEI/V
 vvGKd9k0P86Eqb65L70012fnPIJ7VL48HFgRtIP0kbMKcZDRsam8kQWDUFXx1nFrG3M6
 NHXMTSeL8dzwwEYVFzSqBUe/IPrmfrEug1YyzhegSY5zn/xkok/i+KRqFxCRB6jkn8fx
 V75h4dMUWZV1ZjBKmlxTic0wPs/yiowXU1PRmkF0m9ss28lQV1R7qP9c1w1aOoFZgZo7
 FwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fBEQknlUw2Ef4Isvo30HE3I7quVht2cfKMLExZsWpto=;
 b=lEQ4vYBzlu/TJUWdqnrdBtGQ6PtGCT1TYi+rBcUW/tLO3F51QAMUwpzqo2Ho0xmM0n
 hnrl8C1o3EWIaTPtx5fslIB48SRZePo7FvIruOvWLHNmIJps4XWDYf8K3byPopY3UB5p
 8RJxhdwVTecHzmyhtO7rNsTkOBjEZvPqMzHx/LIWYbwmWncuiX2lwAXG8i85ksOEpeCz
 M1C5FA8hTM92b5X9FFnIUHqtL3XGZN0SKLacgbP2pZV5XjtWw90uVhemF58xCan4rrK9
 VPO195/hJLPykz8HglfsYMoh8h1Fx6zRiJRDEXbKIHWxUyFkfPCZ4a5kNeLppw8+brHt
 t6Uw==
X-Gm-Message-State: AKS2vOx171f/BJjuzj0VLtkPbQubW9iOFECzA8kRD9Qd1fhlapxRNOPf
 mPinm/Bx0/TOWESdcWAsJGxaE6At5f2M
X-Received: by 10.13.233.195 with SMTP id s186mr16624518ywe.329.1497845189726; 
 Sun, 18 Jun 2017 21:06:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Sun, 18 Jun 2017 21:06:09 -0700 (PDT)
In-Reply-To: <20170616150540.137808-1-venture@google.com>
References: <20170616150540.137808-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 Jun 2017 13:36:09 +0930
X-Google-Sender-Auth: 7zB68dWJKPaBugqYKs79BtyGyTI
Message-ID: <CACPK8XfJvLGDk7-GPgdZ3ahEFof6JPyZcHWrckFkREx_Yj4gSA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta-q71l: i2c-mux
 compat fix
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Mon, 19 Jun 2017 04:06:32 -0000

Hey Patrick,

On Sat, Jun 17, 2017 at 12:35 AM, Patrick Venture <venture@google.com> wrote:
> Updating compatibility string from 4.7 to 4.10 version of driver.
>
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to dev-4.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index d5febe330121..a73d33d4ce90 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -164,7 +164,7 @@
>          *    Slot 7
>          */
>         i2c-switch@74 {
> -               compatible = "pca9546";
> +               compatible = "nxp,pca9546";
>                 reg = <0x74>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> @@ -180,7 +180,7 @@
>          *    SSD 2
>          */
>         i2c-switch@77 {
> -               compatible = "pca9548";
> +               compatible = "nxp,pca9548";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x77>;
> @@ -218,7 +218,7 @@
>          *    PSU2
>          */
>         i2c-switch@70 {
> -               compatible = "pca9546";
> +               compatible = "nxp,pca9546";
>                 reg = <0x70>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> --
> 2.13.1.518.g3df882009-goog
>
