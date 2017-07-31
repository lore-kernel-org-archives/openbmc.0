Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xLccn4bfDzDrMt
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 21:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="V4Rc7Rz4"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id l82so12325226ywc.2
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=lSJSXK4C9fT5TIsbriTmm0Q/zb1knb+GEOO45TuYz/k=;
 b=V4Rc7Rz44yVxcAKIA8qeS7UC92ISlQA7V1ZD37O9YYt6Z7RchpqvnR7x4vaZpTtrEn
 +HFQkqwx3Zcvh4obJtmQxoA3rrRB5Fnjn4XWXp4MC0vzHziDgxUHy4bWUtWn4FDArFPw
 bkVwBwlOfROmATWUxPD8QzUCeCnXSr0rQ92Xnf1CrRLn5hz4ZE/HcvlFcHlmIb7aFbL9
 1eGvfHsiApEnV9XUHjWhHMQSauljVDtav+pCn94XnjilBhnNtKtlNF4gl9ZRZLP3WZ1e
 +zK3ysJzDArWaQzcJ6gxw4pRxyQ3L6SfSJbWQFq7lc+HeOP+ijkzYE0SkwOGvUvckxhf
 BH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=lSJSXK4C9fT5TIsbriTmm0Q/zb1knb+GEOO45TuYz/k=;
 b=qYXd38OwsImv5LUjbGZ0A5sJlYRMppPOBJ4zwmLCqMFoDGwonZW+fCBYWo6L6pvN5r
 lggsNP4UvJqtri7lqsqjhe3LCZORK4ih7b23lIuhmuHrY03WDvD0XXKTxsFtyA0xxcJ3
 SkoTwQlRXwZM8Ox3w+M6hE6jvq3CP1dilTt16eX4adKqDeRfPylk4EvJS1GJcyYDyb/w
 eyKoBC9kQVKp3W6nDsErA6CqbHCc6GM5EpDFIi1LLpXCKqw3jIxM/p3SW6ov/H+NGa5T
 xOE/7Do//SzdwZvtosUkI2PQ54IaVPOB1F1QYpQv2k2Wf2b0/S5O4EsCVBeeUvKJJ5so
 apjA==
X-Gm-Message-State: AIVw113N12rAWG6SlXRdfjP2awIVhobkAFKI+rDcgf9RlOAFhtL23hTb
 n3FSoHBASgaDef5BA4aPtKDeKqfW5A==
X-Received: by 10.129.74.7 with SMTP id x7mr13304307ywa.193.1501500455537;
 Mon, 31 Jul 2017 04:27:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 04:27:15 -0700 (PDT)
In-Reply-To: <20170728162249.9145-7-andrew@aj.id.au>
References: <20170728162249.9145-1-andrew@aj.id.au>
 <20170728162249.9145-7-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2017 20:57:15 +0930
X-Google-Sender-Auth: ym0YHU8OUPrN02x-PV9Iq9MmypM
Message-ID: <CACPK8Xd56iJ4MrLqRXvcgH9M230nR+ghiGnOZ-4LvF-rtncFvw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 6/6] pmbus: max31785: Work around
 back-to-back writes with FAN_CONFIG_1_2
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 msbarth <msbarth@linux.vnet.ibm.com>, 
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
X-List-Received-Date: Mon, 31 Jul 2017 11:27:38 -0000

On Sat, Jul 29, 2017 at 1:52 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Testing of the pmbus max31785 driver implementation revealed occasional
> NACKs from the device. Attempting the same transaction immediately after
> the failure appears to always succeed. The NACK has consistently been
> observed to happen on the second write of back-to-back writes to the
> device, where the first write is to FAN_CONFIG_1_2. The NACK occurs
> against the first data byte transmitted by the master on the second
> write. The behaviour has the hallmarks of a PMBus Device Busy response,
> but the busy bit is not set in the status byte.
>
> Work around this undocumented behaviour by retrying any back-to-back
> writes that occur after first writing FAN_CONFIG_1_2.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/max31785.c | 105 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 97 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index a86919bc7294..1911658ffcf6 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -48,6 +48,55 @@ enum max31785_regs {
>
>  #define MAX31785_NR_PAGES              23
>
> +/*
> + * MAX31785 dragons ahead

                \||/
                |  @___oo
      /\  /\   / (__,,,,|
     ) /^\) ^\/ _)
     )   /^\/   _)
     )   _ /  / _)
 /\  )/\/ ||  | )_)
<  >      |(,,) )__)
 ||      /    \)___)\
 | \____(      )___) )___
  \______(_______;;; __;;;



> + *
> + * It seems there's an undocumented timing constraint when performing
> + * back-to-back writes where the first write is to FAN_CONFIG_1_2. The device
> + * provides no indication of this besides NACK'ing master Txs; no bits are set
> + * in STATUS_BYTE to suggest anything has gone wrong.
> + *
> + * Given that, do a one-shot retry of the write.
> + *
> + * The __max31785_*_write_*_data() functions should be used at any point where
> + * the prior write is to FAN_CONFIG_1_2.
> + */
> +static int __max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
> +                                               int command, u16 data)

Drop the __ prefix for these functions.

> +{
> +       int ret;
> +
> +       ret = i2c_smbus_write_byte_data(client, command, data);
> +       if (ret == -EIO)
> +               ret = i2c_smbus_write_byte_data(client, command, data);
> +
> +       return ret;
> +}
> +

>  static int max31785_write_word_data(struct i2c_client *client, int page,
> @@ -219,12 +293,24 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
>                 return -ENXIO;
>
>         switch (reg) {
> +       case PMBUS_VIRT_FAN_TARGET_1:
> +               return __max31785_update_fan(client, page, PB_FAN_1_RPM,
> +                                            PB_FAN_1_RPM, word);
> +       case PMBUS_VIRT_PWM_1:
> +       {
> +               u32 command = word;
> +
> +               command *= 100;
> +               command /= 255;
> +               return __max31785_update_fan(client, page, 0, PB_FAN_1_RPM,
> +                                            command);

This looks like code from the pmbus core. Does this override the code
from the core so we can use the magic try-twice update?

Cheers,

Joel
