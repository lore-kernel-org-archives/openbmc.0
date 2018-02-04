Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rHYM8e+y"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZLzP49sjzF0qB
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 06:54:57 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id k6so13533104ita.3
 for <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2018 11:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QH9oCzZP4mtX3ExfdWUFiM0fF2L1d5fZFs+xwD+75dc=;
 b=rHYM8e+yIjUFtY08JRj+T8PfSYtA2e909D3RXvFmwkMYhnVdeOc4WYGRqf8SvZARTv
 5YhyKOZj3RoR1Iun1CWxgrds/TLqmtu7NeKBAXfKbLhBpJ5S5+VgSyZiC8hZiJDJTMOs
 W5uw51ioA032IAP6K30mZvUMr6x66DlmdIlVRyf5mRFsg35f5vUDe730/T/frptoJORr
 lcKkWyjHAlu4zONqkxKFsJxefbWFhhuvhkF8NOXWGf7uWJBZBwU3hQI44vtaKQixdCvL
 s9m7YYB46F+L1/nsJ/BZStdwSNAQ1dy9VqsIM5/SrGOeO2pht6xWBEt7/vmmnGDwfvT9
 6RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QH9oCzZP4mtX3ExfdWUFiM0fF2L1d5fZFs+xwD+75dc=;
 b=GNEerFmtpxpnlNEYwI3KnT5M7bTcyqlpByenqwRNh4WVcnY+x7KKDC40acdwVHDcZo
 N3A65jty/QN8nN3YvTeJ3NvFeYtJWS+1GiyR2bSmwT8z+YROFkekEn76WG6EUfJaTp5T
 QbgGgO8Xs4S9jzBcnm4z3fygLEWaeD9Jtgf947Omk1JfSjzJIAnRA0tj/5ftrm9QSBPI
 ET2LT4FJXr9XH8XlVyBp00yEy1vxIVkVtAdnPd+EpU0UW7iy9Q0R/3NXzZxM/u8TGDoD
 YTnjLkefkuCigWXW+yQzcDHgFaswucQycA2ln0P7ASmPlCqLEYQr4MUsEPVkQq4oMUh8
 TJEQ==
X-Gm-Message-State: AKwxytdcai96lR28v255Xv3FW7tpwNf9NISVkGqWM9gZDC2MmKvm6lqP
 TL2OocgomPyYwtpdXH0Msm4vxwBQyvjilmngBDU=
X-Google-Smtp-Source: AH8x226mS57s3CP4U/+tbmZR1xU0tfX+wap0ngNxJpfjvTBxfKlMXV/T77oRkJWwAVwKqqdVe+MjOJCRr1hwy+2Iz6o=
X-Received: by 10.36.127.148 with SMTP id r142mr54917606itc.11.1517774095138; 
 Sun, 04 Feb 2018 11:54:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.7.10 with HTTP; Sun, 4 Feb 2018 11:54:54 -0800 (PST)
In-Reply-To: <CACPK8XcznGkfjhhi3TB+pYYH_EsT0ehJdF944=iVfG-ROQnWcw@mail.gmail.com>
References: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
 <1516720600-2040-3-git-send-email-tmaimon77@gmail.com>
 <CACPK8XcznGkfjhhi3TB+pYYH_EsT0ehJdF944=iVfG-ROQnWcw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 4 Feb 2018 21:54:54 +0200
Message-ID: <CAP6Zq1goE=rvxq+OG0ZbWwpFRDhfkscCDZkU7AUecTM5LJrvKA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v2 2/2] serial: npcm: add NPCM UART driver
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Sun, 04 Feb 2018 19:54:58 -0000

On 2 February 2018 at 04:51, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Jan 24, 2018 at 1:46 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Add Nuvoton BMC NPCM UART driver.
>>
>> The NPCM7xx BMC contains four UART blocks and accessory logic.
>>
>> NPCM UART based on 8250 driver.
>
> Nice! Much less code to review and maintain than before :)
>
> I did some more digging, to see if we could add even less code. I'll
> sent a patch to the list, but I need to clarify the divisor
> calculation first.
>
Thanks!
>> +static int npcm_uart_set_baud_rate(struct uart_port *port,
>> +                                     NPCM_UART_BAUDRATE_T baudrate)
>> +{
>> +       struct uart_8250_port *up = up_to_u8250p(port);
>> +       int divisor     = 0;
>> +       int ret         = 0;
>> +       unsigned long flags;
>> +
>> +       divisor = ((int)port->uartclk / ((int)baudrate * 16)) - 2;
>
> The 8250 core uses this calculation:
>
>  divisor = port->uartclk / (baudrate * 16).
>
> Checking the datasheet, this is the calculation that is documented for Poleg:
>
>  divisor = port->uartclk / (baudrate * 16 + 2).
>
> If I change the calculation to this, the UART doesn't work (due to the
> precision of the integer division, there's no change from the 8250
> core code). If I subtract 2 from the number, as you do in your patch,
> it works!
>
> Can you explain what is happening here?
>
>> +
>> +       /* since divisor is rounded down check
>> +        * if it is better when rounded up
>> +        */
>> +       if (((int)port->uartclk / (16 * (divisor + 2)) - (int)baudrate) >
>> +               ((int)baudrate -
>> +                (int)port->uartclk / (16 * ((divisor + 1) + 2))))
>> +               divisor++;
>
> This bit confused me when I tried to understand what it was checking.
> I couldn't find a mention of it in the datasheet either.
>
> Can you explain to me what it is trying to do? Do we need it?
hope i will explain it right...

we are calculating the nearest round up of the divisor according to
the distance from the real divisor (with point) to the value we get
from the round up and round down. (and it different from using
DIV_ROUND_CLOSEST)
for example:

If the baud rate is 230,400

the divisor is 4.510 (it means round up)

if we doing the calculation above:

(24Mhz/(16*(4+2))) - 230,400 = 19,600
230,400 - (24Mhz/(16*(4+3))) = 16,114

also in here we see round - up, but the distance from the second
(16,114) it better and the 4.510 not represent it correctly because 2
result we get are not that the same.

so maybe in clock rate of 24Mhz it will be fine but if we will modify
the clock rate the calculation could be wrong with a use of
DIV_ROUND_CLOSEST.

so we think it is better to use the calculation above and not round up.

Is it problematic to use it in the modify driver you sent?

>
> Cheers,
>
> Joel

Cheers,

Tomer
