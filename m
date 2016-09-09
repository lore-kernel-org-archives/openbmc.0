Return-Path: <brendanhiggins@google.com>
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com
 [IPv6:2607:f8b0:400c:c08::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sW9XQ4H39zDrq6
 for <openbmc@lists.ozlabs.org>; Sat, 10 Sep 2016 07:37:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=h5iMZeqb; 
 dkim-atps=neutral
Received: by mail-ua0-x231.google.com with SMTP id 31so79049788uao.0
 for <openbmc@lists.ozlabs.org>; Fri, 09 Sep 2016 14:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GZfUmBCQ+et2vbMV97YXGrlF9RSJvqwWELFhoUycbEA=;
 b=h5iMZeqbH5BKh3GGfuaw6YMZs8yI84q58aUPAXs3/GZ3j01sMEyTZV4NhPWTFz57Ro
 j1Kao4GkNAJlo14kNp1r0BLlPERbEghaI73C0qMk8S8E8Lnc01dm45XL/ZTxoW7bWM4M
 3eZ1mWc4rRWL7/t5X5Nxwb+S8LlixDGpGvxXaqNkZ5NekGQZJs63a026Conn0qfs9Lu6
 2sLShuZzr+HoRfSVRL1gj+8R8F6NieRYzBOx9VMU/fLHxpKkcumE7jyMqe5O78JhlRzs
 1GtmAODmzFuZuxJP7Mtf/MFli15nFAuc1VyGoecAr0eGp8fJTzSpyIDCaMDLCwOWo9sm
 TVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GZfUmBCQ+et2vbMV97YXGrlF9RSJvqwWELFhoUycbEA=;
 b=Jj1e6Hwbg0kEAChyEGNDG0NIOFkR9N8paYdQZUBpcIyacm3HNbu8djid6FoX/WFzF5
 WQu3/P/9lJ2/d1QHHgMX6RQJnenhBV/40OJmDKL8lutxXd8ykTOUoSrTEJ4K67LEtNtf
 kKN48Z+Y0sxX+LRJakZKKXKy873N/rev7YRPlUUOivW6Cy4f5fitxN65UHevhSbEtNaS
 qNT1izw2K8JKB+8Uil37eCuQoifxhr912M9i/XcWWIPgVNL2iaETrI+4XOGclxJjpAnO
 P8We+SPSNMNPrZadRnZY54V/fPVAWXschyHEUbMyuMucapR6mAYiHI9jxqGrIAxxNMwX
 YROw==
X-Gm-Message-State: AE9vXwPJo4ac6/pOyREHz3ha2eLmrLjzVk9sXKJoRJ8hH0H8VmtaWiJcR+L62cqWd8qUWqBCeDGsBMvRrulTTUdU
X-Received: by 10.176.83.113 with SMTP id y46mr1142028uay.126.1473457042493;
 Fri, 09 Sep 2016 14:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
 <1473370130-26681-2-git-send-email-brendanhiggins@google.com>
 <CACPK8XfVqptgO+r2wf_zxGqBT6Zuh0iNPv5UZvXBcbVEDYowow@mail.gmail.com>
In-Reply-To: <CACPK8XfVqptgO+r2wf_zxGqBT6Zuh0iNPv5UZvXBcbVEDYowow@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 09 Sep 2016 21:37:12 +0000
Message-ID: <CAFd5g46F2yXZjR+3CTt5jpfZkSOgkdo_66LAYvegG+oGFr8_rQ@mail.gmail.com>
Subject: Re: [RFC 1/2] misc: bt: added IPMI Block Transfer over I2C master and
 slave
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=94eb2c1917509c5649053c19f3b2
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 21:37:27 -0000

--94eb2c1917509c5649053c19f3b2
Content-Type: text/plain; charset=UTF-8

> There is talk of putting the bt-host driver into drivers/char/ipmi. I
> imagine that will affect your work.

Yes it would; this was talked about more on the cover letter, so I will
continue this discussion there.

> I didn't pick up on this when reading your cover letter. The host side
> will read the messages straight into the kernel and userspace, not
> pass them through firmware?

That is the plan at this time. If the BIOS were to want to communicate with
the BMC they would obviously have to implement the master side of this
driver. I think it is useful to
  a) provide a reference implementation in the kernel
  b) not make any assumptions about something like BIOS runtime services
In any case, the slave side does not care how the master organizes its
communication with the BMC.

> It feels like there should be a neater way of doing this read/write
> and wait operation that the driver does. I don't have a specific
> recommendation though.

I do not think the write is particularly messy, maybe I am being
presumptuous about the amount of errors that an I2C bus may experience. I
can appreciate your concern about the read though; I was not thrilled about
having to poll for a non-zero length, but without SMBus Alert we do not
have a way of knowing whether a read is ready without polling (I fully
intend on adding support for that later on, but that requires a change to
I2C core and I would really like to keep that separate :-) ).

> The goto doesn't do much :)

No it does not, but I thought it made it clear that it was intentionally
failing out rather than proceeding normally. I guess I thought it better
fit past criticism about explicit fail out (I am thinking of "goto out"
over "cleanup return" in the I2C driver). In any case, I do not feel
strongly about it, but I guess I would like an explanation.

Thanks!

On Thu, Sep 8, 2016 at 10:51 PM Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Sep 9, 2016 at 6:58 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
> > The IPMI definition of the Block Transfer protocol defines the hardware
> > registers and behavior in addition to the message format and messaging
> > semantics. This implements a new protocol that uses IPMI Block Transfer
> > messages and semantics on top of a standard I2C interface. This protocol
> > has the same BMC side file system interface as "bt-host".
> >
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> >  drivers/misc/Kconfig         |  23 ++++
> >  drivers/misc/Makefile        |   2 +
> >  drivers/misc/bt-i2c-master.c | 199 +++++++++++++++++++++++++++
> >  drivers/misc/bt-i2c-slave.c  | 317
> +++++++++++++++++++++++++++++++++++++++++++
> >  drivers/misc/bt.h            |  19 +++
> >  5 files changed, 560 insertions(+)
> >  create mode 100644 drivers/misc/bt-i2c-master.c
> >  create mode 100644 drivers/misc/bt-i2c-slave.c
> >  create mode 100644 drivers/misc/bt.h
> >
>
> There is talk of putting the bt-host driver into drivers/char/ipmi. I
> imagine that will affect your work.
>
> > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > index 4617ddc..1c7e3a9 100644
> > --- a/drivers/misc/Kconfig
> > +++ b/drivers/misc/Kconfig
> > @@ -809,6 +809,29 @@ config ASPEED_BT_IPMI_HOST
> >         help
> >           Support for the Aspeed BT ipmi host.
> >
> > +config BT_I2C_SLAVE
> > +       depends on !ASPEED_BT_IPMI_HOST && I2C_SLAVE
> > +       tristate "BT I2C IPMI slave driver"
> > +       default "n"
> > +       ---help---
> > +         Block Transfer over I2C defines a new IPMI compatible
> interface that
> > +         uses Block Transfer messages and semantics on top of plain old
> I2C.
> > +
> > +         This adds support for the slave side of the protocol (only
> really
> > +         useful for BMCs (Baseboard Management Controllers)).
> > +
> > +config BT_I2C_MASTER
> > +       depends on I2C
> > +       tristate "BT I2C IPMI master driver"
> > +       default "n"
> > +       ---help---
> > +         Block Transfer over I2C defines a new IPMI compatible
> interface that
> > +         uses Block Transfer messages and semantics on top of plain old
> I2C.
> > +
> > +         This adds support for master side of the protocol (this is
> most likely
> > +         what you want if you are compiling for a regular CPU, only
> useful if
> > +         your computer has a BMC that speaks the slave side of this
> protocol).
>
> I didn't pick up on this when reading your cover letter. The host side
> will read the messages straight into the kernel and userspace, not
> pass them through firmware?
>
> > +
> >  source "drivers/misc/c2port/Kconfig"
> >  source "drivers/misc/eeprom/Kconfig"
> >  source "drivers/misc/cb710/Kconfig"
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index 724861b..b642ed8 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -58,3 +58,5 @@ obj-$(CONFIG_VEXPRESS_SYSCFG) += vexpress-syscfg.o
> >  obj-$(CONFIG_CXL_BASE)         += cxl/
> >  obj-$(CONFIG_PANEL)             += panel.o
> >  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
> > +obj-$(CONFIG_BT_I2C_SLAVE)     += bt-i2c-slave.o
> > +obj-$(CONFIG_BT_I2C_MASTER)    += bt-i2c-master.o
> > diff --git a/drivers/misc/bt-i2c-master.c b/drivers/misc/bt-i2c-master.c
> > new file mode 100644
> > index 0000000..22142d6
> > --- /dev/null
> > +++ b/drivers/misc/bt-i2c-master.c
> > @@ -0,0 +1,199 @@
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/errno.h>
> > +#include <linux/poll.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +#include <linux/delay.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/timer.h>
> > +#include <linux/jiffies.h>
> > +
> > +#include "bt.h"
> > +
> > +#define DEVICE_NAME    "bt-master"
> > +
> > +struct bt_i2c_master {
> > +       struct i2c_client       *client;
> > +       struct miscdevice       miscdev;
> > +       struct mutex            file_mutex;
> > +};
> > +
> > +static const unsigned long write_timeout = 25;
> > +
> > +static int send_bt_request(struct bt_i2c_master *bt_master,
> > +                          struct bt_msg *bt_request)
> > +{
> > +       struct i2c_client *client = bt_master->client;
> > +       u8 *buf = (u8 *) bt_request;
> > +       unsigned long timeout, read_time;
> > +       int ret;
> > +
> > +       timeout = jiffies + msecs_to_jiffies(write_timeout);
> > +       do {
> > +               read_time = jiffies;
> > +               ret = i2c_master_send(client, buf,
> bt_msg_len(bt_request));
> > +               if (ret >= 0)
> > +                       return 0;
> > +               usleep_range(1000, 1500);
> > +       } while (time_before(read_time, timeout));
>
> It feels like there should be a neater way of doing this read/write
> and wait operation that the driver does. I don't have a specific
> recommendation though.
>
> > +       return ret;
> > +}
> > +
> > +static int receive_bt_response(struct bt_i2c_master *bt_master,
> > +                              struct bt_msg *bt_response)
> > +{
> > +       struct i2c_client *client = bt_master->client;
> > +       u8 *buf = (u8 *) bt_response;
> > +       u8 len = 0;
> > +       unsigned long timeout, read_time;
> > +       int ret;
> > +
> > +       /*
> > +        * Slave may not NACK when not ready, so we peek at the first
> byte to
> > +        * see if it is a valid length.
> > +        */
> > +       while (len == 0) {
> > +               i2c_master_recv(client, &len, 1);
> > +               if (len != 0)
> > +                       break;
> > +               usleep_range(1000, 1500);
> > +
> > +               /* Signal received: quit syscall. */
> > +               if (signal_pending(current))
> > +                       return -ERESTARTSYS;
> > +       }
> > +
> > +       timeout = jiffies + msecs_to_jiffies(write_timeout);
> > +       do {
> > +               read_time = jiffies;
> > +               ret = i2c_master_recv(client, buf, len + 1);
> > +               if (ret >= 0)
> > +                       return 0;
> > +               usleep_range(1000, 1500);
> > +       } while (time_before(read_time, timeout));
> > +       return ret;
> > +}
> > +
> > +static inline struct bt_i2c_master *to_bt_i2c_master(struct file *file)
> > +{
> > +       return container_of(file->private_data, struct bt_i2c_master,
> miscdev);
> > +}
> > +
> > +static ssize_t bt_read(struct file *file, char __user *buf, size_t
> count,
> > +                      loff_t *ppos)
> > +{
> > +       struct bt_i2c_master *bt_master = to_bt_i2c_master(file);
> > +       struct bt_msg msg;
> > +       int ret;
> > +
> > +       mutex_lock(&bt_master->file_mutex);
> > +       ret = receive_bt_response(bt_master, &msg);
> > +       if (ret < 0)
> > +               goto out;
> > +       count = min(count, bt_msg_len(&msg));
> > +       if (copy_to_user(buf, &msg, count)) {
> > +               ret = -EFAULT;
> > +               goto out;
>
> The goto doesn't do much :)
>
> > +       }
> > +
> > +out:
> > +       mutex_unlock(&bt_master->file_mutex);
> > +       if (ret < 0)
> > +               return ret;
> > +       else
> > +               return count;
> > +}
> > +
> > +static ssize_t bt_write(struct file *file, const char __user *buf,
> size_t count,
> > +                       loff_t *ppos)
> > +{
> > +       struct bt_i2c_master *bt_master = to_bt_i2c_master(file);
> > +       struct bt_msg msg;
> > +       int ret;
> > +
> > +       mutex_lock(&bt_master->file_mutex);
> > +       if (count > sizeof(struct bt_msg)) {
> > +               ret = -EFAULT;
> > +               goto out;
> > +       }
> > +       if (copy_from_user(&msg, buf, count) || count <
> bt_msg_len(&msg)) {
> > +               ret = -EFAULT;
> > +               goto out;
> > +       }
> > +       ret = send_bt_request(bt_master, &msg);
> > +       if (ret < 0)
> > +               goto out;
> > +
> > +out:
> > +       mutex_unlock(&bt_master->file_mutex);
> > +       if (ret < 0)
> > +               return ret;
> > +       else
> > +               return count;
> > +}
> > +
> > +static const struct file_operations bt_fops = {
> > +       .owner          = THIS_MODULE,
> > +       .read           = bt_read,
> > +       .write          = bt_write,
> > +};
> > +
> > +static int bt_i2c_probe(struct i2c_client *client,
> > +                       const struct i2c_device_id *id)
> > +{
> > +       struct bt_i2c_master *bt_master;
> > +       int ret;
> > +
> > +       bt_master = devm_kzalloc(&client->dev, sizeof(struct
> bt_i2c_master),
> > +                                GFP_KERNEL);
> > +       if (!bt_master)
> > +               return -ENOMEM;
> > +
> > +       mutex_init(&bt_master->file_mutex);
> > +       bt_master->client = client;
> > +       i2c_set_clientdata(client, bt_master);
> > +
> > +       bt_master->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +       bt_master->miscdev.name = DEVICE_NAME;
> > +       bt_master->miscdev.fops = &bt_fops;
> > +       bt_master->miscdev.parent = &client->dev;
> > +       ret = misc_register(&bt_master->miscdev);
> > +       if (ret < 0)
> > +               return ret;
> > +       return 0;
> > +}
> > +
> > +static int bt_i2c_remove(struct i2c_client *client)
> > +{
> > +       struct bt_i2c_master *bt_master = i2c_get_clientdata(client);
> > +
> > +       misc_deregister(&bt_master->miscdev);
> > +       return 0;
> > +}
> > +
> > +static const struct i2c_device_id bt_i2c_id[] = {
> > +       {"bt-i2c-master", 0},
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(i2c, bt_i2c_id);
> > +
> > +static struct i2c_driver bt_i2c_driver = {
> > +       .driver = {
> > +               .name           = "bt-i2c-master",
> > +       },
> > +       .probe          = bt_i2c_probe,
> > +       .remove         = bt_i2c_remove,
> > +       .id_table       = bt_i2c_id,
> > +};
> > +module_i2c_driver(bt_i2c_driver);
> > +
> > +MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
> > +MODULE_DESCRIPTION("IPMI Block Transfer over I2C master.");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/misc/bt-i2c-slave.c b/drivers/misc/bt-i2c-slave.c
> > new file mode 100644
> > index 0000000..1a90e05
> > --- /dev/null
> > +++ b/drivers/misc/bt-i2c-slave.c
> > @@ -0,0 +1,317 @@
> > +#include <linux/module.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/errno.h>
> > +#include <linux/poll.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/mutex.h>
> > +#include <linux/slab.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/device.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/io.h>
> > +#include <linux/delay.h>
> > +#include <linux/miscdevice.h>
> > +#include <linux/timer.h>
> > +#include <linux/jiffies.h>
> > +
> > +#include "bt.h"
> > +
> > +/*
> > + * TODO: This is "bt-host" to match the bt-host driver; however, I
> think this is
> > + * unclear in the context of a CPU side driver. Should probably name
> this
> > + * and the DEVICE_NAME in bt-host to something like "bt-bmc" or
> "bt-slave".
> > + */
> > +#define DEVICE_NAME    "bt-host"
> > +
> > +static const unsigned long request_queue_max_len = 256;
> > +
> > +struct bt_request_elem {
> > +       struct list_head        list;
> > +       struct bt_msg           request;
> > +};
> > +
> > +struct bt_i2c_slave {
> > +       struct i2c_client       *client;
> > +       struct miscdevice       miscdev;
> > +       struct bt_msg           request;
> > +       struct list_head        request_queue;
> > +       atomic_t                request_queue_len;
> > +       struct bt_msg           response;
> > +       atomic_t                response_in_progress;
> > +       size_t                  msg_idx;
> > +       spinlock_t              lock;
> > +       wait_queue_head_t       wait_queue;
> > +       struct mutex            file_mutex;
> > +};
> > +
> > +static int receive_bt_request(struct bt_i2c_slave *bt_slave, bool
> non_blocking,
> > +                             struct bt_msg *bt_request) {
> > +       unsigned long flags;
> > +       struct bt_request_elem *queue_elem;
> > +
> > +       if (!atomic_read(&bt_slave->request_queue_len) && non_blocking)
> > +               return -EAGAIN;
> > +       else if (!non_blocking)
> > +               wait_event_interruptible(
> > +                               bt_slave->wait_queue,
> > +
>  atomic_read(&bt_slave->request_queue_len));
> > +
> > +       spin_lock_irqsave(&bt_slave->lock, flags);
> > +       queue_elem = list_first_entry(&bt_slave->request_queue,
> > +                                     struct bt_request_elem, list);
> > +       memcpy(bt_request, &queue_elem->request, sizeof(struct bt_msg));
> > +       list_del(&queue_elem->list);
> > +       kfree(queue_elem);
> > +       atomic_dec(&bt_slave->request_queue_len);
> > +       spin_unlock_irqrestore(&bt_slave->lock, flags);
> > +       return 0;
> > +}
> > +
> > +static int send_bt_response(struct bt_i2c_slave *bt_slave, bool
> non_blocking,
> > +                           struct bt_msg *bt_response) {
> > +       unsigned long flags;
> > +
> > +       if (non_blocking && atomic_read(&bt_slave->response_in_progress))
> > +               return -EAGAIN;
> > +       else if (!non_blocking)
> > +               wait_event_interruptible(
> > +                               bt_slave->wait_queue,
> > +
>  !atomic_read(&bt_slave->response_in_progress));
> > +
> > +       spin_lock_irqsave(&bt_slave->lock, flags);
> > +       memcpy(&bt_slave->response, bt_response, sizeof(struct bt_msg));
> > +       atomic_set(&bt_slave->response_in_progress, 0);
> > +       spin_unlock_irqrestore(&bt_slave->lock, flags);
> > +       return 0;
> > +}
> > +
> > +static inline struct bt_i2c_slave *to_bt_i2c_slave(struct file *file)
> > +{
> > +       return container_of(file->private_data, struct bt_i2c_slave,
> miscdev);
> > +}
> > +
> > +static ssize_t bt_read(struct file *file, char __user *buf, size_t
> count,
> > +                      loff_t *ppos)
> > +{
> > +       struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
> > +       struct bt_msg msg;
> > +       ssize_t ret;
> > +
> > +       mutex_lock(&bt_slave->file_mutex);
> > +       ret = receive_bt_request(bt_slave, file->f_flags & O_NONBLOCK,
> &msg);
> > +       if (ret < 0)
> > +               goto out;
> > +       count = min(count, bt_msg_len(&msg));
> > +       if (copy_to_user(buf, &msg, count)) {
> > +               ret = -EFAULT;
> > +               goto out;
> > +       }
> > +
> > +out:
> > +       mutex_unlock(&bt_slave->file_mutex);
> > +       if (ret < 0)
> > +               return ret;
> > +       else
> > +               return count;
> > +}
> > +
> > +static ssize_t bt_write(struct file *file, const char __user *buf,
> size_t count,
> > +                       loff_t *ppos)
> > +{
> > +       struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
> > +       struct bt_msg msg;
> > +       ssize_t ret;
> > +
> > +       if (count > sizeof(struct bt_msg))
> > +               return -EFAULT;
> > +
> > +       if (copy_from_user(&msg, buf, count) || count < bt_msg_len(&msg))
> > +               return -EFAULT;
> > +
> > +       mutex_lock(&bt_slave->file_mutex);
> > +       ret = send_bt_response(bt_slave, file->f_flags & O_NONBLOCK,
> &msg);
> > +       mutex_unlock(&bt_slave->file_mutex);
> > +
> > +       if (ret < 0)
> > +               return ret;
> > +       else
> > +               return count;
> > +}
> > +
> > +static long bt_ioctl(struct file *file, unsigned int cmd, unsigned long
> param)
> > +{
> > +       return 0;
> > +}
> > +
> > +static unsigned int bt_poll(struct file *file, poll_table *wait)
> > +{
> > +       struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
> > +       unsigned int mask = 0;
> > +
> > +       mutex_lock(&bt_slave->file_mutex);
> > +       poll_wait(file, &bt_slave->wait_queue, wait);
> > +
> > +       if (atomic_read(&bt_slave->request_queue_len))
> > +               mask |= POLLIN;
> > +       if (!atomic_read(&bt_slave->response_in_progress))
> > +               mask |= POLLOUT;
> > +       mutex_unlock(&bt_slave->file_mutex);
> > +       return mask;
> > +}
> > +
> > +static const struct file_operations bt_fops = {
> > +       .owner          = THIS_MODULE,
> > +       .read           = bt_read,
> > +       .write          = bt_write,
> > +       .poll           = bt_poll,
> > +       .unlocked_ioctl = bt_ioctl,
> > +};
> > +
> > +static int handle_request(struct bt_i2c_slave *bt_slave)
> > +{
> > +       struct bt_request_elem *queue_elem;
> > +
> > +       if (atomic_read(&bt_slave->request_queue_len) >=
> request_queue_max_len)
> > +               return -EFAULT;
> > +       queue_elem = kmalloc(sizeof(struct bt_request_elem), GFP_KERNEL);
> > +       memcpy(&queue_elem->request, &bt_slave->request, sizeof(struct
> bt_msg));
> > +       list_add(&queue_elem->list, &bt_slave->request_queue);
> > +       atomic_inc(&bt_slave->request_queue_len);
> > +       wake_up_all(&bt_slave->wait_queue);
> > +       return 0;
> > +}
> > +
> > +static int complete_response(struct bt_i2c_slave *bt_slave)
> > +{
> > +       /* Invalidate response in buffer to denote it having been sent.
> */
> > +       bt_slave->response.len = 0;
> > +       atomic_set(&bt_slave->response_in_progress, 1);
> > +       wake_up_all(&bt_slave->wait_queue);
> > +       return 0;
> > +}
> > +
> > +static int bt_i2c_slave_cb(struct i2c_client *client,
> > +                          enum i2c_slave_event event, u8 *val)
> > +{
> > +       struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
> > +       u8 *buf;
> > +
> > +       spin_lock(&bt_slave->lock);
> > +       switch (event) {
> > +       case I2C_SLAVE_WRITE_REQUESTED:
> > +               bt_slave->msg_idx = 0;
> > +               break;
> > +
> > +       case I2C_SLAVE_WRITE_RECEIVED:
> > +               buf = (u8 *) &bt_slave->request;
> > +               if (bt_slave->msg_idx >= sizeof(struct bt_i2c_slave))
> > +                       break;
> > +
> > +               buf[bt_slave->msg_idx++] = *val;
> > +               if (bt_slave->msg_idx >= bt_msg_len(&bt_slave->request))
> > +                       handle_request(bt_slave);
> > +               break;
> > +
> > +       case I2C_SLAVE_READ_REQUESTED:
> > +               buf = (u8 *) &bt_slave->response;
> > +               bt_slave->msg_idx = 0;
> > +               *val = buf[bt_slave->msg_idx];
> > +               /*
> > +                * Do not increment buffer_idx here, because we don't
> know if
> > +                * this byte will be actually used. Read Linux I2C slave
> docs
> > +                * for details.
> > +                */
> > +               break;
> > +
> > +       case I2C_SLAVE_READ_PROCESSED:
> > +               buf = (u8 *) &bt_slave->response;
> > +               if (bt_slave->response.len &&
> > +                   bt_slave->msg_idx < bt_msg_len(&bt_slave->response))
> {
> > +                       *val = buf[++bt_slave->msg_idx];
> > +               } else {
> > +                       *val = 0;
> > +               }
> > +               if (bt_slave->msg_idx + 1 >=
> bt_msg_len(&bt_slave->response))
> > +                       complete_response(bt_slave);
> > +               break;
> > +
> > +       case I2C_SLAVE_STOP:
> > +               bt_slave->msg_idx = 0;
> > +               break;
> > +
> > +       default:
> > +               break;
> > +       }
> > +       spin_unlock(&bt_slave->lock);
> > +
> > +       return 0;
> > +}
> > +
> > +static int bt_i2c_probe(struct i2c_client *client,
> > +                       const struct i2c_device_id *id)
> > +{
> > +       struct bt_i2c_slave *bt_slave;
> > +       int ret;
> > +
> > +       bt_slave = devm_kzalloc(&client->dev, sizeof(struct
> bt_i2c_slave),
> > +                               GFP_KERNEL);
> > +       if (!bt_slave)
> > +               return -ENOMEM;
> > +
> > +       spin_lock_init(&bt_slave->lock);
> > +       init_waitqueue_head(&bt_slave->wait_queue);
> > +       atomic_set(&bt_slave->request_queue_len, 0);
> > +       atomic_set(&bt_slave->response_in_progress, 0);
> > +       INIT_LIST_HEAD(&bt_slave->request_queue);
> > +
> > +       mutex_init(&bt_slave->file_mutex);
> > +
> > +       bt_slave->miscdev.minor = MISC_DYNAMIC_MINOR;
> > +       bt_slave->miscdev.name = DEVICE_NAME;
> > +       bt_slave->miscdev.fops = &bt_fops;
> > +       bt_slave->miscdev.parent = &client->dev;
> > +       ret = misc_register(&bt_slave->miscdev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       bt_slave->client = client;
> > +       i2c_set_clientdata(client, bt_slave);
> > +       ret = i2c_slave_register(client, bt_i2c_slave_cb);
> > +       if (ret < 0) {
> > +               misc_deregister(&bt_slave->miscdev);
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int bt_i2c_remove(struct i2c_client *client)
> > +{
> > +       struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
> > +
> > +       i2c_slave_unregister(client);
> > +       misc_deregister(&bt_slave->miscdev);
> > +       return 0;
> > +}
> > +
> > +static const struct i2c_device_id bt_i2c_id[] = {
> > +       {"bt-i2c-slave", 0},
> > +       {},
> > +};
> > +MODULE_DEVICE_TABLE(i2c, bt_i2c_id);
> > +
> > +static struct i2c_driver bt_i2c_driver = {
> > +       .driver = {
> > +               .name           = "bt-i2c-slave",
> > +       },
> > +       .probe          = bt_i2c_probe,
> > +       .remove         = bt_i2c_remove,
> > +       .id_table       = bt_i2c_id,
> > +};
> > +module_i2c_driver(bt_i2c_driver);
> > +
> > +MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
> > +MODULE_DESCRIPTION("IPMI Block Transfer over I2C slave.");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/misc/bt.h b/drivers/misc/bt.h
> > new file mode 100644
> > index 0000000..c0c2881
> > --- /dev/null
> > +++ b/drivers/misc/bt.h
> > @@ -0,0 +1,19 @@
> > +#ifndef _DRIVERS_MISC_BT_H
> > +#define _DRIVERS_MISC_BT_H
> > +
> > +#include <linux/types.h>
> > +
> > +struct bt_msg {
> > +       u8 len;
> > +       u8 netfn_lun;
> > +       u8 seq;
> > +       u8 cmd;
> > +       u8 payload[252];
> > +};
> > +
> > +static inline u32 bt_msg_len(struct bt_msg *bt_request)
> > +{
> > +       return bt_request->len + 1;
> > +}
> > +
> > +#endif /* _DRIVERS_MISC_BT_H */
> > --
> > 2.8.0.rc3.226.g39d4020
> >
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
>

--94eb2c1917509c5649053c19f3b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"color:rgb(33,33,33);font-family:&=
quot;helvetica neue&quot;,helvetica,arial,sans-serif">There is talk of putt=
ing the bt-host driver into drivers/char/ipmi. I</span><br class=3D"gmail_m=
sg" style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,hel=
vetica,arial,sans-serif"><span style=3D"color:rgb(33,33,33);font-family:&qu=
ot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt; imagine that will =
affect your work.</span><div><span style=3D"color:rgb(33,33,33);font-family=
:&quot;helvetica neue&quot;,helvetica,arial,sans-serif"><br></span></div><d=
iv><span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot=
;,helvetica,arial,sans-serif">Yes it would; this was talked about more on t=
he cover letter, so I will continue this discussion there.</span></div><div=
><span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,=
helvetica,arial,sans-serif"><br></span></div><div><span style=3D"color:rgb(=
33,33,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif=
">&gt;=C2=A0</span><span style=3D"color:rgb(33,33,33);font-family:&quot;hel=
vetica neue&quot;,helvetica,arial,sans-serif;line-height:1.5">I didn&#39;t =
pick up on this when reading your cover letter. The host side</span></div><=
span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,he=
lvetica,arial,sans-serif">&gt; will read the messages straight into the ker=
nel and userspace, not</span><br class=3D"gmail_msg" style=3D"color:rgb(33,=
33,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif"><=
span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,he=
lvetica,arial,sans-serif">&gt; pass them through firmware?</span><div><span=
 style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvet=
ica,arial,sans-serif;line-height:1.5"><br></span></div><div><span style=3D"=
color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,=
sans-serif;line-height:1.5">That is the plan at this time. If the BIOS were=
 to want to communicate with the BMC they would obviously have to implement=
 the master side of this driver. I think it is useful to</span></div><div><=
span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;,he=
lvetica,arial,sans-serif;line-height:1.5">=C2=A0 a) provide a reference imp=
lementation in the kernel</span></div><div><span style=3D"color:rgb(33,33,3=
3);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif;line-h=
eight:1.5">=C2=A0 b) not make any assumptions about something like BIOS run=
time services</span></div><div><font color=3D"#212121" face=3D"helvetica ne=
ue, helvetica, arial, sans-serif">In any case, the slave side does not care=
 how the master organizes its communication with the BMC.</font></div><div>=
<font color=3D"#212121" face=3D"helvetica neue, helvetica, arial, sans-seri=
f"><br></font></div><div><font color=3D"#212121" face=3D"helvetica neue, he=
lvetica, arial, sans-serif">&gt;=C2=A0</font><span style=3D"color:rgb(33,33=
,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">It =
feels like there should be a neater way of doing this read/write</span><br =
class=3D"gmail_msg" style=3D"color:rgb(33,33,33);font-family:&quot;helvetic=
a neue&quot;,helvetica,arial,sans-serif"><span style=3D"color:rgb(33,33,33)=
;font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt; an=
d wait operation that the driver does. I don&#39;t have a specific</span><b=
r class=3D"gmail_msg" style=3D"color:rgb(33,33,33);font-family:&quot;helvet=
ica neue&quot;,helvetica,arial,sans-serif"><span style=3D"color:rgb(33,33,3=
3);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif">&gt; =
recommendation though.</span></div><div><font color=3D"#212121" face=3D"hel=
vetica neue, helvetica, arial, sans-serif"><br></font></div><div><font colo=
r=3D"#212121" face=3D"helvetica neue, helvetica, arial, sans-serif">I do no=
t think the write is particularly messy, maybe I am being presumptuous abou=
t the amount of errors that an I2C bus may experience. I can appreciate you=
r concern about the read though; I was not thrilled about having to poll fo=
r a non-zero length, but without SMBus Alert we do not have a way of knowin=
g whether a read is ready without polling (I fully intend on adding support=
 for that later on, but that requires a change to I2C core and I would real=
ly like to keep that separate :-) ).</font><br></div><div><font color=3D"#2=
12121" face=3D"helvetica neue, helvetica, arial, sans-serif"><br></font></d=
iv><div><font color=3D"#212121" face=3D"helvetica neue, helvetica, arial, s=
ans-serif">&gt;=C2=A0</font><span style=3D"color:rgb(33,33,33);font-family:=
&quot;helvetica neue&quot;,helvetica,arial,sans-serif;line-height:1.5">The =
goto doesn&#39;t do much :)</span></div><div><span style=3D"color:rgb(33,33=
,33);font-family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif;line=
-height:1.5"><br></span></div><div><span style=3D"color:rgb(33,33,33);font-=
family:&quot;helvetica neue&quot;,helvetica,arial,sans-serif;line-height:1.=
5">No it does not, but I thought it made it clear that it was intentionally=
 failing out rather than proceeding normally. I guess I thought it better f=
it past criticism about explicit fail out (I am thinking of &quot;goto out&=
quot; over &quot;cleanup return&quot; in the I2C driver). In any case, I do=
 not feel strongly about it, but I guess I would like an explanation.</span=
></div><div><span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica =
neue&quot;,helvetica,arial,sans-serif;line-height:1.5"><br></span></div><di=
v><span style=3D"color:rgb(33,33,33);font-family:&quot;helvetica neue&quot;=
,helvetica,arial,sans-serif;line-height:1.5">Thanks!</span></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, Sep 8, 2016 at 10:51 PM=
 Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Fri, Sep 9, 2016 at 6:58 =
AM, Brendan Higgins<br class=3D"gmail_msg">
&lt;<a href=3D"mailto:brendanhiggins@google.com" class=3D"gmail_msg" target=
=3D"_blank">brendanhiggins@google.com</a>&gt; wrote:<br class=3D"gmail_msg"=
>
&gt; The IPMI definition of the Block Transfer protocol defines the hardwar=
e<br class=3D"gmail_msg">
&gt; registers and behavior in addition to the message format and messaging=
<br class=3D"gmail_msg">
&gt; semantics. This implements a new protocol that uses IPMI Block Transfe=
r<br class=3D"gmail_msg">
&gt; messages and semantics on top of a standard I2C interface. This protoc=
ol<br class=3D"gmail_msg">
&gt; has the same BMC side file system interface as &quot;bt-host&quot;.<br=
 class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; Signed-off-by: Brendan Higgins &lt;<a href=3D"mailto:brendanhiggins@go=
ogle.com" class=3D"gmail_msg" target=3D"_blank">brendanhiggins@google.com</=
a>&gt;<br class=3D"gmail_msg">
&gt; ---<br class=3D"gmail_msg">
&gt;=C2=A0 drivers/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23=
 ++++<br class=3D"gmail_msg">
&gt;=C2=A0 drivers/misc/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02=
 +<br class=3D"gmail_msg">
&gt;=C2=A0 drivers/misc/bt-i2c-master.c | 199 +++++++++++++++++++++++++++<b=
r class=3D"gmail_msg">
&gt;=C2=A0 drivers/misc/bt-i2c-slave.c=C2=A0 | 317 ++++++++++++++++++++++++=
+++++++++++++++++++<br class=3D"gmail_msg">
&gt;=C2=A0 drivers/misc/bt.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 19 +++<br class=3D"gmail_msg">
&gt;=C2=A0 5 files changed, 560 insertions(+)<br class=3D"gmail_msg">
&gt;=C2=A0 create mode 100644 drivers/misc/bt-i2c-master.c<br class=3D"gmai=
l_msg">
&gt;=C2=A0 create mode 100644 drivers/misc/bt-i2c-slave.c<br class=3D"gmail=
_msg">
&gt;=C2=A0 create mode 100644 drivers/misc/bt.h<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
There is talk of putting the bt-host driver into drivers/char/ipmi. I<br cl=
ass=3D"gmail_msg">
imagine that will affect your work.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig<br class=3D"g=
mail_msg">
&gt; index 4617ddc..1c7e3a9 100644<br class=3D"gmail_msg">
&gt; --- a/drivers/misc/Kconfig<br class=3D"gmail_msg">
&gt; +++ b/drivers/misc/Kconfig<br class=3D"gmail_msg">
&gt; @@ -809,6 +809,29 @@ config ASPEED_BT_IPMI_HOST<br class=3D"gmail_msg"=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0help<br class=3D"gmail_msg">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Support for the Aspeed BT ipmi=
 host.<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; +config BT_I2C_SLAVE<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !ASPEED_BT_IPMI_HOST &amp;&amp;=
 I2C_SLAVE<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;BT I2C IPMI slave driver&qu=
ot;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;n&quot;<br class=3D"gmail_ms=
g">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Block Transfer over I2C defines a n=
ew IPMI compatible interface that<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uses Block Transfer messages and se=
mantics on top of plain old I2C.<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This adds support for the slave sid=
e of the protocol (only really<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0useful for BMCs (Baseboard Manageme=
nt Controllers)).<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +config BT_I2C_MASTER<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on I2C<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;BT I2C IPMI master driver&q=
uot;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default &quot;n&quot;<br class=3D"gmail_ms=
g">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0---help---<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Block Transfer over I2C defines a n=
ew IPMI compatible interface that<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uses Block Transfer messages and se=
mantics on top of plain old I2C.<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This adds support for master side o=
f the protocol (this is most likely<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what you want if you are compiling =
for a regular CPU, only useful if<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0your computer has a BMC that speaks=
 the slave side of this protocol).<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
I didn&#39;t pick up on this when reading your cover letter. The host side<=
br class=3D"gmail_msg">
will read the messages straight into the kernel and userspace, not<br class=
=3D"gmail_msg">
pass them through firmware?<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt;=C2=A0 source &quot;drivers/misc/c2port/Kconfig&quot;<br class=3D"gmail=
_msg">
&gt;=C2=A0 source &quot;drivers/misc/eeprom/Kconfig&quot;<br class=3D"gmail=
_msg">
&gt;=C2=A0 source &quot;drivers/misc/cb710/Kconfig&quot;<br class=3D"gmail_=
msg">
&gt; diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile<br class=3D=
"gmail_msg">
&gt; index 724861b..b642ed8 100644<br class=3D"gmail_msg">
&gt; --- a/drivers/misc/Makefile<br class=3D"gmail_msg">
&gt; +++ b/drivers/misc/Makefile<br class=3D"gmail_msg">
&gt; @@ -58,3 +58,5 @@ obj-$(CONFIG_VEXPRESS_SYSCFG) +=3D vexpress-syscfg.o=
<br class=3D"gmail_msg">
&gt;=C2=A0 obj-$(CONFIG_CXL_BASE)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D cxl=
/<br class=3D"gmail_msg">
&gt;=C2=A0 obj-$(CONFIG_PANEL)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D panel.o<br class=3D"gmail_msg">
&gt;=C2=A0 obj-$(CONFIG_ASPEED_BT_IPMI_HOST)=C2=A0 =C2=A0 =C2=A0 +=3D bt-ho=
st.o<br class=3D"gmail_msg">
&gt; +obj-$(CONFIG_BT_I2C_SLAVE)=C2=A0 =C2=A0 =C2=A0+=3D bt-i2c-slave.o<br =
class=3D"gmail_msg">
&gt; +obj-$(CONFIG_BT_I2C_MASTER)=C2=A0 =C2=A0 +=3D bt-i2c-master.o<br clas=
s=3D"gmail_msg">
&gt; diff --git a/drivers/misc/bt-i2c-master.c b/drivers/misc/bt-i2c-master=
.c<br class=3D"gmail_msg">
&gt; new file mode 100644<br class=3D"gmail_msg">
&gt; index 0000000..22142d6<br class=3D"gmail_msg">
&gt; --- /dev/null<br class=3D"gmail_msg">
&gt; +++ b/drivers/misc/bt-i2c-master.c<br class=3D"gmail_msg">
&gt; @@ -0,0 +1,199 @@<br class=3D"gmail_msg">
&gt; +#include &lt;linux/module.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/moduleparam.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/errno.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/poll.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/mutex.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/slab.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/i2c.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/init.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/device.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/of.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/platform_device.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/io.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/delay.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/miscdevice.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/timer.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/jiffies.h&gt;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +#include &quot;bt.h&quot;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +#define DEVICE_NAME=C2=A0 =C2=A0 &quot;bt-master&quot;<br class=3D"gm=
ail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +struct bt_i2c_master {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client=C2=A0 =C2=A0 =C2=A0 =C2=
=A0*client;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct miscdevice=C2=A0 =C2=A0 =C2=A0 =C2=
=A0miscdev;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file_mutex;<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static const unsigned long write_timeout =3D 25;<br class=3D"gmail_ms=
g">
&gt; +<br class=3D"gmail_msg">
&gt; +static int send_bt_request(struct bt_i2c_master *bt_master,<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct bt_msg *bt_request)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D bt_master-&g=
t;client;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf =3D (u8 *) bt_request;<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout, read_time;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout =3D jiffies + msecs_to_jiffies(wri=
te_timeout);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_time =3D =
jiffies;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_ma=
ster_send(client, buf, bt_msg_len(bt_request));<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &gt;=
=3D 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(1=
000, 1500);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (time_before(read_time, timeout));=
<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
It feels like there should be a neater way of doing this read/write<br clas=
s=3D"gmail_msg">
and wait operation that the driver does. I don&#39;t have a specific<br cla=
ss=3D"gmail_msg">
recommendation though.<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int receive_bt_response(struct bt_i2c_master *bt_master,<br cl=
ass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct bt_msg *bt_response)<br class=3D=
"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D bt_master-&g=
t;client;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf =3D (u8 *) bt_response;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 len =3D 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout, read_time;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Slave may not NACK when not ready, so w=
e peek at the first byte to<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * see if it is a valid length.<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0while (len =3D=3D 0) {<br class=3D"gmail_m=
sg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_master_rec=
v(client, &amp;len, 1);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len !=3D 0=
)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(1=
000, 1500);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Signal rece=
ived: quit syscall. */<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (signal_pen=
ding(current))<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -ERESTARTSYS;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0timeout =3D jiffies + msecs_to_jiffies(wri=
te_timeout);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_time =3D =
jiffies;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_ma=
ster_recv(client, buf, len + 1);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &gt;=
=3D 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usleep_range(1=
000, 1500);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} while (time_before(read_time, timeout));=
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static inline struct bt_i2c_master *to_bt_i2c_master(struct file *fil=
e)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(file-&gt;private_data,=
 struct bt_i2c_master, miscdev);<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static ssize_t bt_read(struct file *file, char __user *buf, size_t co=
unt,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 loff_t *ppos)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_master *bt_master =3D to_bt_=
i2c_master(file);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg msg;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;bt_master-&gt;file_mutex);=
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D receive_bt_response(bt_master, &am=
p;msg);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D min(count, bt_msg_len(&amp;msg))=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(buf, &amp;msg, count)) {<=
br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAUL=
T;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
<br class=3D"gmail_msg">
The goto doesn&#39;t do much :)<br class=3D"gmail_msg">
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +out:<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;bt_master-&gt;file_mutex=
);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static ssize_t bt_write(struct file *file, const char __user *buf, si=
ze_t count,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0loff_t *ppos)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_master *bt_master =3D to_bt_=
i2c_master(file);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg msg;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;bt_master-&gt;file_mutex);=
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &gt; sizeof(struct bt_msg)) {<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAUL=
T;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;msg, buf, count) |=
| count &lt; bt_msg_len(&amp;msg)) {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAUL=
T;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D send_bt_request(bt_master, &amp;ms=
g);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +out:<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;bt_master-&gt;file_mutex=
);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static const struct file_operations bt_fops =3D {<br class=3D"gmail_m=
sg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D THIS_MODULE,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D bt_read,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D bt_write,<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int bt_i2c_probe(struct i2c_client *client,<br class=3D"gmail_=
msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0const struct i2c_device_id *id)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_master *bt_master;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_master =3D devm_kzalloc(&amp;client-&gt=
;dev, sizeof(struct bt_i2c_master),<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GFP_KERNEL);<br class=3D"gmail_m=
sg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bt_master)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;bt_master-&gt;file_mutex);=
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_master-&gt;client =3D client;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(client, bt_master);<br =
class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_master-&gt;miscdev.minor =3D MISC_DYNAM=
IC_MINOR;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_master-&gt;<a href=3D"http://miscdev.na=
me" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">miscdev.name</=
a> =3D DEVICE_NAME;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_master-&gt;miscdev.fops =3D &amp;bt_fop=
s;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_master-&gt;miscdev.parent =3D &amp;clie=
nt-&gt;dev;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D misc_register(&amp;bt_master-&gt;m=
iscdev);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int bt_i2c_remove(struct i2c_client *client)<br class=3D"gmail=
_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_master *bt_master =3D i2c_ge=
t_clientdata(client);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0misc_deregister(&amp;bt_master-&gt;miscdev=
);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static const struct i2c_device_id bt_i2c_id[] =3D {<br class=3D"gmail=
_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;bt-i2c-master&quot;, 0},<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +MODULE_DEVICE_TABLE(i2c, bt_i2c_id);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static struct i2c_driver bt_i2c_driver =3D {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;bt-i2c-master&quot;,<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D bt_i2c_probe,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D bt_i2c_remove,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D bt=
_i2c_id,<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +module_i2c_driver(bt_i2c_driver);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +MODULE_AUTHOR(&quot;Brendan Higgins &lt;<a href=3D"mailto:brendanhigg=
ins@google.com" class=3D"gmail_msg" target=3D"_blank">brendanhiggins@google=
.com</a>&gt;&quot;);<br class=3D"gmail_msg">
&gt; +MODULE_DESCRIPTION(&quot;IPMI Block Transfer over I2C master.&quot;);=
<br class=3D"gmail_msg">
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br class=3D"gmail_msg">
&gt; diff --git a/drivers/misc/bt-i2c-slave.c b/drivers/misc/bt-i2c-slave.c=
<br class=3D"gmail_msg">
&gt; new file mode 100644<br class=3D"gmail_msg">
&gt; index 0000000..1a90e05<br class=3D"gmail_msg">
&gt; --- /dev/null<br class=3D"gmail_msg">
&gt; +++ b/drivers/misc/bt-i2c-slave.c<br class=3D"gmail_msg">
&gt; @@ -0,0 +1,317 @@<br class=3D"gmail_msg">
&gt; +#include &lt;linux/module.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/moduleparam.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/errno.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/poll.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/spinlock.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/mutex.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/slab.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/i2c.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/init.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/device.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/of.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/platform_device.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/io.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/delay.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/miscdevice.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/timer.h&gt;<br class=3D"gmail_msg">
&gt; +#include &lt;linux/jiffies.h&gt;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +#include &quot;bt.h&quot;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +/*<br class=3D"gmail_msg">
&gt; + * TODO: This is &quot;bt-host&quot; to match the bt-host driver; how=
ever, I think this is<br class=3D"gmail_msg">
&gt; + * unclear in the context of a CPU side driver. Should probably name =
this<br class=3D"gmail_msg">
&gt; + * and the DEVICE_NAME in bt-host to something like &quot;bt-bmc&quot=
; or &quot;bt-slave&quot;.<br class=3D"gmail_msg">
&gt; + */<br class=3D"gmail_msg">
&gt; +#define DEVICE_NAME=C2=A0 =C2=A0 &quot;bt-host&quot;<br class=3D"gmai=
l_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static const unsigned long request_queue_max_len =3D 256;<br class=3D=
"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +struct bt_request_elem {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 list;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0request;<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +struct bt_i2c_slave {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct i2c_client=C2=A0 =C2=A0 =C2=A0 =C2=
=A0*client;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct miscdevice=C2=A0 =C2=A0 =C2=A0 =C2=
=A0miscdev;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0request;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 request_queue;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 request_queue_len;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0response;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 response_in_progress;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg_idx;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spinlock_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lock;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wait_queue_head_t=C2=A0 =C2=A0 =C2=A0 =C2=
=A0wait_queue;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct mutex=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 file_mutex;<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int receive_bt_request(struct bt_i2c_slave *bt_slave, bool non=
_blocking,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg *bt_request) {<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br class=3D"gmail_msg=
">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_request_elem *queue_elem;<br cla=
ss=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!atomic_read(&amp;bt_slave-&gt;request=
_queue_len) &amp;&amp; non_blocking)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EAGAIN=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!non_blocking)<br class=3D"gmail_=
msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_event_int=
erruptible(<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;wait_queue,<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_read(&amp;bt_slave-&gt;req=
uest_queue_len));<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;bt_slave-&gt;lock, =
flags);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0queue_elem =3D list_first_entry(&amp;bt_sl=
ave-&gt;request_queue,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_re=
quest_elem, list);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(bt_request, &amp;queue_elem-&gt;req=
uest, sizeof(struct bt_msg));<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;queue_elem-&gt;list);<br cla=
ss=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(queue_elem);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_dec(&amp;bt_slave-&gt;request_queue=
_len);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;bt_slave-&gt;l=
ock, flags);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int send_bt_response(struct bt_i2c_slave *bt_slave, bool non_b=
locking,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg *bt_response) {<br class=3D"gmail=
_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long flags;<br class=3D"gmail_msg=
">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (non_blocking &amp;&amp; atomic_read(&a=
mp;bt_slave-&gt;response_in_progress))<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EAGAIN=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!non_blocking)<br class=3D"gmail_=
msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wait_event_int=
erruptible(<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;wait_queue,<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!atomic_read(&amp;bt_slave-&gt;re=
sponse_in_progress));<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_irqsave(&amp;bt_slave-&gt;lock, =
flags);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;bt_slave-&gt;response, bt_resp=
onse, sizeof(struct bt_msg));<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_set(&amp;bt_slave-&gt;response_in_p=
rogress, 0);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock_irqrestore(&amp;bt_slave-&gt;l=
ock, flags);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static inline struct bt_i2c_slave *to_bt_i2c_slave(struct file *file)=
<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return container_of(file-&gt;private_data,=
 struct bt_i2c_slave, miscdev);<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static ssize_t bt_read(struct file *file, char __user *buf, size_t co=
unt,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 loff_t *ppos)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_slave *bt_slave =3D to_bt_i2=
c_slave(file);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg msg;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;bt_slave-&gt;file_mutex);<=
br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D receive_bt_request(bt_slave, file-=
&gt;f_flags &amp; O_NONBLOCK, &amp;msg);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0count =3D min(count, bt_msg_len(&amp;msg))=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_to_user(buf, &amp;msg, count)) {<=
br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EFAUL=
T;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +out:<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;bt_slave-&gt;file_mutex)=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static ssize_t bt_write(struct file *file, const char __user *buf, si=
ze_t count,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0loff_t *ppos)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_slave *bt_slave =3D to_bt_i2=
c_slave(file);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_msg msg;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (count &gt; sizeof(struct bt_msg))<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT=
;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (copy_from_user(&amp;msg, buf, count) |=
| count &lt; bt_msg_len(&amp;msg))<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT=
;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;bt_slave-&gt;file_mutex);<=
br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D send_bt_response(bt_slave, file-&g=
t;f_flags &amp; O_NONBLOCK, &amp;msg);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;bt_slave-&gt;file_mutex)=
;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static long bt_ioctl(struct file *file, unsigned int cmd, unsigned lo=
ng param)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static unsigned int bt_poll(struct file *file, poll_table *wait)<br c=
lass=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_slave *bt_slave =3D to_bt_i2=
c_slave(file);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int mask =3D 0;<br class=3D"gmail=
_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;bt_slave-&gt;file_mutex);<=
br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0poll_wait(file, &amp;bt_slave-&gt;wait_que=
ue, wait);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (atomic_read(&amp;bt_slave-&gt;request_=
queue_len))<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask |=3D POLL=
IN;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!atomic_read(&amp;bt_slave-&gt;respons=
e_in_progress))<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask |=3D POLL=
OUT;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;bt_slave-&gt;file_mutex)=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return mask;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static const struct file_operations bt_fops =3D {<br class=3D"gmail_m=
sg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.owner=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D THIS_MODULE,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.read=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D bt_read,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.write=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D bt_write,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.poll=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D bt_poll,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.unlocked_ioctl =3D bt_ioctl,<br class=3D"=
gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int handle_request(struct bt_i2c_slave *bt_slave)<br class=3D"=
gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_request_elem *queue_elem;<br cla=
ss=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (atomic_read(&amp;bt_slave-&gt;request_=
queue_len) &gt;=3D request_queue_max_len)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAULT=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0queue_elem =3D kmalloc(sizeof(struct bt_re=
quest_elem), GFP_KERNEL);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;queue_elem-&gt;request, &amp;b=
t_slave-&gt;request, sizeof(struct bt_msg));<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;queue_elem-&gt;list, &amp;bt=
_slave-&gt;request_queue);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_inc(&amp;bt_slave-&gt;request_queue=
_len);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_all(&amp;bt_slave-&gt;wait_queue);=
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int complete_response(struct bt_i2c_slave *bt_slave)<br class=
=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Invalidate response in buffer to denote=
 it having been sent. */<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;response.len =3D 0;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_set(&amp;bt_slave-&gt;response_in_p=
rogress, 1);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_all(&amp;bt_slave-&gt;wait_queue);=
<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int bt_i2c_slave_cb(struct i2c_client *client,<br class=3D"gma=
il_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 enum i2c_slave_event event, u8 *val)<br class=3D"gmai=
l_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_slave *bt_slave =3D i2c_get_=
clientdata(client);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 *buf;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;bt_slave-&gt;lock);<br clas=
s=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (event) {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SLAVE_WRITE_REQUESTED:<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;m=
sg_idx =3D 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br clas=
s=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SLAVE_WRITE_RECEIVED:<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D (u8 *)=
 &amp;bt_slave-&gt;request;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bt_slave-&=
gt;msg_idx &gt;=3D sizeof(struct bt_i2c_slave))<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[bt_slave-&=
gt;msg_idx++] =3D *val;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bt_slave-&=
gt;msg_idx &gt;=3D bt_msg_len(&amp;bt_slave-&gt;request))<br class=3D"gmail=
_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0handle_request(bt_slave);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br clas=
s=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SLAVE_READ_REQUESTED:<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D (u8 *)=
 &amp;bt_slave-&gt;response;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;m=
sg_idx =3D 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D buf[b=
t_slave-&gt;msg_idx];<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Do not incr=
ement buffer_idx here, because we don&#39;t know if<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * this byte w=
ill be actually used. Read Linux I2C slave docs<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for details=
.<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br clas=
s=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SLAVE_READ_PROCESSED:<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf =3D (u8 *)=
 &amp;bt_slave-&gt;response;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bt_slave-&=
gt;response.len &amp;&amp;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bt_slave-&gt;msg_idx &lt; bt_msg_len(&amp;bt_slave-&gt;response)) {<br clas=
s=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*val =3D buf[++bt_slave-&gt;msg_idx];<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br cl=
ass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*val =3D 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"=
gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bt_slave-&=
gt;msg_idx + 1 &gt;=3D bt_msg_len(&amp;bt_slave-&gt;response))<br class=3D"=
gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0complete_response(bt_slave);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br clas=
s=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_SLAVE_STOP:<br class=3D"gmail_msg=
">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;m=
sg_idx =3D 0;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br clas=
s=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br clas=
s=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;bt_slave-&gt;lock);<br cl=
ass=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int bt_i2c_probe(struct i2c_client *client,<br class=3D"gmail_=
msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0const struct i2c_device_id *id)<br class=3D"gmail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_slave *bt_slave;<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave =3D devm_kzalloc(&amp;client-&gt;=
dev, sizeof(struct bt_i2c_slave),<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br class=3D"gmail_ms=
g">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bt_slave)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;bt_slave-&gt;lock);<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0init_waitqueue_head(&amp;bt_slave-&gt;wait=
_queue);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_set(&amp;bt_slave-&gt;request_queue=
_len, 0);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic_set(&amp;bt_slave-&gt;response_in_p=
rogress, 0);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;bt_slave-&gt;request_q=
ueue);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_init(&amp;bt_slave-&gt;file_mutex);<=
br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;miscdev.minor =3D MISC_DYNAMI=
C_MINOR;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;<a href=3D"http://miscdev.nam=
e" rel=3D"noreferrer" class=3D"gmail_msg" target=3D"_blank">miscdev.name</a=
> =3D DEVICE_NAME;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;miscdev.fops =3D &amp;bt_fops=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;miscdev.parent =3D &amp;clien=
t-&gt;dev;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D misc_register(&amp;bt_slave-&gt;mi=
scdev);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bt_slave-&gt;client =3D client;<br class=
=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(client, bt_slave);<br c=
lass=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_slave_register(client, bt_i2c_=
slave_cb);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0misc_deregiste=
r(&amp;bt_slave-&gt;miscdev);<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
 class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static int bt_i2c_remove(struct i2c_client *client)<br class=3D"gmail=
_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct bt_i2c_slave *bt_slave =3D i2c_get_=
clientdata(client);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0i2c_slave_unregister(client);<br class=3D"=
gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0misc_deregister(&amp;bt_slave-&gt;miscdev)=
;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br class=3D"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static const struct i2c_device_id bt_i2c_id[] =3D {<br class=3D"gmail=
_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;bt-i2c-slave&quot;, 0},<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{},<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +MODULE_DEVICE_TABLE(i2c, bt_i2c_id);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static struct i2c_driver bt_i2c_driver =3D {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.driver =3D {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;bt-i2c-slave&quot;,<br class=3D=
"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.probe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D bt_i2c_probe,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D bt_i2c_remove,<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D bt=
_i2c_id,<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +module_i2c_driver(bt_i2c_driver);<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +MODULE_AUTHOR(&quot;Brendan Higgins &lt;<a href=3D"mailto:brendanhigg=
ins@google.com" class=3D"gmail_msg" target=3D"_blank">brendanhiggins@google=
.com</a>&gt;&quot;);<br class=3D"gmail_msg">
&gt; +MODULE_DESCRIPTION(&quot;IPMI Block Transfer over I2C slave.&quot;);<=
br class=3D"gmail_msg">
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br class=3D"gmail_msg">
&gt; diff --git a/drivers/misc/bt.h b/drivers/misc/bt.h<br class=3D"gmail_m=
sg">
&gt; new file mode 100644<br class=3D"gmail_msg">
&gt; index 0000000..c0c2881<br class=3D"gmail_msg">
&gt; --- /dev/null<br class=3D"gmail_msg">
&gt; +++ b/drivers/misc/bt.h<br class=3D"gmail_msg">
&gt; @@ -0,0 +1,19 @@<br class=3D"gmail_msg">
&gt; +#ifndef _DRIVERS_MISC_BT_H<br class=3D"gmail_msg">
&gt; +#define _DRIVERS_MISC_BT_H<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +#include &lt;linux/types.h&gt;<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +struct bt_msg {<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 len;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 netfn_lun;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 seq;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 cmd;<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 payload[252];<br class=3D"gmail_msg">
&gt; +};<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +static inline u32 bt_msg_len(struct bt_msg *bt_request)<br class=3D"g=
mail_msg">
&gt; +{<br class=3D"gmail_msg">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return bt_request-&gt;len + 1;<br class=3D=
"gmail_msg">
&gt; +}<br class=3D"gmail_msg">
&gt; +<br class=3D"gmail_msg">
&gt; +#endif /* _DRIVERS_MISC_BT_H */<br class=3D"gmail_msg">
&gt; --<br class=3D"gmail_msg">
&gt; 2.8.0.rc3.226.g39d4020<br class=3D"gmail_msg">
&gt;<br class=3D"gmail_msg">
&gt; _______________________________________________<br class=3D"gmail_msg"=
>
&gt; openbmc mailing list<br class=3D"gmail_msg">
&gt; <a href=3D"mailto:openbmc@lists.ozlabs.org" class=3D"gmail_msg" target=
=3D"_blank">openbmc@lists.ozlabs.org</a><br class=3D"gmail_msg">
&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferre=
r" class=3D"gmail_msg" target=3D"_blank">https://lists.ozlabs.org/listinfo/=
openbmc</a><br class=3D"gmail_msg">
</blockquote></div>

--94eb2c1917509c5649053c19f3b2--
