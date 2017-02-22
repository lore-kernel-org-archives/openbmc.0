Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSzHr21LBzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 00:49:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oVAFIavn"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 203so222925ywz.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=C83GhRNiM9K4UjnnA28Pbc+4/25gOMjbfmiahabBZCM=;
 b=oVAFIavn138PepSMff+/8BZj5UZoRuzgo5kLbGwjdJhVK553n+nxUhLdSyjoWW8gxT
 Hw2ZIkAMaOj0Rz5sL4kWqA7o01kfQgbMo2mcoA1ZgMGeYTZex4zpm2uONoW/dRUUQJTy
 hMWxQDaNgKaFRXGSLFFGmo0yP4/mRihfdcCjZN1Bbm2FjfJZJPo+j5DP7QU/uI1/CSkl
 q94dAZXW8aso2Cd18N6X8XVcrhMY9isKn19nzR1M33TTFwKhr0MDsBj+SpBF8vxValqU
 KELeZcJhWWiQGxh45E5o6qvMm5WiFWVJcht6iGQyKGD6XsXnbsWBIYNHbqor7woMvO7F
 H6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=C83GhRNiM9K4UjnnA28Pbc+4/25gOMjbfmiahabBZCM=;
 b=HmmBTzFzjtyZEuL56iHje2z9/ec2Bd1gBL471YXqk7AQq/qhO24jDrdkwKOdRui5mL
 7cz+UyIVGmB8iBrEcPMXgFITS7bzPLjtqtp+Y7+kK7H834QqQdoWjRlyEt8iWcpSnWOF
 FpmP1NIR39zdd3c4SdfVOxGVxn1yROYnXkTLURYPs2q4v35VqqTZbJsIIq057U6aV+lL
 72uP1bkoCInF265cI7n+nyErje/sRkmWe8x3VTBKQwaBuduGf/6HUtFOCVKsdTFEPdaX
 jRBLvN/Z3YlFbf/f5TcX8G/NlazD0JD7VIwIFF7nz3E5Aq9HzgdL9zueZex4sg0nla1V
 cLXg==
X-Gm-Message-State: AMke39kFqSdMm6z1aPZ0P5zQyuykVLVusfWirRMXppJuE2ILcu1hlPEFBoPNrUrSiemyOqefB5NVMJrKJl6qrw==
X-Received: by 10.13.247.134 with SMTP id h128mr27694694ywf.56.1487771366107; 
 Wed, 22 Feb 2017 05:49:26 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 22 Feb 2017 05:49:05 -0800 (PST)
In-Reply-To: <CACPK8XeJ0fgYZbBGcfGGaRsbqfeH5ZUbrHq3PvHE1DhM3fCQxA@mail.gmail.com>
References: <20170220144004.10809-1-andrew@aj.id.au>
 <CACPK8XeJ0fgYZbBGcfGGaRsbqfeH5ZUbrHq3PvHE1DhM3fCQxA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2017 00:19:05 +1030
X-Google-Sender-Auth: lVC8m8OwDugj7dr3AsgiQIyMtoo
Message-ID: <CACPK8XcvoS=UJ37OG1EMeOydQP0k4edte_G4h8AZZsAg2u+rmQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: aspeed: Add debounce support
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-List-Received-Date: Wed, 22 Feb 2017 13:49:29 -0000

On Wed, Feb 22, 2017 at 2:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>> +               /*
>> +                * Check if a timer is already configured for the requested
>> +                * debounce period. If so, just add @offset as a user of this
>> +                * timer
>> +                */
>> +               for (i = 0; i < ARRAY_SIZE(debounce_timers); i++) {
>> +                       u32 cycles;
>> +
>> +                       addr = gpio->base + debounce_timers[i];
>> +                       cycles = ioread32(addr);
>> +
>> +                       if (requested_cycles == cycles)
>> +                               break;
>> +               }
>> +
>> +               /* Otherwise, allocate a timer */
>
> Is "otherwise" in reference to the check above? Is the break above
> supposed to be a goto?

I realised later that the if i == ARRAY_SIZE test below will always be
false when the break was hit, so in effect we are doing a goto
"Register @offset as a user of timer i".

I think adding a goto would make it easier to read.

If you're not a fan then perhaps tweak the comment?

Cheers,

Joel

>
>> +               if (i == ARRAY_SIZE(debounce_timers)) {
>> +                       for (i = 0; i < ARRAY_SIZE(gpio->timer_users); i++) {
>> +                               if (gpio->timer_users[i] == 0)
>> +                                       break;
>> +                       }
>> +
>> +                       /* We have run out of timers */
>> +                       if (i == ARRAY_SIZE(gpio->timer_users)) {
>> +                               dev_warn(chip->parent,
>> +                                               "Debounce timers exhausted, cannot debounce for period %luus\n",
>> +                                               usecs);
>> +                               rc = -EPERM;
>> +                               goto err;
>> +                       }
>> +
>> +                       /* Timer update */
>> +                       addr = gpio->base + debounce_timers[i];
>> +                       iowrite32(requested_cycles, addr);
>> +               }
>> +
>> +               /* Register @offset as a user of timer i */
>> +               newdt->offset = offset;
>> +               newdt->timer = i;
>> +               hash_add(gpio->offset_timer, &newdt->node, offset);
