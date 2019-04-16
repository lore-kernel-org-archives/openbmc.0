Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="f0DYIH9P"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44k8TR28yDzDqLb
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 01:30:50 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id b3so10598727pfd.1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mcd/v9qu4ZhTnEs7imunm3j47I3ZTFJEeoLvijbMP28=;
 b=f0DYIH9PayAZCY0gCvtOk6PdUmW3eTgmzhJt0uEEjgEq3zbYLKj7b0RVGwgb24QP84
 JxkoRU/Ixv7zksxZfszA3P+w9YLtrUXbxPbiu+ONXB3BLYLzxVWoWkWTF3Pbb1OHkxS9
 7K3DDf8ErLVNPxKWDCAc58nE76BurW7RPac4s74RE/bDnVrmmaX+GCVjmazuiNRp7UFu
 uquk+caUvFTugdR964sfyAw5KVpVlFm6hRNZ1GtRExXkS2ljeACo3K0C1O6B82U5VuIR
 H9yKDZvVN00sHLAKAroX5lOZIQb2rg9BcRfZ8JL3AoYnEnrTP/azPP63gEmTatVOCBRR
 ozmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mcd/v9qu4ZhTnEs7imunm3j47I3ZTFJEeoLvijbMP28=;
 b=f4HZtH8N3Q1irevOeoxKSPt4IdaPYhU35CXRwpo1A9X3yzDfU16Bo49U9uByTqzIo8
 GKrqDvTVr2yZhqzyZ+PSJ3Hd77+fpw6JhlMURc4RCbi9FjV2sfuRHvP2akrXR/e9q8cz
 6TAoj+nXDPNy4MFAo+/JA9QnIcwUxPoBjl3KObnrYywRc33T0rZhHdQVREv1Imb892Cz
 UkiB6uAeCIVMzRRcEZ0N5UnwM6n9xmXQ2DX7HlN/QK4aRCFF6YsJEEhSn8jqxrkNdd50
 fky/I/HyP2xxgKbwVEcyet7ja5nQUXG2Bx5lm9hi04wOhLDcgAHqUD4gJUZvCQKUvmoQ
 tbUg==
X-Gm-Message-State: APjAAAU2FOqsv+ybKIANmSbMr/qjBAuHdK9TqDMcv+Z1/uOvxpZ5GDp9
 CtAxry/AqEkoBoZv7/svZf6+goGpVyBw6Gl+/eVQkw==
X-Google-Smtp-Source: APXvYqzu6MhHlU3qCdIfua/ND+fMBPAKdRstx9sMEJYP/95k3bsS6/omF8kcqHNEoh6GIctgrrjTV2ATmYKnrSfu++g=
X-Received: by 2002:a65:5682:: with SMTP id v2mr78311986pgs.100.1555428648636; 
 Tue, 16 Apr 2019 08:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190412144206.68324-1-venture@google.com>
In-Reply-To: <20190412144206.68324-1-venture@google.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 16 Apr 2019 08:30:37 -0700
Message-ID: <CAO=notx11Vp2arQFSQ8oN0sba8XJZnrGNEpWfRtDN1no-CY-Fg@mail.gmail.com>
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
X-List-Received-Date: Tue, 16 Apr 2019 15:30:52 -0000

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
s/intersil/isil/g

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
