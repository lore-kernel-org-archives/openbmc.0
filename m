Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsvYG2L3DzDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 16:13:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QdGCp2BP"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id u13so9834287ywg.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=UJFJzNAgVp7APa+vxeQYVTZXLJXwyv4jTXW1d+FoZEU=;
 b=QdGCp2BP92gilUDTXeowEN/S3SaPC9zSe4nw8GYSaPhS/cSVt1lsPZsVvrnTCDGyHG
 lYImIy3gVw3fdR7bJZXWkn34sRthylKHnLF8hlLRk5QtxjPe/MZV24cGocfsYTjSgVyC
 y7QMF7B8eOVl+j+lCd7FCjSHG7TRBuugh9SXtAwBRyW4XnLZuFUR/YNZ6TSCeMqtXqSr
 Q8djglLslO4RNpxRYJfkx8giwR7TATKvk7d8yUvQwICFWHsLuWpWdJ3FrWDufmcyhzid
 kKppZkWA+T2beJlDAoyd3BEkIZYL2XROizTpRKiTb6RvmEapHZCxv8G27Mx/NsaK0jNl
 lQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=UJFJzNAgVp7APa+vxeQYVTZXLJXwyv4jTXW1d+FoZEU=;
 b=rysSJqqAqM5n6bWOft07i5/MDPavMQxP6/qdZt1RuN5U/Lwjgdp1XbKcmVmrhV61LI
 U4TfTTvY86SeyV9ca09KVB42RDPub31ppmpHXfY4n1aDdyBVws8XYS9tGQ5epOdXimzc
 8A83ecGzkjUdDQ05sJK8/ErN8VUcLcw8APk/ItyU5wZY62rEIkF/7T3pcA/jFTZw9ylK
 AaAtgJYcUxGDbmyCGc+3RvjSsba5go/CNvM68bW+G/TWNg0GRen4yxK6rOtNPkdAyleA
 f7U/Z7O40A/8h7KHPQqCrP6PyX2ZGcg6a7HbeBDoggnIgxMk79sGDU8d1X3CtZ/QaCTh
 5wgw==
X-Gm-Message-State: AKS2vOwCpljfzcRDA353XoLqegYo3s1bEvauFh3IPwB00bDKFANJcdQ0
 dRFa65rtZ8OQ4UfsevQbQsRGIiR7ZnEHKkI=
X-Received: by 10.13.225.79 with SMTP id k76mr24425354ywe.178.1498025631509;
 Tue, 20 Jun 2017 23:13:51 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 20 Jun 2017 23:13:31 -0700 (PDT)
In-Reply-To: <20170619041533.26446-1-joel@jms.id.au>
References: <20170619041533.26446-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jun 2017 15:43:31 +0930
X-Google-Sender-Auth: 3sWDkVT_9mCL8Hig7uycYuh8uwY
Message-ID: <CACPK8XeDB+0O8MrBOV9_yBg9cqbsnH6qW0Bhe4FymnSBAoPv2g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Enable WDT2 for all
 platforms
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Matt Spinler <spinler@us.ibm.com>, Xo Wang <xow@google.com>,
 Lei YU <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>, Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 21 Jun 2017 06:13:55 -0000

On Mon, Jun 19, 2017 at 1:45 PM, Joel Stanley <joel@jms.id.au> wrote:
> Some versions of u-boot leave watchdog 2 running, but some do not.
> In order to handle all of the u-boots in the wild, ensure Linux is
> loading a driver for it.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Merged to dev-4.10. Thanks Rick for the ack.

Cheers,

Joel

> ---
> If you're on cc, please reply with an Ack so I know that this change is okay
> for the platform(s) you care about. If I don't have objections by Wednesday,
> I'll merge.
>
>  arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts    | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts   | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts   | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts     | 4 ++++
>  8 files changed, 32 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> index ff5058ee8834..9bfd5462ea9e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-cmm.dts
> @@ -201,3 +201,7 @@
>  &pinctrl {
>         aspeed,external-nodes = <&gfx &lhc>;
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 9f7098876ecb..e4e853d0f561 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -184,3 +184,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> index 430622c86ef7..873e62ce6673 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts
> @@ -224,3 +224,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 8ebed01e7725..f7a7cbf77aba 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -324,3 +324,7 @@
>  &mbox {
>         status = "okay";
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index dd01dfaa8509..d53dc597a0ce 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -257,3 +257,7 @@
>  &pinctrl {
>         aspeed,external-nodes = <&gfx &lhc>;
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 99003b9fb54b..31315d03dfb8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -419,3 +419,7 @@
>  &pinctrl {
>         aspeed,external-nodes = <&gfx &lhc>;
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 68baf3288263..ccf6cad2e382 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -386,3 +386,7 @@
>  &gfx {
>         status = "okay";
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> index a73d33d4ce90..e609c53d58f5 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
> @@ -244,3 +244,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&wdt2 {
> +       status = "okay";
> +};
> --
> 2.11.0
>
