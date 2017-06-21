Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wst2g1n21zDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:05:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F2SC7QWi"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id e142so4971884ywa.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 22:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=R6NUIrEDnuRGfRjqy1D2rxFcAwqUzCHgehVeva7YI5I=;
 b=F2SC7QWiuQQVCrJoz+kJAn4GueLfjnob+DdSTTeA/vsStgwYY/EE6HFMo78naaC+fq
 xveTzXPgD5mYtzV3aoFD/mNvWBwejjTcH2tCG2rmrkoxQI88CcGjAtXNEnA8lzyrWkuV
 L770oFUUmxh26QbfhmozsTE3Rh3W9MU0Hj7rAiLHlVBh7Q/TXZoRQZBxcT6tvRJvzwgv
 F7KpXfkUz8nrBknkwHY/9mzjoKGjYtE57v22kgA2CSJPcMEYyPbqZ+yTee7b2S3SDoUa
 BtwVpILdPLnZxvPfwAllcS9xlnonmRYFHt+POeP145lbkWR8k70QaYDOJUul4zAABfc3
 /crA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=R6NUIrEDnuRGfRjqy1D2rxFcAwqUzCHgehVeva7YI5I=;
 b=V+T0fz7RG2q1/h40hVt7BrWS7KH2ettArqWsbIkM7RIW2Nl8LP/CnF3DaaSXBZpWch
 SzK12o9p0kDoB7Ez/xHxHMdm3dFBdlwWeW1oGuG23ag+MAa8KcJXqvQBOgC69pQAayKr
 VxPGjksyylM+AP5RI/bKCWOR5ghEo13RI7g3h/PAcc8mMUtTcHepesncvzA5EY4dA1tj
 XGmxKBLVr9Oamjv7Y7igiKCp3/Kln5nqfkk1AMtBB6xo7Gv5OhdJMQi8zjQIPYLk//zi
 Ct9NDWFmyLQ2XojwhP07Wt5EPSpimOpwqBsNPcj/J5BYCAcS3qcbiOCSJO3Qo0+xBeii
 LoKA==
X-Gm-Message-State: AKS2vOz8HYgC9jhzm/FyXHGJyfmnUSKbf67Ggmjgr56RlMxB0uC+K0hu
 /KCODt4KWHwKgtC9XrxYnozG8DIk+g==
X-Received: by 10.13.208.67 with SMTP id s64mr26568203ywd.43.1498021544949;
 Tue, 20 Jun 2017 22:05:44 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 20 Jun 2017 22:05:24 -0700 (PDT)
In-Reply-To: <20170620183747.25327-1-cbostic@linux.vnet.ibm.com>
References: <20170620183747.25327-1-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jun 2017 14:35:24 +0930
X-Google-Sender-Auth: zfNEB39FCkG3u5lA282EGP3S3mA
Message-ID: <CACPK8XcEuWbFhc5Z6y7k+aS=9n2EUfO6TYqHYnfiMPaw6P56Kw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon: max31785 Set fan fault
 response based on dev tree
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 21 Jun 2017 05:05:48 -0000

On Wed, Jun 21, 2017 at 4:07 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Check for the optional device tree property 'fault-max-fan'.  If
> present, configure hardware for 100% PWM fan duty cycle on fault
> condition.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v3 - Change bit field definition to use macro BIT(x)
>    - Set all 6 fans to same fault response
>    - Rename fault response register #define to match the spec

Applied to dev-4.10.

Cheers,

Joel

>
> v2 - Set 4 fans to same fault response
> ---
>  drivers/hwmon/max31785.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index fc03b7c..4010504 100644
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
> +#define MAX31785_FAULT_PIN_MONITOR             BIT(0)
> +
>  /* Fan Command constants */
>  #define MAX31785_FAN_COMMAND_PWM_RATIO         40
>
> @@ -762,6 +766,35 @@ static int max31785_get_capabilities(struct max31785 *data)
>         return 0;
>  }
>
> +static int max31785_init_fault_resp(struct i2c_client *client)
> +{
> +       struct device_node *np = client->dev.of_node;
> +       int page;
> +       int rc;
> +
> +       if (np && of_get_property(np, "fault-max-fan", NULL)) {

For reference, you can use of_property_read_bool here.

> +               for (page = 0; page < NR_CHANNEL; page++) {
> +
> +                       /* set max fans on fault */
> +                       rc = max31785_set_page(client, page);
> +                       if (rc < 0)
> +                               return rc;
> +
> +                       rc = i2c_smbus_read_byte_data(client,
> +                                       MAX31785_REG_MFR_FAULT_RESP);
> +                       if (rc < 0)
> +                               return rc;
> +
> +                       rc |= MAX31785_FAULT_PIN_MONITOR;
> +                       rc = i2c_smbus_write_byte_data(client,
> +                                       MAX31785_REG_MFR_FAULT_RESP, rc);
> +               }
> +               return rc;
> +       }
> +
> +       return 0;
> +}
> +
>  static int max31785_probe(struct i2c_client *client,
>                           const struct i2c_device_id *id)
>  {
> @@ -783,6 +816,10 @@ static int max31785_probe(struct i2c_client *client,
>         data->client = client;
>         mutex_init(&data->lock);
>
> +       rc = max31785_init_fault_resp(client);
> +       if (rc)
> +               return rc;
> +
>         rc = max31785_init_fans(data);
>         if (rc)
>                 return rc;
> --
> 1.8.2.2
>
