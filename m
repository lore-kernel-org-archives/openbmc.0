Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1Gnp4Gc3zDr3V
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 16:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qOBy2jEm"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id a12so3688441ywh.1
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eUvOEPWDu8gxD0AkT3luJSXnl1R04oEdERoGmAQc4PE=;
 b=qOBy2jEmuptIy7vTII4fvZ7t152JnXcDx0lKgdBhJ7QtcR6CkWfsg7GL6Ghsj/2i4v
 HB47qQQtUd2SeGDyz1eC4hc6kZLSvs78ZcvheHkgVXbDybW7a/P0+W27gWB6WR9w01FR
 rUi+QATJGpRO8fckueJpJLv4CidVpNWU64WKPK0js8TTSrZXt/0K72UnmejIobKPqULj
 ARKcT8KhJaaeCUzphWQRZ++n+JW4OtWy3RlQfHs4EzDS/D7ilxMKx4fjLoEOngq5oxlq
 NxN1tMg2ZY1xRTRFTdClPwWkZEYRxM16pTruhx9kH49MH40/uKXh54VCCOMCowvGrRr9
 0+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eUvOEPWDu8gxD0AkT3luJSXnl1R04oEdERoGmAQc4PE=;
 b=GE14tLTdrqFqHnL6nqukwa8Z0wdzQWLvw5tqxYiH7y3LSqNXg08QqMot7IhQ9m+4UW
 P7Ro85ne6eV2uiew6hO92/qoz4DQPck375X407l8ScRPVk9JEFZTKo2WzNTwasSDFLm3
 7kMHEeLf3KQ7q0SXxWQ5drRYlKF9is3WHjuJwRirZ7R1MyyPFoNcKPSHGt7t2TEg59Ax
 fJTzIKSMvTPqwaFj0e8VNX6Bfev2GtwnyMIDKymemhoysHm79cmYdr7864zX+SdQaiP7
 8Qg8YLqvS/vF4BY3DmmWlK0gh0hB3Gy6S+DLkyp3q7Wa/mr+VQYKfE4AWrvxwsv0UBxY
 tB/w==
X-Gm-Message-State: AKS2vOzveq/EQfhHQP65TqldwDh5phWuIW2zkgO7POa7sJF9wlpTRG6Z
 cFcbjZi6M84K1IpuQ192GD9Lk8k8Ww==
X-Received: by 10.129.93.133 with SMTP id r127mr25247128ywb.135.1499061916141; 
 Sun, 02 Jul 2017 23:05:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 23:04:55 -0700 (PDT)
In-Reply-To: <1498853815-12959-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1498853815-12959-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 15:34:55 +0930
X-Google-Sender-Auth: 06tnHybi0OC9VVH9yuMsODnrZT4
Message-ID: <CACPK8Xf1xaN=sv5f-YGy0P5GYZxgLSbv3LNJnBUW6UZLp-PnHw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/occ: Add sysfs_notify on
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
X-List-Received-Date: Mon, 03 Jul 2017 06:05:19 -0000

On Sat, Jul 1, 2017 at 5:46 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> For userspace polling, we need to notify sysfs that the state of our
> error entry has changed.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 40 ++++++++++++++++++++++++++++++----------
>  drivers/hwmon/occ/common.h |  3 +++
>  drivers/hwmon/occ/p8_i2c.c | 28 ++++++++++++++--------------
>  drivers/hwmon/occ/p9_sbe.c | 34 ++++++++++++++++------------------
>  4 files changed, 63 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 4e3e411..f62cc6d 100644
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
> +               occ->error = error;

This means we only record the error number for the last error that
occurred. Is that desirable?

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
> @@ -198,18 +211,25 @@ int occ_poll(struct occ *occ)
>         if (header->status & OCC_STAT_MASTER) {
>                 if (hweight8(header->occs_present) !=
>                     atomic_read(&occ_num_occs)) {
> -                       occ->error = -EXDEV;
>                         occ->bad_present_count++;
> +
> +                       if (occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)

Why do we have both bad_present_count and occ->occ_error?

Could they be combined?

> +                               occ->error = -EXDEV;

What is EXDEV?

#define   EXDEV           18      /* Cross-device link */

I'm not sure what that is. Perhaps EIO? or EINVAL?

>                 } else
>                         occ->bad_present_count = 0;
>         }
> +done:
> +       /* notify userspace if we change error state */
> +       if (occ->error != error)
> +               sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);

So from now on userspace will be notified of every error. Is that intentional?

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
> @@ -239,6 +259,10 @@ int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>         rc = occ->send_cmd(occ, cmd);
>         mutex_unlock(&occ->lock);
>
> +       /* notify userspace if we change error state */
> +       if (occ->error != error)
> +               sysfs_notify(&occ->bus_dev->kobj, NULL, occ->error_attr_name);
> +
>         return rc;
>  }
>
> @@ -260,14 +284,9 @@ int occ_update_response(struct occ *occ)
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
> @@ -1152,6 +1171,7 @@ int occ_create_status_attrs(struct occ *occ)
>                 (struct sensor_device_attribute)SENSOR_ATTR(occ_error, 0444,
>                                                             occ_show_error,
>                                                             NULL, 0);
> +       occ->error_attr_name = occ->status_attrs[7].dev_attr.attr.name;
>
>         for (i = 0; i < OCC_NUM_STATUS_ATTRS; ++i) {
>                 rc = device_create_file(dev, &occ->status_attrs[i].dev_attr);
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index a5f86c3..3b4bd91 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -116,6 +116,7 @@ struct occ {
>         struct attribute_group group;
>         const struct attribute_group *groups[2];
>         struct sensor_device_attribute *status_attrs;
> +       const char *error_attr_name;
>
>         u8 poll_cmd_data;
>         int (*send_cmd)(struct occ *occ, u8 *cmd);
> @@ -143,6 +144,8 @@ struct occ {
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
