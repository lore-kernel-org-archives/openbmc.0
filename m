Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pkSYyrLy"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZcrH6TgFzDr3J
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 17:19:43 +1100 (AEDT)
Received: by mail-qt0-x243.google.com with SMTP id t25so4685760qtg.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2018 22:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fvkuT5jXasB2DDNIixBV8r5K5nP0O6SI2I64gDeStig=;
 b=pkSYyrLyphjnQy6Jchd85ZLbcKUGeSundpAiLRZ8eM3b36/HTJbPe9qyafK4CTwz4Z
 06jr/7zisk4jjdOlKa+viW7qy4bD4i7C9JQvG4vkh0jigzP93m4M8fYUxfopkMfVknEH
 A6DtDfG0zqjioKKMY+Me0TEhYnMPq1N2oxdSu3PlcxR18ZSVMltGGyqZFhN+U7bJ8c8C
 BqJhprW+55HcFeUJiOlz3MHybimTPxbuyxC3jo454a5CgrexH3Vf0csgg+TcAQX1Ve/C
 PLaF8iaoVHDZWtGpflriGuwWvO0KWzVoyfEvca5EH0ZNZqaAKnM/u0zLrZk5qpSoH/di
 41hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fvkuT5jXasB2DDNIixBV8r5K5nP0O6SI2I64gDeStig=;
 b=qEc7X7glvtuV+AeiCvmgFs+dwCpWeQfx+TwcnSpa8UIeltOFaWulshl1uoYGCt3IdS
 4nZNbRQwlx3LOcVQ+C/KA1aUxWWQorHk4EQR5WmH2sZY5IIWTugvldHJPZ6Ugr7ybA3v
 uaMj+WEdqg9YLMDnLazVpMgMDuAeVRhJh2buQwNSsUYhQJJMb5/P0hISxXoRvfjuZtN6
 3P86RTlEimytxoPejTCfOtx5g9Z/+7sEFgR0xjGiMszQxWVR+wRb0lQdSKFgXOee95kV
 COUhSgE4Q1o8nAMcQBvz+tfugqifUuhMuGPuhdSMBLY+xYf9zPzNVz413j/+Yg/z1Jgu
 4DqQ==
X-Gm-Message-State: APf1xPDyDS8uO2BJPPmZAiyR5sVNDS3kfERMc69e4PTOwbBZLfomJUia
 uAo4oc2ib5+6twxAOf91iKCZifbNlNOeamuxBng=
X-Google-Smtp-Source: AH8x224c6AbypcbLkbAKnFYWnYXUNoqC6F2iwm5wJrStXjhHEreOnXrOflbCsHtwBOGW5CYGdZ65Iducg1UIUPUkNro=
X-Received: by 10.237.38.37 with SMTP id z34mr2085918qtc.178.1517811580236;
 Sun, 04 Feb 2018 22:19:40 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Sun, 4 Feb 2018 22:19:19 -0800 (PST)
In-Reply-To: <CAP6Zq1goE=rvxq+OG0ZbWwpFRDhfkscCDZkU7AUecTM5LJrvKA@mail.gmail.com>
References: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
 <1516720600-2040-3-git-send-email-tmaimon77@gmail.com>
 <CACPK8XcznGkfjhhi3TB+pYYH_EsT0ehJdF944=iVfG-ROQnWcw@mail.gmail.com>
 <CAP6Zq1goE=rvxq+OG0ZbWwpFRDhfkscCDZkU7AUecTM5LJrvKA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 5 Feb 2018 16:49:19 +1030
X-Google-Sender-Auth: P9DgHz-EGFOEBxYm4rg9-ZPG9hc
Message-ID: <CACPK8XeSFHhMsjkdXc_AuRL_Q4yVSfpn8+WBe405yBu39nMcfQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 2/2] serial: npcm: add NPCM UART driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Feb 2018 06:19:44 -0000

On Mon, Feb 5, 2018 at 6:24 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> On 2 February 2018 at 04:51, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, Jan 24, 2018 at 1:46 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>> Add Nuvoton BMC NPCM UART driver.
>>>
>>> The NPCM7xx BMC contains four UART blocks and accessory logic.
>>>
>>> NPCM UART based on 8250 driver.
>>
>> Nice! Much less code to review and maintain than before :)
>>
>> I did some more digging, to see if we could add even less code. I'll
>> sent a patch to the list, but I need to clarify the divisor
>> calculation first.
>>
> Thanks!
>>> +static int npcm_uart_set_baud_rate(struct uart_port *port,
>>> +                                     NPCM_UART_BAUDRATE_T baudrate)
>>> +{
>>> +       struct uart_8250_port *up = up_to_u8250p(port);
>>> +       int divisor     = 0;
>>> +       int ret         = 0;
>>> +       unsigned long flags;
>>> +
>>> +       divisor = ((int)port->uartclk / ((int)baudrate * 16)) - 2;
>>
>> The 8250 core uses this calculation:
>>
>>  divisor = port->uartclk / (baudrate * 16).
>>
>> Checking the datasheet, this is the calculation that is documented for Poleg:
>>
>>  divisor = port->uartclk / (baudrate * 16 + 2).
>>
>> If I change the calculation to this, the UART doesn't work (due to the
>> precision of the integer division, there's no change from the 8250
>> core code). If I subtract 2 from the number, as you do in your patch,
>> it works!
>>
>> Can you explain what is happening here?

Hi Tomer, you missed this question. Can you explain to me what is
happening here?

>>
>>> +
>>> +       /* since divisor is rounded down check
>>> +        * if it is better when rounded up
>>> +        */
>>> +       if (((int)port->uartclk / (16 * (divisor + 2)) - (int)baudrate) >
>>> +               ((int)baudrate -
>>> +                (int)port->uartclk / (16 * ((divisor + 1) + 2))))
>>> +               divisor++;
>>
>> This bit confused me when I tried to understand what it was checking.
>> I couldn't find a mention of it in the datasheet either.
>>
>> Can you explain to me what it is trying to do? Do we need it?
> hope i will explain it right...
>
> we are calculating the nearest round up of the divisor according to
> the distance from the real divisor (with point) to the value we get
> from the round up and round down. (and it different from using
> DIV_ROUND_CLOSEST)
> for example:
>
> If the baud rate is 230,400
>
> the divisor is 4.510 (it means round up)
>
> if we doing the calculation above:
>
> (24Mhz/(16*(4+2))) - 230,400 = 19,600
> 230,400 - (24Mhz/(16*(4+3))) = 16,114
>
> also in here we see round - up, but the distance from the second
> (16,114) it better and the 4.510 not represent it correctly because 2
> result we get are not that the same.
>
> so maybe in clock rate of 24Mhz it will be fine but if we will modify
> the clock rate the calculation could be wrong with a use of
> DIV_ROUND_CLOSEST.
>
> so we think it is better to use the calculation above and not round up.
>
> Is it problematic to use it in the modify driver you sent?

Thanks for the explanation. As I mention above, I need to understand
the first calculation in order to understand this part.

It would be easy enough to add this calculation if it was strictly
necessary. However, to know if it is required, I first need to
understand what is happening.

Cheers,

Joel
