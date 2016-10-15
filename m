Return-Path: <raltherr@google.com>
Received: from mail-yb0-x233.google.com (mail-yb0-x233.google.com
 [IPv6:2607:f8b0:4002:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sx8bP1Z7VzDt4S
 for <openbmc@lists.ozlabs.org>; Sun, 16 Oct 2016 03:11:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=SNa2w6UD; 
 dkim-atps=neutral
Received: by mail-yb0-x233.google.com with SMTP id o189so26795730yba.1
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=j0mym/ovoTnmAcgVfwp7S82xIRXu2pFvgifM6FOnjbM=;
 b=SNa2w6UD5LEPyv72NVPYd3lwY/+DehaWoEG5jTgcRHqsbSAsloUzSgLftQaeYZOXFM
 4YgvzVn3FQ3OGMMa4FwW983EaLjdHLbMD7c40SwUk7864a1qtybU+bNMB30OdaETr+At
 UeePpy2Hy7fW0HaRdxsvW38+ourcugVeAKY3zvWJrLIIPWIdmpcwpMke617ThiV9hLo3
 zcnc54Ntd+oswS9yZb6kblzd8QFABxmpF/drHPkH32ARah6rsCr9ow6AMIAxTKJZzsi+
 QC1dPMLb3qICu78N0WT1L6GpHACcUmHFv1z3wfe3Qc+31PdhgaQNe5m0dtRIDSMIUTvY
 1TSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=j0mym/ovoTnmAcgVfwp7S82xIRXu2pFvgifM6FOnjbM=;
 b=TyVWQgB2ipHhnyua3vri8OHg+mdSkM0IkotXQQ+hywOk5t9GOq3Qpao6yiHv+e8LeO
 niIYWDUX6xF+H8jiE6ZKgX310dWowFXdxDH8KHq26RLdplK8YkrEGMdjXO1cJftArITZ
 ZCfxb4lEDdOXU7B29WHBscZ3RnRgeDjSnn6glxx1i1lJS6O4fvnmOjONfgF0hEokn+X2
 ISMYon8bZHAULvdGgS+FDt22e07jNEf1Udq91bjQRxxfoqf844+0H+gpOfKp8vLe3B0a
 hurT9uyrnANOvcOnb6NGh4Fw3EaWUD30ArPVLl/cnDDmU/It/GlbIEHj8Q6bXv0uIVwg
 LVxg==
X-Gm-Message-State: AA6/9Rlmifj/ohq41T20lFAdXUzbi8DBWjnw0kbXVNFFLWEd8LM6ul9ioPnS2OAh4ftfk1hhDT0PMtu+BXP8LgYs
X-Received: by 10.37.1.85 with SMTP id 82mr15530747ybb.102.1476547869521; Sat,
 15 Oct 2016 09:11:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Sat, 15 Oct 2016 09:11:08 -0700 (PDT)
In-Reply-To: <CANsWYUVRqqwzvYqNsz-SJRRHc8B2McWpUjNRDRKusk7iVSy-wA@mail.gmail.com>
References: <1476319305-29981-1-git-send-email-jaghu@google.com>
 <1476319305-29981-3-git-send-email-jaghu@google.com>
 <CAPLgG==2KMQkfLLMr=rTWNsPVBv4qEXpF9d59oajksSi6vsu=g@mail.gmail.com>
 <CANsWYUVRqqwzvYqNsz-SJRRHc8B2McWpUjNRDRKusk7iVSy-wA@mail.gmail.com>
From: Rick Altherr <raltherr@google.com>
Date: Sat, 15 Oct 2016 09:11:08 -0700
Message-ID: <CAPLgG==uek_uEq+GQuikVJbVsPq4DoUVVC_ViCMvZzBOBsfihA@mail.gmail.com>
Subject: Re: [PATCH linux v1 2/3] drivers: misc: Character driver to update
 BMC post code
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a113cf56c4278b2053ee99727
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
X-List-Received-Date: Sat, 15 Oct 2016 16:11:14 -0000

--001a113cf56c4278b2053ee99727
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 14, 2016 at 5:00 PM, Jaghathiswari Rankappagounder Natarajan <
jaghu@google.com> wrote:

> By this comment "want this character device to attach to any compatible
> display drivers." , should I have a separate setup_character device
> function(add the platform device(display  driver for GPIO) as the parent of
> the character device)  and call this function from the corresponding
> display driver for GPIO? So display driver for GPIO will only setup
> this character device ?
>
> I'm getting confused by the terminology here.  I would expect a platform
driver that matches on the device tree node, provides an API for displaying
on a 7-segment display, and implements the bit-banging necessary to do so.
The character device driver would match on the previous platform driver and
implement the user-space API for letting a user write to the display
including any conversion methods necessary to map the user input to a
7-segment display.


> I have moved the function to convert character buffer to led display
> pattern to this char driver. The display is very specific for BMC post
> codes( characters '14' is displayed as digits 't4' and the DOT lights up on
> two segment LEDs ) and generic for host POST codes(characters '14' is
> displayed as '14' and DOT doesn't light up). This info is present in the
> lookup table.
> When display driver for GPIO wants to use a character device with
> different conversion(say to display '14' as '14 with DOTs light up) it
> needs a different character device(which does conversion differently) ?
>
> Yes, the conversion should be associated with the character device.  My
rationale is that the conversion used depends on how the user provided the
data (free form string, fixed string, integer).  If the user API is
different, it should have a different character device so the user-space
app knows what API it needs to implement.


> should the mapping be like this char device(with a specific display
> pattern) can be used with any display driver(GPIO and SGPIO) and the GPIO
> driver/SGPIO driver can use any character device(with different display
> conversion patterns) ? is it better to do as above or keep as 1-1 mapping?
> or keep the conversion logic in BMC/Host side?
>
>
I was thinking of having a subsystem layer that abstracts interfacing with
7-segment displays.  It probably isn't necessary today but would make it
simpler to implement other output drivers (using a different shift register
with the Aspeed SGPIO hardware, etc) or implement different user-space APIs.


>
> On Wed, Oct 12, 2016 at 6:15 PM, Rick Altherr <raltherr@google.com> wrote:
>
>>
>>
>> On Wed, Oct 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Natarajan
>> <jaghu@google.com> wrote:
>>
>>> Character driver - On state change, the BMC will write its POST code to
>>> the
>>> character device. The POST code is then sent to update-postcard platform
>>> driver for display on the POST card. The BMC POST code consists of 3
>>> digits
>>>
>>> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com
>>> >
>>> ---
>>>  drivers/misc/Kconfig               |   8 +++
>>>  drivers/misc/Makefile              |   1 +
>>>  drivers/misc/update-bmc-postcode.c | 123 ++++++++++++++++++++++++++++++
>>> +++++++
>>>  3 files changed, 132 insertions(+)
>>>  create mode 100644 drivers/misc/update-bmc-postcode.c
>>>
>>> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
>>> index d65b83f..69dc3b6 100644
>>> --- a/drivers/misc/Kconfig
>>> +++ b/drivers/misc/Kconfig
>>> @@ -815,6 +815,14 @@ config ASPEED_BT_IPMI_HOST
>>>         help
>>>           Support for the Aspeed BT ipmi host.
>>>
>>> +config ASPEED_UPDATE_BMC_POSTCODE
>>> +       tristate "Character driver for BMC POST code update"
>>> +       depends on ASPEED_UPDATE_POSTCARD
>>> +       help
>>> +        On state change, the BMC will write its POST code to the
>>> +        character device. The POST code is then sent to update-postcard
>>> platform
>>> +        driver for display on the POST card
>>> +
>>>
>>
>> Again, not specific to Aspeed.  Maybe this should be
>> SEVEN_SEGMENT_DISPLAY and the other driver should be SEVEN_SEGMENT_SGPIO.
>>
>>
>>>  source "drivers/misc/c2port/Kconfig"
>>>  source "drivers/misc/eeprom/Kconfig"
>>>  source "drivers/misc/cb710/Kconfig"
>>> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
>>> index 730c6c2..dce20cb 100644
>>> --- a/drivers/misc/Makefile
>>> +++ b/drivers/misc/Makefile
>>> @@ -59,3 +59,4 @@ obj-$(CONFIG_CXL_BASE)                += cxl/
>>>  obj-$(CONFIG_PANEL)             += panel.o
>>>  obj-$(CONFIG_ASPEED_UPDATE_POSTCARD)    += update-postcard.o
>>>  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
>>> +obj-$(CONFIG_ASPEED_UPDATE_BMC_POSTCODE)       += update-bmc-postcode.o
>>> diff --git a/drivers/misc/update-bmc-postcode.c
>>> b/drivers/misc/update-bmc-postcode.c
>>> new file mode 100644
>>> index 0000000..8e368a4
>>> --- /dev/null
>>> +++ b/drivers/misc/update-bmc-postcode.c
>>> @@ -0,0 +1,123 @@
>>> +/*
>>> + * Character driver - On state change, the BMC will write its POST code
>>> to the
>>> + * character device. The POST code is then sent to update-postcard
>>> platform
>>> + * driver for display on the POST card. The BMC POST code consists of 3
>>> digits.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/version.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/types.h>
>>> +#include <linux/kdev_t.h>
>>> +#include <linux/fs.h>
>>> +#include <linux/device.h>
>>> +#include <linux/cdev.h>
>>> +#include <linux/uaccess.h>
>>> +#include <linux/ctype.h>
>>> +
>>> +#include "update-postcard.h"
>>> +
>>> +#define MAX_POSTCODE_SIZE 3
>>> +
>>> +static dev_t bmc_state_dev;
>>> +static struct cdev c_dev;
>>> +static struct class *bmc_state_class;
>>> +
>>> +static int bmc_state_open(struct inode *i, struct file *f)
>>> +{
>>> +       return 0;
>>> +}
>>> +
>>> +static int bmc_state_close(struct inode *i, struct file *f)
>>> +{
>>> +       return 0;
>>> +}
>>> +
>>> +static ssize_t bmc_state_read(struct file *f, char __user *buf, size_t
>>> +                               len, loff_t *off)
>>> +{
>>> +       return 0;
>>> +}
>>> +
>>> +/* Write post code from bmc to the correct variable */
>>> +static ssize_t bmc_state_write(struct file *f, const char __user *buf,
>>> +                               size_t len, loff_t *off)
>>> +{
>>> +       char tmp[MAX_POSTCODE_SIZE];
>>> +       int length = len - 1;
>>> +       int i;
>>> +
>>> +       if (length != MAX_POSTCODE_SIZE) {
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       if (copy_from_user(tmp, buf, length) != 0) {
>>> +               return -EFAULT;
>>> +       }
>>> +
>>> +       for (i = 0; i < MAX_POSTCODE_SIZE; i++) {
>>> +               if (!isxdigit(tmp[i]))
>>> +                       return -EINVAL;
>>> +       }
>>> +
>>> +       update_postcode(tmp);
>>>
>>
>> As written, this is hard-coded to the bit-bang driver in your other
>> patch.  The concept is fairly generic though.  If we switched to using a
>> 74HC165 that is compatible with the Aspeed's built-in SGPIO hardware,
>> ideally we'd only need to write a driver for the SGPIO.  That implies you
>> want this character device to attach to any compatible display drivers.
>>
>>
>>> +       return len;
>>> +}
>>> +
>>> +static const struct file_operations bmc_state_fops = {
>>> +
>>> +       .owner = THIS_MODULE,
>>> +       .open = bmc_state_open,
>>> +       .release = bmc_state_close,
>>> +       .read = bmc_state_read,
>>> +       .write = bmc_state_write
>>> +};
>>> +
>>> +static int __init update_bmc_pc_init(void)
>>> +{
>>> +       if (alloc_chrdev_region(&bmc_state_dev, 0, 1, "bmc_state") < 0)
>>> {
>>> +               return -1;
>>> +       }
>>> +
>>> +       bmc_state_class = class_create(THIS_MODULE, "bmc_state");
>>> +       if (bmc_state_class == NULL) {
>>> +               goto unregister;
>>> +               return -1;
>>> +       }
>>> +
>>> +       if (device_create(bmc_state_class, NULL, bmc_state_dev,
>>> +               NULL, "current_state") == NULL) {
>>> +               goto class_destroy;
>>> +               return -1;
>>> +       }
>>> +
>>> +       cdev_init(&c_dev, &bmc_state_fops);
>>> +       if (cdev_add(&c_dev, bmc_state_dev, 1) == -1) {
>>> +               goto device_destroy;
>>> +               return -1;
>>> +       }
>>> +
>>> +       return 0;
>>> +
>>> +device_destroy:
>>> +               device_destroy(bmc_state_class, bmc_state_dev);
>>> +class_destroy:
>>> +               class_destroy(bmc_state_class);
>>> +unregister:
>>> +               unregister_chrdev_region(bmc_state_dev, 1);
>>> +       return -1;
>>> +}
>>> +
>>> +static void __exit update_bmc_pc_exit(void)
>>> +{
>>> +       cdev_del(&c_dev);
>>> +       device_destroy(bmc_state_class, bmc_state_dev);
>>> +       class_destroy(bmc_state_class);
>>> +       unregister_chrdev_region(bmc_state_dev, 1);
>>> +}
>>> +
>>> +module_init(update_bmc_pc_init);
>>> +module_exit(update_bmc_pc_exit);
>>> +MODULE_LICENSE("GPL");
>>> +MODULE_AUTHOR("Jaghathiswari Rankappagounder Natarajan <
>>> jaghu@google.com>");
>>> +MODULE_DESCRIPTION("Character driver - update bmc postcode");
>>> --
>>> 2.8.0.rc3.226.g39d4020
>>>
>>> _______________________________________________
>>> openbmc mailing list
>>> openbmc@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/openbmc
>>>
>>
>>
>

--001a113cf56c4278b2053ee99727
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Oct 14, 2016 at 5:00 PM, Jaghathiswari Rankappagounder Nataraja=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blan=
k">jaghu@google.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div>By this comment &quot;want=C2=A0<span style=3D"font-=
size:12.8px">this character device to attach to any compatible display driv=
ers.&quot; , should I have a separate setup_character device function(add t=
he platform device(display =C2=A0driver for GPIO) as the parent of the char=
acter device) =C2=A0and call this function from the corresponding display d=
river for GPIO? So display driver for GPIO will only setup this=C2=A0charac=
ter=C2=A0device ?</span><br></div><div><br></div></div></blockquote><div>I&=
#39;m getting confused by the terminology here.=C2=A0 I would expect a plat=
form driver that matches on the device tree node, provides an API for displ=
aying on a 7-segment display, and implements the bit-banging necessary to d=
o so.=C2=A0 The character device driver would match on the previous platfor=
m driver and implement the user-space API for letting a user write to the d=
isplay including any conversion methods necessary to map the user input to =
a 7-segment display.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div></div><div>I have moved the function to convert charac=
ter buffer to led display pattern to this char driver. The display is very =
specific for BMC post codes( characters &#39;14&#39; is displayed as digits=
 &#39;t4&#39; and the DOT lights up on two segment LEDs ) and generic for h=
ost POST codes(characters &#39;14&#39; is displayed as &#39;14&#39; and DOT=
 doesn&#39;t light up). This info is present in the lookup table.</div>When=
 display driver for GPIO wants to use a character device with different con=
version(say to display &#39;14&#39; as &#39;14 with DOTs light up) it needs=
 a different character device(which does conversion differently) ?<div><br>=
</div></div></blockquote><div>Yes, the conversion should be associated with=
 the character device.=C2=A0 My rationale is that the conversion used depen=
ds on how the user provided the data (free form string, fixed string, integ=
er).=C2=A0 If the user API is different, it should have a different charact=
er device so the user-space app knows what API it needs to implement.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div></div=
><div>should the mapping be like this char device(with a specific display p=
attern) can be used with any display driver(GPIO and SGPIO) and the GPIO dr=
iver/SGPIO driver can use any character device(with different display conve=
rsion patterns) ? is it better to do as above or keep as 1-1 mapping? or ke=
ep the conversion logic in BMC/Host side?<div><div class=3D"h5"><br></div><=
/div></div></div></blockquote><div><br></div><div>I was thinking of having =
a subsystem layer that abstracts interfacing with 7-segment displays.=C2=A0=
 It probably isn&#39;t necessary today but would make it simpler to impleme=
nt other output drivers (using a different shift register with the Aspeed S=
GPIO hardware, etc) or implement different user-space APIs.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div cla=
ss=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed,=
 Oct 12, 2016 at 6:15 PM, Rick Altherr <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raltherr@google.com" target=3D"_blank">raltherr@google.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><di=
v class=3D"m_-7487688587987672970m_-7121693134944063424gmail-h5">On Wed, Oc=
t 12, 2016 at 5:41 PM, Jaghathiswari Rankappagounder Natarajan <span dir=3D=
"ltr">&lt;<a href=3D"mailto:jaghu@google.com" target=3D"_blank">jaghu@googl=
e.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Character driver - On state change, the BMC will write its POST code =
to the<br>
character device. The POST code is then sent to update-postcard platform<br=
>
driver for display on the POST card. The BMC POST code consists of 3 digits=
<br>
<br>
Signed-off-by: Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D"mailt=
o:jaghu@google.com" target=3D"_blank">jaghu@google.com</a>&gt;<br>
---<br>
=C2=A0drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A08 +++<br>
=C2=A0drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A01 +<br>
=C2=A0drivers/misc/update-bmc-postc<wbr>ode.c | 123 +++++++++++++++++++++++=
+++++++<wbr>+++++++<br>
=C2=A03 files changed, 132 insertions(+)<br>
=C2=A0create mode 100644 drivers/misc/update-bmc-postco<wbr>de.c<br>
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
+<br></blockquote><div><br></div></div></div><div>Again, not specific to As=
peed.=C2=A0 Maybe this should be SEVEN_SEGMENT_DISPLAY and the other driver=
 should be SEVEN_SEGMENT_SGPIO.</div><div><div class=3D"m_-7487688587987672=
970m_-7121693134944063424gmail-h5"><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
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
=C2=A0obj-$(CONFIG_ASPEED_UPDATE_PO<wbr>STCARD)=C2=A0 =C2=A0 +=3D update-po=
stcard.o<br>
=C2=A0obj-$(CONFIG_ASPEED_BT_IPMI_H<wbr>OST)=C2=A0 =C2=A0 =C2=A0 +=3D bt-ho=
st.o<br>
+obj-$(CONFIG_ASPEED_UPDATE_BM<wbr>C_POSTCODE)=C2=A0 =C2=A0 =C2=A0 =C2=A0+=
=3D update-bmc-postcode.o<br>
diff --git a/drivers/misc/update-bmc-post<wbr>code.c b/drivers/misc/update-=
bmc-post<wbr>code.c<br>
new file mode 100644<br>
index 0000000..8e368a4<br>
--- /dev/null<br>
+++ b/drivers/misc/update-bmc-post<wbr>code.c<br>
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
</div></div></div><div>As written, this is hard-coded to the bit-bang drive=
r in your other patch.=C2=A0 The concept is fairly generic though.=C2=A0 If=
 we switched to using a 74HC165 that is compatible with the Aspeed&#39;s bu=
ilt-in SGPIO hardware, ideally we&#39;d only need to write a driver for the=
 SGPIO.=C2=A0 That implies you want this character device to attach to any =
compatible display drivers.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div><div class=3D"m_-7487688587987672970m_-712169=
3134944063424gmail-h5">
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (alloc_chrdev_region(&amp;bmc_stat<wbr>e_dev=
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (device_create(bmc_state_class<wbr>, NULL, b=
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
state_clas<wbr>s, bmc_state_dev);<br>
+class_destroy:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(bmc_s=
tate_class<wbr>);<br>
+unregister:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_r=
egion(bmc_<wbr>state_dev, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
+}<br>
+<br>
+static void __exit update_bmc_pc_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cdev_del(&amp;c_dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0device_destroy(bmc_state_clas<wbr>s, bmc_state_=
dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0class_destroy(bmc_state_class<wbr>);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unregister_chrdev_region(bmc_<wbr>state_dev, 1)=
;<br>
+}<br>
+<br>
+module_init(update_bmc_pc_ini<wbr>t);<br>
+module_exit(update_bmc_pc_exi<wbr>t);<br>
+MODULE_LICENSE(&quot;GPL&quot;);<br>
+MODULE_AUTHOR(&quot;Jaghathiswari Rankappagounder Natarajan &lt;<a href=3D=
"mailto:jaghu@google.com" target=3D"_blank">jaghu@google.com</a>&gt;&quot;)=
;<br>
+MODULE_DESCRIPTION(&quot;Character driver - update bmc postcode&quot;);<br=
>
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
</blockquote></div><br></div></div></div></div></div>
</blockquote></div><br></div></div>

--001a113cf56c4278b2053ee99727--
