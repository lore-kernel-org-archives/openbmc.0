Return-Path: <raltherr@google.com>
Received: from mail-yw0-x229.google.com (mail-yw0-x229.google.com
 [IPv6:2607:f8b0:4002:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3svXqM658jzDrPL
 for <openbmc@lists.ozlabs.org>; Thu, 13 Oct 2016 12:15:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=FFkln2z7; 
 dkim-atps=neutral
Received: by mail-yw0-x229.google.com with SMTP id t192so44161120ywf.0
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 18:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2t8D3+0BJskI4LLhwuHVyPqf9u3OKj04xURk+5YryfM=;
 b=FFkln2z7qyvSldKqlNISS8cuaW9UhjQu8bIhwBnPau1u3YYKVEVPG5hbxnKkyzwZtD
 eApAdFsq/I1+ngY48S29/uqWcXt+a0XEsBwZQzPXQJcGygU3pkdOQHZOyXq0b8y6+xVc
 FtLWnE3r52/lUvprENVIWhOrgdb+nX9q0PE1t3NjRjiJc0VYXBOdngje5D9RrIZpjnRd
 JIor2UMJb/5fVR8BTm3ZjFJkSmXY78yQOxBRdqFd3BZgixl+/f8/uiQxs1Cj8/JuKr1X
 gWe5WgGBoP7xoWPJkx4GS2hpOM25pIZzjgSz3WuY9ZI/1NDEV6UyYNOp3wvxrJsGWIZY
 sd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2t8D3+0BJskI4LLhwuHVyPqf9u3OKj04xURk+5YryfM=;
 b=X/8mHnOfhg1kzC5Eg6UkXAnbCKJYFflvFMPGt5GMU/5k9XuQOWihahLFnRawlFJbLx
 SojsiGH0n7GlJRvpiA8fHY1jW+xr8js4mYRiNrr8J3+M5w/suA5rIV0kA0tHZz+v23+W
 VmjbIWkNLy7vs7FDeAzgyfNduYJolanwxcu4EKkiSX5wBiEaMekg/YQt0Sh6k8iagqom
 oJTT+4zLQ2ROOS1c3sC1eIJd93gbFraJjJ7af4QibPgN6Kld4L/JEw4cc/h4rKrnmiOv
 5+kvQvSNooEpTkEcRsPjVG97RSAFBr4UYGuerxK/NFrgn9e+0FUBE+qnWQTqrfh78Ume
 cCPg==
X-Gm-Message-State: AA6/9RkzW4twJSiKtu21d7yx4V/ilONZ/lvPYFLzn/5jvMQLiHZi+mw+hujlg9mmzx43F4yvchsal5Pqnzr237Fp
X-Received: by 10.13.233.4 with SMTP id s4mr1082706ywe.58.1476321357341; Wed,
 12 Oct 2016 18:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Wed, 12 Oct 2016 18:15:56 -0700 (PDT)
In-Reply-To: <1476319305-29981-3-git-send-email-jaghu@google.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-3-git-send-email-jaghu@google.com>
From: Rick Altherr <raltherr@google.com>
Date: Wed, 12 Oct 2016 18:15:56 -0700
Message-ID: <CAPLgG==2KMQkfLLMr=rTWNsPVBv4qEXpF9d59oajksSi6vsu=g@mail.gmail.com>
Subject: Re: [PATCH linux v1 2/3] drivers: misc: Character driver to update
 BMC post code
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c0758a614b17e053eb4daad
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
X-List-Received-Date: Thu, 13 Oct 2016 01:16:00 -0000

--94eb2c0758a614b17e053eb4daad
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> Character driver - On state change, the BMC will write its POST code to the
> character device. The POST code is then sent to update-postcard platform
> driver for display on the POST card. The BMC POST code consists of 3 digits
>
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> ---
>  drivers/misc/Kconfig               |   8 +++
>  drivers/misc/Makefile              |   1 +
>  drivers/misc/update-bmc-postcode.c | 123 ++++++++++++++++++++++++++++++
> +++++++
>  3 files changed, 132 insertions(+)
>  create mode 100644 drivers/misc/update-bmc-postcode.c
>
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index d65b83f..69dc3b6 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -815,6 +815,14 @@ config ASPEED_BT_IPMI_HOST
>         help
>           Support for the Aspeed BT ipmi host.
>
> +config ASPEED_UPDATE_BMC_POSTCODE
> +       tristate "Character driver for BMC POST code update"
> +       depends on ASPEED_UPDATE_POSTCARD
> +       help
> +        On state change, the BMC will write its POST code to the
> +        character device. The POST code is then sent to update-postcard
> platform
> +        driver for display on the POST card
> +
>

Again, not specific to Aspeed.  Maybe this should be SEVEN_SEGMENT_DISPLAY
and the other driver should be SEVEN_SEGMENT_SGPIO.


>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 730c6c2..dce20cb 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -59,3 +59,4 @@ obj-$(CONFIG_CXL_BASE)                += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
>  obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
> +obj-$(CONFIG_ASPEED_UPDATE_BMC_POSTCODE)       += update-bmc-postcode.o
> diff --git a/drivers/misc/update-bmc-postcode.c b/drivers/misc/update-bmc-
> postcode.c
> new file mode 100644
> index 0000000..8e368a4
> --- /dev/null
> +++ b/drivers/misc/update-bmc-postcode.c
> @@ -0,0 +1,123 @@
> +/*
> + * Character driver - On state change, the BMC will write its POST code
> to the
> + * character device. The POST code is then sent to update-postcard
> platform
> + * driver for display on the POST card. The BMC POST code consists of 3
> digits.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/version.h>
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/kdev_t.h>
> +#include <linux/fs.h>
> +#include <linux/device.h>
> +#include <linux/cdev.h>
> +#include <linux/uaccess.h>
> +#include <linux/ctype.h>
> +
> +#include "update-postcard.h"
> +
> +#define MAX_POSTCODE_SIZE 3
> +
> +static dev_t bmc_state_dev;
> +static struct cdev c_dev;
> +static struct class *bmc_state_class;
> +
> +static int bmc_state_open(struct inode *i, struct file *f)
> +{
> +       return 0;
> +}
> +
> +static int bmc_state_close(struct inode *i, struct file *f)
> +{
> +       return 0;
> +}
> +
> +static ssize_t bmc_state_read(struct file *f, char __user *buf, size_t
> +                               len, loff_t *off)
> +{
> +       return 0;
> +}
> +
> +/* Write post code from bmc to the correct variable */
> +static ssize_t bmc_state_write(struct file *f, const char __user *buf,
> +                               size_t len, loff_t *off)
> +{
> +       char tmp[MAX_POSTCODE_SIZE];
> +       int length = len - 1;
> +       int i;
> +
> +       if (length != MAX_POSTCODE_SIZE) {
> +               return -EINVAL;
> +       }
> +
> +       if (copy_from_user(tmp, buf, length) != 0) {
> +               return -EFAULT;
> +       }
> +
> +       for (i = 0; i < MAX_POSTCODE_SIZE; i++) {
> +               if (!isxdigit(tmp[i]))
> +                       return -EINVAL;
> +       }
> +
> +       update_postcode(tmp);
>

As written, this is hard-coded to the bit-bang driver in your other patch.
The concept is fairly generic though.  If we switched to using a 74HC165
that is compatible with the Aspeed's built-in SGPIO hardware, ideally we'd
only need to write a driver for the SGPIO.  That implies you want this
character device to attach to any compatible display drivers.


> +       return len;
> +}
> +
> +static const struct file_operations bmc_state_fops = {
> +
> +       .owner = THIS_MODULE,
> +       .open = bmc_state_open,
> +       .release = bmc_state_close,
> +       .read = bmc_state_read,
> +       .write = bmc_state_write
> +};
> +
> +static int __init update_bmc_pc_init(void)
> +{
> +       if (alloc_chrdev_region(&bmc_state_dev, 0, 1, "bmc_state") < 0) {
> +               return -1;
> +       }
> +
> +       bmc_state_class = class_create(THIS_MODULE, "bmc_state");
> +       if (bmc_state_class == NULL) {
> +               goto unregister;
> +               return -1;
> +       }
> +
> +       if (device_create(bmc_state_class, NULL, bmc_state_dev,
> +               NULL, "current_state") == NULL) {
> +               goto class_destroy;
> +               return -1;
> +       }
> +
> +       cdev_init(&c_dev, &bmc_state_fops);
> +       if (cdev_add(&c_dev, bmc_state_dev, 1) == -1) {
> +               goto device_destroy;
> +               return -1;
> +       }
> +
> +       return 0;
> +
> +device_destroy:
> +               device_destroy(bmc_state_class, bmc_state_dev);
> +class_destroy:
> +               class_destroy(bmc_state_class);
> +unregister:
> +               unregister_chrdev_region(bmc_state_dev, 1);
> +       return -1;
> +}
> +
> +static void __exit update_bmc_pc_exit(void)
> +{
> +       cdev_del(&c_dev);
> +       device_destroy(bmc_state_class, bmc_state_dev);
> +       class_destroy(bmc_state_class);
> +       unregister_chrdev_region(bmc_state_dev, 1);
> +}
> +
> +module_init(update_bmc_pc_init);
> +module_exit(update_bmc_pc_exit);
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
> >");
> +MODULE_DESCRIPTION("Character driver - update bmc postcode");
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c0758a614b17e053eb4daad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Nataraja=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blan=
k">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Character driver - On state change, the BMC will write its POST code to th=
e<br>
character device. The POST code is then sent to update-postcard platform<br=
>
driver for display on the POST card. The BMC POST code consists of 3 digits=
<br>
<br>
Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailt=
o:jaghu@google.com">jaghu@google.com</a>&gt;<br>
---<br>
=C2=A0drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A08 +++<br>
=C2=A0drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/misc/update-bmc-<wbr>postcode.c | 123 +++++++++++++++++++++++=
+++++++<wbr>+++++++<br>
=C2=A03 files changed, 132 insertions(+)<br>
=C2=A0create mode 100644 drivers/misc/update-bmc-<wbr>postcode.c<br>
<br>
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig<br>
index d65b83f..69dc3b6 100644<br>
--- a/drivers/misc/Kconfig<br>
+++ b/drivers/misc/Kconfig<br>
@@ -815,6 +815,14 @@ config ASPEED_BT_IPMI_HOST<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Support for the Aspeed BT ipmi host.<br>
<br>
+config ASPEED_UPDATE_BMC_POSTCODE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Character driver for BMC POST co=
de update&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on ASPEED_UPDATE_POSTCARD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 On state change, the BMC will write its POST c=
ode to the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 character device. The POST code is then sent t=
o update-postcard platform<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 driver for display on the POST card<br>
+<br></blockquote><div><br></div><div>Again, not specific to Aspeed.=C2=A0 =
Maybe this should be SEVEN_SEGMENT_DISPLAY and the other driver should be S=
EVEN_SEGMENT_SGPIO.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0source &quot;drivers/misc/c2port/Kconfig&quot;<br>
=C2=A0source &quot;drivers/misc/eeprom/Kconfig&quot;<br>
=C2=A0source &quot;drivers/misc/cb710/Kconfig&quot;<br>
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile<br>
index 730c6c2..dce20cb 100644<br>
--- a/drivers/misc/Makefile<br>
+++ b/drivers/misc/Makefile<br>
@@ -59,3 +59,4 @@ obj-$(CONFIG_CXL_BASE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 +=3D cxl/<br>
=C2=A0obj-$(CONFIG_PANEL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D panel.o<br>
=C2=A0obj-$(CONFIG_ASPEED_UPDATE_<wbr>POSTCARD)=C2=A0 =C2=A0 +=3D update-po=
stcard.o<br>
=C2=A0obj-$(CONFIG_ASPEED_BT_IPMI_<wbr>HOST)=C2=A0 =C2=A0 =C2=A0 +=3D bt-ho=
st.o<br>
+obj-$(CONFIG_ASPEED_UPDATE_<wbr>BMC_POSTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D update-bmc-postcode.o<br>
diff --git a/drivers/misc/update-bmc-<wbr>postcode.c b/drivers/misc/update-=
bmc-<wbr>postcode.c<br>
new file mode 100644<br>
index 0000000..8e368a4<br>
--- /dev/null<br>
+++ b/drivers/misc/update-bmc-<wbr>postcode.c<br>
@@ -0,0 +1,123 @@<br>
+/*<br>
+ * Character driver - On state change, the BMC will write its POST code to=
 the<br>
+ * character device. The POST code is then sent to update-postcard platfor=
m<br>
+ * driver for display on the POST card. The BMC POST code consists of 3 di=
gits.<br>
+ */<br>
+<br>
+#include &lt;linux/module.h&gt;<br>
+#include &lt;linux/version.h&gt;<br>
+#include &lt;linux/kernel.h&gt;<br>
+#include &lt;linux/types.h&gt;<br>
+#include &lt;linux/kdev_t.h&gt;<br>
+#include &lt;linux/fs.h&gt;<br>
+#include &lt;linux/device.h&gt;<br>
+#include &lt;linux/cdev.h&gt;<br>
+#include &lt;linux/uaccess.h&gt;<br>
+#include &lt;linux/ctype.h&gt;<br>
+<br>
+#include &quot;update-postcard.h&quot;<br>
+<br>
+#define MAX_POSTCODE_SIZE 3<br>
+<br>
+static dev_t bmc_state_dev;<br>
+static struct cdev c_dev;<br>
+static struct class *bmc_state_class;<br>
+<br>
+static int bmc_state_open(struct inode *i, struct file *f)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static int bmc_state_close(struct inode *i, struct file *f)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+static ssize_t bmc_state_read(struct file *f, char __user *buf, size_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len, loff_t *off)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
+/* Write post code from bmc to the correct variable */<br>
+static ssize_t bmc_state_write(struct file *f, const char __user *buf,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t len, loff_t *off)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char tmp[MAX_POSTCODE_SIZE];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int length =3D len - 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (length !=3D MAX_POSTCODE_SIZE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(tmp, buf, length) !=3D 0) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; MAX_POSTCODE_SIZE; i++) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!isxdigit(tmp[i=
]))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0update_postcode(tmp);<br></blockquote><div><br>=
</div><div>As written, this is hard-coded to the bit-bang driver in your ot=
her patch.=C2=A0 The concept is fairly generic though.=C2=A0 If we switched=
 to using a 74HC165 that is compatible with the Aspeed&#39;s built-in SGPIO=
 hardware, ideally we&#39;d only need to write a driver for the SGPIO.=C2=
=A0 That implies you want this character device to attach to any compatible=
 display drivers.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>
+}<br>
+<br>
+static const struct file_operations bmc_state_fops =3D {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THIS_MODULE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.open =3D bmc_state_open,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.release =3D bmc_state_close,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D bmc_state_read,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D bmc_state_write<br>
+};<br>
+<br>
+static int __init update_bmc_pc_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (alloc_chrdev_region(&amp;bmc_<wbr>state_dev=
, 0, 1, &quot;bmc_state&quot;) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bmc_state_class =3D class_create(THIS_MODULE, &=
quot;bmc_state&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bmc_state_class =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto unregister;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (device_create(bmc_state_<wbr>class, NULL, b=
mc_state_dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, &quot;current=
_state&quot;) =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto class_destroy;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_init(&amp;c_dev, &amp;bmc_state_fops);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cdev_add(&amp;c_dev, bmc_state_dev, 1) =3D=
=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto device_destroy=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+<br>
+device_destroy:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(bmc_=
state_<wbr>class, bmc_state_dev);<br>
+class_destroy:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(bmc_s=
tate_class)<wbr>;<br>
+unregister:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_r=
egion(bmc_<wbr>state_dev, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+}<br>
+<br>
+static void __exit update_bmc_pc_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_del(&amp;c_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(bmc_state_<wbr>class, bmc_state_=
dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(bmc_state_class)<wbr>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_region(bmc_<wbr>state_dev, 1)=
;<br>
+}<br>
+<br>
+module_init(update_bmc_pc_<wbr>init);<br>
+module_exit(update_bmc_pc_<wbr>exit);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D=
"mailto:jaghu@google.com">jaghu@google.com</a>&gt;&quot;);<br>
+MODULE_DESCRIPTION(&quot;Character driver - update bmc postcode&quot;);<br=
>
--<br>
2.8.0.rc3.226.g39d4020<br>
<br>
______________________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
</blockquote></div><br></div></div>

--94eb2c0758a614b17e053eb4daad--
