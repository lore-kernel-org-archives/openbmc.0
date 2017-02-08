Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJ85236S7zDq5x
 for <openbmc@lists.ozlabs.org>; Wed,  8 Feb 2017 15:54:30 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v184sFCT005492;
 Tue, 7 Feb 2017 22:54:16 -0600
Message-ID: <1486529655.3401.2.camel@kernel.crashing.org>
Subject: Re: [PATCH v4] drivers/misc: Add Aspeed LPC control driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Cyril Bur <cyrilbur@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 mikey@neuling.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Date: Wed, 08 Feb 2017 15:54:15 +1100
In-Reply-To: <CAHp75VcfrPu0kba4Erw1L5BBzibzzKTgSr-5zYL7kE4sWA64Tg@mail.gmail.com>
References: <20170207234247.19425-1-cyrilbur@gmail.com>
 <CAHp75VcfrPu0kba4Erw1L5BBzibzzKTgSr-5zYL7kE4sWA64Tg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 08 Feb 2017 04:54:31 -0000

On Wed, 2017-02-08 at 02:06 +0200, Andy Shevchenko wrote:
> > On Wed, Feb 8, 2017 at 1:42 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > In order to manage server systems, there is typically another processor
> > known as a BMC (Baseboard Management Controller) which is responsible
> > for powering the server and other various elements, sometimes fans,
> > often the system flash.
> > 
> > The Aspeed BMC family which is what is used on OpenPOWER machines and a
> > number of x86 as well is typically connected to the host via an LPC
> > (Low Pin Count) bus (among others).
> 
> Perhaps I missed the discussion on previous versions, but here my
> question. If it's available on x86, how you access it there? This
> driver seems too OF oriented which is not a case on most of x86
> platforms.

This is the BMC (ie salve) side of the LPC bus which is an Aspeed
ARM chip whose kernel is device-tree based.

What happens on the "host" side (x86, powerpc, arm64, ...) is not
directly relevant here.

 .../...

> > It is important to note that due to the way the Aspeed chip lets the
> > kernel configure the mapping between host LPC addresses and BMC ram
> > addresses the offset within the window must be a multiple of size.
> > Not doing so will fragment the accessible space rather than simply
> > moving 'zero' upwards. This is caused by the nature of HICR8 being a
> > mask and the way host LPC addresses are translated.
> >  drivers/misc/Kconfig                 |   8 ++
> >  drivers/misc/Makefile                |   1 +
> >  drivers/misc/aspeed-lpc-ctrl.c       | 263 +++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/aspeed-lpc-ctrl.h |  36 +++++
> 
> Since it's UAPI can it be more generic in case there will be other LPC
> implementations / devices?

Not really. As I wrote above, this isn't exposing an LPC bus the way
you seem to think of it, it's about the *BMC* side of the LPC bus (the
slave side) where some fairly chip/board configuration is needed to
do things like control the mapping of part of the LPC FW space to the
SPI flash or control which LPC devices are made visible to the host etc...

This is meant to be used by OpenBMC to configure the LPC bus properly
on the BMC side so the host can boot.

> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -53,6 +53,7 @@ obj-$(CONFIG_ECHO)            += echo/
> >  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
> >  obj-$(CONFIG_CXL_BASE)         += cxl/
> >  obj-$(CONFIG_PANEL)             += panel.o
> > +obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o
> 
> Does it suit best under misc?

Yes. It's basically a chardev giving access to a few very specific
registers. I've already explained all of this in series of emails...

It could *almost* be UIO except for the fact that one thing that
needs to be configured is the mapping between the LPC bus FW space
and some region of the SoC address space, either the SPI controller
or some reserved memory used for flash operations, and there is
benefit in doing so in the kernel for security purposes as doing
so incorrectly would expose the BMC internal physical address space
to the host.

> > +static long aspeed_lpc_ctrl_ioctl(struct file *file, unsigned int cmd,
> > +               unsigned long param)
> > +{
> > +       long rc;
> > +       struct aspeed_lpc_ctrl_mapping map;
> > +       struct aspeed_lpc_ctrl *lpc_ctrl = file_aspeed_lpc_ctrl(file);
> > +       void __user *p = (void __user *)param;
> > +       u32 addr;
> > +       u32 size;
> 
> Reversed tree?

Ugh ? One of those new ridiculous coding style rules ?

> > +               rc = regmap_write(lpc_ctrl->regmap, HICR7,
> > +                               (addr | (map.addr >> 16)));
> > +               if (rc)
> > +                       return rc;
> > +
> > +               return regmap_write(lpc_ctrl->regmap, HICR8,
> > +                       (~(map.size - 1)) | ((map.size >> 16) - 1));
> 
> Magic stuff above and here. Perhaps some helpers?

A helper might be warranted but it's not *that* magic ... pretty
obvious what that does ;-)

> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static const struct file_operations aspeed_lpc_ctrl_fops = {
> > +       .owner          = THIS_MODULE,
> 
> Do we still need this?
> > +       .mmap           = aspeed_lpc_ctrl_mmap,
> > +       .unlocked_ioctl = aspeed_lpc_ctrl_ioctl,
> > +};
> > +static int aspeed_lpc_ctrl_probe(struct platform_device *pdev)
> > +{
> > +       struct aspeed_lpc_ctrl *lpc_ctrl;
> > +       struct device *dev;
> > +       struct device_node *node;
> > +       struct resource resm;
> > +       int rc;
> > +
> > +       dev = &pdev->dev;
> 
> You can do this in the definition block.
> 
> 
> > +       node = of_parse_phandle(dev->of_node, "flash", 0);
> > +       if (!node) {
> > +               dev_err(dev, "Didn't find host pnor flash node\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       rc = of_property_read_u32_index(node, "reg", 3,
> > +                       &lpc_ctrl->pnor_size);
> > +       if (rc)
> > +               return rc;
> > +       rc = of_property_read_u32_index(node, "reg", 2,
> > +                       &lpc_ctrl->pnor_base);
> > +       if (rc)
> > +               return rc;
> 
> Isn't something you may read at once?

Actually it should be parsed using of_address_to_resource indeed
in case there's any translation in the DT.

> > +       lpc_ctrl->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +       lpc_ctrl->miscdev.name = DEVICE_NAME;
> > +       lpc_ctrl->miscdev.fops = &aspeed_lpc_ctrl_fops;
> > +       lpc_ctrl->miscdev.parent = dev;
> > +       rc = misc_register(&lpc_ctrl->miscdev);
> 
> No devm_ variant?

No real need here, is there ?

> > +       if (rc)
> > +               dev_err(dev, "Unable to register device\n");
> > +       else
> > +               dev_info(dev, "Loaded at 0x%08x (0x%08x)\n",
> 
> %pa
> %pa
> 
> > +                       lpc_ctrl->mem_base, lpc_ctrl->mem_size);
> > +
> > +       return rc;
> > +}
> > +struct aspeed_lpc_ctrl_mapping {
> > +       __u8    window_type;
> > +       __u8    window_id;
> > +       __u16   flags;
> > +       __u32   addr;
> > +       __u32   offset;
> > +       __u32   size;
> > +};
> 
> It will suck. So, no room for manoeuvre?

What do you mean ?

Cheers,
Ben.
