Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh4gG3dWbzDq5W
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 16:30:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRsRuDye"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id w143so1190252yww.1
 for <openbmc@lists.ozlabs.org>; Sun, 04 Jun 2017 23:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=8P1NiCJMOjdM73YBVzXp/oErWDc4x/uIUXh7SAO/mr0=;
 b=gRsRuDyecKTJkBdqyb8fvJ5rmCWtSS0rfxzDHypOCndG8t7FDPXOxoUxromLY+46ZI
 Ly1VdzB4KiVaRiguhP/+QTK7rWa4YQ2XqAZaZOjp3kY9Q4ehbt5iCfAK/FfF7PrUzrox
 GOowx2TLHcZapzsZpttmZLhZ62f1kN6sqZTHa+9xnK04V7Rpw0fHDOTuPDqmOo9R6jzc
 SXv0eVC2TGfmbr4qF/2Nez9SqT4i0gZeDfymu6Rs2WNRKlmqe83k0fzCzhQd2uiP+EAY
 eugmRX9a3oTo2beQZSi2iHv1DMgDZpn9bQs3MqxM4dJaVS3w99FvtFS2Fq5XGH00Al30
 ZP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=8P1NiCJMOjdM73YBVzXp/oErWDc4x/uIUXh7SAO/mr0=;
 b=neVnor0i57FXGWb+e1I7qtpMHybo1rQ1PQkDukMgQhSjO4aEZ/0Ubl6rrA8yYjAg32
 xtjmrkSQ4veU+V81t8HnPdFxiOnjAIU8INcpdt2P3E99SGmU80KZ3iCU5zvSgNoxOfBJ
 XVdY9tR6Z8xgey2GVOgbGvW8Zi0Sklv05R1T8gyxGxWf15Dzn9DPEHEn/LgbrK7XbhpR
 bMi9ywafJ0OKLLVcsfcDNRumy6TQ3b8KaW7mIO2RloS8E5SLBgkXVwvDEVLsr86hfOuq
 td4iWqVTzptunjCq11UujzyixPLZrVhEl2+61sWPvkjKCSOOk2Sl5e/xAMmx34M66SxI
 FJew==
X-Gm-Message-State: AODbwcDQGeKjDLCqinG/0pSsopMl0rIPTYMmZKExEUI/sid+TV0rPxC0
 E3fiRg8nrWGp8cYSkJpKhjuPClaejg==
X-Received: by 10.13.218.198 with SMTP id c189mr14305925ywe.308.1496644200558; 
 Sun, 04 Jun 2017 23:30:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Sun, 4 Jun 2017 23:29:40 -0700 (PDT)
In-Reply-To: <1494617900-32369-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494617900-32369-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1494617900-32369-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Jun 2017 15:59:40 +0930
X-Google-Sender-Auth: aBaMWvTt5gAecGyeOVD2fHsZAMg
Message-ID: <CACPK8XdMJANFCV8pfrbf=+oR5pzku5ARVs1fE39E5v=eP0p_tQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 3/3] dts: aspeed: witherspoon: Add FSI
 devices
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 05 Jun 2017 06:30:03 -0000

On Sat, May 13, 2017 at 5:08 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 46 ++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index f20aaf4..4138c93 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -65,6 +65,8 @@
>
>         gpio-fsi {
>                 compatible = "fsi-master-gpio", "fsi-master";
> +               #address-cells = <2>;
> +               #size-cells = <0>;
>
>                 status = "okay";
>
> @@ -73,6 +75,50 @@
>                 mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>                 trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
> +
> +               cfam@0,0 {
> +                       reg = <0 0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;

Since this snippet will be shared by all power9 machines, I suggest we
put it in a dtsi file that is included by them all.

I will resend with my proposal.

Cheers,

Joel

> +
> +                       sbefifo@2400 {
> +                               compatible = "ibm,p9-sbefifo";
> +                               reg = <0x2400 0x400>;
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               occ@1 {
> +                                       compatible = "ibm,p9-occ";
> +                                       reg = <1>;
> +                               };
> +                       };
> +
> +                       hub@3400 {
> +                               compatible = "fsi-master-hub";
> +                               reg = <0x3400 0x400>;
> +                               #address-cells = <2>;
> +                               #size-cells = <0>;
> +
> +                               cfam@1,0 {
> +                                       reg = <1 0>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
> +
> +                                       sbefifo@2400 {
> +                                               compatible = "ibm,p9-sbefifo";
> +                                               reg = <0x2400 0x400>;
> +                                               #address-cells = <1>;
> +                                               #size-cells = <0>;
> +
> +                                               occ@2 {
> +                                                       compatible =
> +                                                               "ibm,p9-occ";
> +                                                       reg = <2>;
> +                                               };
> +                                       };
> +                               };
> +                       };
> +               };
>         };
>
>         iio-hwmon {
> --
> 1.8.3.1
>
