Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZyc16T2mzDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:38:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=StnMW5sN; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 192so241167vkl.0
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rCrPZVcXv2uwTlumo0bYKNRehApSbKxwi9dDHiw5Eas=;
 b=StnMW5sNHaDG+hZs39ACEvev89DuZ5+iu5pxFZMwTq3O6TruKuHScNRuDsr//Drsnc
 hm28UrW46pyh0fDDehAMkSa8p+ALWTPG9Zx3RTMfO2hHsj7crk6X665x3VPOGkLy4ML/
 10CXp/djxR+/D/JVmR8fPMlAImmsT8B3orzdMg7t6ROadP651Hexzs/3FAQUx9jOzpZJ
 sySG0EC20n0GQFkeiP3jMbN/gxJAxKKgo66DI5XwK4EDZQpA9GN6wIVfA4dHj2QbFLMF
 mydLopUucR6npo954Un3sJbmRdr5NER3d/o/28HmEtAOzb10GQArOyvqqgsxS+P6KdMe
 +yuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rCrPZVcXv2uwTlumo0bYKNRehApSbKxwi9dDHiw5Eas=;
 b=MkdheGj+cYEsqnBsi/0pRXLGzkb1lFVYXP3i1dqdMPYP0FLcbXuXzoUsvQgESMLknW
 VAhxtX6LzebrYieJX+LGCdW/kFeosLxZFkpsfJ93tzeO/kfbMIO8M2LvaPgRWQ7naBJc
 hnWKOyTQmIiytek5eKFGMYmYYjkbbNXCrUSQh+pW0HO/RD1cceTV8T1/TUAXgrKcqbzD
 oivJ+UaRbUhAP7rjMLVWPwLy8EudDBhZMcnyGZbm4YzlnS/3Gfq6UFoELboPcKQr8vF7
 7Qh1tBUVrK2hX/Ub0onI8XbyDVuHVEvRa8u+b9ogyCi6L4Hj3YzUedJyWmlR0kXQIPdh
 dcXg==
X-Gm-Message-State: AE9vXwMTonJNVC5UIr3nDmALwJTWUDfoyXt21q04nHEK7epWEcjaqjCQEPA26LgLg4h6opuD12On/zbQG1Uxaw==
X-Received: by 10.31.41.195 with SMTP id p186mr1049712vkp.2.1473989920052;
 Thu, 15 Sep 2016 18:38:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 18:38:19 -0700 (PDT)
In-Reply-To: <1486230206.194642.1473971929473.JavaMail.zimbra@raptorengineeringinc.com>
References: <1486230206.194642.1473971929473.JavaMail.zimbra@raptorengineeringinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Sep 2016 11:08:19 +0930
X-Google-Sender-Auth: tMGFrxURcur19Wb71DKLwFiRtIM
Message-ID: <CACPK8XdV0HTwvgA8CvU2YtGEV98hVE+PSq2WuwsEoQSHJDuKYA@mail.gmail.com>
Subject: Re: [PATCH 16/16] Enable FSI buffer on Firestone
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2016 01:38:42 -0000

On Fri, Sep 16, 2016 at 6:08 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 3b13cfd..ca039ad 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -257,6 +257,15 @@
>         // i2c hub PCA9516A
>  };
>
> +&gpio {
> +       pin_func_mode0 {
> +               gpio-hog;
> +               gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "func_mode0";

func_mode is the name of a group of three pins on the Palmetto. We
don't want to use it as a generic name for a GPIO.

Instead call it whatever the net name in the schematic is.

> +       };
> +};
> +
>  &vuart {
>         status = "okay";
>  };
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
