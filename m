Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sw61f2QSSzDt1l
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 10:11:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=X4WPWTlJ; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id 83so3209330vkd.0
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 16:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=YpJO+TtgwUHqIht/Rsp64/djmNsxNl1TwFlTa71aKc8=;
 b=X4WPWTlJFKHO8dJItPiWMSRfy6ZArvPPq+zhK96iQsCJ4QKyA695+skPkELrcTP4GV
 CCTX1Bpgdazu04AkbgE0ZooZu1rnoteltfcE7Sm0zyVXt5Y1FoSIv82uLkk6FV9kI0ZB
 vTCqWqRH/oKhSGbvf9M+H4y6ze6FNm1J1vunaXCFCzFwGELH7ChCpQJw3lgW1TRyyaeH
 iDaMfm5XjpVmxlmYu8iwC5GODGTMBRwAYK1+QAf9PCAlMMbR68oQbNc2Jnjz+szNeY+4
 7cxNnQMhyVzvTphZZEkLdgmFR4QQ8UQEIpsGyLunMV06bOGSAS8HkluSxrh8abdo2qOz
 bGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=YpJO+TtgwUHqIht/Rsp64/djmNsxNl1TwFlTa71aKc8=;
 b=mEJQgPa/uX3zGnntMvRSSBv6vhtxp+gYjb3fLYhXCuOjd65FVdz7dlYSqjlxkrucpH
 WFOSFC64J6xET5l7KgF8N6G1AmC+YW8F/8gLTKsuQoNorFq97gKM4Ey6A36RjQrJHMSQ
 LMxg+FUFpVl59hUQYJXXQrfmRGysW2Te+bk0dhJc4/SErCWDe5/R4A4jQPvi6WPSpWII
 7LHo7vNWoZj5Y9PlQ8hBbgsqB33HSGhf5NugIV7oolPCo+wssvswFPSQ+qccH2kyUm3x
 emMD+H6OBSCisam0oVYfAtkkXxJcw3SJC4Z8tk4H3NvTn9pDeinam8IDGv1Y/f8j+XCP
 vNgg==
X-Gm-Message-State: AA6/9Rn/Q91xRF/QShggEKn2WgARQqBuHbs+cT1CjlPBdw5SvMrre60l+md+Jjo5QJdcO55fIJw03fLw+XPwcw==
X-Received: by 10.31.140.147 with SMTP id o141mr5729477vkd.149.1476400307054; 
 Thu, 13 Oct 2016 16:11:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Thu, 13 Oct 2016 16:11:26 -0700 (PDT)
In-Reply-To: <1476319305-29981-2-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-2-git-send-email-jaghu@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Oct 2016 10:11:26 +1100
X-Google-Sender-Auth: 0f_nvveLEivb749hMfcB0SObpA8
Message-ID: <CACPK8Xc6bTOE+rX=jZStZaHf3CxJ9Gp7beGyOYwtdwm7-943Bg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Oct 2016 23:11:51 -0000

Hello,

On Thu, Oct 13, 2016 at 11:41 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Platform driver to periodically update the display on the POST card.
> POST card hardware assumed is 74HC164 wired to two 7-segment displays.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>

A good start. In addition to the other reviews, I have some comments below.

> ---
>  drivers/misc/Kconfig           |   6 ++
>  drivers/misc/Makefile          |   1 +
>  drivers/misc/update-postcard.c | 219 +++++++++++++++++++++++++++++++++++++++++
>  drivers/misc/update-postcard.h |   1 +
>  4 files changed, 227 insertions(+)
>  create mode 100644 drivers/misc/update-postcard.c
>  create mode 100644 drivers/misc/update-postcard.h
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4617ddc..d65b83f 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
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

You need a copyright header here.

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

Kernel style for multi-line comments is like this:

/*
 * convert postcode to led pattern
 *  * 7-bits used for each 7-seg display and
 *  * 1 bit used for the 'dot' on both digits.
 */

Drop the @param/@return annotations.

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

This could be clearer if you used if()

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

These comments are unnecessary - it's obvious what the code is doing.

> +               }
> +               udelay(1);
> +
> +               /* Set the clock signal to low */
> +               gpiod_set_value(clk_gpio, 0);
> +               udelay(1);
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

We need to come up with a better string here. Along the lines of your
other reviews, make it generic.

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

I think we want del_timer_sync here.

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

Kernel style is to not have headers unless there is a requirement to
export outside of a file. This should go in the c file.

Cheers,

Joel
