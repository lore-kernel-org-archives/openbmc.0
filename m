Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ckn+t7tr"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbtKH4kLBzF0yb
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 18:30:43 +1100 (AEDT)
Received: by mail-it0-x242.google.com with SMTP id k131so1096811ith.4
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 23:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=I/i/9oKFE0Fv5wOY95TtI4diwVeMUNZw7gy+kKepE2E=;
 b=ckn+t7trko+idBAU4rWn+XK86F437PCrluWOCHJYE9DyJwctPPOBWQ2xBiCSiUDFM3
 ja+9xgUnPxbtTMwlMiKjrhj1DBYjw2JYz67fUQzWRkhDQ1m/bk33IBhAc/S5rbicUfGR
 Y8uDDoIwRP/NNpFFzbHfURPsbP7MsIOHUXAXEp2okk8DgSiGEw2q0UzLniwt5DHTBE3W
 PAfk6UdcuEEbamb73I0wfSq4cLhsVv5a3S8tfOmU3lCv3SSCDTmL0/ds0nBFPeu7+Idz
 ZUhF4ZUj3zguWvGjaQXfg3GgKbaJXng34Z1D3xHRMkC4JwNRjqvN9BIVwWE3kohJfkNp
 jbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=I/i/9oKFE0Fv5wOY95TtI4diwVeMUNZw7gy+kKepE2E=;
 b=ksmA4iqWXPPWpzZt0c/fKT/oyP9IIGkEqU3U8zAPqqct+vAdIikng8vFlkaaAij/gw
 aHu8Bua76Ou/0vBQtsxnc0K2FQ509NbMmadMpagJorO45yU25vW0bntFKfzRWv2oMTIG
 M3rVV80q4qVCEERofRlboyQ0G7McahzSxjHdRDVxQK+F8kbVgYYLjwsVUbStem0vyrax
 UEaPnKQvBc8SECCWZh43f6Q+HYB8fD2Vo89pJSCBJvzd+eDzrRpsxPEQk07Xw24bL8v2
 aEQugTHoI8c8Mmomlg+ZszqV7KqH4/yLO6nJdahTI9BkvRyipEl7rybaKBW+sEu49QLE
 eliw==
X-Gm-Message-State: APf1xPBD4/bfRtfYvhvOPT7D4uMGg2Kh6CpyidTC0Qln34yyYC+qsQmY
 M5U/OUf05zmzoRkr2E3AcD9yjprr/JPvLPrr2Ao=
X-Google-Smtp-Source: AH8x2270ZpgQGnXIT3ZO0S4n6gP8wjj4RbsTmotyTKB27h8/T2vPbhH9dPzGpSif9qc6OEh2BwsS4nCXszKOvvXI3Ck=
X-Received: by 10.36.218.196 with SMTP id z187mr6486673itg.122.1517988640849; 
 Tue, 06 Feb 2018 23:30:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.7.10 with HTTP; Tue, 6 Feb 2018 23:30:40 -0800 (PST)
In-Reply-To: <CACPK8XdxGzemcwCpbzx8jbGm5072E5eaHeqc584f7qeAb6QRTg@mail.gmail.com>
References: <20180202042709.21627-1-joel@jms.id.au>
 <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
 <CACPK8Xc+b=Hfs01TKpZtRd6K+HKb-Qc0X9WNfr+L-tZZtXkDqg@mail.gmail.com>
 <CAKKbWA7_thZ=YpJ6GFhQrQrdzDU4Oo+eCNQ3wUUe+YT1rvTGAQ@mail.gmail.com>
 <CAP6Zq1g3EhECHC0fbDYaWnTJK6jbRPep7yqg3mBaOcJr-dbQ3g@mail.gmail.com>
 <CACPK8XdxGzemcwCpbzx8jbGm5072E5eaHeqc584f7qeAb6QRTg@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 7 Feb 2018 09:30:40 +0200
Message-ID: <CAP6Zq1j1Zm5DUHVzcmm3KRxMs3Lf3YiniCRFWKEea__NxRUOpw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
To: Joel Stanley <joel@jms.id.au>
Cc: Avi Fishman <avifishman70@gmail.com>,
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
X-List-Received-Date: Wed, 07 Feb 2018 07:30:44 -0000

On 7 February 2018 at 03:50, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Feb 6, 2018 at 10:54 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> On 6 February 2018 at 12:37, Avi Fishman <avifishman70@gmail.com> wrote:
>>> On Tue, Feb 6, 2018 at 7:50 AM, Joel Stanley <joel@jms.id.au> wrote:
>>>> On Mon, Feb 5, 2018 at 7:39 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>>> On 2 February 2018 at 06:27, Joel Stanley <joel@jms.id.au> wrote:
>>>>
>>>>>>  /* Uart divisor latch read */
>>>>>> @@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
>>>>>>                                 UART_DA830_PWREMU_MGMT_FREE);
>>>>>>         }
>>>>>>
>>>>>> +       if (port->type == PORT_NPCM) {
>>>>>> +               /*
>>>>>> +                * Nuvoton calls the scratch register 'UART_TOR' (timeout
>>>>>> +                * register). Enable it, and set TIOC (timeout interrupt
>>>>>> +                * comparator) to be 0x20 for correct operation.
>>>>>> +                */
>>>>>> +               serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
>>>>>> +       }
>>>>>
>>>>> Can we set the TOR register dynamically (adding special IOCTL)?
>>>>
>>>> We would have to have a good reason to do so.
>>>>
>>>> Under what circumstances would a user need to change this dynamically?
>>>
>>> Tomer, I agree it is not important to change at run time.
>> I agree Avi,
>> but the only problem I see with it that if we will need in the future
>> to TOR register dynamically (new SOC, client demand, etc.)
>> Could it be done in the 8250 files?
>
> If we have a requirement in the future I suggest we decide how to
> solve that problem then. Cross that bridge when we come to it.
Sounds good
>
>
>>>
>>>>
>>>>>
>>>>>> +
>>>>>>  #ifdef CONFIG_SERIAL_8250_RSA
>>>>>>         /*
>>>>>>          * If this is an RSA port, see if we can kick it up to the
>>>>>> @@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
>>>>>>         return quot_16 >> 4;
>>>>>>  }
>>>>>>
>>>>>> +/* Nuvoton NPCM UARTs have a custom divisor calculation */
>>>>>> +static unsigned int npcm_get_divisor(struct uart_8250_port *up,
>>>>>> +               unsigned int baud)
>>>>>> +{
>>>>>> +       struct uart_port *port = &up->port;
>>>>>> +
>>>>>> +       return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
>>>>>> +}
>>>>
>>>> Did you test this version of the driver on your hardware?
>> Yes Thanks!!! it working fine.
>
> Great!
>
>>>>
>>>> I think I understand why you had the extra code, but does it affect
>>>> operation in any of your tests?
>>>>
>>>> From what I understand the baud rates are often calculated to be "near enough".
>>>
>>> Joel, I made the original calculation but I agree that this one is
>>> good enough (I confused Tomer to think that your calculation will not
>>> fit :)
>>>
>> I see you add the TOR to include/uapi/linux/serial_reg.h will the
>> maintainer accept it?
>
> It's in a private include, include/uapi/linux/serial_reg.h.
>
> Initially I didn't do this, but if you examine the end of that file
> there are a number of other 8250 ports that do this.
>
> If you would like, I will send this patch upstream now.
Yes great please do,

Thanks a lot
>
> Cheers,
>
> Joel

Cheers,

Tomer
