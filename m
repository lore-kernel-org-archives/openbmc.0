Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhT60DEX"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbNtV1cN5zDqhg
 for <openbmc@lists.ozlabs.org>; Tue,  6 Feb 2018 23:24:17 +1100 (AEDT)
Received: by mail-it0-x243.google.com with SMTP id 196so2214067iti.5
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=RZXcvFVtKnSyjR8EyoRXxKXN7pVJ3ip9wzTDrxsshiY=;
 b=JhT60DEXB6dnmsOAPeeF91mlXDFDFtBrvmYyWubgzsE76JOniJ9m+GryhD9qaWMbSr
 wDBoBf2qlnRd+hyBcjYLWW2iw3KNOEeCey96lkJkm73eZ0ODbUrQSkq/DBFfW47B9OLf
 nSC0J0IPa/RiFBaO4FQmYiUjOfQmNgLhVU4qpH7kdTOr3mBTv1NFzxJ2IHA0xQqycSr1
 m9BrKmNr5QBMueVvLzlAli9qfzTZ63PN79IXHdfh3HYi9Q5M6y2yA0q+TncSD9UEYZA2
 U/neFl0DQdGm6qIN3nmXfsLNdvpitGeudkEegAxM1+G4y4A4pj+vSSilvlllNLECbtyI
 zV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=RZXcvFVtKnSyjR8EyoRXxKXN7pVJ3ip9wzTDrxsshiY=;
 b=qg1aD7xVVJtbCjHFf+l+kgTFHRHLs0JnHUJ2eZJEqQZeKqX94/vD9fwEgzgk4q61i0
 rxLoITtzSLRHllIU9yDt+Ipz4aft+heHqZZVk3NOq7rx5/MNZvYMziwnKpCjTNWlyM97
 dwp0psJ18FnsC1fJ2oe1eJWyba4Z/c9h0NjjVGSYGuFovp/TZQaHlBA+6Y2stl32638N
 eB4ZGC/VoQgkbEXmiqWN9M0/PWKODTBeiOkUiGv8iDFZIVvEZnaNGfX/G2O7jKZjPh7s
 OGxuiiVeQIPYbAhaSIQQgvPqYXJvTOzKjQofcK5fRQvXrfA+cHEAdftEvFaLXGNFWDns
 so0A==
X-Gm-Message-State: APf1xPDzWQLvY+331qc8Hll0oGNtUN2bPLZqH7Ykh8RKZo46yfigxjbO
 LLnOTQT5Iu/644Zy48twezqO6yUTWUfty1Ai70w=
X-Google-Smtp-Source: AH8x224Qby1OWI7Tro4fSCKSKXrf9nNSwAE7S69MkUtsvxZhvrduAJRNNbRaYcpsWee+mp4l+upIkJmxSIYHZOMumzc=
X-Received: by 10.36.163.72 with SMTP id p69mr2892795ite.65.1517919854745;
 Tue, 06 Feb 2018 04:24:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.7.10 with HTTP; Tue, 6 Feb 2018 04:24:14 -0800 (PST)
In-Reply-To: <CAKKbWA7_thZ=YpJ6GFhQrQrdzDU4Oo+eCNQ3wUUe+YT1rvTGAQ@mail.gmail.com>
References: <20180202042709.21627-1-joel@jms.id.au>
 <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
 <CACPK8Xc+b=Hfs01TKpZtRd6K+HKb-Qc0X9WNfr+L-tZZtXkDqg@mail.gmail.com>
 <CAKKbWA7_thZ=YpJ6GFhQrQrdzDU4Oo+eCNQ3wUUe+YT1rvTGAQ@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 6 Feb 2018 14:24:14 +0200
Message-ID: <CAP6Zq1g3EhECHC0fbDYaWnTJK6jbRPep7yqg3mBaOcJr-dbQ3g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
To: Avi Fishman <avifishman70@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 06 Feb 2018 12:24:19 -0000

On 6 February 2018 at 12:37, Avi Fishman <avifishman70@gmail.com> wrote:
> On Tue, Feb 6, 2018 at 7:50 AM, Joel Stanley <joel@jms.id.au> wrote:
>> On Mon, Feb 5, 2018 at 7:39 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>> On 2 February 2018 at 06:27, Joel Stanley <joel@jms.id.au> wrote:
>>
>>>>  /* Uart divisor latch read */
>>>> @@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
>>>>                                 UART_DA830_PWREMU_MGMT_FREE);
>>>>         }
>>>>
>>>> +       if (port->type == PORT_NPCM) {
>>>> +               /*
>>>> +                * Nuvoton calls the scratch register 'UART_TOR' (timeout
>>>> +                * register). Enable it, and set TIOC (timeout interrupt
>>>> +                * comparator) to be 0x20 for correct operation.
>>>> +                */
>>>> +               serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
>>>> +       }
>>>
>>> Can we set the TOR register dynamically (adding special IOCTL)?
>>
>> We would have to have a good reason to do so.
>>
>> Under what circumstances would a user need to change this dynamically?
>
> Tomer, I agree it is not important to change at run time.
I agree Avi,
but the only problem I see with it that if we will need in the future
to TOR register dynamically (new SOC, client demand, etc.)
Could it be done in the 8250 files?
>
>>
>>>
>>>> +
>>>>  #ifdef CONFIG_SERIAL_8250_RSA
>>>>         /*
>>>>          * If this is an RSA port, see if we can kick it up to the
>>>> @@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
>>>>         return quot_16 >> 4;
>>>>  }
>>>>
>>>> +/* Nuvoton NPCM UARTs have a custom divisor calculation */
>>>> +static unsigned int npcm_get_divisor(struct uart_8250_port *up,
>>>> +               unsigned int baud)
>>>> +{
>>>> +       struct uart_port *port = &up->port;
>>>> +
>>>> +       return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
>>>> +}
>>
>> Did you test this version of the driver on your hardware?
Yes Thanks!!! it working fine.
>>
>> I think I understand why you had the extra code, but does it affect
>> operation in any of your tests?
>>
>> From what I understand the baud rates are often calculated to be "near enough".
>
> Joel, I made the original calculation but I agree that this one is
> good enough (I confused Tomer to think that your calculation will not
> fit :)
>
I see you add the TOR to include/uapi/linux/serial_reg.h will the
maintainer accept it?

>>
>> Cheers,
>>
>> Joel

Cheers,

Tomer
