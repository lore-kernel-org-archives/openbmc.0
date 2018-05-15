Return-Path: <andy.shevchenko@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::242; helo=mail-qt0-x242.google.com;
 envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GjXYeyXg"; 
 dkim-atps=neutral
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lr9H1fF4zF2F3
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 07:21:38 +1000 (AEST)
Received: by mail-qt0-x242.google.com with SMTP id m16-v6so2292116qtg.13
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 14:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Kv3Dsb136m6woDcLeq0RvetZlxd07JTKK/EPH5bVjKE=;
 b=GjXYeyXghAo02f4jjkuKBv2M0xrQhcoR/2/nNezd+VFThSEWvzWGhAFhAH0tQxHBHm
 S6EUmYbm0FLRcAqF7nL47eurnLRItrjzq8LgeVHcmIyn6MmktTiHg7jvPXDI/ur1urYE
 Fp38TijBUwhe8evZ10Q0qzMBLItL47W2Ij9KbKZj+0oy3a7LNPIrPxN23jlB4X7mqdQa
 KlaZrSrUl5K4ZnhJ0l2/MVouOeVzex0PyAv1HCqR602IeGD8NqWMAUilmYYRgxrXPJX6
 IJr7aXkLGIFXIK3efu8muFL17XXc8m2xk/V/SZOonuOhl+r56JU3q6/QNUt2k5lWPldZ
 FRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Kv3Dsb136m6woDcLeq0RvetZlxd07JTKK/EPH5bVjKE=;
 b=ugyqtfHN9VIJ0hOYHpdKZ5P36Hbqr7zKsHapaI/gbZWaHS+XJqzNa0sLCrZ0SqKUIa
 5P3CYALJ8KDYjdDDY4l1c0ukwFt1WDvxnFU77h8CiRaLcC0HiYpmUQd0BWxuFHl7q23f
 g7y+R06Cpou3F6INQZMe5BduSsbOTnkerYMz/4G8FroEXbJfbe6hn6P6Ccl6FNHfsQa3
 zzUKU/iKU3ZDM707BAhnHLJDj3eIH352/etKWEjUJ46mq89+H+Q2zwNJdQFOWTcgzsEl
 LzD0RxZSnmM8ca9Fq072/rtXJpPTMBcmqWxT7nHzZlTOY07ZztSCmvNFjxtDHxYYntEO
 KTvg==
X-Gm-Message-State: ALKqPwcILhyTuHEU6+vf/5Y+LwBB9+njyeq41Hxgo4z4uOKXITuDViON
 /17923g70illR0ABhMRaedUQj9gevwOg+5z1yLA=
X-Google-Smtp-Source: AB8JxZqi0xZPcyi45/szUYWmr5XylYAnXn4h1xa6ibkOTYgWl2kpg3ouL5RESynGOJ9ch4Ynbn3By9H85uT9f9LFqrE=
X-Received: by 2002:ac8:354f:: with SMTP id
 z15-v6mr15555316qtb.295.1526419296060; 
 Tue, 15 May 2018 14:21:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.150 with HTTP; Tue, 15 May 2018 14:21:35 -0700 (PDT)
In-Reply-To: <1526394095-5069-2-git-send-email-oleksandrs@mellanox.com>
References: <1526394095-5069-1-git-send-email-oleksandrs@mellanox.com>
 <1526394095-5069-2-git-send-email-oleksandrs@mellanox.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 16 May 2018 00:21:35 +0300
Message-ID: <CAHp75VctG5RBtLF3nT5e_j7_e9O12u=5gerJ6OMxWbABM9ft2w@mail.gmail.com>
Subject: Re: [patch v21 1/4] drivers: jtag: Add JTAG core driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, openbmc@lists.ozlabs.org, 
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Vadim Pasternak <vadimp@mellanox.com>, 
 system-sw-low-level@mellanox.com, Rob Herring <robh+dt@kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
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
X-List-Received-Date: Tue, 15 May 2018 21:21:40 -0000

On Tue, May 15, 2018 at 5:21 PM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
> Initial patch for JTAG driver
> JTAG class driver provide infrastructure to support hardware/software
> JTAG platform drivers. It provide user layer API interface for flashing
> and debugging external devices which equipped with JTAG interface
> using standard transactions.
>
> Driver exposes set of IOCTL to user space for:
> - XFER:
> - SIR (Scan Instruction Register, IEEE 1149.1 Data Register scan);
> - SDR (Scan Data Register, IEEE 1149.1 Instruction Register scan);
> - RUNTEST (Forces the IEEE 1149.1 bus to a run state for a specified
>   number of clocks).
> - SIOCFREQ/GIOCFREQ for setting and reading JTAG frequency.
>
> Driver core provides set of internal APIs for allocation and
> registration:
> - jtag_register;
> - jtag_unregister;
> - jtag_alloc;
> - jtag_free;
>
> Platform driver on registration with jtag-core creates the next
> entry in dev folder:
> /dev/jtagX

>  0xB0   all     RATIO devices           in development:
>                                         <mailto:vgo@ratio.de>
>  0xB1   00-1F   PPPoX                   <mailto:mostrows@styx.uwaterloo.ca>
> +0xB2   00-0f   linux/jtag.h            JTAG driver
> +                                       <mailto:oleksandrs@mellanox.com>

Consider to preserve style (upper vs. lower).

> +         This provides basic core functionality support for JTAG class devices.
> +         Hardware that is equipped with a JTAG microcontroller can be
> +         supported by using this driver's interfaces.
> +         This driver exposes a set of IOCTLs to the user space for
> +         the following commands:
> +         SDR: (Scan Data Register) Performs an IEEE 1149.1 Data Register scan
> +         SIR: (Scan Instruction Register) Performs an IEEE 1149.1 Instruction
> +         Register scan.
> +         RUNTEST: Forces the IEEE 1149.1 bus to a run state for a specified
> +         number of clocks or a specified time period.

Something feels wrong with formatting here.

> +#define MAX_JTAG_NAME_LEN (sizeof("jtag") + 5)

Interesting definition. Why not to set to 10 explicitly? And why 10?
(16 sounds better)

> +struct jtag {
> +       struct miscdevice miscdev;

> +       struct device *dev;

Doesn't miscdev parent contain exactly this one?

> +       const struct jtag_ops *ops;
> +       int id;
> +       bool opened;
> +       struct mutex open_lock;
> +       unsigned long priv[0];
> +};

> +               err = copy_to_user(u64_to_user_ptr(xfer.tdio),
> +                                  (void *)(xfer_data), data_size);

Redundant parens in one case. Check the rest similar places.

> +static int jtag_open(struct inode *inode, struct file *file)
> +{

> +       struct jtag *jtag = container_of(file->private_data, struct jtag,
> +                                        miscdev);

I would don't care about length and put it on one line.

> +       if (jtag->opened) {
> +       jtag->opened = true;
> +       jtag->opened = false;

Can it be opened non exclusively several times? If so, this needs to
be a ref counter instead.

> +       if (!ops->idle || !ops->mode_set || !ops->status_get || !ops->xfer)
> +               return NULL;

Are all of them mandatory?

> +int jtag_register(struct jtag *jtag)

Perhaps devm_ variant.

> +#define jtag_u64_to_ptr(arg) ((void *)(uintptr_t)arg)

Where is this used or supposed to be used?

> +#define JTAG_MAX_XFER_DATA_LEN 65535

Is this limitation from some spec?
Otherwise why not to allow 64K?

> +/**
> + * struct jtag_ops - callbacks for jtag control functions:
> + *
> + * @freq_get: get frequency function. Filled by device driver
> + * @freq_set: set frequency function. Filled by device driver
> + * @status_get: set status function. Filled by device driver
> + * @idle: set JTAG to idle state function. Filled by device driver
> + * @xfer: send JTAG xfer function. Filled by device driver
> + */

Perhaps you need to describe which of them are _really_ mandatory and
which are optional.

-- 
With Best Regards,
Andy Shevchenko
