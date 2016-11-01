Return-Path: <jaghu@google.com>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com
 [IPv6:2a00:1450:400c:c09::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7fj11WPjzDt3Q
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 05:22:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=UEji15tt; 
 dkim-atps=neutral
Received: by mail-wm0-x235.google.com with SMTP id p190so221571049wmp.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=y+9EFawmPBCpp3sJfGOevGgF20ikPqCAhaMAKjcMJXE=;
 b=UEji15tt83WVQ1yd7vCiGqAqz4o6p07DQpqcYmkzFEKFkOfEB9zo7dYq69wPNF3oMN
 /VMAOFs1BqeaExxm46K+qqzucRQglFisMy+IFkJTvG9lo8bzziCr0G6egbIrppRnzmJu
 ARenwzIUusXbnmSjzv5XFHVOy9KsfLxO3plb2a6y0qFxWGRR1brWnb2uxTw7beiU/BTx
 MoG9xsyw0NOfU3uZLQJGZ4cC9ed+VF3nQ5tIpG8Kaipj9O974p1um7FP33LrC+KLM9fO
 BWUdFDVXlFr8hYBciChiXRwtrzFVwd7i5Chg7IA2virkhi14Rx9KZukNi4Nd9P2RYCj0
 gJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=y+9EFawmPBCpp3sJfGOevGgF20ikPqCAhaMAKjcMJXE=;
 b=Ip/MAZn127o+hSXTZ7FAJ5hI2hO+jFAHtOUue74iLH+8W/tD7HldKLli9VSQAhYkXL
 t1AU0n5C98vQDP7yBCihkx4jA+LcVv/VJ2iRz3ky5kS4zIEEzlX949K2USUo7HUfFna7
 UC36aD8Ih59bP8PEAjB3WyfE+f1SHHY0eVzH8iJ9WCIeaPZFc1O4PjZHctwkob9llItP
 nvOtqqI9Wh8/gBBVyuSwu0noyXZpVQ+ZcFvAeBNi6/lLG+QGHWxNaMeUYzF6pWP6LCAW
 Ipq+acBiUJstyGzeWL1oyUZ/QL2AMDCHHHngq8XNkQ1jxkL1iAyWhZTl2y5PCM07e1Y0
 RomQ==
X-Gm-Message-State: ABUngvdZUUNo5e2NonAjPMawoIZk3xmJ+FmZ4ZD/tf/R9rUn02Bmx6swfX/DOpcEOGwbjrSbMBqQteu32WFDqcjf
X-Received: by 10.28.1.135 with SMTP id 129mr3006815wmb.108.1478024545212;
 Tue, 01 Nov 2016 11:22:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.92.37 with HTTP; Tue, 1 Nov 2016 11:22:04 -0700 (PDT)
In-Reply-To: <CAPLgG==U3fXuQSKTKJWMv_n7zwnd+X6rH=j+gvRKdan8LFO-LA@mail.gmail.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-2-git-send-email-jaghu@google.com>
 <CAPLgG==U3fXuQSKTKJWMv_n7zwnd+X6rH=j+gvRKdan8LFO-LA@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Tue, 1 Nov 2016 11:22:04 -0700
Message-ID: <CANsWYUX3a2QeVCW-Us9V1jCUCgWXsv2S2NSG9fSvVNvaK_1SNg@mail.gmail.com>
Subject: Re: [PATCH linux v1 1/3] drivers: misc: Platform driver to update
 display on the POST card
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113c842efd14cd0540416723
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
X-List-Received-Date: Tue, 01 Nov 2016 18:22:30 -0000

--001a113c842efd14cd0540416723
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2016 at 6:09 PM, Rick Altherr <raltherr@google.com> wrote:

>
> On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Natarajan <
> jaghu@google.com> wrote:
>
>> Platform driver to periodically update the display on the POST card.
>> POST card hardware assumed is 74HC164 wired to two 7-segment displays.
>>
>> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
>> ---
>>  drivers/misc/Kconfig           |   6 ++
>>  drivers/misc/Makefile          |   1 +
>>  drivers/misc/update-postcard.c | 219 ++++++++++++++++++++++++++++++
>> +++++++++++
>>  drivers/misc/update-postcard.h |   1 +
>>  4 files changed, 227 insertions(+)
>>  create mode 100644 drivers/misc/update-postcard.c
>>  create mode 100644 drivers/misc/update-postcard.h
>>
>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>> index 4617ddc..d65b83f 100644
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>> @@ -804,6 +804,12 @@ config PANEL_BOOT_MESSAGE
>>           An empty message will only clear the display at driver init
>> time. Any other
>>           printf()-formatted message is valid with newline and escape
>> codes.
>>
>> +config ASPEED_UPDATE_POSTCARD
>> +       tristate "Platform driver to update POST card"
>> +       help
>> +        Support to periodically update display on the POST card. The
>> POST card
>> +        hardware assumed is 74HC164 wired to two 7-segment displays.
>> +
>>
>
> Nothing about this driver is associated with Aspeed.  UPDATE_POSTCARD
> reads to me as describing an action, not a device.  Maybe
> SEVEN_SEGMENT_DISPLAY?
>
>
>>  config ASPEED_BT_IPMI_HOST
>>         tristate "BT IPMI host driver"
>>         help
>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>> index 724861b..730c6c2 100644
>> --- a/drivers/misc/Makefile
>> +++ b/drivers/misc/Makefile
>> @@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)            += echo/
>>  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
>>  obj-$(CONFIG_CXL_BASE)         += cxl/
>>  obj-$(CONFIG_PANEL)             += panel.o
>> +obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
>>  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
>> diff --git a/drivers/misc/update-postcard.c
>> b/drivers/misc/update-postcard.c
>> new file mode 100644
>> index 0000000..3516c24
>> --- /dev/null
>> +++ b/drivers/misc/update-postcard.c
>> @@ -0,0 +1,219 @@
>> +/* Platform driver to periodically update the display on the POST card.
>> + * POST card hardware assumed is 74HC164 wired to two 7-segment displays.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/timer.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/sizes.h>
>> +#include <linux/map_to_7segment.h>
>> +#include <linux/io.h>
>> +#include <linux/delay.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/gpio/consumer.h>
>> +
>> +#define POST_CODE_UPDATE_INTVL 1000
>> +
>> +#define MAX_PC_SIZE 3
>> +
>> +#define LED_DOT 0x01
>> +
>> +#define CLOCK_GPIO_NAME "clk"
>> +#define DATA_GPIO_NAME "data"
>> +#define CLEAR_GPIO_NAME "clr"
>> +
>> +static struct mutex mutex;
>> +
>> +static struct timer_list update_timer;
>> +
>> +static char curr_postcode[3];
>> +static u8 pc_valid;
>> +
>>
> +static struct gpio_desc *clk_gpio;
>> +static struct gpio_desc *data_gpio;
>> +static struct gpio_desc *clr_gpio;
>>
>
> I realize there should really only ever be one of these in a system but
> static data members in modules bug me.  I'd much rather see all this
> configuration and these buffers in a struct that is saved with
> platform_set_drvdata().
>
>
>> +
>> +/*
>> + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
>> + *  _       _   _       _   _   _   _   _   _       _       _   _
>> + * | |   |  _|  _| |_| |_  |_    | |_| |_| |_| |_  |    _| |_  |_
>> + * |_|   | |_   _|   |  _| |_|   | |_|   | | | |_| |_  |_| |_  |
>> + *
>> + * data[7:1] = led[a:g]
>> + * lookup table used for both bytes of lpc post code and lower byte of
>> + * bmc post code
>> + */
>> +const u8 seven_seg_bits[] = {
>> +       0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,
>> +       0xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, 0x8E
>> +       };
>> +
>> +/*
>> + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
>> + *      _       _   _                              _            _
>> + *     |   |_  |_| |_  _   _   _   _   _   _   _  |_    _|  _| | |
>> + *     |_  |_  |   |                               _|  |_| |_| | |
>> + *
>> + * data[7:1] = led[a:g]
>> + * lookup table used for higher byte of bmc post code
>> + */
>> +const u8 special_seven_seg_bits[] = {
>> +       0x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,
>> +       0x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC
>> +       };
>> +
>> +void update_postcode(char *buf)
>> +{
>> +       mutex_lock(&mutex);
>> +       strncpy(curr_postcode, buf, sizeof(curr_postcode));
>> +       mutex_unlock(&mutex);
>> +       pc_valid = 1;
>> +}
>> +EXPORT_SYMBOL(update_postcode);
>> +
>> +/* convert postcode to led pattern
>> + * 7-bits used for each 7-seg display and
>> + * 1 bit used for the 'dot' on both digits.
>> + *
>> + *  @param N/A
>> + *  @return N/A
>> + */
>> +static u16 postcode_to_led_signal(void)
>> +{
>> +       u8 low_display;
>> +       u8 high_display;
>> +       u16 led_value;
>> +       char buf[3];
>> +
>> +       mutex_lock(&mutex);
>> +       strncpy(buf, curr_postcode, sizeof(buf));
>> +       mutex_unlock(&mutex);
>> +
>> +       low_display = seven_seg_bits[hex_to_bin(buf[2])];
>> +
>> +       high_display = (buf[0] == '1') ?
>> +               special_seven_seg_bits[hex_to_bin(buf[1])] :
>> +               seven_seg_bits[hex_to_bin(buf[1])];
>> +
>> +       led_value = low_display | (high_display << 8);
>> +       if (buf[0] == '1') {
>> +               led_value |= LED_DOT | (LED_DOT << 8);
>> +       }
>> +
>> +       return led_value;
>> +}
>> +
>> +static void update_sgpio(void)
>> +{
>> +       u16 led_signal;
>> +       int i;
>> +
>> +       /* Convert two bytes of post code to 16 bit led pattern */
>> +       led_signal = postcode_to_led_signal();
>>
>
> Why do you wait until the display update to convert the string to the LED
> bit pattern?  For that matter, why does update_postcode() take a string at
> all?  If you can only display at most a 16-bit number, take a u16 and have
> the caller deal with whatever processing they need.
>
>
>> +
>> +       /* Set the clear signal to low */
>> +       gpiod_set_value(clr_gpio, 0);
>> +       udelay(1);
>> +       /* Set the clear clear to high */
>> +       gpiod_set_value(clr_gpio, 1);
>> +       udelay(1);
>> +
>> +       /* Bitbang the 16 bit led pattern
>> +        * 7-bits used for each 7-seg display
>> +        * 1 bit used for the 'dot' on both digits
>> +        */
>> +       for (i = 0; i < 16; i++) {
>> +               if (led_signal & 0x01) {
>> +                       /* Set the data signal to high */
>> +                       gpiod_set_value(data_gpio, 1);
>> +               } else {
>> +                       /* Set the data signal to low */
>> +                       gpiod_set_value(data_gpio, 0);
>> +               }
>> +               udelay(1);
>> +
>> +               /* Set the clock signal to low */
>> +               gpiod_set_value(clk_gpio, 0);
>> +               udelay(1);
>> +               /* Set the clock signal to high */
>> +               gpiod_set_value(clk_gpio, 1);
>> +               udelay(1);
>> +
>> +               led_signal >>= 1;
>> +       }
>> +}
>> +
>> +static void update_timer_handler(unsigned long data)
>> +{
>> +       if (pc_valid == 1) {
>>
>
> Is this to avoid the time after the driver is register until
> update_postcode() is called the first time?  Is there an API for clearing
> the display?
>
Yes, this is to wait until the user gives a valid display data. I have
included an API for clearing the display in the next patch.


>
>
>> +               update_sgpio();
>> +       }
>> +       mod_timer(&update_timer,
>> +               jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
>> +}
>> +
>> +static const struct of_device_id of_postcard_match[] = {
>> +               { .compatible = "postcard-display" },
>> +                       {},
>> +};
>> +
>> +MODULE_DEVICE_TABLE(of, of_postcard_match);
>> +
>> +static int postcard_probe(struct platform_device *pdev)
>> +{
>> +       int result;
>> +       struct device *dev = &pdev->dev;
>> +
>> +       /* Requesting the clock gpio */
>> +       clk_gpio = devm_gpiod_get(dev, CLOCK_GPIO_NAME,
>> +               GPIOD_OUT_HIGH);
>> +       if (IS_ERR(clk_gpio))
>> +               return PTR_ERR(data_gpio);
>> +
>> +       /* Requesting the data gpio */
>> +       data_gpio = devm_gpiod_get(dev, DATA_GPIO_NAME,
>> +               GPIOD_OUT_HIGH);
>> +       if (IS_ERR(data_gpio))
>> +               return PTR_ERR(data_gpio);
>> +
>> +       /* Requesting the clear gpio */
>> +       clr_gpio = devm_gpiod_get(dev, CLEAR_GPIO_NAME,
>> +               GPIOD_OUT_HIGH);
>> +       if (IS_ERR(clr_gpio))
>> +               return PTR_ERR(clr_gpio);
>> +
>> +       /* Start timer to update post code every second */
>> +       setup_timer(&update_timer, update_timer_handler, 0);
>> +       result = mod_timer(&update_timer,
>> +               jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
>> +
>> +       if (result)
>> +               return result;
>> +
>> +       mutex_init(&mutex);
>> +
>> +       return 0;
>> +}
>> +
>> +static void postcard_remove(struct platform_device *pdev)
>> +{
>> +       del_timer(&update_timer);
>> +}
>> +
>> +static struct platform_driver postcard_display_driver = {
>> +       .probe          = postcard_probe,
>> +       .shutdown       = postcard_remove,
>> +       .driver         = {
>> +               .name   = "postcard-display",
>> +               .of_match_table = of_postcard_match,
>> +       },
>> +};
>> +
>> +module_platform_driver(postcard_display_driver);
>
> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
>> >");
>> +MODULE_DESCRIPTION("Post card display update driver");
>> diff --git a/drivers/misc/update-postcard.h
>> b/drivers/misc/update-postcard.h
>> new file mode 100644
>> index 0000000..ef82e9091d
>> --- /dev/null
>> +++ b/drivers/misc/update-postcard.h
>> @@ -0,0 +1 @@
>> +void update_postcode(char *buf);
>> --
>> 2.8.0.rc3.226.g39d4020
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>>
>
>

--001a113c842efd14cd0540416723
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Oct 12, 2016 at 6:09 PM, Rick Altherr <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raltherr@google.com" target=3D"_blank">raltherr@google.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div class=3D"h=
5">On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Natarajan=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blank=
">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Platform driver to periodically update the display on th=
e POST card.<br>
POST card hardware assumed is 74HC164 wired to two 7-segment displays.<br>
<br>
Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailt=
o:jaghu@google.com" target=3D"_blank">jaghu@google.com</a>&gt;<br>
---<br>
=C2=A0drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 ++<br>
=C2=A0drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0drivers/misc/update-postcard.<wbr>c | 219 +++++++++++++++++++++++++++=
+++<wbr>+++++++++++<br>
=C2=A0drivers/misc/update-postcard.<wbr>h |=C2=A0 =C2=A01 +<br>
=C2=A04 files changed, 227 insertions(+)<br>
=C2=A0create mode 100644 drivers/misc/update-postcard.c<br>
=C2=A0create mode 100644 drivers/misc/update-postcard.h<br>
<br>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig<br>
index 4617ddc..d65b83f 100644<br>
--- a/drivers/misc/Kconfig<br>
+++ b/drivers/misc/Kconfig<br>
@@ -804,6 +804,12 @@ config PANEL_BOOT_MESSAGE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 An empty message will only clear the dis=
play at driver init time. Any other<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf()-formatted message is valid with=
 newline and escape codes.<br>
<br>
+config ASPEED_UPDATE_POSTCARD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Platform driver to update POST c=
ard&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Support to periodically update display on the =
POST card. The POST card<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hardware assumed is 74HC164 wired to two 7-seg=
ment displays.<br>
+<br></blockquote><div><br></div></div></div><div>Nothing about this driver=
 is associated with Aspeed.=C2=A0 UPDATE_POSTCARD reads to me as describing=
 an action, not a device.=C2=A0 Maybe SEVEN_SEGMENT_DISPLAY?</div><div><div=
 class=3D"h5"><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0config ASPEED_BT_IPMI_HOST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;BT IPMI host driver&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile<br>
index 724861b..730c6c2 100644<br>
--- a/drivers/misc/Makefile<br>
+++ b/drivers/misc/Makefile<br>
@@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D echo/<br>
=C2=A0obj-$(CONFIG_VEXPRESS_SYSCFG)<wbr>=C2=A0 +=3D vexpress-syscfg.o<br>
=C2=A0obj-$(CONFIG_CXL_BASE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D cxl/<br>
=C2=A0obj-$(CONFIG_PANEL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D panel.o<br>
+obj-$(CONFIG_ASPEED_UPDATE_PO<wbr>STCARD)=C2=A0 =C2=A0 +=3D update-postcar=
d.o<br>
=C2=A0obj-$(CONFIG_ASPEED_BT_IPMI_H<wbr>OST)=C2=A0 =C2=A0 =C2=A0 +=3D bt-ho=
st.o<br>
diff --git a/drivers/misc/update-postcard<wbr>.c b/drivers/misc/update-post=
card<wbr>.c<br>
new file mode 100644<br>
index 0000000..3516c24<br>
--- /dev/null<br>
+++ b/drivers/misc/update-postcard<wbr>.c<br>
@@ -0,0 +1,219 @@<br>
+/* Platform driver to periodically update the display on the POST card.<br=
>
+ * POST card hardware assumed is 74HC164 wired to two 7-segment displays.<=
br>
+ */<br>
+<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/timer.h&gt;<br>
+#include &lt;linux/jiffies.h&gt;<br>
+#include &lt;linux/sizes.h&gt;<br>
+#include &lt;linux/map_to_7segment.h&gt;<br>
+#include &lt;linux/io.h&gt;<br>
+#include &lt;linux/delay.h&gt;<br>
+#include &lt;linux/uaccess.h&gt;<br>
+#include &lt;linux/mutex.h&gt;<br>
+#include &lt;linux/of_platform.h&gt;<br>
+#include &lt;linux/gpio/consumer.h&gt;<br>
+<br>
+#define POST_CODE_UPDATE_INTVL 1000<br>
+<br>
+#define MAX_PC_SIZE 3<br>
+<br>
+#define LED_DOT 0x01<br>
+<br>
+#define CLOCK_GPIO_NAME &quot;clk&quot;<br>
+#define DATA_GPIO_NAME &quot;data&quot;<br>
+#define CLEAR_GPIO_NAME &quot;clr&quot;<br>
+<br>
+static struct mutex mutex;<br>
+<br>
+static struct timer_list update_timer;<br>
+<br>
+static char curr_postcode[3];<br>
+static u8 pc_valid;<br>
+<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+static=
 struct gpio_desc *clk_gpio;<br>
+static struct gpio_desc *data_gpio;<br>
+static struct gpio_desc *clr_gpio;<br></blockquote><div><br></div></div></=
div><div>I realize there should really only ever be one of these in a syste=
m but static data members in modules bug me.=C2=A0 I&#39;d much rather see =
all this configuration and these buffers in a struct that is saved with pla=
tform_set_drvdata().</div><div><div class=3D"h5"><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
+<br>
+/*<br>
+ * 0=C2=A0 =C2=A01=C2=A0 =C2=A02=C2=A0 =C2=A03=C2=A0 =C2=A04=C2=A0 =C2=A05=
=C2=A0 =C2=A06=C2=A0 =C2=A07=C2=A0 =C2=A08=C2=A0 =C2=A09=C2=A0 =C2=A0A=C2=
=A0 =C2=A0B=C2=A0 =C2=A0C=C2=A0 =C2=A0D=C2=A0 =C2=A0E=C2=A0 =C2=A0F<br>
+ *=C2=A0 _=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0 =C2=A0 =
=C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=
=A0_=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0_<=
br>
+ * | |=C2=A0 =C2=A0|=C2=A0 _|=C2=A0 _| |_| |_=C2=A0 |_=C2=A0 =C2=A0 | |_| =
|_| |_| |_=C2=A0 |=C2=A0 =C2=A0 _| |_=C2=A0 |_<br>
+ * |_|=C2=A0 =C2=A0| |_=C2=A0 =C2=A0_|=C2=A0 =C2=A0|=C2=A0 _| |_|=C2=A0 =
=C2=A0| |_|=C2=A0 =C2=A0| | | |_| |_=C2=A0 |_| |_=C2=A0 |<br>
+ *<br>
+ * data[7:1] =3D led[a:g]<br>
+ * lookup table used for both bytes of lpc post code and lower byte of<br>
+ * bmc post code<br>
+ */<br>
+const u8 seven_seg_bits[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, 0x8E<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+/*<br>
+ * 0=C2=A0 =C2=A01=C2=A0 =C2=A02=C2=A0 =C2=A03=C2=A0 =C2=A04=C2=A0 =C2=A05=
=C2=A0 =C2=A06=C2=A0 =C2=A07=C2=A0 =C2=A08=C2=A0 =C2=A09=C2=A0 =C2=A0A=C2=
=A0 =C2=A0B=C2=A0 =C2=A0C=C2=A0 =C2=A0D=C2=A0 =C2=A0E=C2=A0 =C2=A0F<br>
+ *=C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 _=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _<br>
+ *=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0|_=C2=A0 |_| |_=C2=A0 _=C2=A0 =C2=A0_=
=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=A0 =C2=A0_=C2=
=A0 |_=C2=A0 =C2=A0 _|=C2=A0 _| | |<br>
+ *=C2=A0 =C2=A0 =C2=A0|_=C2=A0 |_=C2=A0 |=C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0_|=C2=A0 |_| |_| | |<br>
+ *<br>
+ * data[7:1] =3D led[a:g]<br>
+ * lookup table used for higher byte of bmc post code<br>
+ */<br>
+const u8 special_seven_seg_bits[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+void update_postcode(char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(curr_postcode, buf, sizeof(curr_postcod=
e));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pc_valid =3D 1;<br>
+}<br>
+EXPORT_SYMBOL(update_postcode<wbr>);<br>
+<br>
+/* convert postcode to led pattern<br>
+ * 7-bits used for each 7-seg display and<br>
+ * 1 bit used for the &#39;dot&#39; on both digits.<br>
+ *<br>
+ *=C2=A0 @param N/A<br>
+ *=C2=A0 @return N/A<br>
+ */<br>
+static u16 postcode_to_led_signal(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 low_display;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 high_display;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 led_value;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char buf[3];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;mutex);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(buf, curr_postcode, sizeof(buf));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;mutex);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0low_display =3D seven_seg_bits[hex_to_bin(buf[<=
wbr>2])];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0high_display =3D (buf[0] =3D=3D &#39;1&#39;) ?<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0special_seven_seg_b=
its[hex_<wbr>to_bin(buf[1])] :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seven_seg_bits[hex_=
to_bin(<wbr>buf[1])];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0led_value =3D low_display | (high_display &lt;&=
lt; 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0] =3D=3D &#39;1&#39;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_value |=3D LED_=
DOT | (LED_DOT &lt;&lt; 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return led_value;<br>
+}<br>
+<br>
+static void update_sgpio(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 led_signal;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Convert two bytes of post code to 16 bit led=
 pattern */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0led_signal =3D postcode_to_led_signal();<br>
</blockquote><div><br></div></div></div><div>Why do you wait until the disp=
lay update to convert the string to the LED bit pattern?=C2=A0 For that mat=
ter, why does update_postcode() take a string at all?=C2=A0 If you can only=
 display at most a 16-bit number, take a u16 and have the caller deal with =
whatever processing they need.</div><div><div class=3D"h5"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clear signal to low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(clr_gpio, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clear clear to high */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(clr_gpio, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Bitbang the 16 bit led pattern<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 7-bits used for each 7-seg display<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1 bit used for the &#39;dot&#39; on both dig=
its<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 16; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (led_signal &amp=
; 0x01) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Set the data signal to high */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpiod_set_value(data_gpio, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Set the data signal to low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0gpiod_set_value(data_gpio, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clock si=
gnal to low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(clk=
_gpio, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set the clock si=
gnal to high */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value(clk=
_gpio, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0udelay(1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_signal &gt;&gt;=
=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
+static void update_timer_handler(unsigned long data)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pc_valid =3D=3D 1) {<br></blockquote><div><=
br></div></div></div><div>Is this to avoid the time after the driver is reg=
ister until update_postcode() is called the first time?=C2=A0 Is there an A=
PI for clearing the display?</div></div></div></div></blockquote><div>Yes, =
this is to wait until the user gives a valid display data. I have included =
an API for clearing the display in the next patch.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote"><div><div class=3D"h5"><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update_sgpio();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mod_timer(&amp;update_timer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jiffies + msecs_to_=
jiffies(POST_CODE_UPD<wbr>ATE_INTVL));<br>
+}<br>
+<br>
+static const struct of_device_id of_postcard_match[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &=
quot;postcard-display&quot; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0{},<br>
+};<br>
+<br>
+MODULE_DEVICE_TABLE(of, of_postcard_match);<br>
+<br>
+static int postcard_probe(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int result;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Requesting the clock gpio */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_gpio =3D devm_gpiod_get(dev, CLOCK_GPIO_NAM=
E,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_HIGH);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clk_gpio))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(data=
_gpio);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Requesting the data gpio */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data_gpio =3D devm_gpiod_get(dev, DATA_GPIO_NAM=
E,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_HIGH);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(data_gpio))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(data=
_gpio);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Requesting the clear gpio */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clr_gpio =3D devm_gpiod_get(dev, CLEAR_GPIO_NAM=
E,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_HIGH);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(clr_gpio))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(clr_=
gpio);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Start timer to update post code every second=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_timer(&amp;update_timer, update_timer_han=
dler, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D mod_timer(&amp;update_timer,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jiffies + msecs_to_=
jiffies(POST_CODE_UPD<wbr>ATE_INTVL));<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (result)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;mutex);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static void postcard_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0del_timer(&amp;update_timer);<br>
+}<br>
+<br>
+static struct platform_driver postcard_display_driver =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D po=
stcard_probe,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.shutdown=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D postcar=
d_remove,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =C2=A0=
=3D &quot;postcard-display&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D=
 of_postcard_match,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
+};<br>
+<br>
+module_platform_driver(postca<wbr>rd_display_driver);</blockquote></div></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"h5=
">
+<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D=
"mailto:jaghu@google.com" target=3D"_blank">jaghu@google.com</a>&gt;&quot;)=
;<br>
+MODULE_DESCRIPTION(&quot;Post card display update driver&quot;);<br>
diff --git a/drivers/misc/update-postcard<wbr>.h b/drivers/misc/update-post=
card<wbr>.h<br>
new file mode 100644<br>
index 0000000..ef82e9091d<br>
--- /dev/null<br>
+++ b/drivers/misc/update-postcard<wbr>.h<br>
@@ -0,0 +1 @@<br>
+void update_postcode(char *buf);<br>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br></div></div>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a><br>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/listi<wbr>nfo/openbmc</a><br>
</blockquote></div><br></div></div>
</blockquote></div><br></div></div>

--001a113c842efd14cd0540416723--
