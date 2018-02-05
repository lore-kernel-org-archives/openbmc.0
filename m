Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+Y5rP0+"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zZhZP2PcnzF0sb
 for <openbmc@lists.ozlabs.org>; Mon,  5 Feb 2018 20:07:56 +1100 (AEDT)
Received: by mail-it0-x244.google.com with SMTP id x128so15874355ite.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Feb 2018 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gYJOPaJLS3CewRgEcC3Fgbk6LgoPq7mcMqdEWWSyFQk=;
 b=i+Y5rP0+D5IkAwYbU1p6W/39STo7vUhOFg6II31fZIfirndOJQNEgQYfCAIdRbL2Ls
 WgkrBrGpCF41ExODePJjt67D3mjxKJVDW+dpq0fqaxPMfJpc1OrtzJCk6MahDTZENJxJ
 ry6KVNS0IK+hyAvgAnHbC1Rd4IYt7rNkkmLThc9gCVxQ1rAtTwhdDEQDrWg//akOtZj2
 M34tfEKJ6SMV2y7BJ1tHzaizn/ed6uP48ROTFWFoF/bEajro/6K8EgGs+Bw2fH+RSyXe
 LTIl3yvI5vLZJtQnqp3LarfY+gLGj8XRcyMWjF1VYHQROUJyphClDCyxCWExDuQ5t8tz
 9CIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gYJOPaJLS3CewRgEcC3Fgbk6LgoPq7mcMqdEWWSyFQk=;
 b=rCeNm6IenGeIp75jjhcCyAH4IdQlQjRjgGWLB6I3edw8dJajOjMyZdmfyNUmrxSasf
 Qa7bBKlLSc5Ewq12XZ7Yncq/sU12CEMAp/UxEa+Ly0V5EmJ7sUTplCFH9gMXX6xWl0op
 Tut86GioVkJ54Z82QdV5b7jEFQ1B9RruJBAKBQQO7B4P4OtCg6vCiKiMBJ6tNzpWdT+6
 Nx+oKvEYZMFsM404E7qyvfW/ZZUEhFl5hXhUa3THYtRHibDegEkU863pIeAezckVBp7n
 byACeIP3JTP4bQtUdGl+uaTWkVpi07he3sMzgeRvl9juYPexL0GmJ5CLSqr4RLgVQfdm
 2w/A==
X-Gm-Message-State: AKwxyteo0NUQ3ymgERZEzxNlgooVxrTBeaQ8TTHZ+67ktbgh3+tG8lnW
 lAny2C4cGGQZ5oalsoG1miimOFdLhqw4w/taH86cjg==
X-Google-Smtp-Source: AH8x225iXssNE+uOKXf/4EA7uF+LeKmCj1NyyPRM2VrrBKQ+SRA8tNcLr8qcvAk8q2eN1A2l+donilO9XDaiWb5Bw9g=
X-Received: by 10.36.39.147 with SMTP id g141mr21889572ita.33.1517821674859;
 Mon, 05 Feb 2018 01:07:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.7.10 with HTTP; Mon, 5 Feb 2018 01:07:54 -0800 (PST)
In-Reply-To: <CAP6Zq1gMb5VjLpFBCWoiYkRjSKdpqa9mZMiU5qUadBtaUvPicw@mail.gmail.com>
References: <1516720600-2040-1-git-send-email-tmaimon77@gmail.com>
 <1516720600-2040-3-git-send-email-tmaimon77@gmail.com>
 <CACPK8XcznGkfjhhi3TB+pYYH_EsT0ehJdF944=iVfG-ROQnWcw@mail.gmail.com>
 <CAP6Zq1goE=rvxq+OG0ZbWwpFRDhfkscCDZkU7AUecTM5LJrvKA@mail.gmail.com>
 <CACPK8XeSFHhMsjkdXc_AuRL_Q4yVSfpn8+WBe405yBu39nMcfQ@mail.gmail.com>
 <CAP6Zq1gMb5VjLpFBCWoiYkRjSKdpqa9mZMiU5qUadBtaUvPicw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 5 Feb 2018 11:07:54 +0200
Message-ID: <CAP6Zq1gdcM=4SmfZEScr8WcZu7_GJJAn857QjrJhywVFcKVPOw@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Feb 2018 09:07:58 -0000

Forget to add CC. Jeremy Kerr <jk@ozlabs.org>,
OpenBMC Maillist <openbmc@lists.ozlabs.org>

On 5 February 2018 at 11:05, Tomer Maimon <tmaimon77@gmail.com> wrote:
> On 5 February 2018 at 08:19, Joel Stanley <joel@jms.id.au> wrote:
>> On Mon, Feb 5, 2018 at 6:24 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>> On 2 February 2018 at 04:51, Joel Stanley <joel@jms.id.au> wrote:
>>>> On Wed, Jan 24, 2018 at 1:46 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>>>>> Add Nuvoton BMC NPCM UART driver.
>>>>>
>>>>> The NPCM7xx BMC contains four UART blocks and accessory logic.
>>>>>
>>>>> NPCM UART based on 8250 driver.
>>>>
>>>> Nice! Much less code to review and maintain than before :)
>>>>
>>>> I did some more digging, to see if we could add even less code. I'll
>>>> sent a patch to the list, but I need to clarify the divisor
>>>> calculation first.
>>>>
>>> Thanks!
>>>>> +static int npcm_uart_set_baud_rate(struct uart_port *port,
>>>>> +                                     NPCM_UART_BAUDRATE_T baudrate)
>>>>> +{
>>>>> +       struct uart_8250_port *up = up_to_u8250p(port);
>>>>> +       int divisor     = 0;
>>>>> +       int ret         = 0;
>>>>> +       unsigned long flags;
>>>>> +
>>>>> +       divisor = ((int)port->uartclk / ((int)baudrate * 16)) - 2;
>>>>
>>>> The 8250 core uses this calculation:
>>>>
>>>>  divisor = port->uartclk / (baudrate * 16).
>>>>
>>>> Checking the datasheet, this is the calculation that is documented for Poleg:
>>>>
>>>>  divisor = port->uartclk / (baudrate * 16 + 2).
>>>>
>>>> If I change the calculation to this, the UART doesn't work (due to the
>>>> precision of the integer division, there's no change from the 8250
>>>> core code). If I subtract 2 from the number, as you do in your patch,
>>>> it works!
>>>>
>>>> Can you explain what is happening here?
>>
>> Hi Tomer, you missed this question. Can you explain to me what is
>> happening here?
>>
>
> Opps sorry!
>
> I think you have little mistake...
>
> From the data sheet calculation:
>
> baudrate =  port->uartclk / (16* (divisor + 2))
>
> So if we isolate the divisor
>
> divisor = (port->uartclk / (16* baudrate)) - 2
>
> this is why if you subtract 2 from the divisor you get the right divisor.
>
>>>>
>>>>> +
>>>>> +       /* since divisor is rounded down check
>>>>> +        * if it is better when rounded up
>>>>> +        */
>>>>> +       if (((int)port->uartclk / (16 * (divisor + 2)) - (int)baudrate) >
>>>>> +               ((int)baudrate -
>>>>> +                (int)port->uartclk / (16 * ((divisor + 1) + 2))))
>>>>> +               divisor++;
>>>>
>>>> This bit confused me when I tried to understand what it was checking.
>>>> I couldn't find a mention of it in the datasheet either.
>>>>
>>>> Can you explain to me what it is trying to do? Do we need it?
>>> hope i will explain it right...
>>>
>>> we are calculating the nearest round up of the divisor according to
>>> the distance from the real divisor (with point) to the value we get
>>> from the round up and round down. (and it different from using
>>> DIV_ROUND_CLOSEST)
>>> for example:
>>>
>>> If the baud rate is 230,400
>>>
>>> the divisor is 4.510 (it means round up)
>>>
>>> if we doing the calculation above:
>>>
>>> (24Mhz/(16*(4+2))) - 230,400 = 19,600
>>> 230,400 - (24Mhz/(16*(4+3))) = 16,114
>>>
>>> also in here we see round - up, but the distance from the second
>>> (16,114) it better and the 4.510 not represent it correctly because 2
>>> result we get are not that the same.
>>>
>>> so maybe in clock rate of 24Mhz it will be fine but if we will modify
>>> the clock rate the calculation could be wrong with a use of
>>> DIV_ROUND_CLOSEST.
>>>
>>> so we think it is better to use the calculation above and not round up.
>>>
>>> Is it problematic to use it in the modify driver you sent?
>>
>> Thanks for the explanation. As I mention above, I need to understand
>> the first calculation in order to understand this part.
>>
>> It would be easy enough to add this calculation if it was strictly
>> necessary. However, to know if it is required, I first need to
>> understand what is happening.
>>
>> Cheers,
>>
>> Joel
>
> Cheers,
>
> Tomer
