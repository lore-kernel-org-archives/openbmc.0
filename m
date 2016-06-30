Return-Path: <joel.stan@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rg9gx6ZG8zDq5d
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 17:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Z2YHVzwF; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id i123so6611546pfg.3
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jun 2016 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=sender:message-id:subject:from:to:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkHouXtB9P1cnXXq4wDk8P/lRHW99kL1RhJe18P0Szk=;
 b=Z2YHVzwFzNoh29Wv0LxPHy9WLZqgZkRuCfXvxavZDtMrMt+co0QIB2JilvW6SF3Z8T
 tSCQz53GQqv6S5PfEBnJarAZXYAFy3yT0Qz0/mwvQvBTiLBT8EH+FTt4Kai+6S2poShI
 Fo/sUu5dGnxVGoIlpFnDN0n8tq0rA/v+Jgd3GioLWe5+9HsbVM25DB62+R6xOetPtLNe
 xqeb5cvIyqYWjF5WiQ/HAsnnwvLwsgUoCLYl2cvK5aO7YXW8j6OstQDr68ixsS75/8HF
 I8Xxz35VnPWx8U9S1oYrnzzGerQOw4TRTnmrxSDxRSxdKg/+ybXcCa5wDEuBRQ1+Ub6X
 BGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:sender:message-id:subject:from:to:date
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SkHouXtB9P1cnXXq4wDk8P/lRHW99kL1RhJe18P0Szk=;
 b=PQKnRq51XABCnG1kBNyNcdNo2FAnoGtTBYNhHW/Ttwcgcba0QpGKvjNVt9BXpKijaR
 SPo0+8aT7TxvS9ICaosrmaL9yMrNWL1Gir1aELVAJ5N7Smh7lCXMHckMBMGHdPfHaE8N
 MKzffMUNF55KjwceN+2eL+8cX/niJzyyknMb+Wtut7XY4po/7GkroV8ExkNeMnLLq0ek
 NncwOmkUa9D2JnAFJo2w/XRgydJqzYD51IN1FU9v/pZikD9V13wKcgfucZVQVVXajg0t
 atCBJ3gWQ4pUPTTJX4ToHxQA0M29I2nSq4rKSu7wupXeuKa1asry6jx0fIxKJZRKHprS
 DQjg==
X-Gm-Message-State: ALyK8tJyOBb24G6NkswbOxhDwuGE6WuPFBB2mF3P0aCbiRtXVA7dCeUlXOJRgB84s9Ft4g==
X-Received: by 10.98.73.198 with SMTP id r67mr18849450pfi.50.1467270683787;
 Thu, 30 Jun 2016 00:11:23 -0700 (PDT)
Received: from aurora ([203.0.153.9])
 by smtp.gmail.com with ESMTPSA id uj5sm2791251pac.28.2016.06.30.00.11.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Jun 2016 00:11:22 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
Message-ID: <1467270678.6386.30.camel@jms.id.au>
Subject: Re: [PATCH uboot v2016.05-aspeed-openbmc 8/9] aspeed/ast-g4: add a
 force saveenv config
From: Joel Stanley <joel@jms.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, 
 openbmc@lists.ozlabs.org
Date: Thu, 30 Jun 2016 16:41:18 +0930
In-Reply-To: <1467216591-8616-9-git-send-email-clg@kaod.org>
References: <1467216591-8616-1-git-send-email-clg@kaod.org>
 <1467216591-8616-9-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Thu, 30 Jun 2016 07:11:26 -0000

On Wed, 2016-06-29 at 18:09 +0200, Cédric Le Goater wrote:
> That was a feature in the previous Aspeed branch which is was left
> out
> in the v2016.05 port. So let's use the new aspeed Kconfig to add it.

What does this gain us?

On a boot with an invalid set of settings, we use the defaults anyway.

Cheers,

Joel

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/arm/Kconfig     | 1 +
>  board/aspeed/Kconfig | 6 ++++++
>  common/env_common.c  | 3 +++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index bfbeb4842380..b2c19b912834 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -756,6 +756,7 @@ config TARGET_WITHERSPOON_BMC
>  config TARGET_AST_G4
>         bool "Support ast2400"
>         select CPU_ARM926EJS
> +       select ASPEED_WRITE_DEFAULT_ENV
>  
>  endchoice
>  
> diff --git a/board/aspeed/Kconfig b/board/aspeed/Kconfig
> index a92b9bc0c934..fca65d0206f6 100644
> --- a/board/aspeed/Kconfig
> +++ b/board/aspeed/Kconfig
> @@ -1,3 +1,9 @@
> +config ASPEED_WRITE_DEFAULT_ENV
> +       bool "force  write of default environment"
> +       help
> +	 when the environment CRC is bad, force a saveenv to update
> +	 the flash with a sane default environment
> +
>  source "board/aspeed/ast-g5/Kconfig"
>  source "board/aspeed/ast-g4/Kconfig"
>  source "board/aspeed/witherspoon-bmc/Kconfig"
> diff --git a/common/env_common.c b/common/env_common.c
> index af59c72e1fd7..5d6aac551b26 100644
> --- a/common/env_common.c
> +++ b/common/env_common.c
> @@ -262,6 +262,9 @@ void env_relocate(void)
>  #else
>  		bootstage_error(BOOTSTAGE_ID_NET_CHECKSUM);
>  		set_default_env("!bad CRC");
> +#ifdef CONFIG_ASPEED_WRITE_DEFAULT_ENV
> +		saveenv();
> +#endif
>  #endif
>  	} else {
>  		env_relocate_spec();
