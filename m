Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xM3GN6gv3zDsQS
 for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2017 14:28:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QWOSNdgx"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id p68so327053ywg.5
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2017 21:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=dVEJJZ9BVHANl4Lc/smkIniuzoynXdYduYRDyNkGd6w=;
 b=QWOSNdgxJTibd1/eokV8p8kcU7oWIhyB3qIxWFcjtOf7gNUUAQuYznzXGDAElPga0g
 lFTV6iORZAIbK6pJsjbOPX4uLOIQrKO6ARz1eClh8hscf2WBs3HAD5u9tQp1h5K/vXIS
 U5+uuQARiNGwiPr1UuvSsPMzyYcrbenGVxbU+Xwiy3/RKahhv/mohPt0NB6516gXWWSA
 DAxhaKUidIZZDn7M0UR+31rnGSmizEf/21qIGo4L1lVF/723asyycUzxkjq+6AuGwJWe
 g67zUMH5Lt6lsGSw6QpiEpnaICRUItDI9S48Yvo6UyvHCrF7/vzh1c6CnTkh5SzTFoYv
 G3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=dVEJJZ9BVHANl4Lc/smkIniuzoynXdYduYRDyNkGd6w=;
 b=DgQkoUOW7zqiWoux5eQF4Az69HxJX42L0dkjc3p0ZVkJRJU3qwu5cW6oztpUrbfS0O
 JWJb6lVvY+52FH4YmJzUJXvHNaTf97qh+MNcIkGeGNKAWEqXiIZi5pqUeAUCx0lg8P8i
 xiQYAIX4etS1VfqabzYXLdAzR4JgQl/hzhkPVRNFH3N57+xYYW92tOO8WC+vf9v8Culi
 txnxNJ0NraZh7LW8P3u0rU6sL8ZFK5mF8gwNIa25kE7+BqGF1311HCpe1T14mzJ811fl
 ddYsISBR0U0O9Nm49+I0mSuOmpMFmCAAFaGiU1d6DM1yOkATYiMTb1XSo28TkLRSESMa
 /mrQ==
X-Gm-Message-State: AIVw110ekEhF4HcE7rVMKiBYFEtFmD/aDk1u23aVDA+VAtmiy13inQvf
 WjlQ/oRwnEnG0hSjlDolzIQgHTEqwg==
X-Received: by 10.13.240.4 with SMTP id z4mr15448509ywe.276.1501561690017;
 Mon, 31 Jul 2017 21:28:10 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.197.148 with HTTP; Mon, 31 Jul 2017 21:27:49 -0700 (PDT)
In-Reply-To: <20170801031932.4328-4-andrew@aj.id.au>
References: <20170801031932.4328-1-andrew@aj.id.au>
 <20170801031932.4328-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Aug 2017 13:57:49 +0930
X-Google-Sender-Auth: MPz_oLMGYxV6SCehOi6rMWoT78Y
Message-ID: <CACPK8XcrJCxuGcbBoij41-5r2JSe=DhzyoXni=3hqh3PJQ_AEw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 3/3] pmbus: max31785: Work around
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
X-List-Received-Date: Tue, 01 Aug 2017 04:28:13 -0000

On Tue, Aug 1, 2017 at 12:49 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -48,6 +48,55 @@ enum max31785_regs {
>
>  #define MAX31785_NR_PAGES              23
>
> +/*
> + * MAX31785 dragons ahead

ENODRAGONS. Daenerys will not be pleased.

> + *
> + * It seems there's an undocumented timing constraint when performing
> + * back-to-back writes where the first write is to FAN_CONFIG_1_2. The device
> + * provides no indication of this besides NACK'ing master Txs; no bits are set
> + * in STATUS_BYTE to suggest anything has gone wrong.
> + *
> + * Given that, do a one-shot retry of the write.
> + *
> + * The max31785_*_write_*_data() functions should be used at any point where
> + * the prior write is to FAN_CONFIG_1_2.
> + */
> +static int max31785_i2c_smbus_write_byte_data(struct i2c_client *client,
> +                                             int command, u16 data)

nit: data should be a u8.

I will fix it when I apply. Thanks for the patches!

Cheers,

Joel
