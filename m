Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bKeHAImZ"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbD8C21BHzF0s0
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 16:50:35 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id l29so901162qkj.8
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 21:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Suz5+zW1nzU1Mthh9IZhVGsq+J0ylNUJN+dGmUlvXco=;
 b=bKeHAImZ3TMoeMSO0MshKs5A3Ji/P/YNlOSGKvN7nv+2/894mUQhin8Xer3iWUK1XK
 qo4SoVXt7hyO5hommRQ5XEL6B0I8wTbHR4G+cBbCt3vUe16LdsimJijC2v53RcxBgbKR
 xnRJROhWGP1rtNs/SX1SSYMkRhGy2yMjXawn1AaBlmM8F+VRIlU/sT9jXIY3rRwl8g5p
 QzB35d8pd2TWQF9OSiVc0YUFq3V6eZDRks7/1lgnHnN+Ia0FRkWXbKlZcrAip5SbUWNY
 ef672iJ4XydFZamapAaCXVrJ0Z5YL9GTgu7AePO2CzMXGnaSN6/GhWXT8uNae58luGZQ
 FE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Suz5+zW1nzU1Mthh9IZhVGsq+J0ylNUJN+dGmUlvXco=;
 b=tiBOy6enz6jthl8zClkbbH4O67f6MuWFfihp//lMhDOL4WpxTeIuOjdjag46D6vM2L
 RcUoFj5pExTkZlPIMIg6ABpcXX/NZwlpMthk1Jh4GWwnyXxYhimyQ/9NBB8hroUTVO7H
 CKOtoR77WEVnBThn6yEHpV9dXxDmFWrgKh6EXIYymqcmOJryy/7lGHyxTvkAZopVu9Z5
 oGyHuKw63NTfNYH8lx4hiuoVnN08maFx0EZMMSklMFoJmRdYhyZb6oysJrrvEZCmh3iJ
 yUD0UNlc9WYW7QbnVSsgwFZlQDFAvE33rv49szjZgW+A84mwt+GkPyi90c59j9WxpHgt
 JtBQ==
X-Gm-Message-State: APf1xPC3CoHP4Cubzu3WdeVQCNe2oXF4oqsBYLuqO+kMEXQDv/WUzfE6
 9ahIWa9TCyIbPBzaa+wtTusVejxHKBHH4l2HTK8=
X-Google-Smtp-Source: AH8x225cpOd8nAx3N7iixPisLTRPsmrt2c6on8LrsoDhcc9VCtfqj0gdO0hMnr6YMGKT899+WVIz1tusNGKW6aYmoSA=
X-Received: by 10.55.20.166 with SMTP id 38mr1699151qku.135.1517896232772;
 Mon, 05 Feb 2018 21:50:32 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.157 with HTTP; Mon, 5 Feb 2018 21:50:12 -0800 (PST)
In-Reply-To: <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
References: <20180202042709.21627-1-joel@jms.id.au>
 <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Feb 2018 16:20:12 +1030
X-Google-Sender-Auth: 9MdJYz_B0CILbV10roo8VZk4s00
Message-ID: <CACPK8Xc+b=Hfs01TKpZtRd6K+HKb-Qc0X9WNfr+L-tZZtXkDqg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 06 Feb 2018 05:50:35 -0000

On Mon, Feb 5, 2018 at 7:39 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> On 2 February 2018 at 06:27, Joel Stanley <joel@jms.id.au> wrote:

>>  /* Uart divisor latch read */
>> @@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
>>                                 UART_DA830_PWREMU_MGMT_FREE);
>>         }
>>
>> +       if (port->type == PORT_NPCM) {
>> +               /*
>> +                * Nuvoton calls the scratch register 'UART_TOR' (timeout
>> +                * register). Enable it, and set TIOC (timeout interrupt
>> +                * comparator) to be 0x20 for correct operation.
>> +                */
>> +               serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
>> +       }
>
> Can we set the TOR register dynamically (adding special IOCTL)?

We would have to have a good reason to do so.

Under what circumstances would a user need to change this dynamically?

>
>> +
>>  #ifdef CONFIG_SERIAL_8250_RSA
>>         /*
>>          * If this is an RSA port, see if we can kick it up to the
>> @@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
>>         return quot_16 >> 4;
>>  }
>>
>> +/* Nuvoton NPCM UARTs have a custom divisor calculation */
>> +static unsigned int npcm_get_divisor(struct uart_8250_port *up,
>> +               unsigned int baud)
>> +{
>> +       struct uart_port *port = &up->port;
>> +
>> +       return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
>> +}

Did you test this version of the driver on your hardware?

I think I understand why you had the extra code, but does it affect
operation in any of your tests?

From what I understand the baud rates are often calculated to be "near enough".

Cheers,

Joel
