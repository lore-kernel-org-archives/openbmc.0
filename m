Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wkW5v6PQtzDqLS
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2017 15:28:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mpc8WZx0"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id p144so2987818ywp.2
 for <openbmc@lists.ozlabs.org>; Thu, 08 Jun 2017 22:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5VKZ/YR5t7eMKhh8F1W939wCHxfouaVt/oQAjl4hcOc=;
 b=Mpc8WZx0tLHsSU6IQggCpdwj0vTYKWq1IFwNdwDpmQq1vNcYvqIxTWoW8EVhkR9y8l
 RUjwQPxokvmwWXTwdwh+n1FarcNMN7nxrJOrJZ9zIiNWMMDtqPeKoX1uDe/miSE/S6UO
 wlqHtwo9wgKGaQE/gU49Oz+PoUPpxWfzkehYxxO7vcvjTxZRVF8N2nyGnL7ucLen0FFo
 kKUEBedWRErHWMnToesFI0YQWleNdiYIzMQCTQqzYhOtEFX4+BYfCcnk96tZhwZ4vUuY
 8mmX+NqwJY6FnC3XTKApk13V2qQAe5I+gs4FS+zyJMHRXmgzThs6BOnGQqXHW/M2MoLR
 1plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5VKZ/YR5t7eMKhh8F1W939wCHxfouaVt/oQAjl4hcOc=;
 b=bopUiyoKAtqJodehxFFQspN6CYw5VC+yhSdMTu6A3uBjH9mmwfsBH2NBCD4fWDJQy9
 vygHtOmj2duDjIirUSJlxThnb3zHAGI0i3500dKTFLLTg9REP6kOj7rDyLVAdOB+qi0x
 Jgv6FYPi4JQCoGPzEqGPTQGZHLWsYqFqJFpWCwfp4lc6B/kEYEAQqe4NMufRRbLhFq9H
 8SxOCYN6Say6Sno+zby0mLJYRrIABOA1ZZumDrCZLFgHNMH9PDKbKGf1K7RnGU6hshb9
 zKwQQ/59MnUFttDFRF+7FK9PzyZhVPFi+MtAetg8EMe6GqMtBtJJQKZcmQqCFOlchvHw
 C8Ww==
X-Gm-Message-State: AODbwcARggoHRwf74J5gfBt1MG21XOWHNwPMxnlYfy1tD8CURjwoQblw
 glh6tIf4wV3kuq4QApMCjvEmhEiIkQ==
X-Received: by 10.13.207.194 with SMTP id r185mr13016925ywd.135.1496986081327; 
 Thu, 08 Jun 2017 22:28:01 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 8 Jun 2017 22:27:40 -0700 (PDT)
In-Reply-To: <20170609041457.31708-4-andrew@aj.id.au>
References: <20170609041457.31708-1-andrew@aj.id.au>
 <20170609041457.31708-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Jun 2017 14:57:40 +0930
X-Google-Sender-Auth: vVj251lV14clLDYNZaFvozNWN5Q
Message-ID: <CACPK8XfoH0vRf5WK41KYj1HQbDPUwovM3ieChCgv_EMVdWZP2g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hwmon: max31785: Provide config of fault pin
 behavior
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: msbarth <msbarth@linux.vnet.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
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
X-List-Received-Date: Fri, 09 Jun 2017 05:28:04 -0000

On Fri, Jun 9, 2017 at 1:44 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> Provide interface to set behavior when FAULT pin is asserted.
> When enabled force fan to 100% PWM duty cycle.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> [Andrew Jeffery: Make it apply to reworked driver]
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/max31785.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
>
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index ecece346be28..b4a350477ee5 100644
> --- a/drivers/hwmon/max31785.c
> +++ b/drivers/hwmon/max31785.c
> @@ -38,6 +38,7 @@
>  #define MAX31785_REG_MFR_ID                    0x99
>  #define MAX31785_REG_MFR_MODEL                 0x9a
>  #define MAX31785_REG_MFR_REVISION              0x9b
> +#define MAX31785_REG_MFR_FAULT_RESP            0xd9
>  #define MAX31785_REG_MFR_FAN_CONFIG            0xf1
>  #define MAX31785_REG_READ_FAN_PWM              0xf3
>
> @@ -51,6 +52,9 @@
>  /* Fan Status register bits */
>  #define MAX31785_FAN_STATUS_FAULT_MASK         0x80
>
> +/* Fault response register bits */
> +#define MAX31785_FAULT_RESP_PIN_MONITOR                0x01
> +
>  /* Fan Command constants */
>  #define MAX31785_FAN_COMMAND_PWM_RATIO         40
>
> @@ -755,6 +759,82 @@ static const struct hwmon_chip_info max31785_chip_info_0x3040 = {
>         .info = max31785_info_0x3040,
>  };
>
> +static ssize_t max31785_fault_resp_store(struct device *dev,
> +                               struct device_attribute *attr, const char *buf,
> +                               size_t count)
> +{
> +       struct i2c_client *client = to_i2c_client(dev);
> +       struct max31785 *data = dev_get_drvdata(dev);
> +       int rv;
> +
> +       mutex_lock(&data->lock);
> +
> +       rv = max31785_set_page(client, 0);
> +       if (rv < 0)
> +               goto done;
> +
> +       rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
> +       if (rv < 0)
> +               goto done;
> +
> +       if (!strncmp(buf, "on", strlen("on"))) {

This is interesting. What do you gain from the strlen?

> +               if (!(rv & MAX31785_FAULT_RESP_PIN_MONITOR)) {
> +                       rv |= MAX31785_FAULT_RESP_PIN_MONITOR;

Is this something we're toggling on and off at runtime?

I doubt it is. This should be enabled at probe time. If we want to
make it an option then use a device tree property, but I don't think
it even needs to be optional.

Chris, can you confirm that this does not need to be dynamic?

Cheers,

Joel


> +                       rv = i2c_smbus_write_byte_data(client,
> +                                       MAX31785_REG_MFR_FAULT_RESP, rv);
> +                       if (rv < 0)
> +                               goto done;
> +               }
> +       } else if (!strncmp(buf, "off", strlen("off"))) {
> +               if (rv & MAX31785_FAULT_RESP_PIN_MONITOR) {
> +                       rv &= ~MAX31785_FAULT_RESP_PIN_MONITOR;
> +                       rv = i2c_smbus_write_byte_data(client,
> +                                       MAX31785_REG_MFR_FAULT_RESP, rv);
> +                       if (rv < 0)
> +                               goto done;
> +               }
> +       } else {
> +               dev_warn(dev, "Unknown fault response type: [%s]\n", buf);
> +               rv = -EINVAL;
> +       }
> +
> +done:
> +       mutex_unlock(&data->lock);
> +
> +       return rv;
> +}
> +
> +static ssize_t max31785_fault_resp_show(struct device *dev,
> +                              struct device_attribute *attr, char *buf)
> +{
> +       struct max31785 *data = max31785_update_device(dev);
> +       struct i2c_client *client = to_i2c_client(dev);
> +       int rv;
> +
> +       mutex_lock(&data->lock);
> +
> +       rv = max31785_set_page(client, 0);
> +       if (rv < 0)
> +               goto done;
> +
> +       rv = i2c_smbus_read_byte_data(client, MAX31785_REG_MFR_FAULT_RESP);
> +       if (rv < 0)
> +               goto done;
> +
> +       if (rv & MAX31785_FAULT_RESP_PIN_MONITOR)
> +               rv = sprintf(buf, "on\n");
> +       else
> +               rv = sprintf(buf, "off\n");
> +
> +done:
> +       mutex_unlock(&data->lock);
> +
> +       return rv;
> +}
> +
> +static DEVICE_ATTR(fault_resp, 0644, max31785_fault_resp_show,
> +               max31785_fault_resp_store);
> +
>
>  static int max31785_get_capabilities(struct max31785 *data)
>  {
> @@ -804,6 +884,10 @@ static int max31785_probe(struct i2c_client *client,
>         else
>                 chip = &max31785_chip_info_0x3030;
>
> +       rc = device_create_file(dev, &dev_attr_fault_resp);
> +       if (rc)
> +               return rc;
> +
>         hwmon_dev = devm_hwmon_device_register_with_info(dev,
>                         client->name, data, chip, NULL);
>
> --
> 2.11.0
>
