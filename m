Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vvL7l3DNszDqC4
 for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2017 10:14:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJJ29Pxk"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id p125so1669682ybb.2
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 16:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nX3OJ50so04yKK22z1ee5H+B+Nour7We43i7TvJs9mA=;
 b=QJJ29PxkzLYd+KAPC/JnCzY4/gGQGzNXo0rgNmMBi3/DkDssOUdJ7TTPpxUrAqWMmF
 i23JRpcHIbiFS3Nl6C4MTTPyWf3PriYrw6Ro7qgre9O75wf0u8B4uC9lX1Ib0OxuitfK
 OnHIzY0AW9UnainKIXVlV25G83gh/R8nxMD2XVzMLhWnOFpX10bA1VEWbBAZVyIAIpmf
 o8XGG8t6yApj5GhjT/nmuJPOaVnKVsp9d2JUi5CL6r9EADONjjWOg4Ph38yhMYsGkq2c
 RNdWmRqYen04KTpI5Wf61C/lFzCIwDzyI3TgaCR1Dpjr/Mi3CF4oZ1rMAw+IdJHNRfKL
 jVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nX3OJ50so04yKK22z1ee5H+B+Nour7We43i7TvJs9mA=;
 b=XSIY7/xk6WvBcnpmRJW3D1Lb03cDxguNqJ00jnezZhVPcJto/63OHOsCvA2wIIQdJE
 96bjDz3KYrQ3sujebm1JvqS7CKwY3a8EQy0bvO483p9fTk61rPTELjH80RWzq3ic120t
 IYI28eLzz0pCJCLUUV27u4rm+WDLmz/9tTHdCZnMce7M9gwxdJhsBmkOse6HlGJldbTs
 H1Byn6n+Jl8uJMzzmMMVga5cEIM1TCJyGkgkkV9shfoENAxkQVyNYca5Crz35lq4+tSI
 74fFkxruPEoULFlkvPfm1rxdYL4UcOUZBHgQEBZAWV/Aw6MvlRs4OHkKdeeLc+b+JTHv
 OTsw==
X-Gm-Message-State: AFeK/H1+1dr5DyfUd//uGB7xYCyM2WOxKhQnJlucgPjV0qfqB2GaL9Col52Yi8nId/tOpN0DaPbmellzi5GwNg==
X-Received: by 10.37.58.195 with SMTP id h186mr1869007yba.106.1490915697228;
 Thu, 30 Mar 2017 16:14:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.59.17 with HTTP; Thu, 30 Mar 2017 16:14:36 -0700 (PDT)
In-Reply-To: <1490911460-20581-1-git-send-email-austenc@us.ibm.com>
References: <1490911460-20581-1-git-send-email-austenc@us.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Mar 2017 09:44:36 +1030
X-Google-Sender-Auth: h0W6twvb3rOVqzRceg6wkZGaA58
Message-ID: <CACPK8XfLMCjV-gwfqG19ve+bqfagazZr0Gi5kOO2w5hOKHOEHQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/1] ARM: dts: aspeed: Enable Garrison uart
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 30 Mar 2017 23:15:00 -0000

On Fri, Mar 31, 2017 at 8:34 AM, Chris Austen <austenc@us.ibm.com> wrote:
> The dts did not turn on the debug port. This starts
> to allow development of OpenBMC on the garrison system
>
> Signed-off-by: Chris Austen <austenc@us.ibm.com>

Thanks Chris. Great work on your first kernel patch for the project.

I've applied this to dev-4.7. Please keep an eye out for a follow up
patch from me that brings other parts of the Garrison dts in line with
other systems.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index 639b8f8..d4bb77d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -64,6 +64,10 @@
>         };
>  };
>
> +&uart5 {
> +       status = "okay";
> +};
> +
>  &mac0 {
>         status = "okay";
>
> --
> 2.7.4
>
