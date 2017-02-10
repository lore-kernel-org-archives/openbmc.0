Return-Path: <jaghu@google.com>
Received: from mail-ua0-x230.google.com (mail-ua0-x230.google.com
 [IPv6:2607:f8b0:400c:c08::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKjtL2Zx3zDqBm
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 05:20:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="v3I/krZc"; 
 dkim-atps=neutral
Received: by mail-ua0-x230.google.com with SMTP id 35so34373497uak.1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 10:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZCKnaBQS0BxkDirZfwLI3HPQXfhBF10FNJqHCXF9g08=;
 b=v3I/krZcL6zmd7w4cRJenrg4+HHRJWCvIEKQWkxShq+2Ele69j/lOqBrs0KrlhuYPx
 QUAmmyk9Rwv/5colD2qlk6XHprztK/Aals1XizX6oBJKnYZpR8NOgOeK6sWSF33N9+Iz
 zdXGb2JP2fcd0lyK7LFocV5qxEAp0Rxg6SWllwJus1RfgeY8ilRH5BGFPqf8JvwhN7hp
 89GEaB9VICiLyug8zEnHeJyIZHG1sSfIcfbUM3lHUyl8fRlU8jNYJ5QRUq/zc30u5N9g
 YpRfKl/dum/BawKDAyqh4UPCx4/MGk9uVtpA9up+HcGcZnhfMerFB/PFVAH4zNDNhrKu
 zrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZCKnaBQS0BxkDirZfwLI3HPQXfhBF10FNJqHCXF9g08=;
 b=IbeXPmSKEpFzobDmP7+2pfSPBD2QPPqAlXMpjWCkebB0M0SbXQkZGYWQopEMamFkpx
 n/rDrZ23WtyuuwbPDBtbQSGjGNf4Gx7GC/obpv/KDlKiZDNb+w9En6s4HVge7KXDhar+
 1HOG24YIU5dOkPXRH//C+MgBBt6DU3912DXd3R8zdz+1Im4N1d94TWGGIoQJb4qvbFN5
 rqGr+n+lmiES22LJAbJuKJY+bmvOhOXSUwnJIUO5MT1kVS3rQx50RRHpccfypCbtZN+m
 AjLFxBB0/Jm7OVpSdvWIJ7E/2SOmPpQ0d3x1JaaS8jJKMhGTlBS+ge6fhGOTd8uqn6Vt
 2R3Q==
X-Gm-Message-State: AMke39lVQTzJftk1Y8HYNe9PyVuwmIef7mXZR2+M3vwqN5SsDC+0anzUTEt/E6Tg41rWnT5OBoI2h/feqvm8xF99
X-Received: by 10.159.36.209 with SMTP id 75mr4416075uar.51.1486750839596;
 Fri, 10 Feb 2017 10:20:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.107.77 with HTTP; Fri, 10 Feb 2017 10:20:19 -0800 (PST)
In-Reply-To: <20170210181943.31782-1-jaghu@google.com>
References: <20170210181943.31782-1-jaghu@google.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Fri, 10 Feb 2017 10:20:19 -0800
Message-ID: <CANsWYUW3sdbUguaOOMLkvbaTOHsCMBo8n0CDpVYiSkbZBuRThQ@mail.gmail.com>
Subject: Re: [PATCH linux v1] drivers: misc: Seven segment support
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
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
X-List-Received-Date: Fri, 10 Feb 2017 18:20:43 -0000

Hi Xo,
Please use this patch for the zaius bmc image

On Fri, Feb 10, 2017 at 10:19 AM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  .../devicetree/bindings/misc/seven-seg-gpio.txt    |  27 +++
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |   8 +
>  drivers/misc/Kconfig                               |  16 ++
>  drivers/misc/Makefile                              |   2 +
>  drivers/misc/seven_seg_disp.c                      | 201 ++++++++++++++++++++
>  drivers/misc/seven_seg_disp.h                      |  34 ++++
>  drivers/misc/seven_seg_gpio.c                      | 206 +++++++++++++++++++++
>  7 files changed, 494 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
>  create mode 100644 drivers/misc/seven_seg_disp.c
>  create mode 100644 drivers/misc/seven_seg_disp.h
>  create mode 100644 drivers/misc/seven_seg_gpio.c
>
> diff --git a/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt b/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
> new file mode 100644
> index 000000000000..248e3ecc538b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/seven-seg-gpio.txt
> @@ -0,0 +1,27 @@
> +This binding defines interface to add clock, data and clear GPIO lines required
> +for seven segment display support.
> +
> +Required properties:
> +- compatible : should be "seven-seg-gpio-dev".
> +- clock-gpios :  Should specify the GPIO pin connected to the Clock line on the
> +  hardware.
> +- data-gpios : Should specify the GPIO pin connected to Data line on the
> +  hardware.
> +- clear-gpios : Should specify the GPIO pin connected to Clear line on the
> +  hardware.
> +
> +Optional properties:
> +- refresh-interval-ms : The interval at which to refresh the display.
> +  If this property is not present, the default value is 1000.
> +
> +Examples:
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +seven-seg-disp {
> +       compatible = "seven-seg-gpio-dev";
> +       refresh-interval-ms = /bits/ 16 <600>;
> +       clock-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
> +       data-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
> +       clear-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> index e2195a641414..d70ede74735d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -74,6 +74,14 @@
>                         gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       seven-seg-disp {
> +               compatible = "seven-seg-gpio-dev";
> +               refresh-interval-ms = /bits/ 16 <600>;
> +               clock-gpios = <&gpio ASPEED_GPIO(J, 0) GPIO_ACTIVE_HIGH>;
> +               data-gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_HIGH>;
> +               clear-gpios = <&gpio ASPEED_GPIO(J, 1) GPIO_ACTIVE_HIGH>;
> +       };
>  };
>
>  &fmc {
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index c802d2245108..c2914476e49e 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -804,6 +804,14 @@ config PANEL_BOOT_MESSAGE
>           An empty message will only clear the display at driver init time. Any other
>           printf()-formatted message is valid with newline and escape codes.
>
> +config SEVEN_SEGMENT_DISPLAY
> +        tristate "Character driver for seven segment display support"
> +        help
> +          Character device driver which implements the user-space
> +          API for letting a user write to two 7-segment displays including
> +          any conversion methods necessary to map the user input
> +          to two 7-segment displays.
> +
>  config ASPEED_LPC_CTRL
>         depends on (ARCH_ASPEED || COMPILE_TEST) && REGMAP && MFD_SYSCON
>         bool "Aspeed BMC to HOST LPC bus controller"
> @@ -812,6 +820,14 @@ config ASPEED_LPC_CTRL
>           through ioctl()s, the driver aso provides a read/write interface to a
>           BMC ram region where host LPC read/write region can be buffered.
>
> +config SEVEN_SEGMENT_GPIO
> +        tristate "Platform driver to update seven segment display"
> +        depends on SEVEN_SEGMENT_DISPLAY
> +        help
> +          Platform device driver which provides an API for displaying on two
> +          7-segment displays, and implements the required bit-banging.
> +          The hardware assumed is 74HC164 wired to two 7-segment displays.
> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index cdcd1af48971..be1852bc3282 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -57,4 +57,6 @@ obj-$(CONFIG_ECHO)            += echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
> +obj-SEVEN_SEGMENT_DISPLAY      += seven_seg_disp.o
>  obj-$(CONFIG_ASPEED_LPC_CTRL)  += aspeed-lpc-ctrl.o
> +obj-SEVEN_SEGMENT_GPIO += seven_seg_gpio.o
> diff --git a/drivers/misc/seven_seg_disp.c b/drivers/misc/seven_seg_disp.c
> new file mode 100644
> index 000000000000..c5350c904188
> --- /dev/null
> +++ b/drivers/misc/seven_seg_disp.c
> @@ -0,0 +1,201 @@
> +/*
> + * Copyright (c) 2016 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/version.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/kdev_t.h>
> +#include <linux/fs.h>
> +#include <linux/uaccess.h>
> +#include <linux/ctype.h>
> +#include <linux/of.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +
> +#include "seven_seg_disp.h"
> +
> +#define LED_DOT 0x01
> +
> +/*
> + * 0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
> + *  _       _   _       _   _   _   _   _   _       _       _   _
> + * | |   |  _|  _| |_| |_  |_    | |_| |_| |_| |_  |    _| |_  |_
> + * |_|   | |_   _|   |  _| |_|   | |_|   | | | |_| |_  |_| |_  |
> + *
> + * data[7:1] = led[a:g]
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
> + */
> +const u8 special_seven_seg_bits[] = {
> +       0x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,
> +       0x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC
> +       };
> +
> +static dev_t seven_seg_devno;
> +static struct class *seven_seg_disp_class;
> +
> +static int seven_seg_disp_open(struct inode *inode, struct file *filp)
> +{
> +       struct seven_seg_disp_dev *disp_dev;
> +
> +       disp_dev = container_of(inode->i_cdev,
> +                                struct seven_seg_disp_dev, cdev);
> +       filp->private_data = disp_dev;
> +       return 0;
> +}
> +
> +static int seven_seg_disp_close(struct inode *inode, struct file *filp)
> +{
> +       filp->private_data = NULL;
> +       return 0;
> +}
> +
> +static ssize_t seven_seg_disp_read(struct file *filp, char __user *buf, size_t
> +                               len, loff_t *off)
> +{
> +       struct seven_seg_disp_dev *disp_dev = filp->private_data;
> +
> +       if (disp_dev->disp_data_valid)
> +               return -EINVAL;
> +
> +       if (copy_to_user(buf, disp_dev->seven_seg_disp_data_array,
> +                               MAX_DISP_CHAR_SIZE) != 0) {
> +               return -EFAULT;
> +       }
> +
> +       return 0;
> +}
> +
> +static u16 convert_to_disp_data(char *buf)
> +{
> +       u8 low_display;
> +       u8 high_display;
> +       u16 led_value;
> +
> +       low_display = seven_seg_bits[hex_to_bin(buf[2])];
> +
> +       high_display = (buf[0] == '1') ?
> +       special_seven_seg_bits[hex_to_bin(buf[1])] :
> +       seven_seg_bits[hex_to_bin(buf[1])];
> +
> +       led_value = low_display | (high_display << 8);
> +       if (buf[0] == '1')
> +               led_value |= LED_DOT | (LED_DOT << 8);
> +
> +       return led_value;
> +}
> +
> +static ssize_t seven_seg_disp_write(struct file *filp, const char __user *buf,
> +                               size_t len, loff_t *off)
> +{
> +       int length = len - 1;
> +       int i;
> +
> +       struct seven_seg_disp_dev *disp_dev = filp->private_data;
> +
> +       if (length != MAX_DISP_CHAR_SIZE)
> +               return -EINVAL;
> +
> +       if (copy_from_user(disp_dev->seven_seg_disp_data_array,
> +                               buf, length) != 0) {
> +               return -EFAULT;
> +       }
> +
> +       for (i = 0; i < MAX_DISP_CHAR_SIZE; i++) {
> +               if (!isxdigit(disp_dev->seven_seg_disp_data_array[i]))
> +                       return -EINVAL;
> +       }
> +
> +       disp_dev->current_seven_seg_disp_data = convert_to_disp_data(
> +                       disp_dev->seven_seg_disp_data_array);
> +       disp_dev->disp_data_valid = true;
> +       disp_dev->update_seven_seg_data(&disp_dev->parent,
> +                       disp_dev->current_seven_seg_disp_data);
> +
> +       return len;
> +}
> +
> +static const struct file_operations seven_seg_disp_fops = {
> +
> +       .owner = THIS_MODULE,
> +       .open = seven_seg_disp_open,
> +       .release = seven_seg_disp_close,
> +       .read = seven_seg_disp_read,
> +       .write = seven_seg_disp_write
> +};
> +
> +void seven_seg_rem_cdev(struct seven_seg_disp_dev *disp_dev)
> +{
> +       cdev_del(&disp_dev->cdev);
> +       device_destroy(seven_seg_disp_class, seven_seg_devno);
> +}
> +
> +int seven_seg_setup_cdev(struct seven_seg_disp_dev *disp_dev,
> +       void (*update_disp_data)(struct device *, u16 data))
> +{
> +       struct device *dev;
> +       int err;
> +
> +       dev = device_create(seven_seg_disp_class, &disp_dev->parent,
> +                       seven_seg_devno,
> +                       NULL, "seven_seg_disp_val");
> +       if (dev == NULL)
> +               return -EIO;
> +       disp_dev->dev = dev;
> +       disp_dev->update_seven_seg_data = update_disp_data;
> +       disp_dev->disp_data_valid = false;
> +
> +       cdev_init(&disp_dev->cdev, &seven_seg_disp_fops);
> +       err = cdev_add(&disp_dev->cdev, seven_seg_devno, 1);
> +       if (err)
> +               device_destroy(seven_seg_disp_class, seven_seg_devno);
> +       return err;
> +}
> +
> +static int __init seven_seg_disp_init(void)
> +{
> +       int err = alloc_chrdev_region(&seven_seg_devno, 0, 1, "disp_state");
> +
> +       if (err < 0)
> +               return err;
> +
> +       seven_seg_disp_class = class_create(THIS_MODULE, "disp_state");
> +       if (seven_seg_disp_class == NULL)
> +               goto unreg_chrdev;
> +
> +       return 0;
> +
> +unreg_chrdev:
> +       unregister_chrdev_region(seven_seg_devno, 1);
> +       return -EIO;
> +}
> +
> +static void __exit seven_seg_disp_exit(void)
> +{
> +       class_destroy(seven_seg_disp_class);
> +       unregister_chrdev_region(seven_seg_devno, 1);
> +}
> +
> +module_init(seven_seg_disp_init);
> +module_exit(seven_seg_disp_exit);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
> +MODULE_DESCRIPTION("Seven segment display character driver");
> diff --git a/drivers/misc/seven_seg_disp.h b/drivers/misc/seven_seg_disp.h
> new file mode 100644
> index 000000000000..0ebed0802747
> --- /dev/null
> +++ b/drivers/misc/seven_seg_disp.h
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (c) 2016 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef SEVEN_SEG_DISP_H
> +#define SEVEN_SEG_DISP_H
> +
> +#include <linux/device.h>
> +#include <linux/cdev.h>
> +
> +#define MAX_DISP_CHAR_SIZE 3
> +
> +#define DEFAULT_REFRESH_INTERVAL_MS 600
> +
> +struct seven_seg_disp_dev {
> +       bool disp_data_valid;
> +       u16 current_seven_seg_disp_data;
> +       char seven_seg_disp_data_array[MAX_DISP_CHAR_SIZE];
> +       struct device parent;
> +       struct device *dev;
> +       struct cdev cdev;
> +       void (*update_seven_seg_data)(struct device *, u16 data);
> +};
> +
> +int seven_seg_setup_cdev(struct seven_seg_disp_dev *disp_dev,
> +       void (*update_disp_data)(struct device *, u16 data));
> +
> +void seven_seg_rem_cdev(struct seven_seg_disp_dev *disp_dev);
> +
> +#endif
> diff --git a/drivers/misc/seven_seg_gpio.c b/drivers/misc/seven_seg_gpio.c
> new file mode 100644
> index 000000000000..3dcb9034e263
> --- /dev/null
> +++ b/drivers/misc/seven_seg_gpio.c
> @@ -0,0 +1,206 @@
> +/*
> + * Copyright (C) 2016 Google, Inc
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or later as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +#include <linux/sizes.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/uaccess.h>
> +#include <linux/mutex.h>
> +#include <linux/of_platform.h>
> +#include <linux/gpio/consumer.h>
> +
> +#include "seven_seg_disp.h"
> +
> +#define DELAY_INTVL_US 1
> +
> +#define CLOCK_GPIO_NAME "clock"
> +#define DATA_GPIO_NAME "data"
> +#define CLEAR_GPIO_NAME "clear"
> +
> +struct seven_seg_gpio_info {
> +       u16 curr_disp_value;
> +       u16 refresh_interval;
> +       struct timer_list update_timer;
> +       struct gpio_desc *clock_gpio;
> +       struct gpio_desc *data_gpio;
> +       struct gpio_desc *clear_gpio;
> +};
> +
> +static void update_seven_seg_gpio_data(struct device *dev, u16 data)
> +{
> +       struct platform_device *pdev;
> +       struct seven_seg_gpio_info *gpio_info;
> +
> +       pdev = container_of(dev, struct platform_device, dev);
> +       if (pdev == NULL) {
> +               pr_err("invalid NULL platform_device\n");
> +               return;
> +       }
> +
> +       gpio_info = platform_get_drvdata(pdev);
> +       if (gpio_info == NULL) {
> +               pr_err("invalid NULL gpio_info\n");
> +               return;
> +       }
> +
> +       gpio_info->curr_disp_value = data;
> +}
> +
> +static void clear_seven_seg_gpio_data(struct device *dev, u16 data)
> +{
> +       struct platform_device *pdev;
> +       struct seven_seg_gpio_info *gpio_info;
> +
> +       pdev = container_of(dev, struct platform_device, dev);
> +       if (pdev == NULL) {
> +               pr_err("invalid NULL platform_device\n");
> +               return;
> +       }
> +
> +       gpio_info = platform_get_drvdata(pdev);
> +       if (gpio_info == NULL) {
> +               pr_err("invalid NULL gpio_info\n");
> +               return;
> +       }
> +
> +       gpio_info->curr_disp_value = 0;
> +}
> +
> +static void send_seven_seg_gpio_data(u16 disp_data,
> +               struct seven_seg_gpio_info *gpio_info)
> +{
> +       int i;
> +
> +       gpiod_set_value(gpio_info->clear_gpio, 0);
> +       udelay(DELAY_INTVL_US);
> +       gpiod_set_value(gpio_info->clear_gpio, 1);
> +       udelay(DELAY_INTVL_US);
> +
> +       for (i = 0; i < 16; i++) {
> +               if (disp_data & 0x01)
> +                       gpiod_set_value(gpio_info->data_gpio, 1);
> +               else
> +                       gpiod_set_value(gpio_info->data_gpio, 0);
> +
> +               udelay(DELAY_INTVL_US);
> +
> +               gpiod_set_value(gpio_info->clock_gpio, 0);
> +               udelay(DELAY_INTVL_US);
> +               gpiod_set_value(gpio_info->clock_gpio, 1);
> +               udelay(DELAY_INTVL_US);
> +
> +               disp_data >>= 1;
> +       }
> +}
> +
> +static void disp_refresh_timer_handler(unsigned long data)
> +{
> +       u16 disp_data;
> +       struct seven_seg_gpio_info *gpio_info =
> +               (struct seven_seg_gpio_info *)data;
> +       disp_data = gpio_info->curr_disp_value;
> +
> +       send_seven_seg_gpio_data(disp_data, gpio_info);
> +       mod_timer(&gpio_info->update_timer,
> +               jiffies + msecs_to_jiffies(gpio_info->refresh_interval));
> +}
> +
> +static const struct of_device_id of_seven_seg_gpio_match[] = {
> +               { .compatible = "seven-seg-gpio-dev" },
> +               {},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_seven_seg_gpio_match);
> +
> +static int seven_seg_gpio_probe(struct platform_device *pdev)
> +{
> +       u16 interval;
> +       int result;
> +       struct seven_seg_gpio_info *gpio_info;
> +       struct device *dev = &pdev->dev;
> +       struct seven_seg_disp_dev *disp_dev;
> +
> +       gpio_info = devm_kzalloc(dev,
> +                       sizeof(struct seven_seg_gpio_info),
> +                       GFP_KERNEL);
> +       if (gpio_info == NULL)
> +               return -ENOMEM;
> +
> +       /* Requesting the clock gpio */
> +       gpio_info->clock_gpio = devm_gpiod_get(dev, CLOCK_GPIO_NAME,
> +               GPIOD_OUT_HIGH);
> +       if (IS_ERR(gpio_info->clock_gpio))
> +               return PTR_ERR(gpio_info->clock_gpio);
> +
> +       /* Requesting the data gpio */
> +       gpio_info->data_gpio = devm_gpiod_get(dev, DATA_GPIO_NAME,
> +               GPIOD_OUT_HIGH);
> +       if (IS_ERR(gpio_info->data_gpio))
> +               return PTR_ERR(gpio_info->data_gpio);
> +
> +       /* Requesting the clear gpio */
> +       gpio_info->clear_gpio = devm_gpiod_get(dev, CLEAR_GPIO_NAME,
> +               GPIOD_OUT_HIGH);
> +       if (IS_ERR(gpio_info->clear_gpio))
> +               return PTR_ERR(gpio_info->clear_gpio);
> +
> +       result = of_property_read_u16(pdev->dev.of_node,
> +               "refresh-interval-ms", &interval);
> +       gpio_info->refresh_interval = result ? DEFAULT_REFRESH_INTERVAL_MS :
> +               interval;
> +
> +       /* Start timer to update seven segment display every second */
> +       setup_timer(&gpio_info->update_timer, disp_refresh_timer_handler,
> +                       (unsigned long)gpio_info);
> +       result = mod_timer(&gpio_info->update_timer,
> +                       jiffies +
> +                       msecs_to_jiffies(gpio_info->refresh_interval));
> +       if (result)
> +               return result;
> +
> +       gpio_info->curr_disp_value = 0;
> +
> +       platform_set_drvdata(pdev, gpio_info);
> +
> +       disp_dev = devm_kzalloc(dev, sizeof(struct seven_seg_disp_dev),
> +                               GFP_KERNEL);
> +       disp_dev->parent = *dev;
> +       seven_seg_setup_cdev(disp_dev, &update_seven_seg_gpio_data);
> +       return 0;
> +}
> +
> +static int seven_seg_gpio_remove(struct platform_device *pdev)
> +{
> +       struct seven_seg_gpio_info *gpio_info = platform_get_drvdata(pdev);
> +       struct seven_seg_disp_dev *disp_dev =
> +                               container_of(&pdev->dev,
> +                               struct seven_seg_disp_dev, parent);
> +       seven_seg_rem_cdev(disp_dev);
> +       del_timer_sync(&gpio_info->update_timer);
> +       platform_set_drvdata(pdev, NULL);
> +       return 0;
> +}
> +
> +static struct platform_driver seven_seg_gpio_driver = {
> +       .probe          = seven_seg_gpio_probe,
> +       .remove         = seven_seg_gpio_remove,
> +       .driver         = {
> +               .name   = "seven-seg-gpio",
> +               .of_match_table = of_seven_seg_gpio_match,
> +       },
> +};
> +
> +module_platform_driver(seven_seg_gpio_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>");
> +MODULE_DESCRIPTION("Seven segment display driver using GPIO config");
> --
> 2.11.0.483.g087da7b7c-goog
>
