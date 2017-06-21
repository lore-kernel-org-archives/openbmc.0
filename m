Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsspY5d8ZzDq88
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 14:55:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XIfoeBOh"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id u13so9752114ywg.0
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+v7e7WUXVaFBTUr747HR9dC9gMyH4lK861s1Sdy2V/U=;
 b=XIfoeBOhqB6NO7YwnEPTJwKEybdB/LQuB2siHeGCpDxgzoOGkQedB9H+2FkgJIlU99
 kqFgdMQ5ThFdYpYXfJ2foVen1t1D3kbbSEkQE3MigcCh7Pd5cpndSfzz2ifNQKibnc5z
 mmKU2jDfSoGyLqmcuSRDGJaKyUGG5RqTElmshGNupWSvDiL610bftAl401h+AN4m050k
 yL4rwHvCqmCVpwFpCDc5aRuXKJboV75wfrLiaHMwF0AZ87tg78Y3QvSY+rGCB9t3xUVl
 /2gxp9hRDN3DXka77lqxSgfxi16nfIT7rLIC7cZ6iSp7L0TRhQTKFWAiA+Vod1YQFZYW
 Dafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+v7e7WUXVaFBTUr747HR9dC9gMyH4lK861s1Sdy2V/U=;
 b=j2hCDsh3iqDZ0+UZ0K6JAiHw/ue2nCBhmw6J/GsYTgO8OLJzrj4jFOT5KQGCB+MG0K
 BeT/M3/wkNZRioysxYymIiRxEbR4lkSOA/TA4/DbcGHJYsfr747UgXb/HvzQ5sePhX+O
 T4nYZiovqBf3gXZJTWn1YT57ac9q61WFjmhtKwqGjQjNOtseTJV03myXz3QTb8S1fuQH
 XcH7WAoJsEH6ZRwX4CEB/5LKtii2JPYTtyaM2yj27ibRv35W68YNzuaJcNqsr+nxxpko
 ANwH8JVrBMCCr1u4j3kWK5NI5+hZLwjtEklFiVCbNQ2l0zOpIUj4fjN2Cc83xTh0CQ2D
 dYOQ==
X-Gm-Message-State: AKS2vOxkLGHnbyL/vPXcRGFr5KkND1SFCqxv2rcEVUVwM7O1rL90/6R+
 9pQEhrJrIMSvnYYvOZPXQhYy+c3D/A==
X-Received: by 10.129.93.133 with SMTP id r127mr24348475ywb.135.1498020915411; 
 Tue, 20 Jun 2017 21:55:15 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 20 Jun 2017 21:54:54 -0700 (PDT)
In-Reply-To: <20170620023941.21081-1-andrew@aj.id.au>
References: <20170620023941.21081-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jun 2017 14:24:54 +0930
X-Google-Sender-Auth: pqXH4Ozpxf6sgsv8gCFm_LpmooA
Message-ID: <CACPK8Xd==WMj0deqb9vSWdRejS_AXn=FiUaDEXd+AvVAX5d00A@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] hwmon: max31785: Enable dual rotor if
 functionality is detected
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Matt Spinler <spinler@us.ibm.com>
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
X-List-Received-Date: Wed, 21 Jun 2017 04:55:18 -0000

On Tue, Jun 20, 2017 at 12:09 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> The MFR_FAN_CONFIG command contains a bit (12) to enable or disable the
> second rotor measurement. Ensure we set it if we detect the 0x3040
> MFR_REVISION_ID.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied to dev-4.10.

Cheers,

Joel

> ---
>  drivers/hwmon/max31785.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index ecece346be28..73680954f664 100644
> --- a/drivers/hwmon/max31785.c
> +++ b/drivers/hwmon/max31785.c
> @@ -39,6 +39,7 @@
>  #define MAX31785_REG_MFR_MODEL                 0x9a
>  #define MAX31785_REG_MFR_REVISION              0x9b
>  #define MAX31785_REG_MFR_FAN_CONFIG            0xf1
> +#define         MAX31785_REG_MFR_FAN_CONFIG_DUAL_TACH  BIT(12)
>  #define MAX31785_REG_READ_FAN_PWM              0xf3
>
>  /* Fan Config register bits */
> @@ -81,13 +82,13 @@ struct max31785 {
>         /* Registers */
>         u8      fan_config[NR_CHANNEL];
>         u16     fan_command[NR_CHANNEL];
> -       u8      mfr_fan_config[NR_CHANNEL];
> +       u16     mfr_fan_config[NR_CHANNEL];
>         u8      fault_status[NR_CHANNEL];
>         u16     pwm[NR_CHANNEL];
>         u16     tach_rpm[NR_CHANNEL * 2];
>  };
>
> -static inline bool max31785_has_fast_rotor(struct max31785 *data)
> +static inline bool max31785_has_dual_rotor(struct max31785 *data)
>  {
>         return !!(data->capabilities & MAX31785_CAP_FAST_ROTOR);
>  }
> @@ -188,7 +189,7 @@ static int max31785_update_fan_speed(struct max31785 *data, u8 fan)
>         if (rc)
>                 return rc;
>
> -       if (max31785_has_fast_rotor(data)) {
> +       if (max31785_has_dual_rotor(data)) {
>                 rc = max31785_smbus_read_long_data(data->client,
>                                 MAX31785_REG_FAN_SPEED_1);
>                 if (rc < 0)
> @@ -429,12 +430,23 @@ static int max31785_init_fans(struct max31785 *data)
>                         return rv;
>                 data->fan_command[i] = rv;
>
> -               rv = max31785_read_fan_byte(client, i,
> +               rv = max31785_read_fan_word(client, i,
>                                 MAX31785_REG_MFR_FAN_CONFIG);
>                 if (rv < 0)
>                         return rv;
>                 data->mfr_fan_config[i] = rv;
>
> +               if (max31785_has_dual_rotor(data)) {
> +                       rv |= MAX31785_REG_MFR_FAN_CONFIG_DUAL_TACH;
> +                       data->mfr_fan_config[i] = rv;
> +
> +                       rv = max31785_write_fan_word(client, i,
> +                                       MAX31785_REG_MFR_FAN_CONFIG,
> +                                       data->mfr_fan_config[i]);
> +                       if (rv < 0)
> +                               return rv;
> +               }
> +
>                 if (!((data->fan_config[i]
>                         & MAX31785_FAN_CFG_CONTROL_MODE_RPM)
>                         || is_automatic_control_mode(data, i))) {
> @@ -799,7 +811,7 @@ static int max31785_probe(struct i2c_client *client,
>         if (rc < 0)
>                 return rc;
>
> -       if (max31785_has_fast_rotor(data))
> +       if (max31785_has_dual_rotor(data))
>                 chip = &max31785_chip_info_0x3040;
>         else
>                 chip = &max31785_chip_info_0x3030;
> --
> 2.11.0
>
