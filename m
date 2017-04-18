Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x242.google.com (mail-io0-x242.google.com
 [IPv6:2607:f8b0:4001:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w6SYw5zmgzDq7Z
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 11:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jxsp7Ome"; 
 dkim-atps=neutral
Received: by mail-io0-x242.google.com with SMTP id k87so30014543ioi.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2017 18:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UDmtW4AjZHzsNupJARq4jjtET+ZF0OUIV6d+u2Q1dnQ=;
 b=jxsp7OmeBhifnffd447FUg3t380lACnUoq2BQ7zYKx0rGIhsC66+9qgF9CnBANHUAs
 x4RX4YrcMhPLtnFC9EXvwt/dX221rO7zRwqmkWapRWch2FQEx1jfKH/Zm6R1VQ+p+YmZ
 f9TyA8Mxm474RaUcS/TQm+QlzCE55ZkiX2XjuHpf52KDDnt2LFUqlDsDnGaIQ6z6z+do
 4iFux+7TIp7ErY9BDSZqCbRh+OgwWi1IMrEylWqSV5hMps2LvumospJJX5Ap9xJiMMzF
 Mxb0zBJPxiOcrebbd9Wn3+bjpP2iXbDc1n70f5eJ2jLm6cO29n7EElvvEkBA42XJk6QU
 mGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UDmtW4AjZHzsNupJARq4jjtET+ZF0OUIV6d+u2Q1dnQ=;
 b=gd3QdfNr80nJSczEvP8HRFnm1Ru4J/i9fyMzRUZ9QVlCG75qMXSDHZ0ar7cGGJb+JB
 qWl0i8U4f03C+LQIfP/vtIsvB5XkDTJ6QI35pFkEeJzgoRhOElWJUB1HLzPt3GlJjWy6
 PuaqC+DXwhhhBHA3+X3Tshs9fkK1EwFjg/dudvOa/5J/tjSC5oTNBSrX0/HLncveiWxD
 ZZyN+SVISy8TdO8INbV2B27hGfUyQmvJxvfCz5YrOmXaNLGf8Mot9wkzEmgXalfGW3Oz
 mICDUX4xGfZVeKwunac1P8pXfuSoVFA9v7fTDGvO3JpEIV5lvYuHxkvjji+lpBCdWMBJ
 BmgQ==
X-Gm-Message-State: AN3rC/6EdOxDhQWSMURV6boQBFwg3scn4j3AChpXSP9kqOuAogZ2Rs6+
 4dqA2SRV4VrejiY+NjTqxugeLx95wA==
X-Received: by 10.107.171.67 with SMTP id u64mr11482628ioe.102.1492479762238; 
 Mon, 17 Apr 2017 18:42:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.128.228 with HTTP; Mon, 17 Apr 2017 18:42:41 -0700 (PDT)
In-Reply-To: <1492443705-24309-1-git-send-email-saqibkhan@utexas.edu>
References: <1492443705-24309-1-git-send-email-saqibkhan@utexas.edu>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 17 Apr 2017 20:42:41 -0500
Message-ID: <CALLMt=qKaXU5i3J+2wWFA968t4ohOPBcyjAnfBU0wW7NbROufA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] Correct spelling of "barreleye"
To: saqibkhan@utexas.edu
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Saqib Khan <khansa@us.ibm.com>
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
X-List-Received-Date: Tue, 18 Apr 2017 01:42:45 -0000

On Mon, Apr 17, 2017 at 10:41 AM,  <saqibkhan@utexas.edu> wrote:
> From: Saqib Khan <khansa@us.ibm.com>
>
> Note:"barreleye" mispelled in /sys/firmware/devicetree/base/model
>
> Signed-off-by: Saqib Khan <khansa@us.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> index 9dc3e67..f638bda 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
> @@ -4,7 +4,7 @@
>  #include <dt-bindings/gpio/aspeed-gpio.h>
>
>  / {
> -       model = "Barrelye BMC";
> +       model = "Barreleye BMC";
>         compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
>
>         aliases {
> --
> 1.8.2.2
>

Acked-by: Andrew Geissler <geissonator@gmail.com>
