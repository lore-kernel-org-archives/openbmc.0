Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtBdR5Vb6zDq93
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 13:33:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q+CfVsaU"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id i203so280787ywc.3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7II8ia5onIN35kZZdWhLj5gyaoGlZPByYjOzHj53cn8=;
 b=q+CfVsaUkNAuoWiPl9jXC/00Undzu9jAKP2zYSUErLBCROcm6wTgh7Wzv9mtJffBYC
 C0AuBWLbBhHYaIx+sKVlA+hWILDWfGWeJbef8G4xwlHFhRSjqv0ankMc/ZTSWm6+ckl8
 innN65bPJYtL+xPAgV/lkzrL7Wo79wZojMMvXayZ/IMf+xFgesYVYns9iXz8wab71+80
 S7A2bs4Xv5bdq7FhV2zqQIAZ+yIpGIw3ZTZBimPj96WxbQbhNT57ZeTiz/3kvy6At2Vm
 I0M56dgiylYp3MenBMPfqUZO5RF40OEXVr4hgQaqUd81GaY9VYM4q+CYHRZBwE3M8Boq
 mGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7II8ia5onIN35kZZdWhLj5gyaoGlZPByYjOzHj53cn8=;
 b=qOi0IIyAlCbJkC4NYpA7PDlciCUYzhBi80ZhEc/IkXCOOskTHvQgfWW2WZ1Wih896Z
 4adF2KNWbn/1qHv7vuNq3LdStOL+1VA5jA1sLuIMYoAobStw30G7ytdjbw2lUZV/lmOi
 m5jfzv/tyXSZRaAzGfJiicSldVdzZq+KjkkLR3WJvHlfaktx9rQ+Q9IT/ya0NXmNUGNI
 dqlTE2IYLL0N3/c+rhUMdcy8lrFtVq1IL7ySC9MMK0tryQTwbCcpJirQ/qV5D+MyGBNQ
 h0gGD6+hcl6Q2k99Kklq8fP2uhuIVtCCBJTP+/W6ITCJo69MWIeZWRE+nRkIwYCFmpMs
 uLbw==
X-Gm-Message-State: AFeK/H2cTlrfpbR08uUklJRjlzJNibmPjfRBLKiOcNx67RY0pkD9vWcxFDXn3mFpEr+x1dnI7gACfBd2kkg4LA==
X-Received: by 10.129.91.86 with SMTP id p83mr22712061ywb.50.1490754792539;
 Tue, 28 Mar 2017 19:33:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Tue, 28 Mar 2017 19:32:52 -0700 (PDT)
In-Reply-To: <1490731480-1349-1-git-send-email-bradleyb@fuzziesquirrel.com>
References: <1490706638-5782-3-git-send-email-bradleyb@fuzziesquirrel.com>
 <1490731480-1349-1-git-send-email-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 29 Mar 2017 13:02:52 +1030
X-Google-Sender-Auth: kHEaUcyPLrlaT79RQHeuLWGkSh4
Message-ID: <CACPK8XfYvf6U17tqU_6WmK-BF7PpCr-Nyoxok1STszNdf3BLBg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/2] ARM: dts: Use IIO version of bmp180
 on Witherspoon
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
X-List-Received-Date: Wed, 29 Mar 2017 02:33:16 -0000

On Wed, Mar 29, 2017 at 6:34 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Early Witherspoon boards had a bmp180 but v2 boards
> have a BMP280.  Switch to the IIO driver that supports both.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
> v2:
>     Remove stray line from commit msg.
>     Fixed missed device name update.
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 6e7b5a4..e3a7b77 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -58,6 +58,11 @@
>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>                 trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
>         };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&bmp 1>;
> +       };
>  };
>
>  &fmc {
> @@ -160,9 +165,10 @@
>          *    Regs 3.3VS, 1.1VCS, 5VCS, 1.8V
>          */
>
> -       bmp180@77 {
> -               compatible = "bosch,bmp180";
> +       bmp: bmp280@77 {
> +               compatible = "bosch,bmp280";
>                 reg = <0x77>;
> +               #io-channel-cells = <1>;
>         };
>
>         max31785@52 {
> --
> 1.8.3.1
