Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hiWmiJ4E"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlqPC0C6pzF0gl
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 16:46:38 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id g14so15059482qti.2
 for <openbmc@lists.ozlabs.org>; Mon, 19 Feb 2018 21:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=beWMj5fVqLNAwE/raDXXy8BWiTcQHnICJjF7FhH9YxE=;
 b=hiWmiJ4E7emVUq3JsVaaqJZmK9fqomvFWeMlnMQbbfL+2duUoVKmfjNBr+u0thj4mq
 RL+3psHulho4P1S0Tiwkofk6C5Tnun8R1v4eSwY7DalN9i0x2/yD/83ujdYb80wEjaz6
 HqKk1TqnDzOc2/rDJN50aPP/ajKyzbJ20dWz4blb/a599m4cEu1VAC3JsVJNX7KhhqRm
 S8hZSkWMmLxcw4zzhpNNzdqGNgfDB8T0sO40NJiOd4qdNISrWClISuUpju467wBs3Oe/
 k9q5lVPp2e1HOXAEtY9CFP71aDo0WUdKzMVemjrKO8AinjfBqeXOe8bhi3kNH3XVpFG0
 tg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=beWMj5fVqLNAwE/raDXXy8BWiTcQHnICJjF7FhH9YxE=;
 b=WawAiBXY5mIHg4r9qDVowiWGprtJ2ayrxU1x471KLKRFg4WBGzR9sFebF3oeFOsfH2
 Yyayz6qJnYP3GBpDEMGDiaDH77YfQEgf9qSef4D/k4SXT/iJUq94J6HAeh3lIRtcgjav
 BAR7c3GeFChYC7IeHqOAKrq8ysU72yV/A536QQQV7MplRqUrF/ygKWSn82aBlaSYGY6u
 IPYG6GxlQv1iWzGU65EqLi/++3AFYUT7wABsVZqou5rdLz9f1fW1XlZuImxl5wuKmNK0
 rJeMV12lKQk8u/YJStsplfxql+EHrKPPlP+lICaN7erbGgOqeI7gfAVOgb+9TtmPjZT7
 vx0g==
X-Gm-Message-State: APf1xPCxKhW1hXhbDu2n+s4hYmOAdB84brS33J0yoMqvVYDSLuFDhnIr
 8CLf6xVNik4myiFptxZnw8fWOOdy+UwYOfC4e7k=
X-Google-Smtp-Source: AH8x227s6auVWDplnwZ07i6ahJahthVgKLtu52ZQcGDE6hPQ5ULxWwUDobfS4M+5mDJg8XVZG6DgurlV+KqLljSWqgs=
X-Received: by 10.200.53.137 with SMTP id k9mr28619950qtb.37.1519105595798;
 Mon, 19 Feb 2018 21:46:35 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.50.69 with HTTP; Mon, 19 Feb 2018 21:46:15 -0800 (PST)
In-Reply-To: <20180216201401.2703-1-bradleyb@fuzziesquirrel.com>
References: <20180216201401.2703-1-bradleyb@fuzziesquirrel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 20 Feb 2018 16:16:15 +1030
X-Google-Sender-Auth: njDz1h7IBa8isp6wFO4hwqBGvBk
Message-ID: <CACPK8Xd=mQUB6yDn_wWJBbYx7x3VG50UBwoepgC2jCFM037Z+Q@mail.gmail.com>
Subject: Re: [PATCH u-boot v2016.07-aspeed-openbmc v2] aspeed: Drop bootcmd
 support for legacy images
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ralther@google.com, 
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Feb 2018 05:46:39 -0000

On Sat, Feb 17, 2018 at 6:44 AM, Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
> Assume booting from a FIT image by default.  This allows image builders
> to use arbitrary configuration names like
> /configurations/conf@foo.
>
> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

Applied. Thanks!

Cheers,

Joel

> ---
> v2:
>  - Reworked to drop legacy image support entirely.
>  - Updated commit message accordingly.
>
>  include/configs/ast-common.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/include/configs/ast-common.h b/include/configs/ast-common.h
> index 89b0cd8533..eff6d2b529 100644
> --- a/include/configs/ast-common.h
> +++ b/include/configs/ast-common.h
> @@ -108,11 +108,7 @@
>  #define CONFIG_ENV_OFFSET              0x60000 /* environment starts here  */
>  #define CONFIG_ENV_SIZE                        0x20000 /* Total Size of Environment Sector */
>
> -#define CONFIG_BOOTCOMMAND     \
> -       "fdt addr 20080000; " \
> -       "if fdt get value ramdisk_conf /configurations/conf@1 ramdisk; then " \
> -       "    bootm 20080000; else bootm 20080000 20300000; " \
> -       "fi"
> +#define CONFIG_BOOTCOMMAND             "bootm 20080000"
>  #define CONFIG_ENV_OVERWRITE
>
>  #define ASPEED_ENV_SETTINGS \
> --
> 2.14.3
