Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s76wR3PQ0zDqS5
 for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2016 16:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=N8sV14/7; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 74so6761625uau.3
 for <openbmc@lists.ozlabs.org>; Sun, 07 Aug 2016 23:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to; bh=TqhzY48NFVA+v6kBjH1q/0OPHez0TjoC6T08B9xS5Uo=;
 b=N8sV14/7UrpMYmNqVaLb9JdNBsHZZRU8QNZegR9guWwks5Jw4xpq1x+szVtargSXeI
 Tquk41NaXS28J4tBW1Ziu0YUt4IjCYyoWK5Mv3lcsMw+0xUJOPbNa52Q1IOqoVVYwcG+
 1+nojXn436z1JyUkPQfSbOgq5xPsPZLaRlsrnRvNcMWs9+HGVK7WkUri3TCHnUcQbZSx
 zOz0Ii/PS1PSZbssUcWcLC6Wt2ZUQPtH6+uDB0PPAOTwCr39nrq4WO7Hr7J73XLc+IGr
 3n0OhuEiUKZkkj4Z5+eabKkK92bn3zrpTxacmCaQJhbWN9PQkXt4GX/PmJrMPTIJkwWN
 hAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to;
 bh=TqhzY48NFVA+v6kBjH1q/0OPHez0TjoC6T08B9xS5Uo=;
 b=bJoj/DctVRCYhLa48vOM/9X5eS8ZWgDpeJVjqQSqjmfAT2NCJs9yJawpLFXduj4w4z
 haVRVTYp2c9mkmT0diqbtvsYI29ocMleiS5aLqSt0/pCHGaq05M1KSgjj5Y1/Igiz0+5
 HkuaCueUN6hnwsprnPYaysYZZrXU1smASwLtpXrWF8EayEmVvGAHUVph8oFpwJEYr24P
 d3ZdIup5xrzrRBpEWKXm7d+AqoWJSBmRDZLUQdH1jbr6BJc4+lAT9bodf63kJYJ0h4Id
 vAMq1chydZlJSRnTh4dyFY772V+MT4CYVmu1AuS+qjq0LUnU93xsZ/sIPnYLi5meaZKK
 vITg==
X-Gm-Message-State: AEkoouuzmrQwfxllQ4hYQqUz7ngXcYVtEd74QUVIzXkaKJKCMVEOrSBSZWRkt4JEPf+pgR1TxbquXMorfv+PeQ==
X-Received: by 10.31.78.6 with SMTP id c6mr46017616vkb.41.1470637810314; Sun,
 07 Aug 2016 23:30:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Sun, 7 Aug 2016 23:29:49 -0700 (PDT)
In-Reply-To: <20160808062057.26873-2-openbmc-patches@stwcx.xyz>
References: <20160808062057.26873-1-openbmc-patches@stwcx.xyz>
 <20160808062057.26873-2-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Aug 2016 15:59:49 +0930
X-Google-Sender-Auth: _7WfEd8WEvOJB884moto21buL8g
Message-ID: <CACPK8Xe2YA5yqS9XwNSf9y1L9dyyOJSZ1BQ1jSfUHQVOHEb_3A@mail.gmail.com>
Subject: Re: [PATCH linux] boot/dts: Keep the LED initial state during kernel
 loading
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 John Wang <hsienchiang@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 06:30:16 -0000

Hello John,

Thanks for the pull request. In the future, can you please use
git-send-email to post the patch to openbmc@lists.ozlabs.org?

On Mon, Aug 8, 2016 at 3:50 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: johnhcwang <hsienchiang@gmail.com>
>
> Base on the Barreleye HW spec, the beep LED shouldn't be
> turned to OFF until BMC ready.
>
> Now the LED will be turned to OFF when the kernel loading,
> so enable the LED sub-node property "default-state" to keep the LED
> initial state.
>
> Signed-off-by: johnhcwang <hsienchiang@gmail.com>

Please set this to be your name. It should look something like:

Signed-off-by: John Wang <hsienchiang@gmail.com>

You can do this with this line:

git config --global author.name "John Wang"

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 0e567e8..3146ea9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -132,12 +132,15 @@
>
>                 heartbeat {
>                         gpios = <&gpio 140 GPIO_ACTIVE_HIGH>;
> +                       default-state = "keep";
>                 };
>                 identify {
>                         gpios = <&gpio 58 GPIO_ACTIVE_LOW>;
> +                       default-state = "keep";
>                 };
>                 beep {
>                         gpios = <&gpio 111 GPIO_ACTIVE_HIGH>;
> +                       default-state = "keep";
>                 };
>         };
>  };
> --
> 2.9.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
