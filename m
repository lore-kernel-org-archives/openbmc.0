Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="L88W5WLY"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gPHf2rG0zDqDQ
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 16:57:01 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id n21-v6so32709107oig.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 23:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ukydBWjyHY0DwPsPBiOpFOz/dMQ3YjGz4iJzNERWkTQ=;
 b=L88W5WLYa/DWGfjLXZR2dfG7mQ/NA5u1yXfW7SGtaJ/CESjtqBI7pFzpzhRbi/ObCp
 JtRU/LSJgZqIirhtNbNhxQY5kRjQEOZkTE94BYcZtLekaM4kVUaXIGyLSwGdq44sJJRS
 js7x5vAM7FeshkVtzuRoqc6CgPwOeshssSegQRrcQoWgXsgvKhCOWlBCr/jdPyFhzF7h
 r9szDJlYdfoJJWxE1o6ElWalUnAh9NlHhSz5FIpd5mF35K9lV2BbEQTPtXabmK5/JQ2o
 Lu28VztQ9TplWLGtDMW4wLaDKf+OBrdlKuBnFAVCd3l1AFtg+9C9jF3vODQFLAhnkbpz
 1RoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ukydBWjyHY0DwPsPBiOpFOz/dMQ3YjGz4iJzNERWkTQ=;
 b=AjfaMlNMA4vQkTKnsHnmLsmHcYGv5MUzDstaIU8+f23rJtJfoVepogUmg5j46phv5/
 YmFh0TUonVBwQlK0tRQ0MM8cMX9K5Cff22MTwSbPdYtkN9/D1slyPD97K37DGFnXMBo0
 1lWRhDuohjDUHHDMp7wNYbPiR0p055+/OjDbs0zaDGDx3vVW5QhQGDqtURbLJ4Vfu1xt
 KI9MxNxmhSAdxwNcKxNZ3SEOU3sI2wOls+vlwEw4zpLS9N7wIctI0a+GAxUDqpdM506Q
 xrf/F4vsbjK1WD6BHbN62D4/nC5yopJggQ/G6fhTnNdmuFoJFMzUEuho1LcB8sn7fcCY
 wlsA==
X-Gm-Message-State: AOUpUlFW96C69ke134hz7otbURjzX6LkrldsJOyt0YrOu+JulWDsKxMJ
 mewp8E9pPL/KgPJz2SfOzkOZaJ7pJxv7NqPTgKx5nw==
X-Google-Smtp-Source: AAOMgpdDzGBO8g3Qsv2cbBUNz5aQagEXnRrjscA/In+DA/NvDm80b1WCWyapRCXK/NC8YsnamM5DJmQ0iX2RQzv5RMk=
X-Received: by 2002:aca:c692:: with SMTP id
 w140-v6mr2172187oif.284.1533106619011; 
 Tue, 31 Jul 2018 23:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180724203615.5770-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20180724203615.5770-1-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 31 Jul 2018 23:56:48 -0700
Message-ID: <CAFd5g44L+-6wtV4+Kn5-j8zRXA1aNamR2pV0EaFpcoshgQ4bTQ@mail.gmail.com>
Subject: Re: [PATCH i2c-next v2] i2c: aspeed: Add an explicit type casting for
 *get_clk_reg_val
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 jarkko.nikula@linux.intel.com, 
 james.feist@linux.intel.com, vernon.mauery@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2018 06:57:03 -0000

On Tue, Jul 24, 2018 at 1:39 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit fixes this sparse warning:
> drivers/i2c/busses/i2c-aspeed.c:875:38: warning: incorrect type in assignment (different modifiers)
> drivers/i2c/busses/i2c-aspeed.c:875:38:    expected unsigned int ( *get_clk_reg_val )( ... )
> drivers/i2c/busses/i2c-aspeed.c:875:38:    got void const *const data
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
> Changes since v1:
> - Fixed title and added Reported-by tag.
>
>  drivers/i2c/busses/i2c-aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index efb89422d496..a4f956c6d567 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -872,7 +872,7 @@ static int aspeed_i2c_probe_bus(struct platform_device *pdev)
>         if (!match)
>                 bus->get_clk_reg_val = aspeed_i2c_24xx_get_clk_reg_val;
>         else
> -               bus->get_clk_reg_val = match->data;
> +               bus->get_clk_reg_val = (u32 (*)(u32))match->data;
>
>         /* Initialize the I2C adapter */
>         spin_lock_init(&bus->lock);
> --
> 2.18.0
>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
