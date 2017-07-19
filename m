Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xCBr8391ZzDrVn
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 19:41:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3TbjB+m"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id f135so1819575yba.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Jul 2017 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/taERNhtSfuXPS3W6EH9DCHWTPeQm2iEJ2iWKBsKU4o=;
 b=D3TbjB+mVubWo4t3gA9tVIaNtkVLakc+gVx5GacNyOWFyXKOJg4yYcoxJ6hW6wNtXX
 fYMrfSVSbT1KS8fu7rg1LqOQdJK8hCWwrgEwfdbrz1YiXPI9z0GjlGX7ArNra0JN4ePo
 iFE/BbxKQhtbe9GL519oQd1+3qsMf08sfl5v+kV2lMAQyeYGTw7pu6T9xekmMh3N2Igi
 NfV+XMqFsKTdfoneJBaSX0b5tEkw2Putwxg851ow8NOEtUqmxu4G+FYoVdMtbW0DslV3
 6uWD/QajkB71YaqyiZM5DQcrIAGrmQY/1ctMV6cNlrFJDX8eJIJc+ZjOinoMzqDTcy9/
 NjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/taERNhtSfuXPS3W6EH9DCHWTPeQm2iEJ2iWKBsKU4o=;
 b=lzwpBNJ+jnYY9UPgJ/vRAY2WVzdsE8BD5RUXYUJMbUUn2nillfujRe2Cns55b9vnxl
 AwjqwlEjd3l6BIoL80UYF9DHtF/bo1olbaSxKNUAE623cAAZOfiyZabJpcq76uNXUISI
 LTj9DTcRUAsTzdT29YPWw4FtAUryLCUqqevC/FzuXKchBeAoL3SzMmes3RXJLUFGoBT+
 vckOeceKqjuW5xyi3PeWfLMfa3tLfGYQW3keHdxsfqLQNpZjxlTWeIAgWc4TQagb97NF
 OUxXtjbEvpTjT4oKuMoFQuiJOdQOtBstCpb2MpKQUQhQDOm1zC1LZX/fnvzd4MBg96rg
 TXYg==
X-Gm-Message-State: AIVw112mzu5IvrwHvrbgLMG+mG3Em+2s5AaU4ldiDulHYpSIOhKeEmxr
 J1SboWBpuFt1ZPABygKTE0Sbtwkd2Osp1Vg=
X-Received: by 10.37.182.197 with SMTP id f5mr1496247ybm.182.1500457302485;
 Wed, 19 Jul 2017 02:41:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 19 Jul 2017 02:41:21 -0700 (PDT)
In-Reply-To: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
References: <20170713193606.56374-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jul 2017 19:11:21 +0930
X-Google-Sender-Auth: PwSvT2O0e1m1FcCjn9ReRlU_tvI
Message-ID: <CACPK8XfbX3VqQcvtMpmiDeJhyPBx5rqh3L5grep5gL+SmS+PDQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: Add gpio keys for power
 supply presence, ucd alert
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 19 Jul 2017 09:41:45 -0000

On Fri, Jul 14, 2017 at 5:06 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Add GPIO keys for power supply 0 and 1 presence as well as ucd alert
> to the device tree.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 76a5b28..34c5dfc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -42,6 +42,24 @@
>                         gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>                         linux,code = <ASPEED_GPIO(J, 2)>;
>                 };
> +
> +               ps0-presence {
> +                       label = "ps0-presence";
> +                       gpios = <&gpio ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(P, 7)>;
> +               };
> +
> +               ps1-presence {
> +                       label = "ps1-presence";
> +                       gpios = <&gpio ASPEED_GPIO(N, 0) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(N, 0)>;
> +               };

Chris, these two look fine. I applied these two and fixed the commit
message to not mention the UCD.

> +
> +               ucd-alert {
> +                       label = "ucd-alert";
> +                       gpios = <&gpio ASPEED_GPIO(I, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(I, 2)>;
> +               };

Andrew, are we sure this should be exposed to userspace? Is it
something that should be hooked up to the SMBus driver instead?

Cheers,

Joel

>         };
>
>         leds {
> --
> 1.8.2.2
>
