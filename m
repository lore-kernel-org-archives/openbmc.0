Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="MbH1S6za"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lW8P6kKczDqRs
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 06:35:47 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id t21so1625586pfh.2
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 13:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BbxZ1Wm3vrcS9rLeR0qxSNVZn0SFBfcNjWi2YkD4UlA=;
 b=MbH1S6za1ShbicEWvBz4SvdQrGZEtT2+ggWSg/UIQoXd/22DBvpUlLbUamWzGMGZU6
 Xjy6X2VgGHPCwwlJJ+EFTgj9GA40yTdwhK6uQu3wplSyCVb0dODkl2COmAod+1kn5SZS
 p/PpQWsHKmzWdBJ2ZslhHdNHypKgHSmfeAoy+0I834YIQp/shyH/Nl8dr1ki2RSY8Xru
 uyUhs9QQWCOL24hZZmOpYfBaf+uTUcEMxUu0syEHqk4R2wT4bM45VpFLC6wHvWqO1xfA
 lBOzlXU/V0l7DKbVEVopqf/4knCZz2FzM53ZoXkZgSghf2N6ByBfVLgeG1HZGROSw1Nb
 YYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbxZ1Wm3vrcS9rLeR0qxSNVZn0SFBfcNjWi2YkD4UlA=;
 b=mr23Kra9cDbPRAGQLCpfFkxyWgf8pibvs2so5gTJJlCqrOOOTP5jQeTvtOI/IuVpoY
 dkyKZT1rhHofGqdE0E5sdNx8h2xTKPe79Wxy9+B/Ud8IDBOcNKhCiM6Y/Jvj+uu6DFjv
 Gb+jhGhNr23BnbOzA1FMOsINBpthAENWkQdaoR5hHlZf+h8DXO/Um3uKU6cNT6nmM5XA
 cQ4vua6E3/vtr1+faJB5jes4pxQx4X6oacH6ggM8CU/Ko17Z2AbRc9j7rz5xS9PmODa0
 2FCV1S4MCg6BUl8tX/CUwKmvE9Iu4L3ycSLziFvboJYWEUtAwuYnfGeogKl8r4IZXuCD
 4QIw==
X-Gm-Message-State: APjAAAUl4365SfrVhS/01CYZeb2A0m6nbeVl4S5xxqdXjEnDVDW7b7Rx
 GezknfMDXsNwEaevdMgRIkNQght6eXZt7pzMI9AG4Q==
X-Google-Smtp-Source: APXvYqwJu5yh75P2ZTkxNCKTm19mCqS0f4dpN9Cz+/MNhiMAUzkgt2ELcK9WvoF55QgihDmewEjQ5sRxNZQ3THh5GlU=
X-Received: by 2002:a63:e850:: with SMTP id a16mr86906748pgk.195.1555619742538; 
 Thu, 18 Apr 2019 13:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <1555617500-10862-1-git-send-email-linux@roeck-us.net>
 <1555617500-10862-3-git-send-email-linux@roeck-us.net>
In-Reply-To: <1555617500-10862-3-git-send-email-linux@roeck-us.net>
From: Patrick Venture <venture@google.com>
Date: Thu, 18 Apr 2019 13:35:31 -0700
Message-ID: <CAO=notxzQUyRJ4L7w6o4Cdbwp-Sg4FXyMDgJUN-7YPm9JgiQuw@mail.gmail.com>
Subject: Re: [PATCH 2/6] hwmon: (aspeed-pwm-tacho) Use
 devm_thermal_of_cooling_device_register
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-pm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Kamil Debski <kamil@wypas.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 
 Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Mykola Kostenok <c_mykolak@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 18 Apr 2019 20:35:50 -0000

On Thu, Apr 18, 2019 at 12:58 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Use devm_thermal_of_cooling_device_register() to register the cooling
> device. As a side effect, this fixes a driver bug:
> thermal_cooling_device_unregister() was not called on removal.
>
> Fixes: f198907d2ff6d ("hwmon: (aspeed-pwm-tacho) cooling device support.")
> Cc: Mykola Kostenok <c_mykolak@mellanox.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Patrick Venture <venture@google.com>

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index c4dd6301e7c8..0daf0b32aa4a 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -830,10 +830,8 @@ static int aspeed_create_pwm_cooling(struct device *dev,
>         }
>         snprintf(cdev->name, MAX_CDEV_NAME_LEN, "%pOFn%d", child, pwm_port);
>
> -       cdev->tcdev = thermal_of_cooling_device_register(child,
> -                                                        cdev->name,
> -                                                        cdev,
> -                                                        &aspeed_pwm_cool_ops);
> +       cdev->tcdev = devm_thermal_of_cooling_device_register(dev, child,
> +                                       cdev->name, cdev, &aspeed_pwm_cool_ops);
>         if (IS_ERR(cdev->tcdev))
>                 return PTR_ERR(cdev->tcdev);
>
> --
> 2.7.4
>
