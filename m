Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPdsF3Hg9zDqD2
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 14:33:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ADOOEYe+"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id 123so1340080ybe.0
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 19:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/I7rjNci5ODBchBr1W2Sab9X6AWsBRkwhH8Me4/Ue3Y=;
 b=ADOOEYe+yLpgBCp3F/AZSPESTQ92D8fwyZ/8dRZ8IGjafmnfW8C6dnBx0d1lMfhBd7
 vYiEnBOXtHLoUoSJZ8T5edi4szf0JLZRYJ1+cT4IR4/w2cQvuJVtia4Tb23GVA2u+p5Q
 LvMMzMPxt65SI01hYWuqhzPRmTSB6nk4EBJ+sYB3kFppoiNXx9J1Swhv7WSvW0sv95yE
 O3qy/FR+8Q9kuGFr14v7E1wifhDZNHBrPGMVz8B1yIr8yB7n21Rgvn4JMtREUjgh4nHf
 8Zicqt3KsCKENWtv6niakEoPlF5UFkH/hkZ1pI6gcL08ab6y8Z3ExPjqH6350VGXA+uu
 NBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/I7rjNci5ODBchBr1W2Sab9X6AWsBRkwhH8Me4/Ue3Y=;
 b=iIxUIh3d70f7+sFi+h94ScwEvfLlftjAUxdW+/Q8/dMVX1l/25BPwvIfBn70ycWOef
 D27yu9DAqrzxuTAgoLvhr7yhK3uMv3z7die7vRqE0divgJnrKD/NGLgNbma0cL4qx8m3
 yjVoulO9/5LYwJINcXmPUcij2JnPzYdZDm8OcjUi+0w+vty20v+CLItg4EhrahPiHknl
 7NhfEJ9KJSTqSQ9Eemo+tGA5r0jq1eMrsyGvF2Fa3gvbeE1MOgTwcDZppaVo1+POb1kf
 OrxxURp3MS89tV/mZkiK5m8Tb8GQGbr3wU+sEjeipJ4Acyjc18zeLZaOAalvmSf8sRwl
 QTUg==
X-Gm-Message-State: AMke39mDxSvJCd8/a163mC3eGPb/YtPR/Zyp6jQdBoelswU7N4VSWhsbtnJsGNpwQD4IABVKHNOYRvaUlmYSrg==
X-Received: by 10.37.32.194 with SMTP id g185mr4468040ybg.167.1487302399163;
 Thu, 16 Feb 2017 19:33:19 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 19:32:58 -0800 (PST)
In-Reply-To: <20170214005104.11940-3-andrew@aj.id.au>
References: <20170214005104.11940-1-andrew@aj.id.au>
 <20170214005104.11940-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 14:02:58 +1030
X-Google-Sender-Auth: ddw8n4YtwuuPtjp0Ttd7GoJk3F8
Message-ID: <CACPK8XfM6seGAO_Qfj5gM_G=D2cbVTbHLQXA034eerpPC7BFPQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 2/3] ARM: dts: aspeed-g5: Add LPC Host
 Controller node to LPC
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, Rick Altherr <raltherr@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 17 Feb 2017 03:33:22 -0000

On Tue, Feb 14, 2017 at 11:21 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Required for pinmux, which tests some bits in the LHC's IO space.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Large Hadron Collider!

Does the ast2400 want to know about it's particle accelerator too?

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>
> This is extracted from commit cec822f89ec19b181dc02e2a0c6441d107d8b4d9 in the
> ARM next/dt tree.
>
>  arch/arm/boot/dts/aspeed-g5.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> index b73503c866aa..7c09a26eea6e 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -117,6 +117,11 @@
>                                         status = "disabled";
>                                 };
>
> +                               lhc: lhc@20 {
> +                                       compatible = "aspeed,ast2500-lhc";
> +                                       reg = <0x20 0x24 0x48 0x8>;
> +                               };
> +
>                                 mbox: mbox@180 {
>                                         compatible = "aspeed,ast2500-mbox";
>                                         reg = <0x180 0x5c>;
> --
> 2.9.3
>
