Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ivWSEQL9"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbkn7588GzF11s
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 12:50:51 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id z10so4971357qti.5
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 17:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EtA1no21qrNo4V2t2xSihQsSLcPYM5Q0tC7NVY/ZhUw=;
 b=ivWSEQL9X1Os7I/d9z+CvKIE0MhpXfaKHzEJLFEOS0jyQTnvf0UFlVBwLwZhwTcpaJ
 V/JfPHZTK1Xow2KJAlXHyUtw1PYRg4UsPPtICgSanbCHLrXqXFoAOUL9Q6GLQJvbbFEI
 mtPTBItv5FVxsz+J/qTwYIXQkVeSPEVXHZguRw42tphMrsfZd0uZ0NAG/68zn8zPJ6GS
 CvM4/O+bHgUa5tHssB863tDCKmUcFIaUGleyDkRTsZvT5YIKYEEGPdvPwfoKgKsu0s/T
 93fM5tSx3qnFEfFeiaxENBpwuu3mb8R1fmkQ0hoEcwSQ5hDodRIHl+AFrSlYMMnyyAgF
 p8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EtA1no21qrNo4V2t2xSihQsSLcPYM5Q0tC7NVY/ZhUw=;
 b=jjQXt8FED/qWZNSEo7YOOYhZyNn1nlnj1OaSUYwqlQcOUqpE7jluHqDpcXMAegka5i
 vXlOB8bItCU+q+geMShgt6oSipV+TEZ1jiHHMStAvI8fiAp0IG8yzCvegnFGGTkdp6jn
 ExfHdbFpUmDS5T/0s1dBpuiwG/FixboWfg8XQZdRqRO7fKkDYLNqBzGL2vlSeflTKkRE
 dLaaXkh9/BQ9H9t4nSmSaO6BJVglnQMeIaRdS/AoThhtwqsXspYwQW7B1LlSn4ePQ6BB
 0MnBzgseLms5mT3xweYxsn9+1klTvCYrVq9+ggMFMEby+Lf+OzD/vm6czf7KaBxCRxMZ
 ZkHg==
X-Gm-Message-State: APf1xPCmru9QEH+hLaV/+8kiadRBD3IdtHvdT5i+08j8g4kSmeaWjti6
 5ZxPtLlARLPNA12+IzyZehjdlStkQp66sYupiOA=
X-Google-Smtp-Source: AH8x225suwGDhPmxTzKerEWsrhEIbn2vA8+jYRvceCoa8FZw4/X7xE14N9IB9Tt5af8nxglmNc7opotMFTWQf4SNIWk=
X-Received: by 10.237.38.37 with SMTP id z34mr7367296qtc.178.1517968248284;
 Tue, 06 Feb 2018 17:50:48 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.179 with HTTP; Tue, 6 Feb 2018 17:50:27 -0800 (PST)
In-Reply-To: <CAP6Zq1g3EhECHC0fbDYaWnTJK6jbRPep7yqg3mBaOcJr-dbQ3g@mail.gmail.com>
References: <20180202042709.21627-1-joel@jms.id.au>
 <CAP6Zq1iQhRu7OkVbuQJJjk55zYSrvX2j-wmnSc296e7z_VFejw@mail.gmail.com>
 <CACPK8Xc+b=Hfs01TKpZtRd6K+HKb-Qc0X9WNfr+L-tZZtXkDqg@mail.gmail.com>
 <CAKKbWA7_thZ=YpJ6GFhQrQrdzDU4Oo+eCNQ3wUUe+YT1rvTGAQ@mail.gmail.com>
 <CAP6Zq1g3EhECHC0fbDYaWnTJK6jbRPep7yqg3mBaOcJr-dbQ3g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Feb 2018 12:20:27 +1030
X-Google-Sender-Auth: q0290o3X_cxJLnA7-Sy3Pn3Xaxw
Message-ID: <CACPK8XdxGzemcwCpbzx8jbGm5072E5eaHeqc584f7qeAb6QRTg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13] serial: 8250: Add Nuvoton NPCM UART
To: Tomer Maimon <tmaimon77@gmail.com>
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
X-List-Received-Date: Wed, 07 Feb 2018 01:50:52 -0000

On Tue, Feb 6, 2018 at 10:54 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> On 6 February 2018 at 12:37, Avi Fishman <avifishman70@gmail.com> wrote:
>> On Tue, Feb 6, 2018 at 7:50 AM, Joel Stanley <joel@jms.id.au> wrote:
>>> On Mon, Feb 5, 2018 at 7:39 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>> On 2 February 2018 at 06:27, Joel Stanley <joel@jms.id.au> wrote:
>>>
>>>>>  /* Uart divisor latch read */
>>>>> @@ -2143,6 +2153,15 @@ int serial8250_do_startup(struct uart_port *port)
>>>>>                                 UART_DA830_PWREMU_MGMT_FREE);
>>>>>         }
>>>>>
>>>>> +       if (port->type == PORT_NPCM) {
>>>>> +               /*
>>>>> +                * Nuvoton calls the scratch register 'UART_TOR' (timeout
>>>>> +                * register). Enable it, and set TIOC (timeout interrupt
>>>>> +                * comparator) to be 0x20 for correct operation.
>>>>> +                */
>>>>> +               serial_port_out(port, UART_NPCM_TOR, UART_NPCM_TOIE | 0x20);
>>>>> +       }
>>>>
>>>> Can we set the TOR register dynamically (adding special IOCTL)?
>>>
>>> We would have to have a good reason to do so.
>>>
>>> Under what circumstances would a user need to change this dynamically?
>>
>> Tomer, I agree it is not important to change at run time.
> I agree Avi,
> but the only problem I see with it that if we will need in the future
> to TOR register dynamically (new SOC, client demand, etc.)
> Could it be done in the 8250 files?

If we have a requirement in the future I suggest we decide how to
solve that problem then. Cross that bridge when we come to it.


>>
>>>
>>>>
>>>>> +
>>>>>  #ifdef CONFIG_SERIAL_8250_RSA
>>>>>         /*
>>>>>          * If this is an RSA port, see if we can kick it up to the
>>>>> @@ -2465,6 +2484,15 @@ static unsigned int xr17v35x_get_divisor(struct uart_8250_port *up,
>>>>>         return quot_16 >> 4;
>>>>>  }
>>>>>
>>>>> +/* Nuvoton NPCM UARTs have a custom divisor calculation */
>>>>> +static unsigned int npcm_get_divisor(struct uart_8250_port *up,
>>>>> +               unsigned int baud)
>>>>> +{
>>>>> +       struct uart_port *port = &up->port;
>>>>> +
>>>>> +       return DIV_ROUND_CLOSEST(port->uartclk, 16 * baud + 2) - 2;
>>>>> +}
>>>
>>> Did you test this version of the driver on your hardware?
> Yes Thanks!!! it working fine.

Great!

>>>
>>> I think I understand why you had the extra code, but does it affect
>>> operation in any of your tests?
>>>
>>> From what I understand the baud rates are often calculated to be "near enough".
>>
>> Joel, I made the original calculation but I agree that this one is
>> good enough (I confused Tomer to think that your calculation will not
>> fit :)
>>
> I see you add the TOR to include/uapi/linux/serial_reg.h will the
> maintainer accept it?

It's in a private include, include/uapi/linux/serial_reg.h.

Initially I didn't do this, but if you examine the end of that file
there are a number of other 8250 ports that do this.

If you would like, I will send this patch upstream now.

Cheers,

Joel
