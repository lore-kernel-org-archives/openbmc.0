Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::242; helo=mail-lf0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wl+xYN86"; 
 dkim-atps=neutral
Received: from mail-lf0-x242.google.com (mail-lf0-x242.google.com
 [IPv6:2a00:1450:4010:c07::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z1fZk4VQXzF06m
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 13:57:34 +1100 (AEDT)
Received: by mail-lf0-x242.google.com with SMTP id f13so22350585lff.12
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 18:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=p1cOwdZxfWF6lNB459qrZko/wZfw0ujW0mc4YkJNLNA=;
 b=Wl+xYN86iBk/uX5fxI6ulk3EGudazFrvITd9J1Zsnwd1DcyAEORli+HJKTF+6Cwk7m
 lXUw9FL2qet4xcik3aEnEqNuauum6FVsxS7SDWVZKBc7e6nXn8io9FPnlatZEhGyjVpG
 SCaTdUrrhgq3f1FDSrZ5uruxU0jMj7qaLXUpIHcZ0/D3u6ZuLGPWpVd2CLLe8Afh18y7
 7JFuZW+PJQCyC9KWMrYN6eDVRjejagm3I08HeS78OpXNbgPKPN72BhdU+GHnC97LMNW3
 3i7AlUbxRWyBvJgPKSrrUvISMEbAHVbJkDYTlFi0wOwjRtlRUieQCDEMTaD5tBrgS1pT
 GCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=p1cOwdZxfWF6lNB459qrZko/wZfw0ujW0mc4YkJNLNA=;
 b=U1jWaphPUsSuHCfT500y808IsuCHD7dtr9+cBCfTqrj00I54dhY5P6USbgWCv6lqfb
 a+D3vRaHWpxw837IJn73z5bJPGiBJX+3w+4iepSRLPebiQrA6eNZXxs/05Mq+y2pBUN5
 WpbICQWazlOLWKuLC+kgN89ycSHpK630oJ6gL5fFknPfYuHbMJYIY9Wv4MFX+UI/y0ui
 yEpbGhIaiampH4zXrKwwUAUbBKH1pl2IXHGL6Rg6qWoeZwykUbPvTgpWzkqq+tNx8egO
 HjthY1qAV1OkhO9mKHSz+fRMY4EObTJG3z7JDEV2q+tw0xyUxxg8a4Lb+BRRb49G9akA
 FVDQ==
X-Gm-Message-State: AKGB3mJlHmLKFQTnD62mHKxstbbkU/hzc3am0P1mHP+K+wsbSlbDtuMg
 5+ZFw+vPG/yl+UzL4Xb1fS/TnCDnRzIwY8UIgqA=
X-Google-Smtp-Source: ACJfBovETPfHrWNbOPKDUCkjSXbqHp0NkmVb86+TQOuZ9kkKMKNeHnJRUTColcgYNcajvow0o+H0GdB/nqfSNcXOtSg=
X-Received: by 10.25.223.70 with SMTP id q6mr3608921lfj.27.1513738650665; Tue,
 19 Dec 2017 18:57:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Tue, 19 Dec 2017 18:57:10 -0800 (PST)
In-Reply-To: <1513628014-16656-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1513628014-16656-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 20 Dec 2017 13:27:10 +1030
X-Google-Sender-Auth: qiYa1xVlifykv4I5rszuDm2bFFc
Message-ID: <CACPK8XeFN63xR4BiGUM+xwVvMOf=sLUr81SJ-BQYVR_McPaASg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers: fsi: SBEFIFO: switch to workqueue
 instead of timer
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Edward A. James" <eajames@us.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Dec 2017 02:57:35 -0000

On Tue, Dec 19, 2017 at 6:43 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Some systems are experiencing scheduling problems; mod_timer can take up
> to several seconds before the timer_function is executed, even if passed
> the current jiffies.

How did you work out that the timer wasn't firing?

Can you describe the other tests you have done?

It's not recommended to paper over something going wrong by changing
over to a workqueue.

Cheers,

Joel

>
> Work around this by using sbefifo's own workqueue.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/fsi/fsi-sbefifo.c | 54 ++++++++++++++++++++++++++++-------------------
>  1 file changed, 32 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 0697a10..7b6842a 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -29,9 +29,9 @@
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> -#include <linux/timer.h>
>  #include <linux/uaccess.h>
>  #include <linux/wait.h>
> +#include <linux/workqueue.h>
>
>  /*
>   * The SBEFIFO is a pipe-like FSI device for communicating with
> @@ -57,7 +57,7 @@
>  #define SBEFIFO_MAX_RESCHDULE  msecs_to_jiffies(5000)
>
>  struct sbefifo {
> -       struct timer_list poll_timer;
> +       struct delayed_work work;
>         struct fsi_device *fsi_dev;
>         struct miscdevice mdev;
>         wait_queue_head_t wait;
> @@ -99,6 +99,8 @@ struct sbefifo_client {
>         unsigned long f_flags;
>  };
>
> +static struct workqueue_struct *sbefifo_wq;
> +
>  static DEFINE_IDA(sbefifo_ida);
>
>  static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
> @@ -337,7 +339,7 @@ static void sbefifo_client_release(struct kref *kref)
>                          */
>                         set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>                         sbefifo_get(sbefifo);
> -                       if (mod_timer(&client->dev->poll_timer, jiffies))
> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>                                 sbefifo_put(sbefifo);
>                 }
>         }
> @@ -374,10 +376,11 @@ static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
>         return NULL;
>  }
>
> -static void sbefifo_poll_timer(unsigned long data)
> +static void sbefifo_worker(struct work_struct *work)
>  {
>         static const unsigned long EOT_MASK = 0x000000ff;
> -       struct sbefifo *sbefifo = (void *)data;
> +       struct delayed_work *dwork = to_delayed_work(work);
> +       struct sbefifo *sbefifo = container_of(dwork, struct sbefifo, work);
>         struct sbefifo_buf *rbuf, *wbuf;
>         struct sbefifo_xfr *xfr, *tmp;
>         struct sbefifo_buf drain;
> @@ -393,6 +396,7 @@ static void sbefifo_poll_timer(unsigned long data)
>         if (!xfr)
>                 goto out_unlock;
>
> +again:
>         rbuf = xfr->rbuf;
>         wbuf = xfr->wbuf;
>
> @@ -414,9 +418,8 @@ static void sbefifo_poll_timer(unsigned long data)
>                 devn = sbefifo_dev_nwwriteable(sts);
>                 if (devn == 0) {
>                         /* No open slot for write.  Reschedule. */
> -                       sbefifo->poll_timer.expires = jiffies +
> -                               SBEFIFO_RESCHEDULE;
> -                       add_timer(&sbefifo->poll_timer);
> +                       queue_delayed_work(sbefifo_wq, &sbefifo->work,
> +                                          SBEFIFO_RESCHEDULE);
>                         goto out_unlock;
>                 }
>
> @@ -468,9 +471,8 @@ static void sbefifo_poll_timer(unsigned long data)
>                         }
>
>                         /* No data yet.  Reschedule. */
> -                       sbefifo->poll_timer.expires = jiffies +
> -                               SBEFIFO_RESCHEDULE;
> -                       add_timer(&sbefifo->poll_timer);
> +                       queue_delayed_work(sbefifo_wq, &sbefifo->work,
> +                                          SBEFIFO_RESCHEDULE);
>                         goto out_unlock;
>                 } else {
>                         xfr->wait_data_timeout = 0;
> @@ -516,10 +518,12 @@ static void sbefifo_poll_timer(unsigned long data)
>                 }
>                 INIT_LIST_HEAD(&sbefifo->xfrs);
>
> -       } else if (eot && sbefifo_next_xfr(sbefifo)) {
> -               sbefifo_get(sbefifo);
> -               sbefifo->poll_timer.expires = jiffies;
> -               add_timer(&sbefifo->poll_timer);
> +       } else if (eot) {
> +               xfr = sbefifo_next_xfr(sbefifo);
> +               if (xfr) {
> +                       wake_up_interruptible(&sbefifo->wait);
> +                       goto again;
> +               }
>         }
>
>         sbefifo_put(sbefifo);
> @@ -638,7 +642,7 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
>                          * Fill the read buffer back up.
>                          */
>                         sbefifo_get(sbefifo);
> -                       if (mod_timer(&client->dev->poll_timer, jiffies))
> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>                                 sbefifo_put(sbefifo);
>                 } else {
>                         list_del(&xfr->client);
> @@ -721,7 +725,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>                                                                  &n))) {
>                         set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>                         sbefifo_get(sbefifo);
> -                       if (mod_timer(&sbefifo->poll_timer, jiffies))
> +                       if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>                                 sbefifo_put(sbefifo);
>
>                         ret = -ERESTARTSYS;
> @@ -741,7 +745,8 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>                             n)) {
>                                 set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>                                 sbefifo_get(sbefifo);
> -                               if (mod_timer(&sbefifo->poll_timer, jiffies))
> +                               if (!queue_work(sbefifo_wq,
> +                                               &sbefifo->work.work))
>                                         sbefifo_put(sbefifo);
>                                 ret = -EFAULT;
>                                 goto out;
> @@ -768,7 +773,7 @@ static ssize_t sbefifo_write_common(struct sbefifo_client *client,
>                  * Drain the write buffer.
>                  */
>                 sbefifo_get(sbefifo);
> -               if (mod_timer(&client->dev->poll_timer, jiffies))
> +               if (!queue_work(sbefifo_wq, &sbefifo->work.work))
>                         sbefifo_put(sbefifo);
>         }
>
> @@ -928,8 +933,7 @@ static int sbefifo_probe(struct device *dev)
>                  sbefifo->idx);
>
>         /* This bit of silicon doesn't offer any interrupts... */
> -       setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
> -                   (unsigned long)sbefifo);
> +       INIT_DELAYED_WORK(&sbefifo->work, sbefifo_worker);
>
>         sbefifo->mdev.minor = MISC_DYNAMIC_MINOR;
>         sbefifo->mdev.fops = &sbefifo_fops;
> @@ -982,7 +986,7 @@ static int sbefifo_remove(struct device *dev)
>
>         ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>
> -       if (del_timer_sync(&sbefifo->poll_timer))
> +       if (cancel_delayed_work_sync(&sbefifo->work))
>                 sbefifo_put(sbefifo);
>
>         sbefifo_put(sbefifo);
> @@ -1010,11 +1014,17 @@ static int sbefifo_remove(struct device *dev)
>
>  static int sbefifo_init(void)
>  {
> +       sbefifo_wq = create_singlethread_workqueue("sbefifo");
> +       if (!sbefifo_wq)
> +               return -ENOMEM;
> +
>         return fsi_driver_register(&sbefifo_drv);
>  }
>
>  static void sbefifo_exit(void)
>  {
> +       destroy_workqueue(sbefifo_wq);
> +
>         fsi_driver_unregister(&sbefifo_drv);
>
>         ida_destroy(&sbefifo_ida);
> --
> 1.8.3.1
>
