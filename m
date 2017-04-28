Return-Path: <xow@google.com>
Received: from mail-qk0-x235.google.com (mail-qk0-x235.google.com
 [IPv6:2607:f8b0:400d:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wF56H1cQ3zDqBQ
 for <openbmc@lists.ozlabs.org>; Sat, 29 Apr 2017 06:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dVk6sKY1"; 
 dkim-atps=neutral
Received: by mail-qk0-x235.google.com with SMTP id y63so62314122qkd.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 13:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=FcXNIPIyC6dJXhbovnUqdb3ceXTgcukYi0fdtSxrAdo=;
 b=dVk6sKY1CCzQ7+kjMQzFEf6y5DwJP+1avSrUOYQq/mirmoYYm/kFFhGG4GqMpXENPV
 72DyQ/ShRHGfhBDcVwUKpYN3lpHD0kGxhgWmy44osVHnyfE+wlL5ny4Uhx6jBO0HbQqq
 prmXET9FI4QFqzayfqkKzU+BCrmwPEHUt2y3jtnz7YYVthSGMCXYlaumyg9eZWCCXXHT
 LWoOeFqt2MNnQn/86mnDvtTwTnhIZ5epOrC2na0DXiEb1MgVRTJ0lqeBob2z49Edvb2w
 69qBm/KsHjFe9YQh0Z46xJpo+eq89HgGsscZRO3eG5CQZROG0W3dyA4h6Mp5PC/d+rmX
 ZXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=FcXNIPIyC6dJXhbovnUqdb3ceXTgcukYi0fdtSxrAdo=;
 b=TQzUXMHxuyZRMK4DC+DkNJsIhuN7YdYL7srEf52dnfY6QgMSnIzsPkQmylebtd1kEi
 yp59mE9//PX4PqTTnNt1LJCv/3lkgVwS4PvEm6n6whIMCpLugOMidl0O1B0iFCtC+pQX
 KL/vbqHLQucEsRnOFIHkoI482bwl2fIZANNp6XGv0LafhztJA2+/TX7Cg83GqUEyWce7
 sniEmsypjjlMgk75DXf+9Dmi+NOIjbirfdhohsP3Illr/l9Ubhaf8MYk9GonnfnjyKVq
 a8FSSl+EyZVc1PYXF7gbOIr+nTnpEAf9NwdtVPIghdH8Afxht/iu7v5HmAFQK6gvuWx2
 NkFQ==
X-Gm-Message-State: AN3rC/4tqgd4venRlAsm8PlcSFcC33OBHhQT7nJMHNYBliHHyVGzSHmO
 kef1L+0y2evbO1gh8sKHfDVWi5BXmf3q
X-Received: by 10.55.116.5 with SMTP id p5mr11032571qkc.305.1493411412757;
 Fri, 28 Apr 2017 13:30:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.73 with HTTP; Fri, 28 Apr 2017 13:30:12 -0700 (PDT)
In-Reply-To: <20170428071043.1355-4-andrew@aj.id.au>
References: <20170428071043.1355-1-andrew@aj.id.au>
 <20170428071043.1355-4-andrew@aj.id.au>
From: Xo Wang <xow@google.com>
Date: Fri, 28 Apr 2017 13:30:12 -0700
Message-ID: <CAPH-5w4UOPOLhwduFByg0JcFJyKYoY04TRd5dMACdpg7OFy5fQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 03/11] aspeed: dt: Add clocks property
 to GPIO node
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Mine <mine260309@gmail.com>, Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 20:30:16 -0000

On Fri, Apr 28, 2017 at 12:10 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> This enables debouncing of GPIOs as requested by drivers.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 1 +
>  arch/arm/boot/dts/aspeed-g5.dtsi | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 9c844fa240e0..d8827d522dfe 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -143,6 +143,7 @@
>                                 interrupts = <20>;
>                                 interrupt-controller;
>                                 gpio-ranges = <&pinctrl 0 0 220>;
> +                               clocks = <&clk_hpll>;
>                         };
>
>                         timer: timer@1e782000 {
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 613b899b07bd..992242d3b22e 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -263,6 +263,7 @@
>                                 interrupts = <20>;
>                                 interrupt-controller;
>                                 gpio-ranges = <&pinctrl 0 0 232>;
> +                               clocks = <&clk_hpll>;
>                         };
>
>                         timer: timer@1e782000 {
> --
> 2.9.3
>

+OpenBMC list

Does this fix any particular bug?

Reviewed-by: Xo Wang <xow@google.com>
