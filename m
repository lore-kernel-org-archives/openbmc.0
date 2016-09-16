Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
 [209.85.213.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sZyfq4lJ8zDsZP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 11:41:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=w+U5447W; 
 dkim-atps=neutral
Received: by mail-vk0-f65.google.com with SMTP id b133so242456vka.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Sep 2016 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=12STaHBZdick7LQR1NN1q0I0epUvDDyttNfhcFMk3MU=;
 b=w+U5447WIz3tSyPR8muAtPpzJAljUVJ/iTAf4EgBtawIFScUUP8EkmxFv5XXzND9dP
 XiJzwEuyGf0UOBa5zjIxE1/sfFevfkFUjl9rtwZZ1I3+u0RD528q75NHxGmlndsjVA2y
 3vgvQNZkf7/W4/c36Zyie/QhIqMuEdIXz01uEfD6b6BOjnZSZiWtoLUCxFg2oiZPZCnY
 dXI2b0iMFLOKZTQSxUnTMHs64Zl/93IjP4kLaoIsHN4eI0EePL/bKN1yluDhDnjmvBDG
 +fxi/mhMZchgbU3yrKlw5wGeL3e5zxQ50XVsCeEpbSLNpMFBMTer41PuW7+uCAEVQ6em
 tOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=12STaHBZdick7LQR1NN1q0I0epUvDDyttNfhcFMk3MU=;
 b=RFpp42l7Sg2pysa8waGXBvKuySqUQPPwsNuDPrVFcZB5BtuQN4gaWenzf8KI3j/yZD
 yyEu4/wWH4QK4BqC/4wYlS3ZY69OzywJJQA27k1ce0pIlBNzRnbv4UumGnwuF7XNBfaM
 cSRUCFxdHYF2p7sQGIVxPqj50QZlBiINmazS4PugOJTfjEt6hJSeH6Cy4lUf6Ow3z+tJ
 RDZ/Rz6ZkgV52QQllFSmXf62OUk698E7A3zLeaeXXhLcK1g7NwJtCF8NIeGQHzxnE1qb
 tKfZY2GeZfmyHKLnuHfq2d7MTNoG1Lcc1lKgRgh7vLf3Livy9PPP6gNXu9KdOI0jEFKT
 Pj3g==
X-Gm-Message-State: AE9vXwPe5uN81bViubxq+TY8w8SjCMwT/lj+fDaDKy/1S+ZTkqVjI87Cga4y29SyFJQQDm0B9yMrJySWOg1tVA==
X-Received: by 10.31.54.11 with SMTP id d11mr862604vka.149.1473990005807; Thu,
 15 Sep 2016 18:40:05 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 15 Sep 2016 18:39:45 -0700 (PDT)
In-Reply-To: <644340813.194637.1473971868909.JavaMail.zimbra@raptorengineeringinc.com>
References: <644340813.194637.1473971868909.JavaMail.zimbra@raptorengineeringinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Sep 2016 11:09:45 +0930
X-Google-Sender-Auth: tg7mVXG33qDW93YCmFZw0-2yzJc
Message-ID: <CACPK8XfRuCt6HS=RAYfsWs6tF4GsrpGg6v+7kgTNrBOpvU9bsQ@mail.gmail.com>
Subject: Re: [PATCH 13/16] Enable RGMII pin functions in Firestone DT
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
X-List-Received-Date: Fri, 16 Sep 2016 01:41:08 -0000

On Fri, Sep 16, 2016 at 6:07 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
>

Missing your s-o-b and commit message.

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 053fafe..a2a2ef2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -72,6 +72,9 @@
>  &mac0 {
>         status = "okay";
>
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_rgmii1_default>;
> +
>         no-hw-checksum;
>  };
>
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
