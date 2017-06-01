Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdcSk3MhmzDq5x
 for <openbmc@lists.ozlabs.org>; Thu,  1 Jun 2017 16:12:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DvmY/K89"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id y64so2206695ywe.0
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 23:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qNJbZY2H+9KcPwu7BAakyYpsCcwW4G19V81Mu7mZMsA=;
 b=DvmY/K89X7uJ1Gfawv7ruKr6eq0/DjIUWqeANP3hMgDpNL8fbdVktR6eeQfm2qpNsp
 XQT2V+S7UyKbfmDwrCKvo0Y+S7gbacp15iNL7O2qVdsRMZ1St34saFwq6zwPARFSRFQa
 smOikAhFQUW5ld1Kh4kuUZccCRL400UOifXpjrV2YX07C2N43FELLCZ2i1neXaEA2EAa
 IKIixXgoHvFIxgQ+m8t+QuaCQPCEJfSGPQ9BvzbSrjH6XFH3GozfN0QBt9r/vizluKDa
 OpU83VcBRNrARgMrec8JHGtjKS2VtVf75jp60TOcPahCZGGstOZ1O55HaMSdf4LP9/Sh
 Qv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qNJbZY2H+9KcPwu7BAakyYpsCcwW4G19V81Mu7mZMsA=;
 b=YTWY6IPk41KSwpNge21TdopX4aI/FiGdfPZmpbEKpuRsjO3ecap4/zU+auMtpMvrMZ
 Z2978pHMaWSwXIPvC/FTK5THgoN8mGHIeBIArgclTO7GJmMxhcgA0aQLPpikogctacZI
 zZZIBULjeUdwXbJ5I/Pfy3SNg6DRq9DLVfuc1tc8Xp94O114Fe+hE9eg7FtrusVQSoYl
 YB7OgSUtZ7OKXlHK73ERDlmDKL+vq9uXSXxzBTjTwnlWJSh/BoY0/rucjNXcOLg1rIcB
 N3Rg9fJ4NOvb6Tod9Vo/C9sviYyyVxtHcOMXRo8tU6Yb3Ih6e8Yx6y+/QK26dOx0Fn0U
 e8FQ==
X-Gm-Message-State: AODbwcAMRq+/yYrP3zalrsHSpkFNozp8eMr4EIfJohNGVExOdwIkjp0W
 pimZVoDdnjrev/X/tx5vgv5tmgi/kg==
X-Received: by 10.13.207.194 with SMTP id r185mr21648855ywd.135.1496297540117; 
 Wed, 31 May 2017 23:12:20 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 23:11:59 -0700 (PDT)
In-Reply-To: <1494431562-25101-4-git-send-email-eajames@linux.vnet.ibm.com>
References: <1494431562-25101-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1494431562-25101-4-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 1 Jun 2017 15:41:59 +0930
X-Google-Sender-Auth: BD4mzx7fG03HcPC1Z5rjPY9Me40
Message-ID: <CACPK8XcMP-R4izcDKFOFr8kUttE5=cY3GNMur-oFp44-6ri2QQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 3/6] drivers: i2c: Add transfer
 implementation for FSI algorithm
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 01 Jun 2017 06:12:23 -0000

On Thu, May 11, 2017 at 1:22 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Execute I2C transfers from the FSI-attached I2C master. Use polling
> instead of interrupts as we have no hardware IRQ over FSI.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/i2c/busses/i2c-fsi.c | 193 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 191 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index cdebc99..f690b16 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -143,6 +143,7 @@ struct fsi_i2c_port {
>         struct i2c_adapter      adapter;
>         struct fsi_i2c_master   *master;
>         u16                     port;
> +       u16                     xfrd;
>  };
>
>  static DEFINE_IDA(fsi_i2c_ida);
> @@ -229,17 +230,205 @@ static int fsi_i2c_set_port(struct fsi_i2c_port *port)
>         return rc;
>  }
>
> +static int fsi_i2c_start(struct fsi_i2c_port *port, struct i2c_msg *msg,
> +                        bool stop)
> +{
> +       int rc;
> +       struct fsi_i2c_master *i2c = port->master;
> +       u32 cmd = I2C_CMD_WITH_START | I2C_CMD_WITH_ADDR;
> +
> +       port->xfrd = 0;
> +
> +       if (msg->flags & I2C_M_RD)
> +               cmd |= I2C_CMD_READ;
> +
> +       if (stop || msg->flags & I2C_M_STOP)
> +               cmd |= I2C_CMD_WITH_STOP;
> +
> +       cmd = SETFIELD(I2C_CMD_ADDR, cmd, msg->addr >> 1);
> +       cmd = SETFIELD(I2C_CMD_LEN, cmd, msg->len);
> +
> +       rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_CMD, &cmd);
> +
> +       return rc;
> +}
> +
> +static int fsi_i2c_write_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
> +                             u8 fifo_count)
> +{
> +       int write;
> +       int rc = 0;
> +       struct fsi_i2c_master *i2c = port->master;
> +       int bytes_to_write = i2c->fifo_size - fifo_count;
> +       int bytes_remaining = msg->len - port->xfrd;
> +
> +       if (bytes_to_write > bytes_remaining)
> +               bytes_to_write = bytes_remaining;
> +
> +       while (bytes_to_write > 0) {
> +               write = bytes_to_write;
> +               /* fsi limited to max 4 byte aligned ops */
> +               if (bytes_to_write > 4)
> +                       write = 4;
> +               else if (write == 3)
> +                       write = 2;
> +
> +               rc = fsi_device_write(i2c->fsi, I2C_FSI_FIFO,
> +                                     &msg->buf[port->xfrd], write);
> +               if (rc)
> +                       return rc;
> +
> +               port->xfrd += write;
> +               bytes_to_write -= write;
> +       }
> +
> +       return rc;
> +}
> +
> +static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
> +                            u8 fifo_count)
> +{
> +       int read;
> +       int rc = 0;
> +       struct fsi_i2c_master *i2c = port->master;
> +       int xfr_remaining = msg->len - port->xfrd;
> +       u32 dummy;
> +
> +       while (fifo_count) {
> +               read = fifo_count;
> +               /* fsi limited to max 4 byte aligned ops */
> +               if (fifo_count > 4)
> +                       read = 4;
> +               else if (read == 3)
> +                       read = 2;
> +
> +               if (xfr_remaining) {
> +                       if (xfr_remaining < read)
> +                               read = xfr_remaining;
> +
> +                       rc = fsi_device_read(i2c->fsi, I2C_FSI_FIFO,
> +                                            &msg->buf[port->xfrd], read);
> +                       if (rc)
> +                               return rc;
> +
> +                       port->xfrd += read;
> +                       xfr_remaining -= read;
> +               } else {
> +                       /* no more buffer but data in fifo, need to clear it */
> +                       rc = fsi_device_read(i2c->fsi, I2C_FSI_FIFO, &dummy,
> +                                            read);
> +                       if (rc)
> +                               return rc;
> +               }
> +
> +               fifo_count -= read;
> +       }
> +
> +       return rc;
> +}
> +
> +static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
> +                                struct i2c_msg *msg, u32 status)
> +{
> +       int rc;
> +       u8 fifo_count;
> +       struct fsi_i2c_master *i2c = port->master;
> +       u32 dummy = 0;
> +
> +       if (status & I2C_STAT_ERR) {
> +               rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
> +               if (rc)
> +                       return rc;
> +
> +               if (status & I2C_STAT_NACK)
> +                       return -EFAULT;

Why EFAULT?

> +
> +               return -EIO;
> +       }
> +
> +       if (status & I2C_STAT_DAT_REQ) {
> +               fifo_count = GETFIELD(I2C_STAT_FIFO_COUNT, status);
> +
> +               if (msg->flags & I2C_M_RD)
> +                       rc = fsi_i2c_read_fifo(port, msg, fifo_count);
> +               else
> +                       rc = fsi_i2c_write_fifo(port, msg, fifo_count);
> +
> +               return rc;
> +       }
> +
> +       if (status & I2C_STAT_CMD_COMP) {
> +               if (port->xfrd < msg->len)
> +                       rc = -ENODATA;
> +               else
> +                       rc = msg->len;
> +       }
> +
> +       return rc;

rc is returned uninitialised here when all of the if () tests are false.


> +}
> +
> +static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
> +                       unsigned long timeout)
> +{
> +       const unsigned long local_timeout = 2; /* jiffies */
> +       u32 status = 0;
> +       int rc;
> +
> +       do {
> +               rc = fsi_i2c_read_reg(port->master->fsi, I2C_FSI_STAT,
> +                                     &status);
> +               if (rc)
> +                       return rc;
> +
> +               if (status & I2C_STAT_ANY_RESP) {
> +                       rc = fsi_i2c_handle_status(port, msg, status);
> +                       if (rc < 0)
> +                               return rc;
> +
> +                       /* cmd complete and all data xfrd */
> +                       if (rc == msg->len)
> +                               return 0;
> +
> +                       /* need to xfr more data, but maybe don't need wait */
> +                       continue;
> +               }
> +
> +               set_current_state(TASK_UNINTERRUPTIBLE);
> +               schedule_timeout(local_timeout);

This is an open coded msleep(2). Just use msleep.

> +               timeout = (timeout < local_timeout) ? 0 :
> +                       timeout - local_timeout;

And then this could be (untested):

end = timeout + jiffies;

do {

} while (time_is_before_jiffies(end));


> +       } while (timeout);
> +
> +       return -ETIME;
> +}
> +
>  static int fsi_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>                         int num)
>  {
> -       int rc;
> +       int i, rc;
> +       unsigned long start_time;
>         struct fsi_i2c_port *port = adap->algo_data;
> +       struct i2c_msg *msg;
>
>         rc = fsi_i2c_set_port(port);
>         if (rc)
>                 return rc;
>
> -       return -ENOSYS;
> +       for (i = 0; i < num; ++i) {
> +               msg = msgs + i;
> +               start_time = jiffies;
> +
> +               rc = fsi_i2c_start(port, msg, i == num - 1);
> +               if (rc)
> +                       return rc;
> +
> +               rc = fsi_i2c_wait(port, msg,
> +                                 adap->timeout - (jiffies - start_time));
> +               if (rc)
> +                       return rc;
> +       }
> +
> +       return 0;
>  }
>
>  static u32 fsi_i2c_functionality(struct i2c_adapter *adap)
> --
> 1.8.3.1
>
