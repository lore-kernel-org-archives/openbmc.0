Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pN4urOek"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41rX5z0DcZzDqmF
 for <openbmc@lists.ozlabs.org>; Thu, 16 Aug 2018 13:35:18 +1000 (AEST)
Received: by mail-io0-x241.google.com with SMTP id q19-v6so2744855ioh.11
 for <openbmc@lists.ozlabs.org>; Wed, 15 Aug 2018 20:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xjC7DV7V+Mdc6Kjen9kp5S5s8w3fYF8tywNSjxmRhUQ=;
 b=pN4urOek6BlKeR3Il8fCPO8izR3JDOwXaZYKuMNpxvQlCdoh5Q8Pqu42AYfKTY9bVq
 K2rabYDp9AoPLImWd+kqURWi4khmf9jbV570NGKL9vDd/y/kHUsliVH9IN5yrJpAi/AM
 sBmuOb+0UHZPongwIOAqCRQ56Z3YbQ8EtF/4eJGSPQdS6uO1B+D+/n1J4OMqKHtNCnOw
 ogPeJaS6Ylzv8hbmO66agLojcnLJbfZFb1M8ZQDFOSr8i8zkXq5DAWYhpGxbHwl29Qjh
 C/+jh2DukrJ6Zv5NS3lblAm9V0jLQpVpOBdKEQAaA9xGfVveAfUexunO3nuoTgSOvn35
 HU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xjC7DV7V+Mdc6Kjen9kp5S5s8w3fYF8tywNSjxmRhUQ=;
 b=rPJuTzcCdojRNZghLKYYNXgm4zodk5VL0FOmTs81q4k+rvoVxPGVXZKz5fI6PxXi16
 +KRBH2zs9s1hr/wh0a5FE/mbvUHvJ60CY9L4xNgBo4I5y/zdMv7AiZqWyZLqkXuZzBc1
 vHX1STcs7pvfBrloXb2rCLD5QFZ8HCrDsH09mvvVNXmHzkpU8Ji6HTMYUnAc3jGcqwb3
 3iuYeXa2xAvnzfB+PmDAWED/Zk7FbSsHSEES6vMLRpqu2PJ6rnsNu06gyGYx/5+OcmO5
 N6HkptgdWanMeYRgnaoONMZZ6L0NUmh2P0BcsSlbX1yXa/DsviIZVFI5fM01JLjscaWc
 H9Bg==
X-Gm-Message-State: AOUpUlFpMcNYAldnqXWrWrkDJr7FVggV0AnObs3YU/14RKe5WBkCBqfq
 R3eREAJoLkgrMKeX3+mJggKATlNLmheAmEhaboWezKSA
X-Google-Smtp-Source: AA+uWPxE1J1AXtX18EM7yJchI1ocs1O+1VNbyCd9FpfCUaRTvYAhfnMo1xDrSsjF6w/K9jBgL0bNkDajc+0+HkmuLJA=
X-Received: by 2002:a6b:8dc2:: with SMTP id
 p185-v6mr24597313iod.98.1534390516380; 
 Wed, 15 Aug 2018 20:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <48463736-e6c5-05e2-8e64-cb11151542f7@yadro.com>
In-Reply-To: <48463736-e6c5-05e2-8e64-cb11151542f7@yadro.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 16 Aug 2018 11:34:59 +0800
Message-ID: <CAARXrt=5=dgMzYZhLKwP62DDPMx=2QBL8g9+TjUmYUh-MAVdFQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] mtd: spi-nor: fix spi register address
 for AST2400
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 a.soldatov@yadro.com
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
X-List-Received-Date: Thu, 16 Aug 2018 03:35:19 -0000

I think the mail subject should be patch linux dev-4.17, instead of dev-4.7.

Tested-by: Lei YU <mine260309@gmail.com>
On Wed, Aug 15, 2018 at 11:15 PM Alexander Amelkin <a.amelkin@yadro.com> wrote:
>
> According to AST2400 datasheet v1.4 the SPI Flash Read Timing
> Setting register is at offset 0x14. There is no register at
> offset 0x94 (unlike FMC controller and AST2500).
>
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> ---
>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
> index c9cd20f..9ddf24b 100644
> --- a/drivers/mtd/spi-nor/aspeed-smc.c
> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
> @@ -71,7 +71,7 @@ static const struct aspeed_smc_info spi_2400_info = {
>         .hastype = false,
>         .we0 = 0,
>         .ctl0 = 0x04,
> -       .timing = 0x94,
> +       .timing = 0x14,
>         .set_4b = aspeed_smc_chip_set_4b_spi_2400,
>         .optimize_read = aspeed_smc_optimize_read,
>  };
> --
> 2.7.4
>
>
