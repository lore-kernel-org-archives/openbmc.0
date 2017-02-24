Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTsXR5wDYzDqC0
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 11:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RXYRI7GS"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id i66so288395yba.1
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 16:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+yqaWNk91UwyWFRGx1EUmqLYA7WRcJuhrrHFhadvjCE=;
 b=RXYRI7GSfKgt7OYXQH6ukucaDkdsIYYR7jdkFJzYbXXhPB12B/zcQd24qQThfsbTuc
 GHdijpr35fE494w4ItepHRQkytgsIfEwrJocAzjj5tNY3F05GpThoSpV/kJMCJ9t0xnm
 JpjGDmqNW75k0d+85Q4ncj7+McQ23iA3E4RyluNyp3Kw9lNKY1NHmwxA5N0E9C14NQiG
 nuQMI4KqBasiXbKGtO56E1JawDBG9g+r+ctiHe2Dki3rlmbFL/ROPzRGdfYUZEJv9Gc6
 fEVCp1moI1KWWoqHhKfBIWT7gCmN4m5Zrk+WtwjKutQIRdKoKUbmZQ0UiCSLzQ9E0eje
 U3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+yqaWNk91UwyWFRGx1EUmqLYA7WRcJuhrrHFhadvjCE=;
 b=OgPdHk3esXpHJYgcYx04CemZZ93COJ1FpyDps8neZByCqaeeVnSlMPzSRhTKRtD04V
 2R4dET+HXB0Gh3SbYRJmUxT1VqBHxnQqkDq8PfMTTC+mj62FaRnTUA5HpYI9qCPpvfUH
 BebiXkJcN3vi7dZvOZRV2mrj4O05aZ/6PQzx8to4uIo9FmHnbUnbCv0GOR0DYyGqLxNj
 PcQLoc+93qq8W4J/6nN8E2HiiB/Bfyq3++oD9bKeGKxqdg4Y6CZZaSJs3Mo1aDGgl6if
 E9dEhTWa0X6kK6qdWAGBSVbidYdzmLkbfiEepb4oU6dWC34P06jPtxGhWjC2Sgfm+67m
 PRAg==
X-Gm-Message-State: AMke39nfy7auFwHAY5hhwzIt5jP121V9iDM2mJ+vyOVt48E3HhbFpGB6JJPO6+G3/iF+pyKPF4oERu8Ku/Negg==
X-Received: by 10.37.16.214 with SMTP id 205mr25519877ybq.17.1487896405176;
 Thu, 23 Feb 2017 16:33:25 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 16:33:04 -0800 (PST)
In-Reply-To: <116aca21-6ead-919a-599a-32778a38fc0c@linux.vnet.ibm.com>
References: <20170223195837.82098-1-cbostic@linux.vnet.ibm.com>
 <20170223195837.82098-2-cbostic@linux.vnet.ibm.com>
 <116aca21-6ead-919a-599a-32778a38fc0c@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 11:03:04 +1030
X-Google-Sender-Auth: BZCqbr0AkcBbt6UrWFcvs7rho98
Message-ID: <CACPK8XfxGGMQxKVMqb76V=6LRWdS6Uq0hBMo40j1mZRAqczj+g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v3 1/2] drivers/fsi: Move common read/write
 code into shared utility
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 24 Feb 2017 00:33:28 -0000

Hi Eddie,

On Fri, Feb 24, 2017 at 7:27 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> Looks good.
>
> Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

Please don't top post on the mailing list.

Cheers,

Joel

>
>
> On 02/23/2017 01:58 PM, Christopher Bostic wrote:
>>
>> Move common code shared between fsi_master_gpio_read/write into
>> send utility.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>>
>> ---
>>
>> v2 - Separate this patch from a collection of other changes in the
>>       v1 related patch.
>> ---
>>   drivers/fsi/fsi-master-gpio.c | 38
>> ++++++++++++++++++--------------------
>>   1 file changed, 18 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
>> index 8c8a8f4..b6feec1 100644
>> --- a/drivers/fsi/fsi-master-gpio.c
>> +++ b/drivers/fsi/fsi-master-gpio.c
>> @@ -354,26 +354,33 @@ static void build_abs_ar_command(struct fsi_gpio_msg
>> *cmd, uint64_t mode,
>>         cmd->msg >>= (64 - cmd->bits);
>>   }
>>
>> +static int send_command(struct fsi_master_gpio *master,
>> +                       struct fsi_gpio_msg *cmd, uint8_t expected,
>> +                       size_t size, void *val)
>> +{
>> +       unsigned long flags;
>> +       int rc;
>> +
>> +       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
>> +       serial_out(master, cmd);
>> +       echo_delay(master);
>> +       rc = poll_for_response(master, expected, size, val);
>> +       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
>> +
>> +       return rc;
>> +}
>> +
>>   static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>>                 uint8_t slave, uint32_t addr, void *val, size_t size)
>>   {
>>         struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>>         struct fsi_gpio_msg cmd;
>> -       int rc;
>> -       unsigned long flags;
>>
>>         if (link != 0)
>>                 return -ENODEV;
>>
>>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size,
>> NULL);
>> -
>> -       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
>> -       serial_out(master, &cmd);
>> -       echo_delay(master);
>> -       rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
>> -       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
>> -
>> -       return rc;
>> +       return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
>>   }
>>
>>   static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>> @@ -381,21 +388,12 @@ static int fsi_master_gpio_write(struct fsi_master
>> *_master, int link,
>>   {
>>         struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
>>         struct fsi_gpio_msg cmd;
>> -       int rc;
>> -       unsigned long flags;
>>
>>         if (link != 0)
>>                 return -ENODEV;
>>
>>         build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size,
>> val);
>> -
>> -       spin_lock_irqsave(&fsi_gpio_cmd_lock, flags);
>> -       serial_out(master, &cmd);
>> -       echo_delay(master);
>> -       rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
>> -       spin_unlock_irqrestore(&fsi_gpio_cmd_lock, flags);
>> -
>> -       return rc;
>> +       return send_command(master, &cmd, FSI_GPIO_RESP_ACK, size, NULL);
>>   }
>>
>>   /*
>
>
