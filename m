Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpqvd4x1JzDq8M
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 16:19:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YlqWgBaE"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id w143so1813650yww.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=zxjJJI5R//cKaD2l+iDojL6f9CIpdi3g+JcLGVoc4mc=;
 b=YlqWgBaEeE+1khPU+N9c11zNdSrIG8jm+c+IptjTZ/ul78V06OrVXMV+RuwLv0zcSx
 i47uyAy6rpkAnLBxfBXjUjliHBl5HAHyNr5v4MYt7yESaxnm7UxA4/zLozXDKH7LdMjK
 TFnDmy7lWkgmBANUapIhX+wQRRFdNPg3b5Xc8A0uTCCMzyeuXaIPPoqfNb3xov1VgWyP
 P+0kXzv5pn+S3hldSx9NpWc0yPYK54xOGvhJ/Q45I7gSCYtY5JokGU7L1gJ5wTxLpznr
 NfL85oGS+41Ikyb470JV82l4DJhHRA6U51jy8gBfXuVH68UyWdTqiSSEi4yimSy2nQEK
 /Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=zxjJJI5R//cKaD2l+iDojL6f9CIpdi3g+JcLGVoc4mc=;
 b=GSdlIWgw+r7czdviByYKxCV6Jdh6Lz0U6oXC9lwTnSgipZ6hYYefIQHBPrM5hOKwpX
 SwlIZiGOL79mYWjGu9EVuxJZpERcBa8qvgUhBoZw6+NFG6mE5hU5ia0EF0Cq28Obij2Q
 s7YCvZ8m8hL/ejEdXpux1Fn6Pu7BakmMyAftu0dKVPOCSeqlwTpAcLu3NYXRJ40Nm65t
 wj0dMZb0naMAmqQG9TMVWEaAYhL2xaEs9MFIL7z6+1BFdFQdXxQX+6O8oeYG8iTx8VXW
 MhrkOSP81jZK7EP2sRlzJRrn1+mMSIqRDuOJ82OUn1Z1jMelGQbSivv01khSXcCiBdnx
 1hrw==
X-Gm-Message-State: AKS2vOwWr6rqFMSVVqcXMOoIhypeHbEJHYFDfTWt0VoI9Q5FzQ398rPz
 s+6nk2ldmU+9+Q9EomBeFn1IlyQkcw==
X-Received: by 10.13.225.79 with SMTP id k76mr6962310ywe.178.1497593946656;
 Thu, 15 Jun 2017 23:19:06 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Thu, 15 Jun 2017 23:18:46 -0700 (PDT)
In-Reply-To: <20170615200033.67387-4-cbostic@linux.vnet.ibm.com>
References: <20170615200033.67387-1-cbostic@linux.vnet.ibm.com>
 <20170615200033.67387-4-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Jun 2017 15:48:46 +0930
X-Google-Sender-Auth: mLiDU7nPXzwxF12zRJNK89k_yEU
Message-ID: <CACPK8Xc-Sm1+jU3tXNnCqCFPCkojro75mtQm1+PkO7=ev2uz=w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 3/3] drivers/hwmon: max31785 Set fan
 fault response based on dev tree
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 16 Jun 2017 06:19:10 -0000

On Fri, Jun 16, 2017 at 5:30 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Check for the optional device tree property 'fault-max-fan'.  If
> present, configure hardware for 100% PWM fan duty cycle on fault
> condition.
>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
>  drivers/hwmon/max31785.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index fc03b7c..a67d5e5 100644
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

It's a bit, so use BIT(0).

The bit is called "FAULT_PIN_MONITOR". Please use that naming in your code.


> +
>  /* Fan Command constants */
>  #define MAX31785_FAN_COMMAND_PWM_RATIO         40
>
> @@ -762,6 +766,36 @@ static int max31785_get_capabilities(struct max31785 *data)
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
> +               /* TODO: number of fans/pages is platform dependent */
> +               for (page = 0; page < 4; page++) {

The datasheet says "this bit is only valid for pages 0 to 5. Other
pages return 0".

Is there a reason you only apply it to the first four pages, and not
the fifth (index 4) and sixth (index 5)?

If you intended to apply this for all 6 supported pages, you could set
page 255, and have the condition applied for all of the valid pages.

If you only set it for the first four pages on purpose then please add
a comment to say that. However, I think we should fix the binding so
the pages can be selected. I will review the bindings separately.

Cheers,

Joel


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
> +                       rc |= MAX31785_FAULT_RESP_PIN_MONITOR;



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
> @@ -783,6 +817,10 @@ static int max31785_probe(struct i2c_client *client,
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
