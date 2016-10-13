Return-Path: <xow@google.com>
Received: from mail-qk0-x232.google.com (mail-qk0-x232.google.com
 [IPv6:2607:f8b0:400d:c09::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svz4m6DxNzDt1g
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 04:59:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=NqTOp/ze; 
 dkim-atps=neutral
Received: by mail-qk0-x232.google.com with SMTP id o68so150846300qkf.3
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 10:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xBVqSGbSPvWLowftPIU/eolvfx3wn2W4rMAog6oRKXM=;
 b=NqTOp/ze/aWRPC8rwpR4iAFyaR9YfhCq76259qOE46aHm+3xLrXxfJH9hJcG0NNQ63
 3jZAa7cOkPNj35xUlXwmUADmCkhEh1IgeEBGw4sRU+o/VzL4cwv2ioPGAgp6zk3YF2OA
 G3nxdczf+AEzcREdP7eKnmX9iGQD7yw6sLiNYCwYbXmGMrJ458ay/gbIIKjwYqzMXfIz
 y3qChbyNZCJv2Jx/9WmwfjFRcTqIm+uk1rYXJW41PkYoEFwN9yQtVHzCJj/8tyqI2YwZ
 9QwboCHwbPZ5vTQqEx0ACusey9m1cc11qMWx2O1iDT55ZOquAkTBdawr7AiS5yiHxdbU
 vzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xBVqSGbSPvWLowftPIU/eolvfx3wn2W4rMAog6oRKXM=;
 b=NtcI4HbIax3r/YAVGIe9o5yk4KFiTkv7kBScYMBEV/kvvuoyZeiccl+Czpthk11MgX
 5iCjng7/nW72nbOtiv01RSJcPQ2QL/AkY8pug4ntTN5OHHnwtEF2rROoZafP649M81H9
 VJKNw73F123SkMI5hL2aUhrRz41uIYNcaDVvdnMJu92rct4aetFdvDIxm5rv+sPe61PG
 EvmxQfcKCs/8eyfE+1QZ6iRk1T5CmhORrMA8RbM734mce1wKAJsduXiYCpkL8xFQz6JI
 S912HxvKHt0/+WU3eWfNdLk+Baroodqa/8SZt705Ak1ygyUU+dOthB7zgP/4hyPPyCKA
 aTyg==
X-Gm-Message-State: AA6/9RnGLI8nPiyFjP9/BKf7mHszXq2ZEBzfqFJG50xyupbzBtOgyNx5pdbquOyTTFtMLxPnq4lO+rJF5DeD//zH
X-Received: by 10.55.204.215 with SMTP id n84mr8974664qkl.240.1476381541689;
 Thu, 13 Oct 2016 10:59:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.58.194 with HTTP; Thu, 13 Oct 2016 10:59:01 -0700 (PDT)
In-Reply-To: <1476319305-29981-2-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-2-git-send-email-jaghu@google.com>
From: Xo Wang <xow@google.com>
Date: Thu, 13 Oct 2016 10:59:01 -0700
Message-ID: <CAPH-5w7CXHTWG+ynBUPrLrEgKpD+cFtPHFfrokUbAFgQ41rROg@mail.gmail.com>
Subject: Re: [PATCH linux v1 1/3] drivers: misc: Platform driver to update
 display on the POST card
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 17:59:06 -0000

with Hi Jagha,

On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
>
> Platform driver to periodically update the display on the POST card.
> POST card hardware assumed is 74HC164 wired to two 7-segment displays.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  drivers/misc/Kconfig           |   6 ++
>  drivers/misc/Makefile          |   1 +
>  drivers/misc/update-postcard.c | 219 +++++++++++++++++++++++++++++++++++++++++
>  drivers/misc/update-postcard.h |   1 +
>  4 files changed, 227 insertions(+)
>  create mode 100644 drivers/misc/update-postcard.c
>  create mode 100644 drivers/misc/update-postcard.h

I agree with what Rick said. You should consider reframing the driver
as a general purpose "bitbang shift register-attached 7-segment LEDs"
driver and not mention POST codes in here.

This will be more clear to other kernel reviewers because

1) they probably don't know what a "POST card" is
2) they're not thinking of BMCs, so they'll confused as to why Linux
would want to display POST codes (usually precedes Linux)

>
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4617ddc..d65b83f 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig

Does drivers/misc make sense? Your driver is most similar to those
described in http://lxr.free-electrons.com/source/Documentation/gpio/drivers-on-gpio.txt

I'm genuinely uncertain since I have little upstream Linux experience.

> @@ -804,6 +804,12 @@ config PANEL_BOOT_MESSAGE
>           An empty message will only clear the display at driver init time. Any other
>           printf()-formatted message is valid with newline and escape codes.
>
> +config ASPEED_UPDATE_POSTCARD
> +       tristate "Platform driver to update POST card"
> +       help
> +        Support to periodically update display on the POST card. The POST card
> +        hardware assumed is 74HC164 wired to two 7-segment displays.
> +
>  config ASPEED_BT_IPMI_HOST
>         tristate "BT IPMI host driver"
>         help
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 724861b..730c6c2 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)            += echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
> +obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
> diff --git a/drivers/misc/update-postcard.c b/drivers/misc/update-postcard.c
> new file mode 100644
> index 0000000..3516c24
> --- /dev/null
> +++ b/drivers/misc/update-postcard.c
> @@ -0,0 +1,219 @@
> +/* Platform driver to periodically update the display on the POST card.
> + * POST card hardware assumed is 74HC164 wired to two 7-segment displays.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/sizes.h>
> +#include <linux/map_to_7segment.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/uaccess.h>
> +#include <linux/mutex.h>
> +#include <linux/of_platform.h>
> +#include <linux/gpio/consumer.h>
> +
> +#define POST_CODE_UPDATE_INTVL 1000

Maybe make this an optional device tree property with 1000 as the
default value. Please also suffix with units (*_ms).

> +
> +#define MAX_PC_SIZE 3
> +
> +#define LED_DOT 0x01
> +
> +#define CLOCK_GPIO_NAME "clk"
> +#define DATA_GPIO_NAME "data"
> +#define CLEAR_GPIO_NAME "clr"
> +
> +static struct mutex mutex;
> +
> +static struct timer_list update_timer;
> +
> +static char curr_postcode[3];
> +static u8 pc_valid;
> +
> +static struct gpio_desc *clk_gpio;
> +static struct gpio_desc *data_gpio;
> +static struct gpio_desc *clr_gpio;

Agree that these should be wrapped up into a struct. It'll then be
easier to turn this into a module or to support multiple shift
register 7seg displays (not that we want those things right now).

> +
> +/*
> + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
> + *  _       _   _       _   _   _   _   _   _       _       _   _
> + * | |   |  _|  _| |_| |_  |_    | |_| |_| |_| |_  |    _| |_  |_
> + * |_|   | |_   _|   |  _| |_|   | |_|   | | | |_| |_  |_| |_  |
> + *
> + * data[7:1] = led[a:g]
> + * lookup table used for both bytes of lpc post code and lower byte of
> + * bmc post code
> + */
> +const u8 seven_seg_bits[] = {
> +       0xFC, 0x60, 0xDA, 0xF2, 0x66, 0xB6, 0xBE, 0xE0,
> +       0xFE, 0xF6, 0xEE, 0x3E, 0x9C, 0x7A, 0x9E, 0x8E
> +       };
> +
> +/*
> + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
> + *      _       _   _                              _            _
> + *     |   |_  |_| |_  _   _   _   _   _   _   _  |_    _|  _| | |
> + *     |_  |_  |   |                               _|  |_| |_| | |
> + *
> + * data[7:1] = led[a:g]
> + * lookup table used for higher byte of bmc post code
> + */
> +const u8 special_seven_seg_bits[] = {
> +       0x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,
> +       0x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC
> +       };
> +
> +void update_postcode(char *buf)
> +{
> +       mutex_lock(&mutex);
> +       strncpy(curr_postcode, buf, sizeof(curr_postcode));
> +       mutex_unlock(&mutex);
> +       pc_valid = 1;
> +}
> +EXPORT_SYMBOL(update_postcode);
> +
> +/* convert postcode to led pattern
> + * 7-bits used for each 7-seg display and
> + * 1 bit used for the 'dot' on both digits.
> + *
> + *  @param N/A
> + *  @return N/A
> + */
> +static u16 postcode_to_led_signal(void)
> +{
> +       u8 low_display;
> +       u8 high_display;
> +       u16 led_value;
> +       char buf[3];
> +
> +       mutex_lock(&mutex);
> +       strncpy(buf, curr_postcode, sizeof(buf));
> +       mutex_unlock(&mutex);
> +
> +       low_display = seven_seg_bits[hex_to_bin(buf[2])];
> +
> +       high_display = (buf[0] == '1') ?
> +               special_seven_seg_bits[hex_to_bin(buf[1])] :
> +               seven_seg_bits[hex_to_bin(buf[1])];
> +
> +       led_value = low_display | (high_display << 8);
> +       if (buf[0] == '1') {
> +               led_value |= LED_DOT | (LED_DOT << 8);
> +       }
> +
> +       return led_value;
> +}
> +
> +static void update_sgpio(void)

Since you're no longer using the Serial GPIO peripheral, please rename
this to something more descriptive like "write_..._display"

> +{
> +       u16 led_signal;
> +       int i;
> +
> +       /* Convert two bytes of post code to 16 bit led pattern */
> +       led_signal = postcode_to_led_signal();
> +
> +       /* Set the clear signal to low */
> +       gpiod_set_value(clr_gpio, 0);
> +       udelay(1);
> +       /* Set the clear clear to high */
> +       gpiod_set_value(clr_gpio, 1);
> +       udelay(1);
> +
> +       /* Bitbang the 16 bit led pattern
> +        * 7-bits used for each 7-seg display
> +        * 1 bit used for the 'dot' on both digits
> +        */
> +       for (i = 0; i < 16; i++) {
> +               if (led_signal & 0x01) {
> +                       /* Set the data signal to high */
> +                       gpiod_set_value(data_gpio, 1);
> +               } else {
> +                       /* Set the data signal to low */
> +                       gpiod_set_value(data_gpio, 0);
> +               }
> +               udelay(1);
> +
> +               /* Set the clock signal to low */
> +               gpiod_set_value(clk_gpio, 0);
> +               udelay(1);

Please name this delay value as a constant (or make it configurable, up to you).

> +               /* Set the clock signal to high */
> +               gpiod_set_value(clk_gpio, 1);
> +               udelay(1);
> +
> +               led_signal >>= 1;
> +       }
> +}
> +
> +static void update_timer_handler(unsigned long data)
> +{
> +       if (pc_valid == 1) {
> +               update_sgpio();
> +       }
> +       mod_timer(&update_timer,
> +               jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
> +}
> +
> +static const struct of_device_id of_postcard_match[] = {
> +               { .compatible = "postcard-display" },
> +                       {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_postcard_match);
> +
> +static int postcard_probe(struct platform_device *pdev)
> +{
> +       int result;
> +       struct device *dev = &pdev->dev;
> +
> +       /* Requesting the clock gpio */
> +       clk_gpio = devm_gpiod_get(dev, CLOCK_GPIO_NAME,
> +               GPIOD_OUT_HIGH);
> +       if (IS_ERR(clk_gpio))
> +               return PTR_ERR(data_gpio);
> +
> +       /* Requesting the data gpio */
> +       data_gpio = devm_gpiod_get(dev, DATA_GPIO_NAME,
> +               GPIOD_OUT_HIGH);
> +       if (IS_ERR(data_gpio))
> +               return PTR_ERR(data_gpio);
> +
> +       /* Requesting the clear gpio */
> +       clr_gpio = devm_gpiod_get(dev, CLEAR_GPIO_NAME,
> +               GPIOD_OUT_HIGH);
> +       if (IS_ERR(clr_gpio))
> +               return PTR_ERR(clr_gpio);
> +
> +       /* Start timer to update post code every second */
> +       setup_timer(&update_timer, update_timer_handler, 0);
> +       result = mod_timer(&update_timer,
> +               jiffies + msecs_to_jiffies(POST_CODE_UPDATE_INTVL));
> +
> +       if (result)
> +               return result;
> +
> +       mutex_init(&mutex);
> +
> +       return 0;
> +}
> +
> +static void postcard_remove(struct platform_device *pdev)
> +{
> +       del_timer(&update_timer);
> +}
> +
> +static struct platform_driver postcard_display_driver = {
> +       .probe          = postcard_probe,
> +       .shutdown       = postcard_remove,
> +       .driver         = {
> +               .name   = "postcard-display",
> +               .of_match_table = of_postcard_match,
> +       },
> +};
> +
> +module_platform_driver(postcard_display_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
> +MODULE_DESCRIPTION("Post card display update driver");
> diff --git a/drivers/misc/update-postcard.h b/drivers/misc/update-postcard.h
> new file mode 100644
> index 0000000..ef82e9091d
> --- /dev/null
> +++ b/drivers/misc/update-postcard.h
> @@ -0,0 +1 @@
> +void update_postcode(char *buf);
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

cheers
xo
