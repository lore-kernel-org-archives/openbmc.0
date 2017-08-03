Return-Path: <mine260309@gmail.com>
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNQKB6fJ3zDrD7
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 19:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tIK9Mdvf"; 
 dkim-atps=neutral
Received: by mail-io0-x243.google.com with SMTP id j32so915118iod.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+EXZG6L6t3bELC6i4WLWyoYtcRVFWF1Dd9hAmGJl5Qg=;
 b=tIK9Mdvfd6q3DeBV3hPvRCWHWutNSUyE1f3Kx2RySPMSdoZdXfisfcfiNjol9usIuU
 FRZ0xILEzLS1lDUZ/K4o14BvLuDzMM/MQvhFapxpWtm8YW54quhc1xSqsU2ZPJT9vsUi
 +FhBOdXeU+IzQ3g+mOeTXLsr8cqkQtp2XZCtBcfvE/8Z9slUmkF351sxh+ytVAh33hrn
 lSpmRP2Qih8rI3WNxKssZX7/hXLCbKRQw8nkLiU8v+KL2gKEWBI+9O8dlOHMdF8gtLY1
 eXwYsfAnqqN4xK2wd7htD3fSssv65ia0TDcte1i/r6W+V/LtXD9OluXdBJkJuniueUnQ
 BivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+EXZG6L6t3bELC6i4WLWyoYtcRVFWF1Dd9hAmGJl5Qg=;
 b=DxAq3En3eTVaymDu6tkEiS+CwhDAKE88KQ4fXTpQvYglrtkrxLwngnO6JQ9dEqJEWi
 z62GJmCnt7L7rPk9xSpU7UH2uV5EpzEHx2/tz4KTUjHnuIoQIbUBwh7JnUyzYdvDHP8/
 r9uFnPbqLmGJa51W5XhmUFQpKZ2jYZJBQ0rPTJLjcL4tcQuK16Ak09ZuvY1t7+XxpImE
 H6hWs0VqGdM1JiQXgoQyaoqRRx0bDEPhnFVdIkFzRjdxOj4uS3SZCp5EHCqdG8ArenG3
 0uLysc34r6v5RWNgz0a14ui4jdkdneNTJDAyKvBA368JcPqu1yv+WLE3PCc8LUBkzerg
 D5HA==
X-Gm-Message-State: AHYfb5g1dV5+ltzmsIBbWTqmEYdbAGcpLVEE62tlTfPWu5QFcBOwI/BF
 qzKS/X32WbvRskDuQOQks6/65wIG4gSzGbY=
X-Received: by 10.107.137.142 with SMTP id t14mr1050768ioi.215.1501753820955; 
 Thu, 03 Aug 2017 02:50:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.30.129 with HTTP; Thu, 3 Aug 2017 02:50:20 -0700 (PDT)
In-Reply-To: <1499294830-8843-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1499294830-8843-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 3 Aug 2017 17:50:20 +0800
Message-ID: <CAARXrt=iaoPw5evb2b3v8Rtcxdp1vsFiok4+1tSA6RW5aG484Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] drivers/hwmon/occ: Add sysfs_notify on
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
X-List-Received-Date: Thu, 03 Aug 2017 09:50:23 -0000

Tested-by: Lei YU <mine260309@gmail.com>

Without this patch, the occ hwmon sensor readings are all empty on P8.
With this patch the issue is fixed and all the readings are OK.

Note: I replied to the [v3] mail but it's found archived.
So reply here again, but I meant to acknowledge the [v3] version.


On Thu, Jul 6, 2017 at 6:47 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> For userspace polling, we need to notify sysfs that the state of our
> error entry has changed.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 44 +++++++++++++++++++++++++++++++-------------
>  drivers/hwmon/occ/common.h |  4 +++-
>  drivers/hwmon/occ/p8_i2c.c | 28 ++++++++++++++--------------
>  drivers/hwmon/occ/p9_sbe.c | 34 ++++++++++++++++------------------
>  4 files changed, 64 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 4e3e411..a676f20 100644
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
> @@ -260,14 +279,12 @@ int occ_update_response(struct occ *occ)
>  static ssize_t occ_show_error(struct device *dev,
>                               struct device_attribute *attr, char *buf)
>  {
> -       int error = 0;
>         struct occ *occ = dev_get_drvdata(dev);
>
> -       if (occ->error_count > OCC_ERROR_COUNT_THRESHOLD || occ->last_safe ||
> -           occ->bad_present_count > OCC_ERROR_COUNT_THRESHOLD)
> -               error = occ->error;
> +       if (occ->error)
> +               return snprintf(buf, PAGE_SIZE - 1, "%d\n", occ->error);
>
> -       return snprintf(buf, PAGE_SIZE - 1, "%d\n", error);
> +       return 0;
>  }
>
>  static ssize_t occ_show_status(struct device *dev,
> @@ -1152,6 +1169,7 @@ int occ_create_status_attrs(struct occ *occ)
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
