Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh2j74BfxzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 15:01:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qovGmrC8"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id r66so4548695yba.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=buL6JATfI7RW1m+Fki8bjvl/n8PAinObO9SlZpia3oQ=;
 b=qovGmrC8N/XptF9QKZYDamY8Bn3QEmLltiBL9vmABhLwbvGJ1meKXYbSlmM/Zhwx/7
 YCY0hXYF+V+lAWf8skNOJARwWZX/sxXMXNahRycEoUU6DMap+iwaEt9ABnl6HoZ/7iZg
 Sk6Iyhy59nt6xQRb+YUMMBHQG+oubGwWcqyicFUF6clF6HjxwsK1AEafs/EjTitqnctl
 QGh66T9P8eWh7I44StE0jp7qKxnpRIvhhT3Ydp0IYyEBoyujJTWwT3PO3k8GK/rzpvNl
 TnaoNkj1+MEdpXvl9pgJo54AMXMbg5BKVTIGptR/Kcc4tVSpPobQVoSFKsiISyuaOTSr
 lo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=buL6JATfI7RW1m+Fki8bjvl/n8PAinObO9SlZpia3oQ=;
 b=n45214l5dIiUQ2Qd9X2rFFh6rro5jE32NoNu35bsNSfs0Qsl9jgu0V2VqVGbfmCy81
 9eykc4wpOmmIqgRG/qLVjutPJ4mf9vO2PQG5zMRAoIanU5GVIyN/+NM0c4Bqw3TnbWPE
 d7LhAnEDshXJUzc86/HMCwrNsk2Iag6J6dS4fL1e5bPUX2RYCPCE8Jj4J3lQThbLClZq
 hniT8cF+bzFeSRUKE372lLLOF0WaP/xqwtjP4/WCVaooCfxM9atMl+QhF/Mk6BPM1wBf
 NHXVolutEHfEl/SzxrpTEd4kJEp9rdMnHCsHi798wKEXWf6FL+KKlWki9h9mDBsDpxj6
 Zptg==
X-Gm-Message-State: AODbwcDty74muy/U2z9Ttm8zSKmPdCIwdxq+Fx8eRmYO727d4uSr+Mep
 50VJwPyx51QaZomLz6rHWuMW0Hug/thdcrw=
X-Received: by 10.37.172.156 with SMTP id x28mr7754108ybi.169.1496638889191;
 Sun, 04 Jun 2017 22:01:29 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 22:01:08 -0700 (PDT)
In-Reply-To: <1496361777-8390-1-git-send-email-austenc@us.ibm.com>
References: <1496361777-8390-1-git-send-email-austenc@us.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 14:31:08 +0930
X-Google-Sender-Auth: ZCAJz54HQhq3Kq1MFbZzybGBIbU
Message-ID: <CACPK8XdKTMwPM3SMK2JA3AV1EiKuBa4JjBi_5syq9_TyXqR-Og@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/1] Add Romulus LEDs in to dts
To: causten <austenc@us.ibm.com>
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
X-List-Received-Date: Mon, 05 Jun 2017 05:01:32 -0000

On Fri, Jun 2, 2017 at 9:32 AM, causten <austenc@us.ibm.com> wrote:
> Romulus has three LEDs that can be exposed.  Without them the
> OpenBMC code can not operate them.
>
> Signed-off-by: Chris Austen <austenc@us.ibm.com>

Applied to dev-4.10.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index e70fc00..7547b9e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -31,6 +31,22 @@
>                 };
>         };
>
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               fault {
> +                       gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               identify {
> +                       gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               power {
> +                       gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +               };
> +       };
> +
>         gpio-fsi {
>                 compatible = "fsi-master-gpio", "fsi-master";
>
> --
> 2.7.4
>
