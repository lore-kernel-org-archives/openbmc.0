Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NjDpayZC"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ggd174BWzDqT7
 for <openbmc@lists.ozlabs.org>; Sat, 13 Apr 2019 00:43:49 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id n8so5227321plp.10
 for <openbmc@lists.ozlabs.org>; Fri, 12 Apr 2019 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lAWfQ0Gyi/J57JYais0Ay61vbPjbcItuFsU0ObiFZ+4=;
 b=NjDpayZCy44Ca3m64mD3UUIVJ9jFqgQGs8l93QjjpnZPCfEhocKYEX1gDsB1VvY3mE
 QDETCOl8pWVpPzJHEylqN0ICIhrsMuE25smg4/8JsY+tpjNYnko/aTbQHrF2IFQ8oDyE
 8QzGK8HtryV5lfebhb6LRmBxrXDKuYP859rHGdqNdCG2P6Uz1woXZFekWlpvsuT+DILh
 JDGVcf+ey3ABwE1Yau9uDScXMa97+dCS7+tXAu4s0HgVG+uJ9l5IQugFrlcw89qyBzHi
 3siXx9pt6ix/7CZ6Fm3Z6TqPt3z3y4enPabRMAhGMTxRiTTAiAknCGFcdlynRLbEXca+
 zCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAWfQ0Gyi/J57JYais0Ay61vbPjbcItuFsU0ObiFZ+4=;
 b=jSMH7zirl2p3TunnOf7e0kgRLP52MN2y3VvjbU+BF3eFR8bf5wzopzL3b9ijEhE1aW
 ve0hzQf0PBxOFje/Ow5P8sMRAw4ozpr4zmtAnVyYI4Se4Aw3srdB8yaySj2B3PWI0mTC
 Rb8D7E23Y/ScfAY4w8jwAk3TiSqMlYD7yfVcpLyc6Ffao4CJs2eX/g/V0c4jWNL2Ymht
 9oosHhDC1FjBe6R/dkH+SgNBsjXGHtNpKM/mlJqWrwXwttw6Knt6p4m/mAvRkoQi/A0x
 TbROZrz7k6UqctY6GRzSA8ACHnnByfVvji3FBfsuEgUkKf1cml5mxqx1CK9Ba2ufFJdx
 DcTA==
X-Gm-Message-State: APjAAAWdMV50B6ftErn3rgDZOjRhANsUrmbHwKBmczcYfMMIZTVFOQ3p
 gxPy6/HFOcH0aIyob9VUE7WK9T1jeypfiEiJOu2RfQ==
X-Google-Smtp-Source: APXvYqyuZ/6hc/iq8626PiiyU7VL2Ms8JHuqQgac0FSvdlQY61sbZIt5Zx+uUUfE4M9pM6li2tWHHI9fdQlos4kduyM=
X-Received: by 2002:a17:902:8bca:: with SMTP id
 r10mr57439475plo.67.1555080227295; 
 Fri, 12 Apr 2019 07:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190412144206.68324-1-venture@google.com>
In-Reply-To: <20190412144206.68324-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 12 Apr 2019 07:43:36 -0700
Message-ID: <CAO=notwJ_yNaJr29bcCcTvNksU2ANw6C2wjcQ+Axz7bJqn9bGg@mail.gmail.com>
Subject: Re: [PATCH dev-5.0] ARM: dts: aspeed: zaius: add Infineon and
 Intersil regulators
To: Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: Maxim Sloyko <maxims@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Robert Lippert <rlippert@google.com>
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
X-List-Received-Date: Fri, 12 Apr 2019 14:43:50 -0000

On Fri, Apr 12, 2019 at 7:42 AM Patrick Venture <venture@google.com> wrote:
>
> From: Maxim Sloyko <maxims@google.com>
>
> Add the nodes for the ir38064 and isl68137 devices on the Zaius board.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> Signed-off-by: Robert Lippert <rlippert@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 65 ++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index 0c0ea41cbe27..53751adebf17 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -301,6 +301,32 @@
>                                 reg = <0x54>;
>                         };
>                 };
> +
> +       };
> +
> +       vrm@64 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x64>;
> +       };
> +
> +       vrm@40 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x40>;
> +       };
> +
> +       vrm@60 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x60>;
> +       };
> +
> +       vrm@43 {
> +               compatible = "infineon,ir38064";
> +               reg = <0x43>;
> +       };
> +
> +       vrm@41 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x41>;
>         };
>
>         /* Master selector PCA9541A @70h (other master: CPU0)
> @@ -316,18 +342,47 @@
>         /* CPU0 VR ISL68137 0.7V, 0.96V PMBUS @64h */
>         /* CPU0 VR ISL68137 1.2V CH03 PMBUS @40h */
>         /* CPU0 VR ISL68137 0.8V PMBUS @60h */
> -       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @41h */
> +       /* CPU0 VR 1.0V IR38064 I2C @11h, PMBUS @43h */
>         /* CPU0 VR ISL68137 1.2V CH47 PMBUS @41h */
> +       /* Master selector PCA9541A @70h (other master: CPU0)
> +        *   LM5066I PMBUS @10h
> +        */
> +       /* 12V SMPS Q54SH12050NNDH @61h */
>  };
>
>  &i2c8 {
>         status = "okay";
>
> -       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @65h */
> -       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @44h */
> -       /* CPU1 VR ISL68137 0.8V PMBUS @61h */
> +       vrm@64 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x64>;
> +       };
> +
> +       vrm@40 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x40>;
> +       };
> +
> +       vrm@41 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x41>;
> +       };
> +
> +       vrm@42 {
> +               compatible = "infineon,ir38064";
> +               reg = <0x42>;
> +       };
> +
> +       vrm@60 {
> +               compatible = "intersil,isl68137";
> +               reg = <0x60>;
> +       };
> +
> +       /* CPU1 VR ISL68137 0.7V, 0.96V PMBUS @64h */
> +       /* CPU1 VR ISL68137 1.2V CH03 PMBUS @40h */
> +       /* CPU1 VR ISL68137 1.2V CH47 PMBUS @41h */
>         /* CPU1 VR 1.0V IR38064 I2C @12h, PMBUS @42h */
> -       /* CPU0 VR ISL68137 1.2V CH47 PMBUS @45h */
> +       /* CPU1 VR ISL68137 0.8V PMBUS @60h */
>  };
>
>
> --
> 2.21.0.392.gf8f6787159e-goog
>

The bindings for the two drivers are missing still.  This will be
fixed when the patches are merged into an upstream branch.
