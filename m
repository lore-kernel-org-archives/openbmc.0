Return-Path: <raltherr@google.com>
Received: from mail-yw0-x22c.google.com (mail-yw0-x22c.google.com
 [IPv6:2607:f8b0:4002:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syTTP374wzDt3H
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 06:55:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=SY+9vFmi; 
 dkim-atps=neutral
Received: by mail-yw0-x22c.google.com with SMTP id t193so124540087ywc.2
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=dpXI3XMLGI22ztpXXEmqMeRckK2eHsyhM13Lo2weQwk=;
 b=SY+9vFmiFP8/ordp5uawYH+FZwOAUmhILabbBQVDi6SWiTL1Ocb56EYtU8XdY5Nr2/
 HKVokZy+ILGrLviAGZqjCYxmwRQ9T+TgES+dCIWqYRqkCf1hHv/sn5WrNKP/o9OH+eR/
 eIsE/29ykh3NCC2hkZ1ZMRNkhQdmwXxwN5jyK75O3LQGUQ7yj+5GCnv0gvK807saPWsR
 vOHAk5dDNzOqBsm2uDLRXQx55Hb2LvyggzF3jsysb/mWbEpRh/ZC6RkfPCKsIyaq3Xxa
 gKIKXur1EvGVqL5FHuNgygnKSeWlireLFAa0lQyA1dSGT8ZXsdXeenJLrZE2pvU7GEJ6
 78CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=dpXI3XMLGI22ztpXXEmqMeRckK2eHsyhM13Lo2weQwk=;
 b=G0nKpOslQsoU9kZTMWHPSvF8IwG94X1yWgS9NjHG05jTpa2uQJHEBYdn0WTIvBeJjE
 U8vxKEl1XH7+ljlVQ64sQsFwwghU07b6bAnyUgk6jF6UhWgRfXGHMVP+Wf7RizZhtgLm
 aIqzPbUrloPl3w45IRIgRG67leuCDAXrm1R10LJtVnQlMC4po9MrwADSQGcu4awkCVjf
 T1YPJQt4PxB+AQCqrLH1bor4JEvSqgJvtFLXw+kes90R6J1csN2z0hbmabzVigZbmmBs
 mzCy/LUYNgaxlC9SCCbX8tq+0Qzxl1EcIcfs4apUs6isxK1+Rv6fHv3FceQPPM0l6P4a
 yNQg==
X-Gm-Message-State: AA6/9RlJc6AcRwyV1IL3SrNxQse/mc440YDfoyjd8WD8EaJhqSSFQWemUO+0TnX73UcnZxR1MHCR4aCUeF61N8hg
X-Received: by 10.13.224.1 with SMTP id j1mr25657124ywe.117.1476734134386;
 Mon, 17 Oct 2016 12:55:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Mon, 17 Oct 2016 12:55:33 -0700 (PDT)
In-Reply-To: <1476724248-15796-1-git-send-email-jaghu@google.com>
References: <1476724248-15796-1-git-send-email-jaghu@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Mon, 17 Oct 2016 12:55:33 -0700
Message-ID: <CAPLgG=mXs8wajUe4z9+Dv1JHiTm2Mi+F1z2QgNjzQbzewej8=g@mail.gmail.com>
Subject: Re: [PATCH linux v2 1/3] drivers: misc: Character driver for seven
 segment display
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Xo Wang <xow@google.com>
Content-Type: multipart/alternative; boundary=94eb2c062e9e829cc3053f14f503
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
X-List-Received-Date: Mon, 17 Oct 2016 19:55:38 -0000

--94eb2c062e9e829cc3053f14f503
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 17, 2016 at 10:10 AM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> The character device driver implements the user-space API for letting
> a user write to the display including any conversion methods necessary
> to map the user input to a 7-segment display.
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  drivers/misc/Kconfig          |   5 ++
>  drivers/misc/Makefile         |   1 +
>  drivers/misc/seven_seg_disp.c | 192 ++++++++++++++++++++++++++++++
> ++++++++++++
>  drivers/misc/seven_seg_gen.h  |  32 +++++++
>  4 files changed, 230 insertions(+)
>  create mode 100644 drivers/misc/seven_seg_disp.c
>  create mode 100644 drivers/misc/seven_seg_gen.h
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4617ddc..cf07817 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -804,6 +804,11 @@ config PANEL_BOOT_MESSAGE
>           An empty message will only clear the display at driver init
> time. Any other
>           printf()-formatted message is valid with newline and escape
> codes.
>
> +config SEVEN_SEGMENT_DISPLAY
> +       tristate "Character driver for seven segment display support"
> +       help
> +         Character driver for seven segment display support
> +
>  config ASPEED_BT_IPMI_HOST
>         tristate "BT IPMI host driver"
>         help
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 724861b..718dc2b 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)            += echo/
>  obj-$(CONFIG_VEXPRESS_SYSCFG)  += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
> +obj-$(CONFIG_SEVEN_SEGMENT_DISPLAY)    += seven_seg_disp.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
> diff --git a/drivers/misc/seven_seg_disp.c b/drivers/misc/seven_seg_disp.c
> new file mode 100644
> index 0000000..88df4a0
> --- /dev/null
> +++ b/drivers/misc/seven_seg_disp.c
> @@ -0,0 +1,192 @@
> +/*
> + * Seven segment display character driver
> + * * Copyright (c) 2016 Google, Inc
> + *
> + * * This program is free software; you can redistribute it and/or modify
> + * * it under the terms of the GNU General Public License version 2 as
> + * * published by the Free Software Foundation.
> + *
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
> +
> +#include "seven_seg_gen.h"
> +
> +#define MAX_DISP_CHAR_SIZE 3
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
> +static ssize_t seven_seg_disp_read(struct file *filp, char __user *buf,
> size_t
> +                               len, loff_t *off)
> +{
>
May as well return the current value to them.


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
> +       if (buf[0] == '1') {
> +               led_value |= LED_DOT | (LED_DOT << 8);
> +       }
> +
> +       return led_value;
> +}
> +
> +static ssize_t seven_seg_disp_write(struct file *filp, const char __user
> *buf,
> +                               size_t len, loff_t *off)
> +{
> +       char tmp[MAX_DISP_CHAR_SIZE];
> +       int length = len - 1;
> +       int i;
> +       u8 result;
> +
> +       struct seven_seg_disp_dev *disp_dev;
> +
> +       if (length != MAX_DISP_CHAR_SIZE) {
> +               return -EINVAL;
> +       }
> +
> +       if (copy_from_user(tmp, buf, length) != 0) {
> +               return -EFAULT;
> +       }
> +
> +       for (i = 0; i < MAX_DISP_CHAR_SIZE; i++) {
>
Only check the bytes actually provided by the user.  If they do a 1-byte
write, you'll read uninit data.


> +               if (!isxdigit(tmp[i]))
> +                       return -EINVAL;
> +       }
> +
> +       result = convert_to_disp_data(tmp);
>
Pick a more descriptive name than 'result' and 'tmp'.  Describe what the
variable contains.


> +
> +       disp_dev = filp->private_data;
> +       disp_dev->update_seven_seg_data(&disp_dev->parent, result);
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
> +void rem_cdev(struct seven_seg_disp_dev *disp_dev)
> +{
> +       cdev_del(&disp_dev->cdev);
> +       device_destroy(seven_seg_disp_class, seven_seg_devno);
> +}
> +
> +int setup_cdev(struct device parent,
> +       struct seven_seg_disp_dev *disp_dev,
> +       void (*update_disp_data)(struct device *, u16 data))
> +{
> +       struct device *dev;
> +       int err;
> +
> +       dev = device_create(seven_seg_disp_class, &parent,
> seven_seg_devno,
> +                       NULL, "seven_seg_disp_val");
> +       if (dev == NULL)
> +               return -1;
> +       disp_dev->parent = parent;
> +       disp_dev->dev = dev;
> +       disp_dev->update_seven_seg_data = update_disp_data;
> +       cdev_init(&disp_dev->cdev, &seven_seg_disp_fops);
> +       disp_dev->cdev.ops = &seven_seg_disp_fops;
> +       err = cdev_add(&disp_dev->cdev, seven_seg_devno, 1);
> +       if (err)
> +               device_destroy(seven_seg_disp_class, seven_seg_devno);
> +       return err;
> +}
> +
> +static int __init seven_seg_disp_init(void)
> +{
> +       if (alloc_chrdev_region(&seven_seg_devno, 0, 1, "disp_state") <
> 0) {
> +               return -1;
> +       }
> +
> +       seven_seg_disp_class = class_create(THIS_MODULE, "disp_state");
> +       if (seven_seg_disp_class == NULL) {
> +               goto unregister;
> +               return -1;
> +       }
> +
> +unregister:
> +       unregister_chrdev_region(seven_seg_devno, 1);
> +       return -1;
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
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
> >");
> +MODULE_DESCRIPTION("Seven segment display character driver");
> diff --git a/drivers/misc/seven_seg_gen.h b/drivers/misc/seven_seg_gen.h
> new file mode 100644
> index 0000000..5748a18
> --- /dev/null
> +++ b/drivers/misc/seven_seg_gen.h
>

Why is this header a different name from the .c?


> @@ -0,0 +1,32 @@
> +/*
> + * Seven segment display support
> + * * Copyright (c) 2016 Google, Inc
> + *
> + * * This program is free software; you can redistribute it and/or modify
> + * * it under the terms of the GNU General Public License version 2 as
> + * * published by the Free Software Foundation.
> + *
> + */
> +
> +#ifndef SEVEN_SEG_H
> +#define SEVEN_SEG_H
>

Guards don't match header name.


> +
> +#include <linux/device.h>
> +#include <linux/cdev.h>
> +
> +#define DEFAULT_REFRESH_INTERVAL 1000
>

This doesn't seem to be used by any of the APIs provided.


> +
> +struct seven_seg_disp_dev {
> +       struct device parent;
> +       struct device *dev;
> +       struct cdev cdev;
> +       void (*update_seven_seg_data)(struct device *, u16 data);
> +};
> +
> +int setup_cdev(struct device parent,
> +       struct seven_seg_disp_dev *disp_dev,
> +       void (*update_disp_data)(struct device *, u16 data));
>

Way too generic of a method name.  This name will be exposed in any .c that
includes this header.  Pick something that describes what it is doing _and_
what subsystem it belongs to.


> +
> +void rem_cdev(struct seven_seg_disp_dev *disp_dev);
> +
> +#endif
> --
> 2.8.0.rc3.226.g39d4020
>
>

--94eb2c062e9e829cc3053f14f503
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 17, 2016 at 10:10 AM, Jaghathiswari Rankappagounder Nataraj=
an <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_bla=
nk">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">The character device driver implements the user-space API for letting<br>
a user write to the display including any conversion methods necessary<br>
to map the user input to a 7-segment display.<br>
<br>
Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailt=
o:jaghu@google.com">jaghu@google.com</a>&gt;<br>
---<br>
=C2=A0drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0=
5 ++<br>
=C2=A0drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
1 +<br>
=C2=A0drivers/misc/seven_seg_disp.c | 192 ++++++++++++++++++++++++++++++<wb=
r>++++++++++++<br>
=C2=A0drivers/misc/seven_seg_gen.h=C2=A0 |=C2=A0 32 +++++++<br>
=C2=A04 files changed, 230 insertions(+)<br>
=C2=A0create mode 100644 drivers/misc/seven_seg_disp.c<br>
=C2=A0create mode 100644 drivers/misc/seven_seg_gen.h<br>
<br>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig<br>
index 4617ddc..cf07817 100644<br>
--- a/drivers/misc/Kconfig<br>
+++ b/drivers/misc/Kconfig<br>
@@ -804,6 +804,11 @@ config PANEL_BOOT_MESSAGE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 An empty message will only clear the dis=
play at driver init time. Any other<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf()-formatted message is valid with=
 newline and escape codes.<br>
<br>
+config SEVEN_SEGMENT_DISPLAY<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Character driver for seven segme=
nt display support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Character driver for seven segment displ=
ay support<br>
+<br>
=C2=A0config ASPEED_BT_IPMI_HOST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tristate &quot;BT IPMI host driver&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile<br>
index 724861b..718dc2b 100644<br>
--- a/drivers/misc/Makefile<br>
+++ b/drivers/misc/Makefile<br>
@@ -57,4 +57,5 @@ obj-$(CONFIG_ECHO)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D echo/<br>
=C2=A0obj-$(CONFIG_VEXPRESS_SYSCFG)=C2=A0 +=3D vexpress-syscfg.o<br>
=C2=A0obj-$(CONFIG_CXL_BASE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D cxl/<br>
=C2=A0obj-$(CONFIG_PANEL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D panel.o<br>
+obj-$(CONFIG_SEVEN_SEGMENT_<wbr>DISPLAY)=C2=A0 =C2=A0 +=3D seven_seg_disp.=
o<br>
=C2=A0obj-$(CONFIG_ASPEED_BT_IPMI_<wbr>HOST)=C2=A0 =C2=A0 =C2=A0 +=3D bt-ho=
st.o<br>
diff --git a/drivers/misc/seven_seg_disp.<wbr>c b/drivers/misc/seven_seg_di=
sp.<wbr>c<br>
new file mode 100644<br>
index 0000000..88df4a0<br>
--- /dev/null<br>
+++ b/drivers/misc/seven_seg_disp.<wbr>c<br>
@@ -0,0 +1,192 @@<br>
+/*<br>
+ * Seven segment display character driver<br>
+ * * Copyright (c) 2016 Google, Inc<br>
+ *<br>
+ * * This program is free software; you can redistribute it and/or modify<=
br>
+ * * it under the terms of the GNU General Public License version 2 as<br>
+ * * published by the Free Software Foundation.<br>
+ *<br>
+ */<br>
+<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/version.h&gt;<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/types.h&gt;<br>
+#include &lt;linux/kdev_t.h&gt;<br>
+#include &lt;linux/fs.h&gt;<br>
+#include &lt;linux/uaccess.h&gt;<br>
+#include &lt;linux/ctype.h&gt;<br>
+<br>
+#include &quot;seven_seg_gen.h&quot;<br>
+<br>
+#define MAX_DISP_CHAR_SIZE 3<br>
+<br>
+#define LED_DOT 0x01<br>
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
+ */<br>
+const u8 special_seven_seg_bits[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00x00, 0x9C, 0x1E, 0xCE, 0x8E, 0x02, 0x02, 0x02,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A00x02, 0x02, 0x02, 0x02, 0xB6, 0x7A, 0x7A, 0xEC<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
+<br>
+static dev_t seven_seg_devno;<br>
+static struct class *seven_seg_disp_class;<br>
+<br>
+static int seven_seg_disp_open(struct inode *inode, struct file *filp)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct seven_seg_disp_dev *disp_dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev =3D container_of(inode-&gt;i_cdev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct seven_seg_disp_dev, cdev);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0filp-&gt;private_data =3D disp_dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int seven_seg_disp_close(struct inode *inode, struct file *filp)<br=
>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0filp-&gt;private_data =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static ssize_t seven_seg_disp_read(struct file *filp, char __user *buf, si=
ze_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len, loff_t *off)<br>
+{<br>
</blockquote><div>May as well return the current value to them.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn 0;<br>
+}<br>
+<br>
+static u16 convert_to_disp_data(char *buf)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 low_display;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 high_display;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 led_value;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0low_display =3D seven_seg_bits[hex_to_bin(buf[<=
wbr>2])];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0high_display =3D (buf[0] =3D=3D &#39;1&#39;) ?<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0special_seven_seg_bits[hex_to_<wbr>bin(buf[1])]=
 :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0seven_seg_bits[hex_to_bin(buf[<wbr>1])];<br>
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
+static ssize_t seven_seg_disp_write(struct file *filp, const char __user *=
buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len, loff_t *off)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmp[MAX_DISP_CHAR_SIZE];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int length =3D len - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 result;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct seven_seg_disp_dev *disp_dev;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (length !=3D MAX_DISP_CHAR_SIZE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(tmp, buf, length) !=3D 0) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; MAX_DISP_CHAR_SIZE; i++) {=
<br></blockquote><div>Only check the bytes actually provided by the user.=
=C2=A0 If they do a 1-byte write, you&#39;ll read uninit data.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!isxdigit(tmp[i=
]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D convert_to_disp_data(tmp);<br></bloc=
kquote><div>Pick a more descriptive name than &#39;result&#39; and &#39;tmp=
&#39;.=C2=A0 Describe what the variable contains.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev =3D filp-&gt;private_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev-&gt;update_seven_seg_<wbr>data(&amp;di=
sp_dev-&gt;parent, result);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static const struct file_operations seven_seg_disp_fops =3D {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D seven_seg_disp_open,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.release =3D seven_seg_disp_close,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D seven_seg_disp_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D seven_seg_disp_write<br>
+};<br>
+<br>
+void rem_cdev(struct seven_seg_disp_dev *disp_dev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_del(&amp;disp_dev-&gt;cdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(seven_seg_disp_<wbr>class, seven=
_seg_devno);<br>
+}<br>
+<br>
+int setup_cdev(struct device parent,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct seven_seg_disp_dev *disp_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*update_disp_data)(struct device *, u16 d=
ata))<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dev =3D device_create(seven_seg_disp_<wbr>class=
, &amp;parent, seven_seg_devno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0NULL, &quot;seven_seg_disp_val&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dev =3D=3D NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev-&gt;parent =3D parent;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev-&gt;dev =3D dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev-&gt;update_seven_seg_<wbr>data =3D upd=
ate_disp_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_init(&amp;disp_dev-&gt;cdev, &amp;seven_se=
g_disp_fops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0disp_dev-&gt;cdev.ops =3D &amp;seven_seg_disp_f=
ops;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D cdev_add(&amp;disp_dev-&gt;cdev, seven_=
seg_devno, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(seve=
n_seg_disp_<wbr>class, seven_seg_devno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
+}<br>
+<br>
+static int __init seven_seg_disp_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (alloc_chrdev_region(&amp;seven_<wbr>seg_dev=
no, 0, 1, &quot;disp_state&quot;) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0seven_seg_disp_class =3D class_create(THIS_MODU=
LE, &quot;disp_state&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (seven_seg_disp_class =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unregister;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+unregister:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_region(<wbr>seven_seg_devno, =
1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+}<br>
+<br>
+static void __exit seven_seg_disp_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(seven_seg_disp_<wbr>class);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_region(<wbr>seven_seg_devno, =
1);<br>
+}<br>
+<br>
+module_init(seven_seg_disp_<wbr>init);<br>
+module_exit(seven_seg_disp_<wbr>exit);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D=
"mailto:jaghu@google.com">jaghu@google.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;Seven segment display character driver&quot;);<br=
>
diff --git a/drivers/misc/seven_seg_gen.h b/drivers/misc/seven_seg_gen.h<br=
>
new file mode 100644<br>
index 0000000..5748a18<br>
--- /dev/null<br>
+++ b/drivers/misc/seven_seg_gen.h<br></blockquote><div><br></div><div>Why =
is this header a different name from the .c?</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
@@ -0,0 +1,32 @@<br>
+/*<br>
+ * Seven segment display support<br>
+ * * Copyright (c) 2016 Google, Inc<br>
+ *<br>
+ * * This program is free software; you can redistribute it and/or modify<=
br>
+ * * it under the terms of the GNU General Public License version 2 as<br>
+ * * published by the Free Software Foundation.<br>
+ *<br>
+ */<br>
+<br>
+#ifndef SEVEN_SEG_H<br>
+#define SEVEN_SEG_H<br></blockquote><div><br></div><div>Guards don&#39;t m=
atch header name.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/cdev.h&gt;<br>
+<br>
+#define DEFAULT_REFRESH_INTERVAL 1000<br></blockquote><div><br></div><div>=
This doesn&#39;t seem to be used by any of the APIs provided.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
+<br>
+struct seven_seg_disp_dev {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device parent;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct cdev cdev;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*update_seven_seg_data)(<wbr>struct devic=
e *, u16 data);<br>
+};<br>
+<br>
+int setup_cdev(struct device parent,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct seven_seg_disp_dev *disp_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void (*update_disp_data)(struct device *, u16 d=
ata));<br></blockquote><div><br></div><div>Way too generic of a method name=
.=C2=A0 This name will be exposed in any .c that includes this header.=C2=
=A0 Pick something that describes what it is doing _and_ what subsystem it =
belongs to.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+void rem_cdev(struct seven_seg_disp_dev *disp_dev);<br>
+<br>
+#endif<br>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
</blockquote></div><br></div></div>

--94eb2c062e9e829cc3053f14f503--
