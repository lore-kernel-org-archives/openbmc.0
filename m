Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="b5689v4l"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Fb6Q30xmzDqVb;
 Thu, 13 Dec 2018 12:03:58 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id o125so215756qkf.3;
 Wed, 12 Dec 2018 17:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQnSjrIxTixXwLTStkoYLZJT914baaGl9zND4iaAbc0=;
 b=b5689v4l7oJV3KVYE9at/KddQJFus/+9BLl2yZfFfmtabSB07o3GKXcpb46LVH5bGG
 xd5HphM88IhhlKgqkWmVMKTnAN9R3NUCdomcxHi4ODvgxmp4XAjt2rPGBI4+sOSGoCrq
 CeLmVXCNJHB2LPoLLtbXfLboNlLfWi5dP8yy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQnSjrIxTixXwLTStkoYLZJT914baaGl9zND4iaAbc0=;
 b=owQhMGL1GMg/bDRFqvk/w7q0WbPbiDwXqsNPQSXK/YBffxABYRBzbqTc0PDdapxDOn
 ifG3ziQ/QvKYIJ2BFrTM82njlv+zSg0S/NyHo5LRvM08qQi7toAkLIM9PAae8I4kC7ZV
 qGCQzyJxYCFNOkj/dombThpnZFQCjA6WXN7N7bHUanaZiCvlmLo+c2GHgaJj135gi1UL
 3aqQGtt496AlL64izhYKsabxWaYY1gAXFvWgQUxAFLDczxK9SfxSEeZw7xnoKJ/tPmns
 yDnZsnUR4aBDGVK8xbOoDAhWAXGXrgqqO5vihDfW396gm20JhI3MMEuL6XGHVEX373A0
 4SDQ==
X-Gm-Message-State: AA+aEWbM09g520kfLUdNqsqcYAIra+IoPjV3Pm6zAXFNNkL7E/Q9hQFU
 cY0BNzYIQwvRRxFHZN9o1trgbvSSoZYvdHemzSA=
X-Google-Smtp-Source: AFSGD/VCefxwXHN5No6O2mLto7MBnUhABIT6+dIL9Ok0vAnGUnMqbCJmeZY4LWnj3iMZOgniWVBpyn5o5gg5NZVr1dM=
X-Received: by 2002:a37:a391:: with SMTP id m139mr185981qke.11.1544663035966; 
 Wed, 12 Dec 2018 17:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20181212210352.1717617-1-vijaykhemka@fb.com>
In-Reply-To: <20181212210352.1717617-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Dec 2018 11:33:44 +1030
Message-ID: <CACPK8Xea5Q1c9ygvT+WtbwJN9p2Nn-bLo8Ea6U4KuFvFZXvkNg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Add KCS & lpc ctrl for Facebook
To: vijaykhemka@fb.com, Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2018 01:03:59 -0000

On Thu, 13 Dec 2018 at 07:34, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Added kcs device and lpc ctrl device to enable LPC clock in Facebook
> Tiogapass device tree.

As we're going to re-spin, it's a good idea to have the KCS and LPC
changes in separate patches. I will take the KCS one straight away,
but the LPC one might need more work (see my comments below).

>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index d9d7f208788a..9544fa2c1822 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -21,6 +21,18 @@
>         memory@80000000 {
>                 reg = <0x80000000 0x20000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +
> +               flash_memory: region@98000000 {
> +                       no-map;
> +                       reg = <0x98000000 0x04000000>; /* 64M */
> +               };

Are you using this to expose some RAM over LPC? If not, we don't want this here.

It is a flaw in the design of the driver that the reserved memory
region is required. We should change the driver to make it optional.

As a workaround, we could add this patch to the tiogapass device tree
but make it smaller so you're not losing 64MB of RAM.

> +       };
> +
>         iio-hwmon {
>                 compatible = "iio-hwmon";
>                 oemname0 = "MB_P3V3";
> @@ -62,6 +74,12 @@
>         };
>  };
>
> +&lpc_ctrl {
> +       status = "okay";
> +       memory-region = <&flash_memory>;
> +       flash = <&spi1>;
> +};
> +
>  &uart1 {
>         // Host Console
>         status = "okay";
> @@ -75,6 +93,18 @@
>         status = "okay";
>  };
>
> +&kcs2 {
> +       // BMC KCS channel 2
> +       status = "okay";
> +       kcs_addr = <0xca8>;
> +};
> +
> +&kcs3 {
> +       // BMC KCS channel 3
> +       status = "okay";
> +       kcs_addr = <0xca2>;
> +};
> +
>  &mac0 {
>         status = "okay";
>
> --
> 2.17.1
>
