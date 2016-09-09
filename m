Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVmYX2VpmzDrcD
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 15:52:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=yACsOa2L; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id u68so2552952uau.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 22:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=HggZlnrz9U61dhFBbteWx6oVwAjxY1UT0f9BAzUj7rA=;
 b=yACsOa2LrCM/QAcczxkAFUD8Q2APKwp/J6KEzn+r7PUQAhFvDjtfpWHXNPYGlpBNZC
 jNzAmwXeqEv8jzqlv2jsTUkihOeOi9k1+DteXrLsmAZ2Lw2rjTVT1ox06CyDT+DhSxu6
 pFZyLg6HNaHNrvm6LNuYjTqgyVEb2ACh/xDCp8CUtPxDZ3btTOrYYjlrsWFsP/q2euvp
 kd/RZfo91EslnfgLFEpNrZTlpyWOu6WmuWMf2dHYDz9EAROhF+FAlxTrD+TqJHEE07/T
 GQeTr5WZ75eDlRNnYdt2H/9m0z4cCZ8PjFlH6CXXfjdFS8mdYoxLUIQ1IOUCRDYDG9GH
 1Fzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=HggZlnrz9U61dhFBbteWx6oVwAjxY1UT0f9BAzUj7rA=;
 b=GlPRKw3MbgiUFBabyD2IcUwFZdzEpxupIzlYy0/TMqMHtKj4/1EqTAbPTk+cI4W5ST
 b2pXJQBvtMgtMWeUJYBOIcwG37sAwc4n2nP2GsLJqf9kEwVa/VO1kZepcGaZuXvfjXCv
 zcumCwjwmgOYOuF1XR8F84TtEUqOZoRXVKMTS7tvYRMtu/t7+rFDJjM9Q8arcpBS4gNC
 pVOp6HKD6bKJ5Vw2eQ0WiTi6bqaae1KO3A0GY4ndyni0wDgUhmY0Y9UA46c27qmIV77R
 FRPkLwIPak2WXhfvjht4v3yjCIdctGv47upMae/J3VWbJuITqWCowZkiI7raZvPnqeVy
 b09Q==
X-Gm-Message-State: AE9vXwOV3lShMTFaVb85XJz4OR/oXwZ81jc0LVTkAgGfLodGzfOrjKVuOH64xmL3N64RupLOluZt/h2YRIAv+g==
X-Received: by 10.176.69.235 with SMTP id u98mr1175071uau.144.1473400317972;
 Thu, 08 Sep 2016 22:51:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 8 Sep 2016 22:51:37 -0700 (PDT)
In-Reply-To: <1473370130-26681-2-git-send-email-brendanhiggins@google.com>
References: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
 <1473370130-26681-2-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Sep 2016 15:21:37 +0930
X-Google-Sender-Auth: oybPGlfYxM2lWGTKQMLpIwZ7c4Y
Message-ID: <CACPK8XfVqptgO+r2wf_zxGqBT6Zuh0iNPv5UZvXBcbVEDYowow@mail.gmail.com>
Subject: Re: [RFC 1/2] misc: bt: added IPMI Block Transfer over I2C master and
 slave
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 09 Sep 2016 05:52:01 -0000

On Fri, Sep 9, 2016 at 6:58 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> The IPMI definition of the Block Transfer protocol defines the hardware
> registers and behavior in addition to the message format and messaging
> semantics. This implements a new protocol that uses IPMI Block Transfer
> messages and semantics on top of a standard I2C interface. This protocol
> has the same BMC side file system interface as "bt-host".
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  drivers/misc/Kconfig         |  23 ++++
>  drivers/misc/Makefile        |   2 +
>  drivers/misc/bt-i2c-master.c | 199 +++++++++++++++++++++++++++
>  drivers/misc/bt-i2c-slave.c  | 317 +++++++++++++++++++++++++++++++++++++++++++
>  drivers/misc/bt.h            |  19 +++
>  5 files changed, 560 insertions(+)
>  create mode 100644 drivers/misc/bt-i2c-master.c
>  create mode 100644 drivers/misc/bt-i2c-slave.c
>  create mode 100644 drivers/misc/bt.h
>

There is talk of putting the bt-host driver into drivers/char/ipmi. I
imagine that will affect your work.

> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4617ddc..1c7e3a9 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -809,6 +809,29 @@ config ASPEED_BT_IPMI_HOST
>         help
>           Support for the Aspeed BT ipmi host.
>
> +config BT_I2C_SLAVE
> +       depends on !ASPEED_BT_IPMI_HOST && I2C_SLAVE
> +       tristate "BT I2C IPMI slave driver"
> +       default "n"
> +       ---help---
> +         Block Transfer over I2C defines a new IPMI compatible interface that
> +         uses Block Transfer messages and semantics on top of plain old I2C.
> +
> +         This adds support for the slave side of the protocol (only really
> +         useful for BMCs (Baseboard Management Controllers)).
> +
> +config BT_I2C_MASTER
> +       depends on I2C
> +       tristate "BT I2C IPMI master driver"
> +       default "n"
> +       ---help---
> +         Block Transfer over I2C defines a new IPMI compatible interface that
> +         uses Block Transfer messages and semantics on top of plain old I2C.
> +
> +         This adds support for master side of the protocol (this is most likely
> +         what you want if you are compiling for a regular CPU, only useful if
> +         your computer has a BMC that speaks the slave side of this protocol).

I didn't pick up on this when reading your cover letter. The host side
will read the messages straight into the kernel and userspace, not
pass them through firmware?

> +
>  source "drivers/misc/c2port/Kconfig"
>  source "drivers/misc/eeprom/Kconfig"
>  source "drivers/misc/cb710/Kconfig"
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 724861b..b642ed8 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -58,3 +58,5 @@ obj-$(CONFIG_VEXPRESS_SYSCFG) += vexpress-syscfg.o
>  obj-$(CONFIG_CXL_BASE)         += cxl/
>  obj-$(CONFIG_PANEL)             += panel.o
>  obj-$(CONFIG_ASPEED_BT_IPMI_HOST)      += bt-host.o
> +obj-$(CONFIG_BT_I2C_SLAVE)     += bt-i2c-slave.o
> +obj-$(CONFIG_BT_I2C_MASTER)    += bt-i2c-master.o
> diff --git a/drivers/misc/bt-i2c-master.c b/drivers/misc/bt-i2c-master.c
> new file mode 100644
> index 0000000..22142d6
> --- /dev/null
> +++ b/drivers/misc/bt-i2c-master.c
> @@ -0,0 +1,199 @@
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/errno.h>
> +#include <linux/poll.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/miscdevice.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +
> +#include "bt.h"
> +
> +#define DEVICE_NAME    "bt-master"
> +
> +struct bt_i2c_master {
> +       struct i2c_client       *client;
> +       struct miscdevice       miscdev;
> +       struct mutex            file_mutex;
> +};
> +
> +static const unsigned long write_timeout = 25;
> +
> +static int send_bt_request(struct bt_i2c_master *bt_master,
> +                          struct bt_msg *bt_request)
> +{
> +       struct i2c_client *client = bt_master->client;
> +       u8 *buf = (u8 *) bt_request;
> +       unsigned long timeout, read_time;
> +       int ret;
> +
> +       timeout = jiffies + msecs_to_jiffies(write_timeout);
> +       do {
> +               read_time = jiffies;
> +               ret = i2c_master_send(client, buf, bt_msg_len(bt_request));
> +               if (ret >= 0)
> +                       return 0;
> +               usleep_range(1000, 1500);
> +       } while (time_before(read_time, timeout));

It feels like there should be a neater way of doing this read/write
and wait operation that the driver does. I don't have a specific
recommendation though.

> +       return ret;
> +}
> +
> +static int receive_bt_response(struct bt_i2c_master *bt_master,
> +                              struct bt_msg *bt_response)
> +{
> +       struct i2c_client *client = bt_master->client;
> +       u8 *buf = (u8 *) bt_response;
> +       u8 len = 0;
> +       unsigned long timeout, read_time;
> +       int ret;
> +
> +       /*
> +        * Slave may not NACK when not ready, so we peek at the first byte to
> +        * see if it is a valid length.
> +        */
> +       while (len == 0) {
> +               i2c_master_recv(client, &len, 1);
> +               if (len != 0)
> +                       break;
> +               usleep_range(1000, 1500);
> +
> +               /* Signal received: quit syscall. */
> +               if (signal_pending(current))
> +                       return -ERESTARTSYS;
> +       }
> +
> +       timeout = jiffies + msecs_to_jiffies(write_timeout);
> +       do {
> +               read_time = jiffies;
> +               ret = i2c_master_recv(client, buf, len + 1);
> +               if (ret >= 0)
> +                       return 0;
> +               usleep_range(1000, 1500);
> +       } while (time_before(read_time, timeout));
> +       return ret;
> +}
> +
> +static inline struct bt_i2c_master *to_bt_i2c_master(struct file *file)
> +{
> +       return container_of(file->private_data, struct bt_i2c_master, miscdev);
> +}
> +
> +static ssize_t bt_read(struct file *file, char __user *buf, size_t count,
> +                      loff_t *ppos)
> +{
> +       struct bt_i2c_master *bt_master = to_bt_i2c_master(file);
> +       struct bt_msg msg;
> +       int ret;
> +
> +       mutex_lock(&bt_master->file_mutex);
> +       ret = receive_bt_response(bt_master, &msg);
> +       if (ret < 0)
> +               goto out;
> +       count = min(count, bt_msg_len(&msg));
> +       if (copy_to_user(buf, &msg, count)) {
> +               ret = -EFAULT;
> +               goto out;

The goto doesn't do much :)

> +       }
> +
> +out:
> +       mutex_unlock(&bt_master->file_mutex);
> +       if (ret < 0)
> +               return ret;
> +       else
> +               return count;
> +}
> +
> +static ssize_t bt_write(struct file *file, const char __user *buf, size_t count,
> +                       loff_t *ppos)
> +{
> +       struct bt_i2c_master *bt_master = to_bt_i2c_master(file);
> +       struct bt_msg msg;
> +       int ret;
> +
> +       mutex_lock(&bt_master->file_mutex);
> +       if (count > sizeof(struct bt_msg)) {
> +               ret = -EFAULT;
> +               goto out;
> +       }
> +       if (copy_from_user(&msg, buf, count) || count < bt_msg_len(&msg)) {
> +               ret = -EFAULT;
> +               goto out;
> +       }
> +       ret = send_bt_request(bt_master, &msg);
> +       if (ret < 0)
> +               goto out;
> +
> +out:
> +       mutex_unlock(&bt_master->file_mutex);
> +       if (ret < 0)
> +               return ret;
> +       else
> +               return count;
> +}
> +
> +static const struct file_operations bt_fops = {
> +       .owner          = THIS_MODULE,
> +       .read           = bt_read,
> +       .write          = bt_write,
> +};
> +
> +static int bt_i2c_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{
> +       struct bt_i2c_master *bt_master;
> +       int ret;
> +
> +       bt_master = devm_kzalloc(&client->dev, sizeof(struct bt_i2c_master),
> +                                GFP_KERNEL);
> +       if (!bt_master)
> +               return -ENOMEM;
> +
> +       mutex_init(&bt_master->file_mutex);
> +       bt_master->client = client;
> +       i2c_set_clientdata(client, bt_master);
> +
> +       bt_master->miscdev.minor = MISC_DYNAMIC_MINOR;
> +       bt_master->miscdev.name = DEVICE_NAME;
> +       bt_master->miscdev.fops = &bt_fops;
> +       bt_master->miscdev.parent = &client->dev;
> +       ret = misc_register(&bt_master->miscdev);
> +       if (ret < 0)
> +               return ret;
> +       return 0;
> +}
> +
> +static int bt_i2c_remove(struct i2c_client *client)
> +{
> +       struct bt_i2c_master *bt_master = i2c_get_clientdata(client);
> +
> +       misc_deregister(&bt_master->miscdev);
> +       return 0;
> +}
> +
> +static const struct i2c_device_id bt_i2c_id[] = {
> +       {"bt-i2c-master", 0},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(i2c, bt_i2c_id);
> +
> +static struct i2c_driver bt_i2c_driver = {
> +       .driver = {
> +               .name           = "bt-i2c-master",
> +       },
> +       .probe          = bt_i2c_probe,
> +       .remove         = bt_i2c_remove,
> +       .id_table       = bt_i2c_id,
> +};
> +module_i2c_driver(bt_i2c_driver);
> +
> +MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
> +MODULE_DESCRIPTION("IPMI Block Transfer over I2C master.");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/misc/bt-i2c-slave.c b/drivers/misc/bt-i2c-slave.c
> new file mode 100644
> index 0000000..1a90e05
> --- /dev/null
> +++ b/drivers/misc/bt-i2c-slave.c
> @@ -0,0 +1,317 @@
> +#include <linux/module.h>
> +#include <linux/moduleparam.h>
> +#include <linux/errno.h>
> +#include <linux/poll.h>
> +#include <linux/spinlock.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/device.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/miscdevice.h>
> +#include <linux/timer.h>
> +#include <linux/jiffies.h>
> +
> +#include "bt.h"
> +
> +/*
> + * TODO: This is "bt-host" to match the bt-host driver; however, I think this is
> + * unclear in the context of a CPU side driver. Should probably name this
> + * and the DEVICE_NAME in bt-host to something like "bt-bmc" or "bt-slave".
> + */
> +#define DEVICE_NAME    "bt-host"
> +
> +static const unsigned long request_queue_max_len = 256;
> +
> +struct bt_request_elem {
> +       struct list_head        list;
> +       struct bt_msg           request;
> +};
> +
> +struct bt_i2c_slave {
> +       struct i2c_client       *client;
> +       struct miscdevice       miscdev;
> +       struct bt_msg           request;
> +       struct list_head        request_queue;
> +       atomic_t                request_queue_len;
> +       struct bt_msg           response;
> +       atomic_t                response_in_progress;
> +       size_t                  msg_idx;
> +       spinlock_t              lock;
> +       wait_queue_head_t       wait_queue;
> +       struct mutex            file_mutex;
> +};
> +
> +static int receive_bt_request(struct bt_i2c_slave *bt_slave, bool non_blocking,
> +                             struct bt_msg *bt_request) {
> +       unsigned long flags;
> +       struct bt_request_elem *queue_elem;
> +
> +       if (!atomic_read(&bt_slave->request_queue_len) && non_blocking)
> +               return -EAGAIN;
> +       else if (!non_blocking)
> +               wait_event_interruptible(
> +                               bt_slave->wait_queue,
> +                               atomic_read(&bt_slave->request_queue_len));
> +
> +       spin_lock_irqsave(&bt_slave->lock, flags);
> +       queue_elem = list_first_entry(&bt_slave->request_queue,
> +                                     struct bt_request_elem, list);
> +       memcpy(bt_request, &queue_elem->request, sizeof(struct bt_msg));
> +       list_del(&queue_elem->list);
> +       kfree(queue_elem);
> +       atomic_dec(&bt_slave->request_queue_len);
> +       spin_unlock_irqrestore(&bt_slave->lock, flags);
> +       return 0;
> +}
> +
> +static int send_bt_response(struct bt_i2c_slave *bt_slave, bool non_blocking,
> +                           struct bt_msg *bt_response) {
> +       unsigned long flags;
> +
> +       if (non_blocking && atomic_read(&bt_slave->response_in_progress))
> +               return -EAGAIN;
> +       else if (!non_blocking)
> +               wait_event_interruptible(
> +                               bt_slave->wait_queue,
> +                               !atomic_read(&bt_slave->response_in_progress));
> +
> +       spin_lock_irqsave(&bt_slave->lock, flags);
> +       memcpy(&bt_slave->response, bt_response, sizeof(struct bt_msg));
> +       atomic_set(&bt_slave->response_in_progress, 0);
> +       spin_unlock_irqrestore(&bt_slave->lock, flags);
> +       return 0;
> +}
> +
> +static inline struct bt_i2c_slave *to_bt_i2c_slave(struct file *file)
> +{
> +       return container_of(file->private_data, struct bt_i2c_slave, miscdev);
> +}
> +
> +static ssize_t bt_read(struct file *file, char __user *buf, size_t count,
> +                      loff_t *ppos)
> +{
> +       struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
> +       struct bt_msg msg;
> +       ssize_t ret;
> +
> +       mutex_lock(&bt_slave->file_mutex);
> +       ret = receive_bt_request(bt_slave, file->f_flags & O_NONBLOCK, &msg);
> +       if (ret < 0)
> +               goto out;
> +       count = min(count, bt_msg_len(&msg));
> +       if (copy_to_user(buf, &msg, count)) {
> +               ret = -EFAULT;
> +               goto out;
> +       }
> +
> +out:
> +       mutex_unlock(&bt_slave->file_mutex);
> +       if (ret < 0)
> +               return ret;
> +       else
> +               return count;
> +}
> +
> +static ssize_t bt_write(struct file *file, const char __user *buf, size_t count,
> +                       loff_t *ppos)
> +{
> +       struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
> +       struct bt_msg msg;
> +       ssize_t ret;
> +
> +       if (count > sizeof(struct bt_msg))
> +               return -EFAULT;
> +
> +       if (copy_from_user(&msg, buf, count) || count < bt_msg_len(&msg))
> +               return -EFAULT;
> +
> +       mutex_lock(&bt_slave->file_mutex);
> +       ret = send_bt_response(bt_slave, file->f_flags & O_NONBLOCK, &msg);
> +       mutex_unlock(&bt_slave->file_mutex);
> +
> +       if (ret < 0)
> +               return ret;
> +       else
> +               return count;
> +}
> +
> +static long bt_ioctl(struct file *file, unsigned int cmd, unsigned long param)
> +{
> +       return 0;
> +}
> +
> +static unsigned int bt_poll(struct file *file, poll_table *wait)
> +{
> +       struct bt_i2c_slave *bt_slave = to_bt_i2c_slave(file);
> +       unsigned int mask = 0;
> +
> +       mutex_lock(&bt_slave->file_mutex);
> +       poll_wait(file, &bt_slave->wait_queue, wait);
> +
> +       if (atomic_read(&bt_slave->request_queue_len))
> +               mask |= POLLIN;
> +       if (!atomic_read(&bt_slave->response_in_progress))
> +               mask |= POLLOUT;
> +       mutex_unlock(&bt_slave->file_mutex);
> +       return mask;
> +}
> +
> +static const struct file_operations bt_fops = {
> +       .owner          = THIS_MODULE,
> +       .read           = bt_read,
> +       .write          = bt_write,
> +       .poll           = bt_poll,
> +       .unlocked_ioctl = bt_ioctl,
> +};
> +
> +static int handle_request(struct bt_i2c_slave *bt_slave)
> +{
> +       struct bt_request_elem *queue_elem;
> +
> +       if (atomic_read(&bt_slave->request_queue_len) >= request_queue_max_len)
> +               return -EFAULT;
> +       queue_elem = kmalloc(sizeof(struct bt_request_elem), GFP_KERNEL);
> +       memcpy(&queue_elem->request, &bt_slave->request, sizeof(struct bt_msg));
> +       list_add(&queue_elem->list, &bt_slave->request_queue);
> +       atomic_inc(&bt_slave->request_queue_len);
> +       wake_up_all(&bt_slave->wait_queue);
> +       return 0;
> +}
> +
> +static int complete_response(struct bt_i2c_slave *bt_slave)
> +{
> +       /* Invalidate response in buffer to denote it having been sent. */
> +       bt_slave->response.len = 0;
> +       atomic_set(&bt_slave->response_in_progress, 1);
> +       wake_up_all(&bt_slave->wait_queue);
> +       return 0;
> +}
> +
> +static int bt_i2c_slave_cb(struct i2c_client *client,
> +                          enum i2c_slave_event event, u8 *val)
> +{
> +       struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
> +       u8 *buf;
> +
> +       spin_lock(&bt_slave->lock);
> +       switch (event) {
> +       case I2C_SLAVE_WRITE_REQUESTED:
> +               bt_slave->msg_idx = 0;
> +               break;
> +
> +       case I2C_SLAVE_WRITE_RECEIVED:
> +               buf = (u8 *) &bt_slave->request;
> +               if (bt_slave->msg_idx >= sizeof(struct bt_i2c_slave))
> +                       break;
> +
> +               buf[bt_slave->msg_idx++] = *val;
> +               if (bt_slave->msg_idx >= bt_msg_len(&bt_slave->request))
> +                       handle_request(bt_slave);
> +               break;
> +
> +       case I2C_SLAVE_READ_REQUESTED:
> +               buf = (u8 *) &bt_slave->response;
> +               bt_slave->msg_idx = 0;
> +               *val = buf[bt_slave->msg_idx];
> +               /*
> +                * Do not increment buffer_idx here, because we don't know if
> +                * this byte will be actually used. Read Linux I2C slave docs
> +                * for details.
> +                */
> +               break;
> +
> +       case I2C_SLAVE_READ_PROCESSED:
> +               buf = (u8 *) &bt_slave->response;
> +               if (bt_slave->response.len &&
> +                   bt_slave->msg_idx < bt_msg_len(&bt_slave->response)) {
> +                       *val = buf[++bt_slave->msg_idx];
> +               } else {
> +                       *val = 0;
> +               }
> +               if (bt_slave->msg_idx + 1 >= bt_msg_len(&bt_slave->response))
> +                       complete_response(bt_slave);
> +               break;
> +
> +       case I2C_SLAVE_STOP:
> +               bt_slave->msg_idx = 0;
> +               break;
> +
> +       default:
> +               break;
> +       }
> +       spin_unlock(&bt_slave->lock);
> +
> +       return 0;
> +}
> +
> +static int bt_i2c_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{
> +       struct bt_i2c_slave *bt_slave;
> +       int ret;
> +
> +       bt_slave = devm_kzalloc(&client->dev, sizeof(struct bt_i2c_slave),
> +                               GFP_KERNEL);
> +       if (!bt_slave)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&bt_slave->lock);
> +       init_waitqueue_head(&bt_slave->wait_queue);
> +       atomic_set(&bt_slave->request_queue_len, 0);
> +       atomic_set(&bt_slave->response_in_progress, 0);
> +       INIT_LIST_HEAD(&bt_slave->request_queue);
> +
> +       mutex_init(&bt_slave->file_mutex);
> +
> +       bt_slave->miscdev.minor = MISC_DYNAMIC_MINOR;
> +       bt_slave->miscdev.name = DEVICE_NAME;
> +       bt_slave->miscdev.fops = &bt_fops;
> +       bt_slave->miscdev.parent = &client->dev;
> +       ret = misc_register(&bt_slave->miscdev);
> +       if (ret < 0)
> +               return ret;
> +
> +       bt_slave->client = client;
> +       i2c_set_clientdata(client, bt_slave);
> +       ret = i2c_slave_register(client, bt_i2c_slave_cb);
> +       if (ret < 0) {
> +               misc_deregister(&bt_slave->miscdev);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int bt_i2c_remove(struct i2c_client *client)
> +{
> +       struct bt_i2c_slave *bt_slave = i2c_get_clientdata(client);
> +
> +       i2c_slave_unregister(client);
> +       misc_deregister(&bt_slave->miscdev);
> +       return 0;
> +}
> +
> +static const struct i2c_device_id bt_i2c_id[] = {
> +       {"bt-i2c-slave", 0},
> +       {},
> +};
> +MODULE_DEVICE_TABLE(i2c, bt_i2c_id);
> +
> +static struct i2c_driver bt_i2c_driver = {
> +       .driver = {
> +               .name           = "bt-i2c-slave",
> +       },
> +       .probe          = bt_i2c_probe,
> +       .remove         = bt_i2c_remove,
> +       .id_table       = bt_i2c_id,
> +};
> +module_i2c_driver(bt_i2c_driver);
> +
> +MODULE_AUTHOR("Brendan Higgins <brendanhiggins@google.com>");
> +MODULE_DESCRIPTION("IPMI Block Transfer over I2C slave.");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/misc/bt.h b/drivers/misc/bt.h
> new file mode 100644
> index 0000000..c0c2881
> --- /dev/null
> +++ b/drivers/misc/bt.h
> @@ -0,0 +1,19 @@
> +#ifndef _DRIVERS_MISC_BT_H
> +#define _DRIVERS_MISC_BT_H
> +
> +#include <linux/types.h>
> +
> +struct bt_msg {
> +       u8 len;
> +       u8 netfn_lun;
> +       u8 seq;
> +       u8 cmd;
> +       u8 payload[252];
> +};
> +
> +static inline u32 bt_msg_len(struct bt_msg *bt_request)
> +{
> +       return bt_request->len + 1;
> +}
> +
> +#endif /* _DRIVERS_MISC_BT_H */
> --
> 2.8.0.rc3.226.g39d4020
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
