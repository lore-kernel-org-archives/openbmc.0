Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHcRh4yvxzDqnv
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 00:09:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MlET7vqS"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id u207so4752009ywc.0
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 07:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hpFo352qb5ApC6G1dI/iHpCfzHhDajapFGyph0kiAuA=;
 b=MlET7vqSlI8tysi7UTiQZKxwIBne8LbzLscnbrPUHe+/+2Q/3OVQVD39dM9jEnClYV
 G2iKkid5UmoJhWx62HT0sWCxWeaFCxxpcmfI9lk4DpRxa4nbNvD3C8Tke71waq2rP9AP
 UQlxgB6j3yy4dSwHdFdf7fnxkoZtUdU+rQQdGZizWi1B1vtCmdGxWJfWT0Q0w5gDJ/kj
 jIkuuOsezdRo88rZtx5/zWFj9iMFy1QUwH14gY1b3WcGLL0fl7gup2Y0sEcZOGUVapFo
 NubzdrYuk2RjmSEfzbUxw+xxSGbEhKBskWozwVbnzpxNZUMCvt72ks3f1OmkNfubnWzN
 lAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hpFo352qb5ApC6G1dI/iHpCfzHhDajapFGyph0kiAuA=;
 b=U7w1vBBCKwhNvHR3RQBRT5sjxwia2FsVTYmuto/z6pKfBQVbSuiLIwGEJ2dfawbwsZ
 JLhioV5nwiKeCVXbi3kLkXTMRb0Q9ZWFi4HkMDQXgUkXUq+beSkoGEY+tEUS82t6i6qH
 b2dXxONl6w9Tk56XpoZvI5mM6LN+THhnLAziKWkZ8Bm3b3Quz5zi3Hly/TWKcS4495r2
 k1tUth5iHVybE56zzPNWi8U3ZJP4URb01WYdBHLJEVGXD940XO9IuD1u8YlLA9xbLcyU
 MaKFNxbAswwcmP9YbiJuH2gFhP2F0caDxzyvrHddgXwbpLsXe+7MQOhOlJwVCIkq5Gxa
 hWGg==
X-Gm-Message-State: AIVw112g2hTZ4Szhh9DvcY3T3PN+WPHbUk70DK/5AAsPJrsjOU6V31Mo
 n1eKGTsvc3xnEmdjX4IEkoVig2jH+w==
X-Received: by 10.129.53.140 with SMTP id c134mr907208ywa.439.1501078157989;
 Wed, 26 Jul 2017 07:09:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.177 with HTTP; Wed, 26 Jul 2017 07:08:57 -0700 (PDT)
In-Reply-To: <20170726112435.32575-1-c_mykolak@mellanox.com>
References: <20170726112435.32575-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Jul 2017 23:38:57 +0930
X-Google-Sender-Auth: tWnXWlkhnvt6_6bw1ofEbpA8wT8
Message-ID: <CACPK8XcgN2-X_LyTn+KJZ-fsibdCjwkGJocBRGK4U3qsYa1BWA@mail.gmail.com>
Subject: Re: [patch v4] hwmon: (aspeed-pwm-tacho) cooling device support.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Patrick Venture <venture@google.com>, Vadim Pasternak <vadimp@mellanox.com>,
 Ohad Oz <ohado@mellanox.com>
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
X-List-Received-Date: Wed, 26 Jul 2017 14:09:21 -0000

On Wed, Jul 26, 2017 at 8:54 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Add support in aspeed-pwm-tacho driver for cooling device creation.
> This cooling device could be bound to a thermal zone
> for the thermal control. Device will appear in /sys/class/thermal
> folder as cooling_deviceX. Then it could be bound to particular
> thermal zones. Allow specification of the cooling levels
> vector - PWM duty cycle values in a range from 0 to 255
> which correspond to thermal cooling states.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>
> v1 -> v2:
>  - Remove device tree binding file from the patch.
>  - Move of_node_put out of cycle because of_get_next_child
>    already do of_put_node on previous child.
>
> v2 -> v3:
>  Pointed out by Rob Herring:
>  - Put cooling-levels under fan subnodes.
>
> v3 -> v4:
>  Pointed out by Joel Stanley:
>  - Move patch history after Signoff.
>  - Remove unnecessary type cast.
>  - Use array instead of pointers for colling_levels.
>  - Rename num_level to num_levels.
>  - Use local variable to make function easier to read.
>  - Drop unnesesary sizeof(u8).
>  - Use IS_ERR instead of PTR_ERR_OR_ZERO.

Changes look good!

> +static int aspeed_create_pwm_cooling(struct device *dev,
> +                                    struct device_node *child,
> +                                    struct aspeed_pwm_tacho_data *priv,
> +                                    u32 pwm_port, u8 num_levels)
> +{
> +       int ret;
> +       struct aspeed_cooling_device *cdev;
> +
> +       cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
> +
> +       if (!cdev)
> +               return -ENOMEM;
> +
> +       cdev->cooling_levels = devm_kzalloc(dev, num_levels, GFP_KERNEL);
> +       if (!cdev->cooling_levels)
> +               return -ENOMEM;
> +
> +       cdev->max_state = num_levels - 1;
> +       ret = of_property_read_u8_array(child, "cooling-levels",
> +                                       cdev->cooling_levels,
> +                                       num_levels);
> +       if (ret) {
> +               dev_err(dev, "Property 'cooling-levels' cannot be read.\n");
> +               return ret;
> +       }
> +       sprintf(cdev->name, "%s%d", child->name, pwm_port);

Oops, I missed this one. It looks like if child->name is too long then
this will overflow name[16]. You could dynamically allocate
cdev->name[16], or use snprintf.

Once you've fixed that I will add my reviewed-by.

Cheers,

Joel
