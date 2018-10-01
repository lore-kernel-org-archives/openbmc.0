Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="YXjlDB9j"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42P2fZ56vMzF2X3;
 Mon,  1 Oct 2018 23:08:53 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id m15-v6so13779168qtp.8;
 Mon, 01 Oct 2018 06:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/sN6qgHQbBHrUmuDtCtmsZllNbHpjUOLdVMSTJazRv0=;
 b=YXjlDB9j00p+XC53RfC0wtBOpHR6BBQPqMVL22m7SF/E+FhVWLUrmZK2AXwZ9F0gc5
 1wjFRSFyuwlLjCzVwlcXEL7LKxmQeWHFuCdo6UC9gI7j+K3QBHX1S+sjo9GjNOxjNfUq
 3lfCDI3aTiGv1CC3PQ8LklzvGc4kZ3WgUH8bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/sN6qgHQbBHrUmuDtCtmsZllNbHpjUOLdVMSTJazRv0=;
 b=psr/pitDTHXx+s0HI5aUQ+voQNdM9ssYBc8ladnhaS1tfXeNdqLpjWFZ8ir3n1K/MC
 6gZUtWkerc3bpkyO6H5LbvvgdE/NdzP8C19xYmKv84QpnpOVwOh5xMipYMR0EjAIdqix
 eTBJjXNSGMUFK5FiAnuGA8zQuGLdHuqFxcsbiFAOmHn20e6Qv4WAiZJDFKvCbHrAkwIF
 KiHdG3tyBgrNRm27Ae0p5me3c0TfvGGx9ZDnD+tsbjUPS7UibLNjMS/AbyJ38ZzGRls2
 z4VO+EGeOnQtoQMRqwxVB5xOw3xkL4emGPTxxvEe4pcSoVSyYUPLwsqCf4BTVOOU7Ooj
 G5yw==
X-Gm-Message-State: ABuFfojvzcmWtJYH/qoiDwDQOgxgFQaiCbShwtJZ6pN0rJN0QOEPJW6k
 JdQTq/plk6G+U3Exr7RCGIARFPAF0ZnSppcvYjA=
X-Google-Smtp-Source: ACcGV609VmPJ/ZxzT0dE3d/BV/hydIk9oIPLdmV+HyxH54b8H5QYm1dys+mzh45S6Zh5BRDsb0pWsIYjVFYfM/unIbE=
X-Received: by 2002:aed:38c7:: with SMTP id
 k65-v6mr8728774qte.84.1538399331284; 
 Mon, 01 Oct 2018 06:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <1537903629-14003-1-git-send-email-eajames@linux.ibm.com>
 <1537903629-14003-2-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1537903629-14003-2-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 1 Oct 2018 15:08:38 +0200
Message-ID: <CACPK8Xd0MhrFQqiM=u-Rv5u7RJRo5R-pAejH4dmeTrYSWE0AZA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: Add Aspeed Video Engine
 binding documentation
To: eajames@linux.ibm.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
 mchehab@kernel.org, hverkuil@xs4all.nl
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
X-List-Received-Date: Mon, 01 Oct 2018 13:08:57 -0000

On Tue, 25 Sep 2018 at 21:27, Eddie James <eajames@linux.ibm.com> wrote:
>
> Document the bindings.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  .../devicetree/bindings/media/aspeed-video.txt     | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/aspeed-video.txt
>
> diff --git a/Documentation/devicetree/bindings/media/aspeed-video.txt b/Documentation/devicetree/bindings/media/aspeed-video.txt
> new file mode 100644
> index 0000000..f1af528
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/aspeed-video.txt
> @@ -0,0 +1,26 @@
> +* Device tree bindings for Aspeed Video Engine
> +
> +The Video Engine (VE) embedded in the Aspeed AST2400 and AST2500 SOCs can
> +capture and compress video data from digital or analog sources.
> +
> +Required properties:
> + - compatible:         "aspeed,ast2400-video-engine" or
> +                       "aspeed,ast2500-video-engine"
> + - reg:                        contains the offset and length of the VE memory region
> + - clocks:             clock specifiers for the syscon clocks associated with
> +                       the VE (ordering must match the clock-names property)
> + - clock-names:                "vclk" and "eclk"
> + - resets:             reset specifier for the syscon reset associaated with

associated

> +                       the VE
> + - interrupts:         the interrupt associated with the VE on this platform
> +
> +Example:
> +
> +video-engine@1e700000 {
> +    compatible = "aspeed,ast2500-video-engine";
> +    reg = <0x1e700000 0x20000>;
> +    clocks = <&syscon ASPEED_CLK_GATE_VCLK>, <&syscon ASPEED_CLK_GATE_ECLK>;
> +    clock-names = "vclk", "eclk";

Did you end up sending the clock patches out?

Cheers,

Joel

> +    resets = <&syscon ASPEED_RESET_VIDEO>;
> +    interrupts = <7>;
> +};
> --
> 1.8.3.1
>
