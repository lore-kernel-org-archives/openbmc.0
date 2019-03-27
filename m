Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="YnAP5t2f"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Td1y5nS1zDqHp
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 17:12:06 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id t28so17541612qte.6
 for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2019 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d4DfIqapJ0nd6J8AEiK8pxsue/c4vTOPt6Clj0oA1zk=;
 b=YnAP5t2f8ItLe5WV0Rv4tpn3vHQ6GKJogwdaI4UZmep1goH2vyFAgORCHIGSVgokDY
 wwuZXVHffJh0Lpl4PfqocKynVVVg4EVozwdECVPzfniaU5G2bf9ovK3oIagxeHCWRdpd
 KcWDi43sL/nfq4qkr5cmTzQnwEoJYfeo/jsGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d4DfIqapJ0nd6J8AEiK8pxsue/c4vTOPt6Clj0oA1zk=;
 b=Jjk4xpcvU6My0XotCXskGNCB5AG7Rodzjv0Wwxlu0bqyJh4LJtenLd7DPJimfZ288q
 2fQ/lPh56qn3S+cLjZIMbv4xCF98C9Q9IwI9muRC9VXpATxEjXN+7WihFM72Ml7Ig2nf
 RiZ9gSY9+ufvSzNnt6phR5bzKZm3hi5yx9y7lSVT230yezXWELn1xunwEJCH+B5WADQu
 zEHMRKyYBGjNIaCJzI6m4syIJjXaJ8YmbwCwoL0m/3fdQrZ30YTByQPMZpBDQaShO5yK
 uQJDtPgh1QW6/C9tRtCIxbVKYThSst+8qA1ASFLosfNXGiff1O6Akw6LZSlWb+VCbvDx
 j6Ug==
X-Gm-Message-State: APjAAAVOvyXuEC4JSxfLbf1Ji+NPvO8sEPcw6Q4ZKcvld7nokerU86K6
 gc+sa/JZT+vPo+dVDI/+0IdMXjzHJ8IvaiNRrik=
X-Google-Smtp-Source: APXvYqwCEEogETbFVbBEHzBSCzYK61otUIWGHAAuABEvDJgpTaOz2wQylwzjBOks0V5wCG3k182EqwbG08CbfsYxjnY=
X-Received: by 2002:ac8:30e8:: with SMTP id w37mr29669381qta.136.1553667124532; 
 Tue, 26 Mar 2019 23:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-8-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1553196610-29595-8-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Mar 2019 06:11:53 +0000
Message-ID: <CACPK8Xd2ULjzCVEDdDYXNXMcgqjM4NkbApfO826bNs2PNNtHUQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 7/7] ARM: dts: romulus: Enable video engine
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 27 Mar 2019 06:12:07 -0000

On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
>
> Enable the video engine and set it's required memory-region property.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index ee1a460..6b24608 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -37,7 +37,7 @@
>                 };
>
>                 gfx_memory: framebuffer {
> -                       size = <0x01000000>;
> +                       size = <0x04000000>;

You're using the memory region we have set aside for the gfx device -
the thing that you plug a monitor into the back of a machine with. Are
you sure that is what we want to do?

>                         alignment = <0x01000000>;
>                         compatible = "shared-dma-pool";
>                         reusable;
> @@ -315,4 +315,9 @@
>       memory-region = <&gfx_memory>;
>  };
>
> +&video {
> +       status = "okay";
> +       memory-region = <&gfx_memory>;
> +};
> +
>  #include "ibm-power9-dual.dtsi"
> --
> 1.8.3.1
>
