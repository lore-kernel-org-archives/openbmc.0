Return-Path: <andy.shevchenko@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJ1hp4yb1zDq8f
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 11:06:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y7PGLKMP"; 
 dkim-atps=neutral
Received: by mail-qk0-x244.google.com with SMTP id u25so15495502qki.2
 for <openbmc@lists.ozlabs.org>; Tue, 07 Feb 2017 16:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=db24u11cWGtT6bUXW5f77jspGjzn7W7o3B0FffcWGgA=;
 b=Y7PGLKMPBkoLGuEhetISkeGmz7yB/44VG1dmqvRwHR+JAxcLzma336W3J73LBV0G08
 y5OnexXTyV6pwEFHaXGFldCn1Jx+yNAsrR/yskyniTG+z1KQiSDQ2x3bNCRg3WmMbIeZ
 vAN0qtvq+Lr2c/0qt8/Glit6KAGCWI2wMDPFqORZ0hfRtHg9q2f3QPFNymTx0UGql/87
 QWt7fudqcs/gHxB0v9qN4uHcR0XWprOOZO6wu5VfOz5s58dPxowLZy5280X0zfEG5AYf
 LXv/gKaUwrUo55M6uVw8u7WJwVYoWvCluzEIqfrdH9ibPYKvFt6A42LqZ1K/dQPhF9xf
 lRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=db24u11cWGtT6bUXW5f77jspGjzn7W7o3B0FffcWGgA=;
 b=KFMEYVyfBcKmpkaDMnbZzFyM6ol2xIszZgKQHWwDJuTB2tpIQxR8TgRmr+ezIgOvIH
 MjRwqPhpoKMAgLAibHyYBzCssba16ogujhXHdvep+nh2DquZR3SIEzJilCi/FdgWBJXD
 xAfiQnnJXydbRFeZqbAnsgJj+zannMYjmwpk24mhM6GYE/22TMIgrvH8HnUfQqzilW9/
 VcVakP+O0ttfRxJs+ptOmGXXtHCgJDbAroKSrX5Q7oB/Dlux+KkQjtftdjQkpLWWqgmb
 g+y4C3Kxem5afyCs0k/HHnbn0oAz/GxaOXXteAog1T5q2URcooB5XwFmU0ebZLCQ5foE
 +zsw==
X-Gm-Message-State: AMke39kOt5AWx2UhgaXfNcnwavy0uAH/waxLzBdmnViVyDZp56UETXUIJ2zZ2lPm3NC4TC7GoVpY0jjs8xYjBQ==
X-Received: by 10.55.108.70 with SMTP id h67mr17649359qkc.245.1486512392210;
 Tue, 07 Feb 2017 16:06:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.153 with HTTP; Tue, 7 Feb 2017 16:06:31 -0800 (PST)
In-Reply-To: <20170207234247.19425-1-cyrilbur@gmail.com>
References: <20170207234247.19425-1-cyrilbur@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 8 Feb 2017 02:06:31 +0200
Message-ID: <CAHp75VcfrPu0kba4Erw1L5BBzibzzKTgSr-5zYL7kE4sWA64Tg@mail.gmail.com>
Subject: Re: [PATCH v4] drivers/misc: Add Aspeed LPC control driver
To: Cyril Bur <cyrilbur@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, mikey@neuling.org,
 joel@jms.id.au, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Wed, 08 Feb 2017 11:55:18 +1100
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
X-List-Received-Date: Wed, 08 Feb 2017 00:06:35 -0000

On Wed, Feb 8, 2017 at 1:42 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> In order to manage server systems, there is typically another processor
> known as a BMC (Baseboard Management Controller) which is responsible
> for powering the server and other various elements, sometimes fans,
> often the system flash.
>
> The Aspeed BMC family which is what is used on OpenPOWER machines and a
> number of x86 as well is typically connected to the host via an LPC
> (Low Pin Count) bus (among others).

Perhaps I missed the discussion on previous versions, but here my
question. If it's available on x86, how you access it there? This
driver seems too OF oriented which is not a case on most of x86
platforms.

>
> The LPC bus is an ISA bus on steroids. It's generally used by the
> BMC chip to provide the host with access to the system flash (via MEM/FW
> cycles) that contains the BIOS or other host firmware along with a
> number of SuperIO-style IOs (via IO space) such as UARTs, IPMI
> controllers.
>
> On the BMC chip side, this is all configured via a bunch of registers
> whose content is related to a given policy of what devices are exposed
> at a per system level, which is system/vendor specific, so we don't want
> to bolt that into the BMC kernel. This started with a need to provide
> something nicer than /dev/mem for user space to configure these things.
>
> One important aspect of the configuration is how the MEM/FW space is
> exposed to the host (ie, the x86 or POWER). Some registers in that
> bridge can define a window remapping all or portion of the LPC MEM/FW
> space to a portion of the BMC internal bus, with no specific limits
> imposed in HW.
>
> I think it makes sense to ensure that this window is configured by a
> kernel driver that can apply some serious sanity checks on what it is
> configured to map.
>
> In practice, user space wants to control this by flipping the mapping
> between essentially two types of portions of the BMC address space:
>
>    - The flash space. This is a region of the BMC MMIO space that
> more/less directly maps the system flash (at least for reads, writes
> are somewhat more complicated).
>
>    - One (or more) reserved area(s) of the BMC physical memory.
>
> The latter is needed for a number of things, such as avoiding letting
> the host manipulate the innards of the BMC flash controller via some
> evil backdoor, we want to do flash updates by routing the window to a
> portion of memory (under control of a mailbox protocol via some
> separate set of registers) which the host can use to write new data in
> bulk and then request the BMC to flash it. There are other uses, such
> as allowing the host to boot from an in-memory flash image rather than
> the one in flash (very handy for continuous integration and test, the
> BMC can just download new images).
>
> It is important to note that due to the way the Aspeed chip lets the
> kernel configure the mapping between host LPC addresses and BMC ram
> addresses the offset within the window must be a multiple of size.
> Not doing so will fragment the accessible space rather than simply
> moving 'zero' upwards. This is caused by the nature of HICR8 being a
> mask and the way host LPC addresses are translated.

>  drivers/misc/Kconfig                 |   8 ++
>  drivers/misc/Makefile                |   1 +
>  drivers/misc/aspeed-lpc-ctrl.c       | 263 +++++++++++++++++++++++++++++++++++

>  include/uapi/linux/aspeed-lpc-ctrl.h |  36 +++++

Since it's UAPI can it be more generic in case there will be other LPC
implementations / devices?

> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)            += echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o

> +obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o

Does it suit best under misc?

> +static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> +               unsigned long param)
> +{

> +       long rc;
> +       struct aspeed_lpc_ctrl_mapping map;
> +       struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> +       void __user *p = (void __user *)param;
> +       u32 addr;
> +       u32 size;

Reversed tree?

> +               rc = regmap_write(lpc_ctrl->regmap, HICR7,
> +                               (addr | (map.addr >> 16)));
> +               if (rc)
> +                       return rc;
> +
> +               return regmap_write(lpc_ctrl->regmap, HICR8,
> +                       (~(map.size - 1)) | ((map.size >> 16) - 1));

Magic stuff above and here. Perhaps some helpers?

> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static const struct file_operations aspeed_lpc_ctrl_fops = {

> +       .owner          = THIS_MODULE,

Do we still need this?

> +       .mmap           = aspeed_lpc_ctrl_mmap,
> +       .unlocked_ioctl = aspeed_lpc_ctrl_ioctl,
> +};

> +static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
> +{
> +       struct aspeed_lpc_ctrl *lpc_ctrl;
> +       struct device *dev;
> +       struct device_node *node;
> +       struct resource resm;
> +       int rc;
> +

> +       dev = &pdev->dev;

You can do this in the definition block.


> +       node = of_parse_phandle(dev->of_node, "flash", 0);
> +       if (!node) {
> +               dev_err(dev, "Didn't find host pnor flash node\n");
> +               return -ENODEV;
> +       }
> +

> +       rc = of_property_read_u32_index(node, "reg", 3,
> +                       &lpc_ctrl->pnor_size);
> +       if (rc)
> +               return rc;
> +       rc = of_property_read_u32_index(node, "reg", 2,
> +                       &lpc_ctrl->pnor_base);
> +       if (rc)
> +               return rc;

Isn't something you may read at once?

> +       lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
> +       lpc_ctrl->miscdev.name = DEVICE_NAME;
> +       lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
> +       lpc_ctrl->miscdev.parent = dev;

> +       rc = misc_register(&lpc_ctrl->miscdev);

No devm_ variant?

> +       if (rc)
> +               dev_err(dev, "Unable to register device\n");
> +       else
> +               dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",

%pa
%pa

> +                       lpc_ctrl->mem_base, lpc_ctrl->mem_size);
> +
> +       return rc;
> +}

> +struct aspeed_lpc_ctrl_mapping {
> +       __u8    window_type;
> +       __u8    window_id;
> +       __u16   flags;
> +       __u32   addr;
> +       __u32   offset;
> +       __u32   size;
> +};

It will suck. So, no room for manoeuvre?

-- 
With Best Regards,
Andy Shevchenko
