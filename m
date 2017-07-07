Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3lJP2X3lzDqj8
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 16:36:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+LFqmrK"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id n205so1013571yba.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 23:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=vZeNfQAIPNCx/Wrs+ZiXeK+TixEtwiQJioHZ0/1pysI=;
 b=c+LFqmrKgfaOj1PFfmLroB/5uDzoY60D3cwZC2F5t4FvGM7VAQmkXqVk7Tm8iUAhRB
 4soQ6NlJibASJvbMFaCxShdMJYILsi3EHFw2FR7x7WuxomUA05yFz4qdy1G/xm1lzvpf
 za91nmVHK+z7qpm3dBuo91IxQBr6AElIwUXxfw3VYmGyENn0PY+QZkJbqtSESFUIKbBs
 Btj73d6qChJra77lv8C37VrEDHpOOhBFNBFrezGNw52ZTABR1weDZbvP9XMSYDOYESyk
 oIjurPH1OiTOlEqe5iyAUD6Q9KD2lKSwgc0VuN2Vc/GZE/4XKrnca3wJHRV/w/cS4rcr
 kPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=vZeNfQAIPNCx/Wrs+ZiXeK+TixEtwiQJioHZ0/1pysI=;
 b=Yv/wn3GGaiIAr/mwjd2y/jTS5Tb7lN6A7ZuFVlzKXUCtR7E1i+rHOsVCCkFcQFIadj
 /PpQTdU6XzNnvRbZ3SNHHnRUmY/aiMcB81DFN058yMLkLQKt1hljkzJEOQPu8E72Humu
 L4SjmMbyIiXoiL5+B6nE+NlcGlxZw4IbRhyo/Srdpor2vgK73T/6ie1ZnJcm6x0Ef435
 JQH67uJECmRlT3fZzQhJn2ihUhV7ryaIL1cOJiDXkYE0EV7BId/Dz4IkoxZ2idlzTlMk
 vohrHUwTt0ZAPXYq2Lolwv1ODSC5fUim2LVbX9gCj9i8Aq0iTD84R8Qsz2R49hc/5dwP
 wY8A==
X-Gm-Message-State: AIVw113F99mO+6YQZ01TeH8FAYX1HW5ceSxaArT1UDE5o2CMnUIBB3QB
 wchGQWQ90iLyQt/lcMqDx8W36qzF9uPD
X-Received: by 10.37.124.134 with SMTP id x128mr3002376ybc.39.1499409410696;
 Thu, 06 Jul 2017 23:36:50 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Thu, 6 Jul 2017 23:36:30 -0700 (PDT)
In-Reply-To: <1499354901-23165-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499354901-23165-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 7 Jul 2017 16:06:30 +0930
X-Google-Sender-Auth: uwUBrLP3Qr_MjMnIuP4V9xPhsN8
Message-ID: <CACPK8Xf15Kwm1S924H0PRsuiAm8XGzGQ-DCf30upMDLjY-nBAA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v3] drivers/hwmon/occ: Add sysfs_notify on
 error
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
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
X-List-Received-Date: Fri, 07 Jul 2017 06:36:54 -0000

On Fri, Jul 7, 2017 at 12:58 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> For userspace polling, we need to notify sysfs that the state of our
> error entry has changed.
>
> Changes since v2:
>  * don't return empty sysfs file
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 43 +++++++++++++++++++++++++++++--------------
>  drivers/hwmon/occ/common.h |  4 +++-
>  drivers/hwmon/occ/p8_i2c.c | 28 ++++++++++++++--------------
>  drivers/hwmon/occ/p9_sbe.c | 34 ++++++++++++++++------------------
>  4 files changed, 62 insertions(+), 47 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 4e3e411..6663bf3 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -163,9 +163,22 @@ void occ_parse_poll_response(struct occ *occ)
>         }
>  }
>
> +void occ_set_error(struct occ *occ, int error)
> +{
> +       occ->error_count++;
> +       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD)

I think this policy can live in userspace. Instead of counting the
errors in the kernel and only reporting after some threshold, report
all of the errors.

Userspace can then chose to do with this information what it wants,
according to the policy of the system.

Cheers,

Joel

> +               occ->error = error;
> +}
> +
> +void occ_reset_error(struct occ *occ)
> +{
> +       occ->error_count = 0;
> +       occ->error = 0;
> +}
> +
>  int occ_poll(struct occ *occ)
>  {
> -       int rc;
> +       int rc, error = occ->error;
>         struct occ_poll_response_header *header;
>         u16 checksum = occ->poll_cmd_data + 1;
>         u8 cmd[8];
> @@ -181,7 +194,7 @@ int occ_poll(struct occ *occ)
>
>         rc = occ->send_cmd(occ, cmd);
>         if (rc)
> -               return rc;
> +               goto done;
>
>         header = (struct occ_poll_response_header *)occ->resp.data;
>
> @@ -197,19 +210,21 @@ int occ_poll(struct occ *occ)
>
>         if (header->status & OCC_STAT_MASTER) {
>                 if (hweight8(header->occs_present) !=
> -                   atomic_read(&occ_num_occs)) {
> -                       occ->error = -EXDEV;
> -                       occ->bad_present_count++;
> -               } else
> -                       occ->bad_present_count = 0;
> +                   atomic_read(&occ_num_occs))
> +                       occ->error = -ENXIO;
>         }
>
> +done:
> +       /* notify userspace if we change error state and have an error */
> +       if (occ->error != error && occ->error && occ->error_attr_name)
> +               sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
> +
>         return rc;
>  }
>
>  int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>  {
> -       int rc;
> +       int rc, error = occ->error;
>         u8 cmd[8];
>         u16 checksum = 0x24;
>         __be16 user_power_cap_be;
> @@ -239,6 +254,10 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>         rc = occ->send_cmd(occ, cmd);
>         mutex_unlock(&occ->lock);
>
> +       /* notify userspace if we change error state and have an error*/
> +       if (occ->error != error && occ->error && occ->error_attr_name)
> +               sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
> +
>         return rc;
>  }
>
> @@ -260,14 +279,9 @@ int occ_update_response(struct occ *occ)
>  static ssize_t occ_show_error(struct device *dev,
>                               struct device_attribute *attr, char *buf)
>  {
> -       int error = 0;
>         struct occ *occ = dev_get_drvdata(dev);
>
> -       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
> -           occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
> -               error = occ->error;
> -
> -       return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
> +       return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
>  }
>
>  static ssize_t occ_show_status(struct device *dev,
> @@ -1152,6 +1166,7 @@ int occ_create_status_attrs(struct occ *occ)
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
>                                                             occ_show_error,
>                                                             NULL, 0);
> +       occ->error_attr_name = occ->status_attrs[7].dev_attr.attr.name;
>
>         for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
>                 rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index a5f86c3..acb50bc 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -103,7 +103,6 @@ struct occ {
>
>         int error;
>         unsigned int error_count;
> -       unsigned int bad_present_count;
>         unsigned long last_safe;
>         unsigned long last_update;
>         struct mutex lock;
> @@ -116,6 +115,7 @@ struct occ {
>         struct attribute_group group;
>         const struct attribute_group *groups[2];
>         struct sensor_device_attribute *status_attrs;
> +       const char *error_attr_name;
>
>         u8 poll_cmd_data;
>         int (*send_cmd)(struct occ *occ, u8 *cmd);
> @@ -143,6 +143,8 @@ struct occ {
>  extern atomic_t occ_num_occs;
>
>  void occ_parse_poll_response(struct occ *occ);
> +void occ_reset_error(struct occ *occ);
> +void occ_set_error(struct occ *occ, int error);
>  int occ_poll(struct occ *occ);
>  int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap);
>  int occ_update_response(struct occ *occ);
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index 29233b4..a7b1d4c 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -98,7 +98,7 @@ static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
>
>  static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>  {
> -       int i, rc;
> +       int i, rc, error;
>         unsigned long start;
>         u16 data_length;
>         struct p8_i2c_occ *p8_i2c_occ = to_p8_i2c_occ(occ);
> @@ -161,22 +161,18 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>                 rc = -EFAULT;
>         }
>
> -       occ->error = resp->return_status;
> -
>         if (rc < 0) {
> -               occ->error_count++;
> -               dev_warn(&client->dev, "occ bad response:%d\n",
> -                        resp->return_status);
> -               return rc;
> +               error = resp->return_status;
> +               dev_warn(&client->dev, "occ bad response:%d\n", error);
> +               goto done;
>         }
>
>         data_length = get_unaligned_be16(&resp->data_length_be);
>         if (data_length > OCC_RESP_DATA_BYTES) {
> -               occ->error_count++;
> -               occ->error = -EDOM;
> +               rc = -EDOM;
>                 dev_warn(&client->dev, "occ bad data length:%d\n",
>                          data_length);
> -               return occ->error;
> +               goto assign;
>         }
>
>         for (i = 8; i < data_length + 7; i += 8) {
> @@ -185,13 +181,17 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>                         goto err;
>         }
>
> -       occ->error_count = 0;
> -       return data_length + 7;
> +       occ_reset_error(occ);
> +       return 0;
>
>  err:
> -       occ->error_count++;
> -       occ->error = rc;
>         dev_err(&client->dev, "i2c scom op failed rc:%d\n", rc);
> +
> +assign:
> +       error = rc;
> +
> +done:
> +       occ_set_error(occ, error);
>         return rc;
>  }
>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index c85f133..db30a2d 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -25,7 +25,7 @@ struct p9_sbe_occ {
>
>  static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>  {
> -       int rc;
> +       int rc, error;
>         unsigned long start;
>         struct occ_client *client;
>         struct occ_response *resp = &occ->resp;
> @@ -35,9 +35,10 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>
>  retry:
>         client = occ_drv_open(p9_sbe_occ->sbe, 0);
> -       if (!client)
> -               /* don't increment occ error counter */
> -               return -ENODEV;
> +       if (!client) {
> +               rc = -ENODEV;
> +               goto assign;
> +       }
>
>         rc = occ_drv_write(client, (const char *)&cmd[1], 7);
>         if (rc < 0)
> @@ -62,7 +63,8 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>                 }
>                 break;
>         case RESP_RETURN_SUCCESS:
> -               rc = 0;
> +               occ_reset_error(occ);
> +               return 0;
>                 break;
>         case RESP_RETURN_CMD_INVAL:
>         case RESP_RETURN_CMD_LEN:
> @@ -77,23 +79,19 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>                 rc = -EFAULT;
>         }
>
> -       occ->error = resp->return_status;
> -
> -       if (rc < 0) {
> -               occ->error_count++;
> -               dev_warn(occ->bus_dev, "occ bad response:%d\n",
> -                        resp->return_status);
> -               return rc;
> -       }
> -
> -       occ->error_count = 0;
> -       return 0;
> +       error = resp->return_status;
> +       dev_warn(occ->bus_dev, "occ bad response:%d\n", error);
> +       goto done;
>
>  err:
> -       occ->error_count++;
> -       occ->error = rc;
>         occ_drv_release(client);
>         dev_err(occ->bus_dev, "occ bus op failed rc:%d\n", rc);
> +
> +assign:
> +       error = rc;
> +
> +done:
> +       occ_set_error(occ, error);
>         return rc;
>  }
>
> --
> 1.8.3.1
>
