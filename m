Return-Path: <jaghu@google.com>
Received: from mail-wm0-x22f.google.com (mail-wm0-x22f.google.com
 [IPv6:2a00:1450:400c:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7ffG6Vn7zDt3P
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 05:20:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=FI7fWg5u; 
 dkim-atps=neutral
Received: by mail-wm0-x22f.google.com with SMTP id n67so301963112wme.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 11:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=c3DproIudBhzoo2avWzI6p/6fMLSNrQtjSGHj1DTgJs=;
 b=FI7fWg5urtruemPVTF1YBznPbWhKTjb+jwNa9hHRNKe2N7AlFrewKJrdHhp53gqXS0
 hYcKHTxkQUk4LlHx4yUroKxDrYJ/FogHnVMZb9t1F73Ep+3q0VJZ8cUXfOEQoYegC/hS
 suyp3OqTkVysVX3NWZhJxdkWDZHrmB+JasIyo3+eLsfslYr4oozDggslo7imq5QIsh55
 99ji+DPbvcEeSJrLqlhN+Ip0IU/Xwv/M4z3S0mOvMIRez2SRreIJpFkVOoy7oz7vyUg2
 B6M/2bug+2GvbnmoehBI4mDxsKnm6dqOk0MRkAVX3PQMlv0NNxowSttBN4t26L6SxhHC
 +F7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=c3DproIudBhzoo2avWzI6p/6fMLSNrQtjSGHj1DTgJs=;
 b=XRfBe0LXTryVBSDWHSJ9Oqv/c2L3wH1gLXeVvv+kTg+kf1oXWcdnXUcJKfSXZmpWW4
 pVaV+BSrEZlPAhQHCAMkI+kdb5GC0jsPI6XpctbvmjQVrNwuS4XFZipQxGSmdfOX5/Iu
 bvmsn6CAiI2hcj+ChkloTyOynBSo/huMSfX8of2zbHGHkcYhO+PhIw8cCT0Q6s+kWuEX
 oMVtZkeIYErZ5Jhfy3kbvf2W/FK14TPxWSKXx6B3EYhZpMiC6e7li7LbilOhbcTwyBSd
 vBkOnC+Vh9pZjLuj9dQKjfPC1b6rfME9vCb1R4+IreGX4V3qgDUOKiXyZlh2MBrvZGtz
 n7EA==
X-Gm-Message-State: ABUngveKlgkaN2pxqbKnQzXt3zlVZ/BKWtXm3vVPBUHjcMbHcPFUjFh4FsQ/LTfh17EAc6Xm41FUeXC7DmrximEg
X-Received: by 10.28.148.81 with SMTP id w78mr2953906wmd.42.1478024403654;
 Tue, 01 Nov 2016 11:20:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.92.37 with HTTP; Tue, 1 Nov 2016 11:19:42 -0700 (PDT)
In-Reply-To: <CAPH-5w7CXHTWG+ynBUPrLrEgKpD+cFtPHFfrokUbAFgQ41rROg@mail.gmail.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-2-git-send-email-jaghu@google.com>
 <CAPH-5w7CXHTWG+ynBUPrLrEgKpD+cFtPHFfrokUbAFgQ41rROg@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Tue, 1 Nov 2016 11:19:42 -0700
Message-ID: <CANsWYUVX4Pj8chrY5qLzToJ5B7fc+9gYPfE+6Difdyi1Hh2zkw@mail.gmail.com>
Subject: Re: [PATCH linux v1 1/3] drivers: misc: Platform driver to update
 display on the POST card
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114b78668d0eb70540415f8e
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
X-List-Received-Date: Tue, 01 Nov 2016 18:20:08 -0000

--001a114b78668d0eb70540415f8e
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 13, 2016 at 10:59 AM, Xo Wang <xow@google.com> wrote:

> with Hi Jagha,
>
> On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
> >
> > Platform driver to periodically update the display on the POST card.
> > POST card hardware assumed is 74HC164 wired to two 7-segment displays.
> >
> > Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
> >
> > ---
> >  drivers/misc/Kconfig           |   6 ++
> >  drivers/misc/Makefile          |   1 +
> >  drivers/misc/update-postcard.c | 219 ++++++++++++++++++++++++++++++
> +++++++++++
> >  drivers/misc/update-postcard.h |   1 +
> >  4 files changed, 227 insertions(+)
> >  create mode 100644 drivers/misc/update-postcard.c
> >  create mode 100644 drivers/misc/update-postcard.h
>
> I agree with what Rick said. You should consider reframing the driver
> as a general purpose "bitbang shift register-attached 7-segment LEDs"
> driver and not mention POST codes in here.
>
> This will be more clear to other kernel reviewers because
>
> 1) they probably don't know what a "POST card" is
> 2) they're not thinking of BMCs, so they'll confused as to why Linux
> would want to display POST codes (usually precedes Linux)
>
> >
> >
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 4617ddc..d65b83f 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
>
> Does drivers/misc make sense? Your driver is most similar to those
> described in http://lxr.free-electrons.com/source/Documentation/gpio/
> drivers-on-gpio.txt
>
> I'm genuinely uncertain since I have little upstream Linux experience.

I looked at the other drivers given in the link you mentioned. But they do
not seem relevant. So I have put them in drivers/misc


> > @@ -804,6 +804,12 @@ config PANEL_BOOT_MESSAGE
> >           An empty message will only clear the display at driver init
> time. Any other
> >           printf()-formatted message is valid with newline and escape
> codes.
> >
> > +config ASPEED_UPDATE_POSTCARD
> > +       tristate "Platform driver to update POST card"
> > +       help
> > +        Support to periodically update display on the POST card. The
> POST card
> > +        hardware assumed is 74HC164 wired to two 7-segment displays.
> > +
> >  config ASPEED_BT_IPMI_HOST
> >         tristate "BT IPMI host driver"
> >         help
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index 724861b..730c6c2 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)            += echo/
> >  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
> >  obj-$(CONFIG_CXL_BASE)         += cxl/
> >  obj-$(CONFIG_PANEL)             += panel.o
> > +obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
> >  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
> > diff --git a/drivers/misc/update-postcard.c b/drivers/misc/update-
> postcard.c
> > new file mode 100644
> > index 0000000..3516c24
> > --- /dev/null
> > +++ b/drivers/misc/update-postcard.c
> > @@ -0,0 +1,219 @@
> > +/* Platform driver to periodically update the display on the POST card.
> > + * POST card hardware assumed is 74HC164 wired to two 7-segment
> displays.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/timer.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/sizes.h>
> > +#include <linux/map_to_7segment.h>
> > +#include <linux/io.h>
> > +#include <linux/delay.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/gpio/consumer.h>
> > +
> > +#define POST_CODE_UPDATE_INTVL 1000
>
> Maybe make this an optional device tree property with 1000 as the
> default value. Please also suffix with units (*_ms).
>
> > +
> > +#define MAX_PC_SIZE 3
> > +
> > +#define LED_DOT 0x01
> > +
> > +#define CLOCK_GPIO_NAME "clk"
> > +#define DATA_GPIO_NAME "data"
> > +#define CLEAR_GPIO_NAME "clr"
> > +
> > +static struct mutex mutex;
> > +
> > +static struct timer_list update_timer;
> > +
> > +static char curr_postcode[3];
> > +static u8 pc_valid;
> > +
> > +static struct gpio_desc *clk_gpio;
> > +static struct gpio_desc *data_gpio;
> > +static struct gpio_desc *clr_gpio;
>
> Agree that these should be wrapped up into a struct. It'll then be
> easier to turn this into a module or to support multiple shift
> register 7seg displays (not that we want those things right now).
>
> > +
> > +/*
> > + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
> > + *  _       _   _       _   _   _   _   _   _       _       _   _
> > + * | |   |  _|  _| |_| |_  |_    | |_| |_| |_| |_  |    _| |_  |_
> > + * |_|   | |_   _|   |  _| |_|   | |_|   | | | |_| |_  |_| |_  |
> > + *
> > + * data[7:1] = led[a:g]
> > + * lookup table used for both bytes of lpc post code and lower byte of
> > + * bmc post code
> > + */
> > +const u8 seven_seg_bits[] = {
> > +       0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,
> > +       0xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, 0x8E
> > +       };
> > +
> > +/*
> > + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
> > + *      _       _   _                              _            _
> > + *     |   |_  |_| |_  _   _   _   _   _   _   _  |_    _|  _| | |
> > + *     |_  |_  |   |                               _|  |_| |_| | |
> > + *
> > + * data[7:1] = led[a:g]
> > + * lookup table used for higher byte of bmc post code
> > + */
> > +const u8 special_seven_seg_bits[] = {
> > +       0x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,
> > +       0x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC
> > +       };
> > +
> > +void update_postcode(char *buf)
> > +{
> > +       mutex_lock(&mutex);
> > +       strncpy(curr_postcode, buf, sizeof(curr_postcode));
> > +       mutex_unlock(&mutex);
> > +       pc_valid = 1;
> > +}
> > +EXPORT_SYMBOL(update_postcode);
> > +
> > +/* convert postcode to led pattern
> > + * 7-bits used for each 7-seg display and
> > + * 1 bit used for the 'dot' on both digits.
> > + *
> > + *  @param N/A
> > + *  @return N/A
> > + */
> > +static u16 postcode_to_led_signal(void)
> > +{
> > +       u8 low_display;
> > +       u8 high_display;
> > +       u16 led_value;
> > +       char buf[3];
> > +
> > +       mutex_lock(&mutex);
> > +       strncpy(buf, curr_postcode, sizeof(buf));
> > +       mutex_unlock(&mutex);
> > +
> > +       low_display = seven_seg_bits[hex_to_bin(buf[2])];
> > +
> > +       high_display = (buf[0] == '1') ?
> > +               special_seven_seg_bits[hex_to_bin(buf[1])] :
> > +               seven_seg_bits[hex_to_bin(buf[1])];
> > +
> > +       led_value = low_display | (high_display << 8);
> > +       if (buf[0] == '1') {
> > +               led_value |= LED_DOT | (LED_DOT << 8);
> > +       }
> > +
> > +       return led_value;
> > +}
> > +
> > +static void update_sgpio(void)
>
> Since you're no longer using the Serial GPIO peripheral, please rename
> this to something more descriptive like "write_..._display"
>
> > +{
> > +       u16 led_signal;
> > +       int i;
> > +
> > +       /* Convert two bytes of post code to 16 bit led pattern */
> > +       led_signal = postcode_to_led_signal();
> > +
> > +       /* Set the clear signal to low */
> > +       gpiod_set_value(clr_gpio, 0);
> > +       udelay(1);
> > +       /* Set the clear clear to high */
> > +       gpiod_set_value(clr_gpio, 1);
> > +       udelay(1);
> > +
> > +       /* Bitbang the 16 bit led pattern
> > +        * 7-bits used for each 7-seg display
> > +        * 1 bit used for the 'dot' on both digits
> > +        */
> > +       for (i = 0; i < 16; i++) {
> > +               if (led_signal & 0x01) {
> > +                       /* Set the data signal to high */
> > +                       gpiod_set_value(data_gpio, 1);
> > +               } else {
> > +                       /* Set the data signal to low */
> > +                       gpiod_set_value(data_gpio, 0);
> > +               }
> > +               udelay(1);
> > +
> > +               /* Set the clock signal to low */
> > +               gpiod_set_value(clk_gpio, 0);
> > +               udelay(1);
>
> Please name this delay value as a constant (or make it configurable, up to
> you).
>
> > +               /* Set the clock signal to high */
> > +               gpiod_set_value(clk_gpio, 1);
> > +               udelay(1);
> > +
> > +               led_signal >>= 1;
> > +       }
> > +}
> > +
> > +static void update_timer_handler(unsigned long data)
> > +{
> > +       if (pc_valid == 1) {
> > +               update_sgpio();
> > +       }
> > +       mod_timer(&update_timer,
> > +               jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
> > +}
> > +
> > +static const struct of_device_id of_postcard_match[] = {
> > +               { .compatible = "postcard-display" },
> > +                       {},
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, of_postcard_match);
> > +
> > +static int postcard_probe(struct platform_device *pdev)
> > +{
> > +       int result;
> > +       struct device *dev = &pdev->dev;
> > +
> > +       /* Requesting the clock gpio */
> > +       clk_gpio = devm_gpiod_get(dev, CLOCK_GPIO_NAME,
> > +               GPIOD_OUT_HIGH);
> > +       if (IS_ERR(clk_gpio))
> > +               return PTR_ERR(data_gpio);
> > +
> > +       /* Requesting the data gpio */
> > +       data_gpio = devm_gpiod_get(dev, DATA_GPIO_NAME,
> > +               GPIOD_OUT_HIGH);
> > +       if (IS_ERR(data_gpio))
> > +               return PTR_ERR(data_gpio);
> > +
> > +       /* Requesting the clear gpio */
> > +       clr_gpio = devm_gpiod_get(dev, CLEAR_GPIO_NAME,
> > +               GPIOD_OUT_HIGH);
> > +       if (IS_ERR(clr_gpio))
> > +               return PTR_ERR(clr_gpio);
> > +
> > +       /* Start timer to update post code every second */
> > +       setup_timer(&update_timer, update_timer_handler, 0);
> > +       result = mod_timer(&update_timer,
> > +               jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
> > +
> > +       if (result)
> > +               return result;
> > +
> > +       mutex_init(&mutex);
> > +
> > +       return 0;
> > +}
> > +
> > +static void postcard_remove(struct platform_device *pdev)
> > +{
> > +       del_timer(&update_timer);
> > +}
> > +
> > +static struct platform_driver postcard_display_driver = {
> > +       .probe          = postcard_probe,
> > +       .shutdown       = postcard_remove,
> > +       .driver         = {
> > +               .name   = "postcard-display",
> > +               .of_match_table = of_postcard_match,
> > +       },
> > +};
> > +
> > +module_platform_driver(postcard_display_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <
> jaghu@google.com>");
> > +MODULE_DESCRIPTION("Post card display update driver");
> > diff --git a/drivers/misc/update-postcard.h b/drivers/misc/update-
> postcard.h
> > new file mode 100644
> > index 0000000..ef82e9091d
> > --- /dev/null
> > +++ b/drivers/misc/update-postcard.h
> > @@ -0,0 +1 @@
> > +void update_postcode(char *buf);
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>
> cheers
> xo
>

--001a114b78668d0eb70540415f8e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Oct 13, 2016 at 10:59 AM, Xo Wang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:xow@google.com" target=3D"_blank">xow@google.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">with Hi Jagha,<br>
<span class=3D""><br>
On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder<br>
Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt; =
wrote:<br>
&gt;<br>
</span><span class=3D"">&gt; Platform driver to periodically update the dis=
play on the POST card.<br>
&gt; POST card hardware assumed is 74HC164 wired to two 7-segment displays.=
<br>
&gt;<br>
&gt; Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"=
mailto:jaghu@google.com">jaghu@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A06 ++<br>
&gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A01 +<br>
&gt;=C2=A0 drivers/misc/update-postcard.c | 219 +++++++++++++++++++++++++++=
+++<wbr>+++++++++++<br>
&gt;=C2=A0 drivers/misc/update-postcard.h |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 4 files changed, 227 insertions(+)<br>
&gt;=C2=A0 create mode 100644 drivers/misc/update-postcard.c<br>
&gt;=C2=A0 create mode 100644 drivers/misc/update-postcard.h<br>
<br>
</span>I agree with what Rick said. You should consider reframing the drive=
r<br>
as a general purpose &quot;bitbang shift register-attached 7-segment LEDs&q=
uot;<br>
driver and not mention POST codes in here.<br>
<br>
This will be more clear to other kernel reviewers because<br>
<br>
1) they probably don&#39;t know what a &quot;POST card&quot; is<br>
2) they&#39;re not thinking of BMCs, so they&#39;ll confused as to why Linu=
x<br>
would want to display POST codes (usually precedes Linux)<br>
<span class=3D""><br>
&gt;<br>
&gt;<br>
&gt; diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig<br>
&gt; index 4617ddc..d65b83f 100644<br>
&gt; --- a/drivers/misc/Kconfig<br>
&gt; +++ b/drivers/misc/Kconfig<br>
<br>
</span>Does drivers/misc make sense? Your driver is most similar to those<b=
r>
described in <a href=3D"http://lxr.free-electrons.com/source/Documentation/=
gpio/drivers-on-gpio.txt" rel=3D"noreferrer" target=3D"_blank">http://lxr.f=
ree-electrons.com/<wbr>source/Documentation/gpio/<wbr>drivers-on-gpio.txt</=
a><br>
<br>
I&#39;m genuinely uncertain since I have little upstream Linux experience.<=
/blockquote><div>I looked at the other drivers given in the link you mentio=
ned. But they do not seem relevant. So I have put them in drivers/misc</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5">
&gt; @@ -804,6 +804,12 @@ config PANEL_BOOT_MESSAGE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0An empty message will only cle=
ar the display at driver init time. Any other<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf()-formatted message is =
valid with newline and escape codes.<br>
&gt;<br>
&gt; +config ASPEED_UPDATE_POSTCARD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Platform driver to update P=
OST card&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Support to periodically update display on=
 the POST card. The POST card<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardware assumed is 74HC164 wired to two =
7-segment displays.<br>
&gt; +<br>
&gt;=C2=A0 config ASPEED_BT_IPMI_HOST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;BT IPMI host driver&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile<br>
&gt; index 724861b..730c6c2 100644<br>
&gt; --- a/drivers/misc/Makefile<br>
&gt; +++ b/drivers/misc/Makefile<br>
&gt; @@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 +=3D echo/<br>
&gt;=C2=A0 obj-$(CONFIG_VEXPRESS_SYSCFG)=C2=A0 +=3D vexpress-syscfg.o<br>
&gt;=C2=A0 obj-$(CONFIG_CXL_BASE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D cxl=
/<br>
&gt;=C2=A0 obj-$(CONFIG_PANEL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D panel.o<br>
&gt; +obj-$(CONFIG_ASPEED_UPDATE_<wbr>POSTCARD)=C2=A0 =C2=A0 +=3D update-po=
stcard.o<br>
&gt;=C2=A0 obj-$(CONFIG_ASPEED_BT_IPMI_<wbr>HOST)=C2=A0 =C2=A0 =C2=A0 +=3D =
bt-host.o<br>
&gt; diff --git a/drivers/misc/update-<wbr>postcard.c b/drivers/misc/update=
-<wbr>postcard.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..3516c24<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/update-<wbr>postcard.c<br>
&gt; @@ -0,0 +1,219 @@<br>
&gt; +/* Platform driver to periodically update the display on the POST car=
d.<br>
&gt; + * POST card hardware assumed is 74HC164 wired to two 7-segment displ=
ays.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;linux/kernel.h&gt;<br>
&gt; +#include &lt;linux/module.h&gt;<br>
&gt; +#include &lt;linux/timer.h&gt;<br>
&gt; +#include &lt;linux/jiffies.h&gt;<br>
&gt; +#include &lt;linux/sizes.h&gt;<br>
&gt; +#include &lt;linux/map_to_7segment.h&gt;<br>
&gt; +#include &lt;linux/io.h&gt;<br>
&gt; +#include &lt;linux/delay.h&gt;<br>
&gt; +#include &lt;linux/uaccess.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/of_platform.h&gt;<br>
&gt; +#include &lt;linux/gpio/consumer.h&gt;<br>
&gt; +<br>
&gt; +#define POST_CODE_UPDATE_INTVL 1000<br>
<br>
</div></div>Maybe make this an optional device tree property with 1000 as t=
he<br>
default value. Please also suffix with units (*_ms).<br>
<span class=3D""><br>
&gt; +<br>
&gt; +#define MAX_PC_SIZE 3<br>
&gt; +<br>
&gt; +#define LED_DOT 0x01<br>
&gt; +<br>
&gt; +#define CLOCK_GPIO_NAME &quot;clk&quot;<br>
&gt; +#define DATA_GPIO_NAME &quot;data&quot;<br>
&gt; +#define CLEAR_GPIO_NAME &quot;clr&quot;<br>
&gt; +<br>
&gt; +static struct mutex mutex;<br>
&gt; +<br>
&gt; +static struct timer_list update_timer;<br>
&gt; +<br>
&gt; +static char curr_postcode[3];<br>
&gt; +static u8 pc_valid;<br>
&gt; +<br>
&gt; +static struct gpio_desc *clk_gpio;<br>
&gt; +static struct gpio_desc *data_gpio;<br>
&gt; +static struct gpio_desc *clr_gpio;<br>
<br>
</span>Agree that these should be wrapped up into a struct. It&#39;ll then =
be<br>
easier to turn this into a module or to support multiple shift<br>
register 7seg displays (not that we want those things right now).<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +/*<br>
&gt; + * 0=C2=A0 =C2=A01=C2=A0 =C2=A02=C2=A0 =C2=A03=C2=A0 =C2=A04=C2=A0 =
=C2=A05=C2=A0 =C2=A06=C2=A0 =C2=A07=C2=A0 =C2=A08=C2=A0 =C2=A09=C2=A0 =C2=
=A0A=C2=A0 =C2=A0B=C2=A0 =C2=A0C=C2=A0 =C2=A0D=C2=A0 =C2=A0E=C2=A0 =C2=A0F<=
br>
&gt; + *=C2=A0 _=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0 =C2=
=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =
=C2=A0_=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=
=A0_<br>
&gt; + * | |=C2=A0 =C2=A0|=C2=A0 _|=C2=A0 _| |_| |_=C2=A0 |_=C2=A0 =C2=A0 |=
 |_| |_| |_| |_=C2=A0 |=C2=A0 =C2=A0 _| |_=C2=A0 |_<br>
&gt; + * |_|=C2=A0 =C2=A0| |_=C2=A0 =C2=A0_|=C2=A0 =C2=A0|=C2=A0 _| |_|=C2=
=A0 =C2=A0| |_|=C2=A0 =C2=A0| | | |_| |_=C2=A0 |_| |_=C2=A0 |<br>
&gt; + *<br>
&gt; + * data[7:1] =3D led[a:g]<br>
&gt; + * lookup table used for both bytes of lpc post code and lower byte o=
f<br>
&gt; + * bmc post code<br>
&gt; + */<br>
&gt; +const u8 seven_seg_bits[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, =
0xE0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, =
0x8E<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * 0=C2=A0 =C2=A01=C2=A0 =C2=A02=C2=A0 =C2=A03=C2=A0 =C2=A04=C2=A0 =
=C2=A05=C2=A0 =C2=A06=C2=A0 =C2=A07=C2=A0 =C2=A08=C2=A0 =C2=A09=C2=A0 =C2=
=A0A=C2=A0 =C2=A0B=C2=A0 =C2=A0C=C2=A0 =C2=A0D=C2=A0 =C2=A0E=C2=A0 =C2=A0F<=
br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _<br=
>
&gt; + *=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0|_=C2=A0 |_| |_=C2=A0 _=C2=A0 =C2=
=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=
=C2=A0 |_=C2=A0 =C2=A0 _|=C2=A0 _| | |<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0|_=C2=A0 |_=C2=A0 |=C2=A0 =C2=A0|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0_|=C2=A0 |_| |_| | |<br>
&gt; + *<br>
&gt; + * data[7:1] =3D led[a:g]<br>
&gt; + * lookup table used for higher byte of bmc post code<br>
&gt; + */<br>
&gt; +const u8 special_seven_seg_bits[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, =
0x02,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, =
0xEC<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +void update_postcode(char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(curr_postcode, buf, sizeof(curr_po=
stcode));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0pc_valid =3D 1;<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(update_<wbr>postcode);<br>
&gt; +<br>
&gt; +/* convert postcode to led pattern<br>
&gt; + * 7-bits used for each 7-seg display and<br>
&gt; + * 1 bit used for the &#39;dot&#39; on both digits.<br>
&gt; + *<br>
&gt; + *=C2=A0 @param N/A<br>
&gt; + *=C2=A0 @return N/A<br>
&gt; + */<br>
&gt; +static u16 postcode_to_led_signal(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 low_display;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 high_display;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 led_value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[3];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(buf, curr_postcode, sizeof(buf));<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mutex);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0low_display =3D seven_seg_bits[hex_to_bin(=
buf[<wbr>2])];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0high_display =3D (buf[0] =3D=3D &#39;1&#39=
;) ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0special_seven_=
seg_bits[hex_to_<wbr>bin(buf[1])] :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seven_seg_bits=
[hex_to_bin(buf[<wbr>1])];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0led_value =3D low_display | (high_display =
&lt;&lt; 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0] =3D=3D &#39;1&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_value |=3D=
 LED_DOT | (LED_DOT &lt;&lt; 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return led_value;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void update_sgpio(void)<br>
<br>
</div></div>Since you&#39;re no longer using the Serial GPIO peripheral, pl=
ease rename<br>
this to something more descriptive like &quot;write_..._display&quot;<br>
<div><div class=3D"h5"><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 led_signal;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Convert two bytes of post code to 16 bi=
t led pattern */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0led_signal =3D postcode_to_led_signal();<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clear signal to low */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(clr_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clear clear to high */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(clr_gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Bitbang the 16 bit led pattern<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7-bits used for each 7-seg display<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 bit used for the &#39;dot&#39; on bot=
h digits<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 16; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (led_signal=
 &amp; 0x01) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* Set the data signal to high */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0gpiod_set_value(data_gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0/* Set the data signal to low */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0gpiod_set_value(data_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clo=
ck signal to low */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_valu=
e(clk_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
<br>
</div></div>Please name this delay value as a constant (or make it configur=
able, up to you).<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clo=
ck signal to high */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_valu=
e(clk_gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_signal &gt=
;&gt;=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void update_timer_handler(unsigned long data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pc_valid =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_sgpio()=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mod_timer(&amp;update_timer,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jiffies + msec=
s_to_jiffies(POST_CODE_<wbr>UPDATE_INTVL));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct of_device_id of_postcard_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =
=3D &quot;postcard-display&quot; },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0{},<br>
&gt; +};<br>
&gt; +<br>
&gt; +MODULE_DEVICE_TABLE(of, of_postcard_match);<br>
&gt; +<br>
&gt; +static int postcard_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int result;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Requesting the clock gpio */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_gpio =3D devm_gpiod_get(dev, CLOCK_GPI=
O_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_HIGH=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(data_gpio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Requesting the data gpio */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0data_gpio =3D devm_gpiod_get(dev, DATA_GPI=
O_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_HIGH=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(data_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(data_gpio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Requesting the clear gpio */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0clr_gpio =3D devm_gpiod_get(dev, CLEAR_GPI=
O_NAME,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_HIGH=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clr_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(clr_gpio);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Start timer to update post code every s=
econd */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_timer(&amp;update_timer, update_time=
r_handler, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D mod_timer(&amp;update_timer,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jiffies + msec=
s_to_jiffies(POST_CODE_<wbr>UPDATE_INTVL));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (result)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return result;=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;mutex);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void postcard_remove(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0del_timer(&amp;update_timer);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static struct platform_driver postcard_display_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D postcard_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.shutdown=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D po=
stcard_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0=3D &quot;postcard-display&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_tabl=
e =3D of_postcard_match,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_platform_driver(<wbr>postcard_display_driver);<br>
&gt; +<br>
&gt; +MODULE_LICENSE(&quot;GPL&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a hr=
ef=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Post card display update driver&quot;);<br>
&gt; diff --git a/drivers/misc/update-<wbr>postcard.h b/drivers/misc/update=
-<wbr>postcard.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ef82e9091d<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/misc/update-<wbr>postcard.h<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +void update_postcode(char *buf);<br>
&gt; --<br>
&gt; 2.8.0.rc3.226.g39d4020<br>
&gt;<br>
</div></div><span class=3D"">&gt; ______________________________<wbr>______=
___________<br>
&gt; openbmc mailing list<br>
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</=
a><br>
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" target=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br>
</span>cheers<br>
<span class=3D"HOEnZb"><font color=3D"#888888">xo<br>
</font></span></blockquote></div><br></div></div>

--001a114b78668d0eb70540415f8e--
