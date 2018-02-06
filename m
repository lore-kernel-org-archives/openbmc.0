Return-Path: <avifishman70@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::242; helo=mail-ot0-x242.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B9NOmmlx"; 
 dkim-atps=neutral
Received: from mail-ot0-x242.google.com (mail-ot0-x242.google.com
 [IPv6:2607:f8b0:4003:c0f::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbLWZ5hCJzF0xt
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 21:37:46 +1100 (AEDT)
Received: by mail-ot0-x242.google.com with SMTP id s4so1264880oth.7
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=sBrQfFyIIVMm1ItDx8+RWl5PeMD6G6QnFC2wPddM7sE=;
 b=B9NOmmlxku2cvRGo6JgxQNH74tQOvb+gKkRDhKdKHctSviEqALyBNhDsR5u1kZeB+i
 9p07I6f9P1b2kc0QSLJeXl31xhZ+11WFM6B61suoDeY6P4Y5TePDgAMJSD4tv+r/BvGr
 DF0nbLmBFwoKV71TuBeAMlygb2i+6q6P1XdmcEolG+BUjpeDGvP7hichulhoempEFixb
 aXo1nFuMP/29uxJuWi2G20dxl64d1v94Gb+P/OjkiPvazAoExGI/ZYgepl1RUFBgNK/8
 NA52RnMq9NK0OhLg7yH2xLdRPCY/67S4CV3UyHBbLae1+/GbH3WFz/s8nnOvtf3mWuc2
 lnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=sBrQfFyIIVMm1ItDx8+RWl5PeMD6G6QnFC2wPddM7sE=;
 b=ImF/9MltJ1MpqstX3n8+SxWFwQo3/6417EjB2XV056xHIcOYJ3KYmNTNUlSxKs1SU4
 YA5fzn4OvXokr1KdL5Sp81tWxk8srG8owwiRVibgPCvynbYRhKSvE9KCgr+O8ANatdVs
 +vBX+n9mMoZzR3eIFJxSTQitlctA7U3AyA6tOQ26x41ma1pqQJOIJipnRqUQy9kyj67o
 v5CODDClJX2OUv6+vLg+867lEK+FAK6Edf63DEBIWC9otq1PXiarEnolpvf/h5hVkhjq
 DL/YAMubYLPQfzTEB29IQzP4yE57h0vR3INKsKqRmCY0jbM12L+HV7gMxVrV+kG34/Wg
 IfQA==
X-Gm-Message-State: APf1xPDKpO8ynnxCoE0gelaCmQTqmKiBwY9b7k0Q6Q4VZFteySxhYYpD
 M1CLE6rT/kug3TI7A4pPKkmHwCOEqoNYl9UDiQ==
X-Google-Smtp-Source: AH8x22515TB5d6GSMN/NssXQ9ZnU9RkYyUMmoCSXeMrwo4Dg2XlLn0q2vBRRm6Ouu9AZxDZ2M6o+b1i+34Wwl9Z1Tsk=
X-Received: by 10.157.12.233 with SMTP id o38mr1201907otd.343.1517913463555;
 Tue, 06 Feb 2018 02:37:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.39.138 with HTTP; Tue, 6 Feb 2018 02:37:43 -0800 (PST)
In-Reply-To: <CACPK8Xc+b=Hfs01TKpZtRd6K+HKb-Qc0X9WNfr+L-tZZtXkDqg@mail.gmail.com>
References: <20180202042709.21627-1-joel@jms.id.au>
 <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
 <CACPK8Xc+b=Hfs01TKpZtRd6K+HKb-Qc0X9WNfr+L-tZZtXkDqg@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 6 Feb 2018 12:37:43 +0200
Message-ID: <CAKKbWA7_thZ=YpJ6GFhQrQrdzDU4Oo+eCNQ3wUUe+YT1rvTGAQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
To: Joel Stanley <joel@jms.id.au>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 06 Feb 2018 10:37:47 -0000

On Tue, Feb 6, 2018 at 7:50 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Mon, Feb 5, 2018 at 7:39 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> On 2 February 2018 at 06:27, Joel Stanley <joel@jms.id.au> wrote:
>
>>>  /* Uart divisor latch read */
>>> @@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
>>>                                 UART_DA830_PWREMU_MGMT_FREE);
>>>         }
>>>
>>> +       if (port->type == PORT_NPCM) {
>>> +               /*
>>> +                * Nuvoton calls the scratch register 'UART_TOR' (timeout
>>> +                * register). Enable it, and set TIOC (timeout interrupt
>>> +                * comparator) to be 0x20 for correct operation.
>>> +                */
>>> +               serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
>>> +       }
>>
>> Can we set the TOR register dynamically (adding special IOCTL)?
>
> We would have to have a good reason to do so.
>
> Under what circumstances would a user need to change this dynamically?

Tomer, I agree it is not important to change at run time.

>
>>
>>> +
>>>  #ifdef CONFIG_SERIAL_8250_RSA
>>>         /*
>>>          * If this is an RSA port, see if we can kick it up to the
>>> @@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
>>>         return quot_16 >> 4;
>>>  }
>>>
>>> +/* Nuvoton NPCM UARTs have a custom divisor calculation */
>>> +static unsigned int npcm_get_divisor(struct uart_8250_port *up,
>>> +               unsigned int baud)
>>> +{
>>> +       struct uart_port *port = &up->port;
>>> +
>>> +       return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
>>> +}
>
> Did you test this version of the driver on your hardware?
>
> I think I understand why you had the extra code, but does it affect
> operation in any of your tests?
>
> From what I understand the baud rates are often calculated to be "near enough".

Joel, I made the original calculation but I agree that this one is
good enough (I confused Tomer to think that your calculation will not
fit :)

>
> Cheers,
>
> Joel
