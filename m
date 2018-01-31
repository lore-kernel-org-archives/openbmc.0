Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rd2tg8me"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zWSXd42HgzDqjm
 for <openbmc@lists.ozlabs.org>; Wed, 31 Jan 2018 13:55:13 +1100 (AEDT)
Received: by mail-qk0-x242.google.com with SMTP id y80so12951380qkb.4
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 18:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=elam+iRlA9Ou4uRTzrAGGkl/T/LUJobfavZ9LH2M5YY=;
 b=Rd2tg8metq41HHQpxscd8YVt2b+1VDYsMREoTL/7hKII43kIieYU323c7Fq/qPesfW
 qt9E5f1FIZFQOW6+sqVZx6GwWTAopUaYN+ItOhnyzACDGUGAf/SoQoo7dMz2rGuV4Oov
 XZRRRmLIuUbBC/ILThq7oAYAzD8gilDdcr/zfHzGw1ikty2ZvTNw+wURvRffrWGgq/ZY
 xAiSKXN0l49JBwgrK40MxYVNEgcRlOxVOtkzuP1LvNWPXXHxI85JIdHCXq/Fr72wWHjM
 B1vLa1+clX+4lJp22sQceuNp8+UfLtQwdJtpk/Mf6cE2IyBDs25mn8EF2h9yPkNT9U/T
 A8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=elam+iRlA9Ou4uRTzrAGGkl/T/LUJobfavZ9LH2M5YY=;
 b=hbbudew2paTLbITM80sC3Kt8hP34Fz6PQwKFcUWi4WAs1EqF3OeeJRVaYK4lEf2UW/
 T2uPgFAiBPIwQf0VXRm+m9TPAgoBXgDxBZcWAj1dvphzufL2JdipyL9DOsnauMLQ+3t5
 ZW4Vekyvo/OTjT+/FajYYUETKqLkRiGHEyBcSIT/rsT0dV3DKmUFr5o3MuTF6awaAr6c
 ZnNfQsBLGh+MhlNvGJEFw0b9AX4zJd8zCTH45lPl6gmPUWHbLLws6kF3WOFpW3QdtV6c
 V8/6MViYnKJmBaIN5skrpPxvOx2M4V5tqfPb++BTYVOGUBJXvX/0Mxjm8qvnjpU08kDt
 TR+w==
X-Gm-Message-State: AKwxyteeU9Q8xDCFzj7BByyOCnCNoxB1Hj9wNb5jsU6C5cl8+3igg37p
 VXUR9+WyCZn07BBg4SGgH3Crvx8AuuMZCzYjQaKAjA==
X-Google-Smtp-Source: AH8x224O3DBY1aVuFMZpJLx9/dKmL82JlH46l3QL4TC7SPxhvf/kHnvGzHEQ/u8A0DBdTbAWZ+MI+LBjH+qlSCI0cXY=
X-Received: by 10.55.198.155 with SMTP id s27mr756682qkl.284.1517367310678;
 Tue, 30 Jan 2018 18:55:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.93 with HTTP; Tue, 30 Jan 2018 18:54:50 -0800 (PST)
In-Reply-To: <20180131023947.24832-2-joel@jms.id.au>
References: <20180131023947.24832-1-joel@jms.id.au>
 <20180131023947.24832-2-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Jan 2018 13:24:50 +1030
X-Google-Sender-Auth: GTMGNOo3vf1vY_6S0CGgB2lVzEY
Message-ID: <CACPK8XfOsJMfF0_PXMRgxsb_BSz8pK91k661iyTiA2f=jd6=hw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: aspeed: Add IPMI BT node
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jan 2018 02:55:14 -0000

On Wed, Jan 31, 2018 at 1:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> The IPMI BT device part of the LPC interface and is used for
> communication with the host processor.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>  Fix bt reg node. It should be an offset from the lpc_host address,
>  not the actual address of the iBT
>
>  arch/arm/boot/dts/aspeed-g4.dtsi | 7 +++++++
>  arch/arm/boot/dts/aspeed-g5.dtsi | 7 +++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index e6f4047142a8..7e0da0b8cd12 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -246,6 +246,13 @@
>                                                 reg = <0x20 0x24 0x48 0x8>;
>                                         };
>
> +                                       ibt: ibt@140 {
> +                                               compatible = "aspeed,ast2400-ibt-bmc";
> +                                               reg = <0xc0 0x18>;
> +                                               interrupts = <8>;
> +                                               status = "disabled";
> +                                       };
> +
>                                         mbox: mbox@180 {
>                                                 compatible = "aspeed,ast2400-mbox";
>                                                 reg = <0x180 0x5c>;
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index b7b42c7c89e1..f1b2fa204873 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -299,6 +299,13 @@
>                                                 reg = <0x20 0x24 0x48 0x8>;
>                                         };
>
> +                                       ibt: ibt@140 {

I forgot to update the node name.

> +                                               compatible = "aspeed,ast2500-ibt-bmc";
> +                                               reg = <0xc0 0x18>;
> +                                               interrupts = <8>;
> +                                               status = "disabled";
> +                                       };
> +
>                                         mbox: mbox@180 {
>                                                 compatible = "aspeed,ast2500-mbox";
>                                                 reg = <0x180 0x5c>;
> --
> 2.15.1
>
