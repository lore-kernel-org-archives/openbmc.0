Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vcgXj10vhzDqY1
 for <openbmc@lists.ozlabs.org>; Tue,  7 Mar 2017 13:27:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VszhzOd/"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id o4so3522614ywd.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Mar 2017 18:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uWP//K8VGZpHvUggZ59IT1NZHLFfCXw/UXUZPfUuRBo=;
 b=VszhzOd/ZSD4FeCP9l6wlnV/UGb+76949m3W0FeTDBsKW5vVQb7IigsaJDoum5YvSS
 NHQoAcDqmREzFiSkEuG7xE43n0D/Pwb/KeiJEgqtVq0XD6sr5yBs/6Yw4cXRgsfH9r7P
 mMCfD4SzN0MOqH3jVGx7Ne7MpGu5tIQ3o2bzF18Ppas0Xut6Or5ZPH1MleTdo5KLqdbr
 yHJOFEw24tvoZGGK6Vm8TX0NQLwiQ/iofl5/pI/4vpUzmA/L2HJ8Ccbxm9xbm4hA1Pep
 GVBEnCde45FZfX1KY0Dl7Fak5r02vboxYkYW2uu/RY/PTNW18iJwzJFqs1nS+cz4FJSc
 1Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uWP//K8VGZpHvUggZ59IT1NZHLFfCXw/UXUZPfUuRBo=;
 b=rgEfYX/8EWz24fLoHcFlvM9qaeHqWRCE4b98nahBG1v1jK9j4xWEBtW5pm7lqfHL98
 VXFrlto7BmC4oqgAz1P9YndIqoj0wC1oOg5wFnVG5ApXGIKqDoOS+eh93EgK64FDKQoS
 O57+TDopxkngFKZhY3a2lK0MYe9M+xV+kSEM4HpnIMJ0fobJ5T2Jj/0W+hAhJov51jgs
 G8NnJ7zFDiuXB2BKi/1fvyfAFFBXb5j2Ha841svuDACm8ayiwDQ+si1PwRr4/icf6tvD
 Zo3gP46CF0aNvcBrUrbKo6V4wBd+nb/2FQsjqg2+JvvY3TkH+MPh6gr51WkweOZ6ts/a
 85cQ==
X-Gm-Message-State: AMke39nP5KsihnCwO+3s3CXUmCVqf7cz4cd2cPveoGgfoWo9UR0ExH0LCaFPH0v/YrV5MtJASoPIBbASb7xy+Q==
X-Received: by 10.37.70.66 with SMTP id t63mr14208053yba.196.1488853634773;
 Mon, 06 Mar 2017 18:27:14 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.42.133 with HTTP; Mon, 6 Mar 2017 18:26:54 -0800 (PST)
In-Reply-To: <20170303213747.97313-1-cbostic@linux.vnet.ibm.com>
References: <20170303213747.97313-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Mar 2017 12:56:54 +1030
X-Google-Sender-Auth: D63z6zUHDmGZcKsTJ9d3gK4yApQ
Message-ID: <CACPK8Xdzj8rK6a4rGTWAneCLWCK5jo+iyXcELS4Rm-vk8h_JPA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Set I/O to standby values on
 unbind
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 07 Mar 2017 02:27:17 -0000

On Sat, Mar 4, 2017 at 8:07 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> On unbind send a break command to reset any connected slave
> and put bus in a good state. Next set each FSI pin to standby
> state, '0' except for SDA (data) which is negative active so set
> it to a '1'.

I recommend  you investigate fixing the device tree node so the data
line is configured as active-low.

I've applied this as-is to dev-4.7.

Cheers,

Joel

>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/fsi/fsi-master-gpio.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 49f3399..c923846 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -557,14 +557,24 @@ static int fsi_master_gpio_remove(struct platform_device *pdev)
>  {
>         struct fsi_master_gpio *master = platform_get_drvdata(pdev);
>
> +       fsi_master_gpio_break(&master->master, 0);
> +
> +       gpiod_set_value(master->gpio_clk, 0);
>         devm_gpiod_put(&pdev->dev, master->gpio_clk);
> +       gpiod_set_value(master->gpio_data, 1);
>         devm_gpiod_put(&pdev->dev, master->gpio_data);
> -       if (master->gpio_trans)
> +       if (master->gpio_trans) {
> +               gpiod_set_value(master->gpio_trans, 0);
>                 devm_gpiod_put(&pdev->dev, master->gpio_trans);
> -       if (master->gpio_enable)
> +       }
> +       if (master->gpio_enable) {
> +               gpiod_set_value(master->gpio_enable, 0);
>                 devm_gpiod_put(&pdev->dev, master->gpio_enable);
> -       if (master->gpio_mux)
> +       }
> +       if (master->gpio_mux) {
> +               gpiod_set_value(master->gpio_mux, 0);
>                 devm_gpiod_put(&pdev->dev, master->gpio_mux);
> +       }
>         fsi_master_unregister(&master->master);
>
>         return 0;
> --
> 1.8.2.2
>
