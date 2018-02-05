Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZr4cV2W"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZZxJ2YnjzF0rC
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 15:53:55 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id 69so17947450qkz.2
 for <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2018 20:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=6hXpOKfkPnYKH/F3OHftzC+VD3dl26/TVmsSw9bGZr8=;
 b=TZr4cV2WP7gk5SLldoHxYihRCm3/AgG1AtoNtfWVHeCi8TwbZNQP79+CtLMSyEMlGs
 onVDHipuKyYNVGd/0BfFcS4wa3WghQEBU9OI1BiNxlBctARAZQBb1T87sL4qApM3P8/R
 G/2QsOVJrLJ+KBY5XMaMrjdrLUilYKOftcmoSHMEDqAGTYDOmWLDiGzb8twHeIz8NDB2
 CKfC1k7dYBz6Nq0mJC7LcLuk12AAlJy/H7u79aFpvv/9rP19jsIv+cS3Lg+rxcwdHet+
 5oCoy55rnlWNszGvoh25Fcd2dZ3cLQlil3NbRmxtv6vdjC+C0l4AefQAj26qWsO7HLdb
 UsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=6hXpOKfkPnYKH/F3OHftzC+VD3dl26/TVmsSw9bGZr8=;
 b=pMpHJeD1kf3sEveEMIGrxbIP54/Xb1X3FHch+7MNr9avVrdzw33UUPROZ15evCgZka
 avvKw1jUBvv+1NfPgQ2gczSAg74Xy7ijiQrG3Wn2bqTioEnrPj8AK2tMaqYqQ3fhW7VG
 nvJMFgTbdocJsygA/ljrUpuohn5v6L7tvaXWkyM9pxq9103mYh3/ixkxW2irONrh5hQh
 MdgXXOfKJEOgdLtCN09J3JT0DuEINMbSXComGxlC7pitLDVfO15xcqeQUgtwypdXVKRE
 ZK/UWvJLnI2rTjG9rROcUe4WlAUQUwdqXHBjoCss9khSGyaIwfQivUUmfhjFnfcvPZKX
 L8Sw==
X-Gm-Message-State: AKwxyteIG3RCNisDhqi6cXfsBXaPyjqL/w/NunMiaAtD5HXric7iscSZ
 PNxnXYjFiY2QU7MlBglOkLRuT406e3hWb/j7Mva/PQ==
X-Google-Smtp-Source: AH8x227XhoTGupihtUMuK2zHUq09jpGWIbJfh7s8pPjDGjY1fQAiKL2tauZTRL2opYe8JzNMOIVHNni/M+9OGyrQA+Q=
X-Received: by 10.55.198.155 with SMTP id s27mr27082558qkl.284.1517806432632; 
 Sun, 04 Feb 2018 20:53:52 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Sun, 4 Feb 2018 20:53:32 -0800 (PST)
In-Reply-To: <20180131023947.24832-3-joel@jms.id.au>
References: <20180131023947.24832-1-joel@jms.id.au>
 <20180131023947.24832-3-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Feb 2018 15:23:32 +1030
X-Google-Sender-Auth: xBb_KOYR_weqCZjPYoSRwttqSxw
Message-ID: <CACPK8XeK2LzSn-wjHZijC=bbt3yHO5vDpLFdJB-jXOnC60k77Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Enable IPMI BT node on OpenPower
 machines
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
X-List-Received-Date: Mon, 05 Feb 2018 04:53:58 -0000

On Wed, Jan 31, 2018 at 1:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> These BMC systems require this device to communicate with the host.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Andrew did an over the shoulder review of this patch:

Acked-by: Andrew Jeffery <andrew@aj.id.au>


> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts    | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts     | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts       | 4 ++++
>  4 files changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index c03c4274f910..e64df1c3b01a 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -114,3 +114,7 @@
>  &vuart {
>         status = "okay";
>  };
> +
> +&ibt {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 09dab179e154..4039381f9361 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -270,3 +270,7 @@
>                 aspeed,fan-tach-ch = /bits/ 8 <0x0e>;
>         };
>  };
> +
> +&ibt {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index b24ea9967fc8..5f8dbffa6b22 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -632,3 +632,7 @@
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_wdtrst1_default>;
>  };
> +
> +&ibt {
> +       status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e7669d126df1..7f5a29566801 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -435,3 +435,7 @@
>                 aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>         };
>  };
> +
> +&ibt {
> +       status = "okay";
> +};
> --
> 2.15.1
>
