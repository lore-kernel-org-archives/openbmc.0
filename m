Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bveuxjrk"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="N16QCwQy"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RPZh1Nq2zF1s3
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 13:28:12 +1000 (AEST)
Received: by mail-qk0-x241.google.com with SMTP id d74so4106303qkg.4
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 20:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JVjDFmK7XoxWORvWazjpDSeIAMCY509waCD00vThyd8=;
 b=BveuxjrkDaiUCBp8bFvwxS001sYqcKgTMyQRZ5EAmUe3kT5GZS+BCWnAuR9SvFBBub
 L+V8M12EV6wbSAg1qAvwE/iMnj14bcIju13hP1HR6ml3KlzpJcMmJrW1C+KevGy7+wCQ
 /uVqukVUFjkG5uy5irt/NSYu1DwM9/F+mf3S7GVoW510fSTQS2rmzL3vqoh4JgH3wy+i
 2TYdOnwG19yccIyCUwEUXLsvojWAampvyu3AdYwvIiEKtszJ0CmU2edSAvsTzQ+tLp1p
 ekVw/qVo+sBG4DrZy4VKXHlMdXjVftOroJVdkYquPZGptLgSNUlh+PoVIwYeexbCuUOx
 XHPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JVjDFmK7XoxWORvWazjpDSeIAMCY509waCD00vThyd8=;
 b=N16QCwQyCC3BDMTN+Mo9PS+W5Tq81MbbexHukto4+MFxG+yvUZIVN3S1rDXTCoD4lF
 0Hqo9IXNZoEvyMhVH9xUXeorD/zcK2joi1NZufgIR4Liow6fusD0dU7pm3qS3Siu/JlP
 xHhDivWK2MJOWcl93nsw2H5lkFNEChuiYJ+S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JVjDFmK7XoxWORvWazjpDSeIAMCY509waCD00vThyd8=;
 b=MqoTBwTTQlyaLxge6l9w7dCK5+8pd5R4DgI9JizvYoaa5N5TlV3oBi9Xsl34NQZgkI
 UyvqzcszvB1feaFCk9K+3w4WZpFJ7XKHsTQlLu/ecagJvLFWmF9/gieabPESn3l78f9E
 U7Sl+44xM3RNix2MZUfgmNttDYINnPLQLzOpgX/BCYZNxZOolEI9/gFXiJL3Psn84hlk
 KdG5i6RSlSVF9r3HkwXhrK+EGiY7PTm+woU+ZTEGnVYRcyn0KcmzVkRbdCKxVMXYtf7Y
 PNl/ElMuI/KO7Ag6xVyItDws7i8O3P6b/IwgeU5a6hvC1F5IjAMMfaBDgiYp4vpmFB+b
 6pjw==
X-Gm-Message-State: ALQs6tB1hfgjwyWPmkHqedGQXxUVLDJ30/H673jH4Qzb6B9cyqYvZo1o
 /PGSIkS5IMa19y1Oj/RrBgPnOCwu+lNi7ZBtNmM=
X-Google-Smtp-Source: AB8JxZrlCMc5J8y3ZN+/LdZTKFiL5xorpzuPPPsOM/6HLlrpYT/S8hRaA/ewNt9K8UfB8mo+fSg7HQCrCS+LemU5q5s=
X-Received: by 10.55.105.193 with SMTP id e184mr4187185qkc.352.1524108488709; 
 Wed, 18 Apr 2018 20:28:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 20:27:48 -0700 (PDT)
In-Reply-To: <20180412035145.21488-3-andrew@aj.id.au>
References: <20180412035145.21488-1-andrew@aj.id.au>
 <20180412035145.21488-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 12:57:48 +0930
X-Google-Sender-Auth: kFPHeia_YDOPfmkAbxIjxESHY5M
Message-ID: <CACPK8Xfijj9Ym5pLaP8ES_YYsw+VmDj+=16_6DkU44ckq0sZYw@mail.gmail.com>
Subject: Re: [RFC PATCH linux dev-4.13 2/3] dts: aspeed-g5: Expose VGA scratch
 registers
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 03:28:13 -0000

On 12 April 2018 at 13:21, Andrew Jeffery <andrew@aj.id.au> wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  arch/arm/boot/dts/aspeed-g5.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index 1468b4ad22dc..8321df50c593 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -158,6 +158,11 @@
>
>                                 };
>
> +                               vga_scratch: scratch@50 {
> +                                       compatible = "aspeed,bmc-misc";

Convention is to use aspeed,<socname>-<hardware>, so this would be
aspeed,ast2500-bmc-misc.


> +                                       reg = <0x50 0x20>;
> +                               };
> +
>                                 hwrng@78 {
>                                         compatible = "timeriomem_rng";
>                                         reg = <0x78 0x4>;
> @@ -1425,3 +1430,46 @@
>                 groups = "WDTRST2";
>         };
>  };
> +
> +&vga_scratch {
> +       vga0 {

Do these names come out in the userspace API?

> +               offset = <0x50>;

Would reg <> be more devicetree-y than offset = <>?


> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;

Should we assume this is the default? Or something else? Having a
default for the common case would be nice.

> +       };
> +       vga1 {
> +               offset = <0x54>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
