Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLXJK0qHHzDrKw
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 18:13:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bjvA9bjw"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id s143so9688630ywg.4
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mTJzvUF95R6vSi2KtUsHwN+9jiklu+w73WQmtU8gcjs=;
 b=bjvA9bjwZ7U80/NZjV5dNzofG9bDeK2RvSXGiP16zrq4g7GN9jvMr6oZen1knHX8kG
 ZE5RcMuJrOQ6bWy2VhEwi4plMjWywhyF4fHnAJ+ehOSSgnk05+gIMnpFswpmFGpDoKcW
 BzfgE47p2kPR1dpJ1jyOUGYGi4ccjuxBEfK/rREbf8NcZCsuQ8kQExiJdmcnR+tQzuSt
 VHajBNRy9rAAjOTdR4MN9rTbdXeJ5MATU4TefL20hgrPhrF8NVSWhkcjprHbqMmL38sS
 STPRSZ5Yj31Y6eWAI3p2L8c8qn87FK189mZEymcXileemZcnjb/djQXz2KtoEyr/y122
 pJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mTJzvUF95R6vSi2KtUsHwN+9jiklu+w73WQmtU8gcjs=;
 b=L4nxyttpRZMRae08o9XvOsuV7LG5ECAetZfr2f/1rVkypackmIQqNdqRQHaWaDKR7Z
 ygaRk6upxdhGYV/TtSv4w7IbFcszczLlGBw9+VvaA0OgyFv9Kzz4/nNJrweB+DAZoDxf
 vMZboebBCMvDtAzNTn9a77m0OaAOungJVSERl2h7sFvmR85XbbumdTJweSVAzfqqVD2t
 3/FeDP02T46Yuw7FoPPt59uwqswAfwxtn+BEBw31+nz8lUZlbMLplZ6aP1YBsSyDmz+b
 tpqy/jIHU26c8PfeEjYpBaVkVLgd6TbW/aPhlJiUn1OTJCl2FIyFjcBCEjNnZ8RO7eA9
 de6g==
X-Gm-Message-State: AIVw110ruAxLNSF2h1eAFaf+dSGzzfNTNfXgHOfXRvjptHWYbZXTq/R/
 JI/Zp2rcozhdwsBsqp6CgYA3xcmmFw==
X-Received: by 10.13.193.132 with SMTP id c126mr6036546ywd.13.1501488781895;
 Mon, 31 Jul 2017 01:13:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 01:12:41 -0700 (PDT)
In-Reply-To: <20170728162249.9145-2-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
 <20170728162249.9145-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2017 17:42:41 +0930
X-Google-Sender-Auth: m8tBCO3Nu1euif9LZqM08Xeo8DU
Message-ID: <CACPK8Xf3DfkeoSGowZvAX8Bzd2i9bda=9ARdUS4rNj1W_EnH2Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/6] dt-bindings: max31785: Add
 mark-fan-installed property
To: Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 31 Jul 2017 08:13:05 -0000

On Sat, Jul 29, 2017 at 1:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> It's a system design decision with regards to managing the default
> values of registers such as FAN_CONFIG_1_2. Do not assume the hardware
> is configured such as the fans are marked as installed, rather expose a
> devicetree option to inform the driver of whether it should mark the
> fan as installed itself.

I think we would be better served by making this a property of the
device (instead of each fan).

The property presence indicates "check the register to enable/disable
specific fans". For systems that have this bit configured, we have the
existing behaviour of the driver.

Otherwise we just set the register based on the fan child nodes that
are present in the device tree, which is your proposed behaviour.

Cheers,

Joel


>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> index 96e705434a59..f2ab18f5f503 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
> @@ -31,6 +31,8 @@ Optional subnode properties:
>  - fan-mode               : "rpm" or "pwm". Default value is "pwm".
>  - tach-pulses            : Tachometer pulses per revolution. Valid values are
>                             1, 2, 3 or 4. The default is 1.
> +- mark-fan-installed     : Mark the fan as installed if the hardware doesn't
> +                           already report it so
>  - maxim,fan-no-fault-ramp: Do not ramp the fan to 100% PWM duty on detecting a
>                             fan fault
>  - maxim,fan-startup      : The number of rotations required before taking
> --
> 2.11.0
>
