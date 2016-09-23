Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sgQKq3PvLzDsmZ
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 17:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=j8LlyCsl; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id u68so1117807uau.0
 for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2016 00:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=XDtZG5MqrBSuKiJUAhOs4Y+bPxLyWuH+73utgIROOdQ=;
 b=j8LlyCslXwUHlHnIUR8I5KxTbHQukgwxl6QVB5GlbyT9Ps/gIrfRvVLKnQWyuEF8iE
 xzceD4aOA+U8WF1j9mnkUkXsx5zj9utZZc0Qws3ZADBetuYiL3WkHy2ZyUdlmwRFzPta
 jxnlFSEtOKWDGN2gGNFuBNbix6YdochnFvguCFMNsbH6dN21WMatDWLQYN23Io+xQrEY
 kC6IpgRpczQL+2LtslsGcc682b79LRd5ViE4tTiDGWabDByttl4MFv+qDAZ2MBipHTel
 ifcPpiHN2DamMgjLJxwdcQ5mXUG4xoC/ZO54HrFWlSU0bgcqWq/Im3uVGuAscRk5XpJb
 /isA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=XDtZG5MqrBSuKiJUAhOs4Y+bPxLyWuH+73utgIROOdQ=;
 b=ItCK7F10rnhVdhtg4esgvSK0RKJ+8n3iInvCYqBINtlK2W4L9ZvtLzoK2rBncUUVfq
 SGY7X5Qx5xLaJvu9MDJzkUfU/YW6YiJdO/sOZmqiP2gQk/q0IpvyH7qA9tmw5P2zfSIb
 L/ipucRykSAJfWaKoHcUHrxa2m+hmhRVZxQJjV7rvDADMy1cW8sa0phqtd15lIi8/ONF
 sJqORT16BHT/SY3xFFMYMYlFgmILVHWJ6jGTeMRPmGFFGfmFRuhSkIvh22OAEU9ed1Fx
 7yNsZDX5l21zPi0+CgmG2t4P38f9g38g3USN2Xt2zfb8XnS8ah4cM9MUU+9YzX0KokWt
 SGgA==
X-Gm-Message-State: AE9vXwMziBoMYFUJaQn+cTmSoOPWoD1OBJbBjl+hzZ/tv6m6OOnHYAsyxjEEpLjqrgRgynt8xTn8ZX5UA2wG3g==
X-Received: by 10.159.36.177 with SMTP id 46mr3431946uar.78.1474616509502;
 Fri, 23 Sep 2016 00:41:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Fri, 23 Sep 2016 00:41:28 -0700 (PDT)
In-Reply-To: <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
References: <1474336344-1821-1-git-send-email-tpearson@raptorengineering.com>
 <1474336344-1821-2-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 23 Sep 2016 17:11:28 +0930
X-Google-Sender-Auth: CXyA4GDgimJWMhxvRSBR_1b8H6M
Message-ID: <CACPK8Xf+m04SOBSV8EJ_xYR3qONU5ydbmA-3LPabZVqE2kvuYw@mail.gmail.com>
Subject: Re: [PATCH] Initial driver for the MAX31785 intelligent fan controller
To: Timothy Pearson <tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 23 Sep 2016 07:41:52 -0000

Hello Timothy,

On Tue, Sep 20, 2016 at 11:22 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> Add a basic driver for the MAX31785, focusing on the fan control
> features but ignoring the temperature and voltage monitoring
> features of the device.
>
> This driver supports all fan control modes and tachometer / PWM
> readback where applicable.

> This series adds a new hwmon driver for the MAX31875, which is
> used for fan control on Firestone.
>
> This patch is a holdover until a PMBus driver is written at some
> point.  Upstream has stated they will not accept unless a PMBus
> driver is used for this particular device.

I'm happy to carry this in our tree for now.

Do you have a timeline for rewriting and submitting upstream?

>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  Documentation/hwmon/max31785 |   36 +++
>  MAINTAINERS                  |    7 +

The change to maintianers should be in a separate patch.

>  drivers/hwmon/Kconfig        |   10 +
>  drivers/hwmon/Makefile       |    1 +
>  drivers/hwmon/max31785.c     |  714 ++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 768 insertions(+)
>  create mode 100644 Documentation/hwmon/max31785
>  create mode 100644 drivers/hwmon/max31785.c
>

> +
> +static const struct i2c_device_id max31785_id[] = {
> +       { "max31785", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(i2c, max31785_id);

No device tree bindings?

> +
> +static struct i2c_driver max31785_driver = {
> +       .class          = I2C_CLASS_HWMON,
> +       .probe          = max31785_probe,
> +       .driver = {
> +               .name   = "max31785",
> +       },
> +       .id_table       = max31785_id,
> +       .detect         = max31785_detect,
> +       .address_list   = normal_i2c,
> +};
> +
> +module_i2c_driver(max31785_driver);
> +
> +MODULE_AUTHOR("Timothy Pearson <tpearson@raptorengineering.com>");
> +MODULE_DESCRIPTION("MAX31785 sensor driver");
> +MODULE_LICENSE("GPL");
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
