Return-Path: <xow@google.com>
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v9FHc1CYlzDq60
 for <openbmc@lists.ozlabs.org>; Sat, 28 Jan 2017 10:24:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="U8QodaVw"; 
 dkim-atps=neutral
Received: by mail-qt0-x22f.google.com with SMTP id v23so160485739qtb.0
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 15:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UX+J7mc1SPu3EuvMno9n3ZUzwjOeX5Ikn+8gAuej0so=;
 b=U8QodaVwLKKfAzIU/C7OzJ9HSFs1w7PpiEyxvGLL40116uc2bxjUOlZkNXiXF1TAv5
 SeiAx397XQ+wXlLsdJaETej+kOv9njCxkBjrCvhl3/bSJoI5bEisGc6yyD1iQDG1I4ih
 zBHEjcYJfeqq8atcPXAY9Pp2jfv0vNkt2JTu/P/ViqlgXTwKEojHQ/d2HqU59Rma3fgO
 6JjiPPvNAhX3wyw+lIXu9NZrhcmWAarQXDmzA/Gg2+ZGwjrWF+2mH+nxzDHaBnrKdgvn
 19r7wURQik2zwjJchi0A7SQ+iwF5OdgsEL6dk+xJpEo5mdHXLoa0yYsGG2jDHX0JGxxC
 lKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UX+J7mc1SPu3EuvMno9n3ZUzwjOeX5Ikn+8gAuej0so=;
 b=oNDqe4rFy9NfrYCn/4AYseeC+jr5TTRX2R8lZ4ZtVSP9hCuWrOycxbyDc65g3CmoxG
 QQ6dFJEDggJ0ro4csSIXo4C+Yrm4kL4asP2YIxc2/XI52NqXaifxhJQW7rZ70VFXUWH0
 V/H2iwfLXgCSczviX7HTX8WWK9xBU86wyP7lQ7RUoLUs51k1+OoIZgKrHnttvi8NH1+b
 eDnWZz8iY99zIyR+zaqdml4aSIx+uua8SfIvuyT6TDPjVbqrXyXCPWmxFOdQvJ1oeDIl
 F9cx81z0teUdWKiqrB47iLWSben9oWVksWtrFJF2YxtzZxh+/aLcRHpUo4RZzT3Sgc/s
 93OA==
X-Gm-Message-State: AIkVDXL0spvdnAyxiP8Hq5obesEZJBcUasXYwfRV7tFIi4E8h2SIW5ZJoAfIRXQmayd4Rha4d5LrgZx16nmkvzpd
X-Received: by 10.237.60.49 with SMTP id t46mr10995599qte.140.1485559481268;
 Fri, 27 Jan 2017 15:24:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Fri, 27 Jan 2017 15:24:40 -0800 (PST)
In-Reply-To: <CAPLgG==T01hpZd8pn7YyK2cEx-FBqHXGKK8LR07B2Jfq00retA@mail.gmail.com>
References: <20170127170814.120771-1-xow@google.com>
 <CAPLgG==T01hpZd8pn7YyK2cEx-FBqHXGKK8LR07B2Jfq00retA@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Fri, 27 Jan 2017 15:24:40 -0800
Message-ID: <CAPH-5w5vKk+yfC7TFwpawGtGmF7FVuuC7qaP-QPS8Z=V03wQTg@mail.gmail.com>
Subject: Re: [PATCH linux] arm: aspeed: zaius: Disable LPC reset for UART1
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 27 Jan 2017 23:24:44 -0000

Heh, that's fair. I guess the code is an opaque block of bit twiddling.

Please take a look at v2.

On Fri, Jan 27, 2017 at 9:41 AM, Rick Altherr <raltherr@google.com> wrote:
> From the patch, I can't tell what your change is doing.  You've described
> the problem but not the solution.
>
> On Fri, Jan 27, 2017 at 9:08 AM, Xo Wang <xow@google.com> wrote:
>>
>> Currently, UART1 on Zaius BMC is unusable until brought out of reset by
>> powering the host on. In this reset state, ttyS0 can still be opened
>> and UART1 silently drops bytes, which is not obviously expected
>> behavior.
>>
>> Signed-off-by: Xo Wang <xow@google.com
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 4bd3680d742d..9f06191f1630 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -185,6 +185,10 @@ static void __init do_zaius_setup(void)
>>
>>         /* Set SPI1 CE0 decoding window to 0x30000000 */
>>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>> +
>> +       /* Disable LPC reset for UART1 */
>> +       reg = readl(AST_IO(AST_BASE_LPC | 0x98));
>> +       writel(reg & ~BIT(4), AST_IO(AST_BASE_LPC | 0x98));
>>  }
>>
>>  static void __init do_witherspoon_setup(void)
>> --
>> 2.11.0.483.g087da7b7c-goog
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>
>
