Return-Path: <SRS0=rRAn=DC=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617D8C4363D
	for <openbmc@archiver.kernel.org>; Fri, 25 Sep 2020 05:12:01 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC5E208B6
	for <openbmc@archiver.kernel.org>; Fri, 25 Sep 2020 05:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bZq4o3WQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC5E208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKld678rzDqlS
	for <openbmc@archiver.kernel.org>; Fri, 25 Sep 2020 15:11:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=bgolaszewski@baylibre.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=bZq4o3WQ; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxx272HJxzDqYt
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 23:38:05 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id n22so3408181edt.4
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xik+LU5D4/fnn9O5Zg87zvohwDV0OOxnMU6Rsd+HY5c=;
 b=bZq4o3WQtLEJr2hF7mu9T4voHEBiRZ/TRwujICZ9S7HZhEwolwqG/vQ7kdo5O4CyP4
 oLSU+r7N7Xllvo9LRKTKkXdRSl06zc1J1mF+kRJI9EUJdNLfEb0Zd5227/HqtRZuMK1b
 YdKMV32umoR833Fj8DoHg5lE7GpkmpqmyqQD8penWeGszWRjo6JbNdwNTXj9Y/f3NRDQ
 E7DpO2ULfgrybDDJtmMI/eTqX6pRyQEQSHOL4FZULVTe1MLBStA1OGaqljfBHPhAFcZ0
 WLSe32GdalfrwK8CwaBPP2Vp9KvNvg2Kq/eXn9z1QeJMTTihSei/Ae+OXG/zu8nJ+EFl
 PSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xik+LU5D4/fnn9O5Zg87zvohwDV0OOxnMU6Rsd+HY5c=;
 b=hkh0nIGeByBYVtgdI6Shu9xVf5kTJtlDoJ7BOSQP2go9PTSp48feFSq4ssWqcRW9uG
 w8RrXwP7cRkkH3gS4IL9+jrnjUuFLzzvxiVuyibl7wk00jfPVTa2r8x+CVMsYOrFK4tz
 /hDZlD8gQ/ogjHOGKDCiKd3TDvp4QDSwUVmbjfZzbwQKmWdHxT/R8x62xcBqz2PAo913
 dMxh4mOtbdAytPX7RZGmwx6bZf9UvT6CBITWxIbXPhTKTaVqfS2SZ+3/x2CoyZekJKyM
 /aLqXe4ZRDQz0U/gEIK2jiH8NPvh+UO/ZS6+JUjVTaoMd5eiTRmEFxboPRojVuf9JFUS
 YpfQ==
X-Gm-Message-State: AOAM533ikyQ3LIQ53wAgjLdwWMjsrlFyyW9IBA/Kj9sBkwKQfRocnzuG
 br9CoEZtUF8c29Ha6d3tV1sRUnsbeGmiBdmbFRo9nQ==
X-Google-Smtp-Source: ABdhPJwUCSvUnwIjhMwXdH5/5JtzPZNKnNR+yIgd72G5d87Unxa+rzC+LUlKdHxuhlTagtPeDVImVhVFGvN3yixC0jU=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr1109705edn.371.1600954680607; 
 Thu, 24 Sep 2020 06:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200916204216.9423-1-rentao.bupt@gmail.com>
In-Reply-To: <20200916204216.9423-1-rentao.bupt@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 24 Sep 2020 15:37:49 +0200
Message-ID: <CAMpxmJWR7VqU9urj=-KypKLm3aFooMd9iyusYtr5dNY2oOgXQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: fix ast2600 bank properties
To: rentao.bupt@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 25 Sep 2020 15:05:20 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com,
 Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, openbmc@lists.ozlabs.org,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 10:42 PM <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> GPIO_U is mapped to the least significant byte of input/output mask, and
> the byte in "output" mask should be 0 because GPIO_U is input only. All
> the other bits need to be 1 because GPIO_V/W/X support both input and
> output modes.
>
> Similarly, GPIO_Y/Z are mapped to the 2 least significant bytes, and the
> according bits need to be 1 because GPIO_Y/Z support both input and
> output modes.
>
> Fixes: ab4a85534c3e ("gpio: aspeed: Add in ast2600 details to Aspeed driver")
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 879db23d8454..d07bf2c3f136 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -1114,8 +1114,8 @@ static const struct aspeed_gpio_config ast2500_config =
>
>  static const struct aspeed_bank_props ast2600_bank_props[] = {
>         /*     input      output   */
> -       {5, 0xffffffff,  0x0000ffff}, /* U/V/W/X */
> -       {6, 0xffff0000,  0x0fff0000}, /* Y/Z */
> +       {5, 0xffffffff,  0xffffff00}, /* U/V/W/X */
> +       {6, 0x0000ffff,  0x0000ffff}, /* Y/Z */
>         { },
>  };
>
> --
> 2.17.1
>

Queued for fixes, thanks!

Bartosz
