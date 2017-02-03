Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vDzZZ6pYnzDqBY
 for <openbmc@lists.ozlabs.org>; Fri,  3 Feb 2017 12:20:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1nqhD+B"; 
 dkim-atps=neutral
Received: by mail-ot0-x244.google.com with SMTP id 65so609611otq.2
 for <openbmc@lists.ozlabs.org>; Thu, 02 Feb 2017 17:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=DOMM+0rokKFQikV/YiTpyWOA/FXtwEDr5pZl3Uqqv+g=;
 b=X1nqhD+B7OS45CQOEoSO/QgWQNJRACTKwd0L5nTULQdQRZUcWFPcV1jYwWWCuvRADs
 nDUcJftIUo94YwxoCrob16Z+2Ivre8o9wcN+/w1Pc6TTqkIG+Q+b9UYvlZR8tYsCZCSg
 r1igjFhQFQDYvoog5dLvZdYn3ckTQYbUBmuJKrCuf7Nid8sACWvwB4JQyyoL+3sZgNhy
 SM/U1/nzhUJqeum8kHScoi0KTSucHqgS2w0W8W5224XcCrbU3DrYnWg8bizj1U9txN7J
 XVhP5gh09+2/ElGthsHyvsvydk0M7J/ShVjzL50ugbs8J9qez21zZrYzMJEQJclfIFNz
 xFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=DOMM+0rokKFQikV/YiTpyWOA/FXtwEDr5pZl3Uqqv+g=;
 b=c+uFdadn31LJqdmIx2QhkPqb9FGK030v/txFeB/UkUmmv5rJEQPx4RUV4+d3B9Dl6K
 pSkkbSfrc049sOVRPC1FCDEhKkR3JsLg2aRhbD4kQlOhsvZVfQ8Mv746R1nx3wA0SOYb
 R06OazRmEYt3Qsd0h2kqxNfa/1ELvCpxE+1pK3yNuczWUFsHCJqNk3X7bv5cwh2hTA1R
 B5DanOdug/cQvushKBacBx7Nt77Cz42fRs+41nHq6DsxgtRoOPZHPMV6j3H5Xii5TBvX
 3hxptY4gQ2Ujo6McQRsREvtbeiAt6vxCFBu9O/kIJh8jyiGo/yD8d06mcXOt2r4b2rAM
 84QQ==
X-Gm-Message-State: AIkVDXJr7RDkilQM/yc+b+jyKmtOmmXuZOTIHHg15JldkLfScwZCQQoOI17iDd0b9xqnP40F5G8dW3BiVo/s4A==
X-Received: by 10.157.10.202 with SMTP id 68mr5217517otq.51.1486084837001;
 Thu, 02 Feb 2017 17:20:37 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Thu, 2 Feb 2017 17:20:16 -0800 (PST)
In-Reply-To: <1486084522.7271.1.camel@aj.id.au>
References: <20170201011230.141303-1-xow@google.com>
 <1486084522.7271.1.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 3 Feb 2017 11:50:16 +1030
X-Google-Sender-Auth: YhIwAyppf84_Ef16AUJG0OWO6ag
Message-ID: <CACPK8XfdPBDRGJLBmsgCzfWNe7PPRnp6ChuiA1Jw87P6j3cUpA@mail.gmail.com>
Subject: Re: [PATCH linux v3] arm: aspeed: zaius: Disable LPC reset for UART1
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Xo Wang <xow@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 03 Feb 2017 01:20:39 -0000

On Fri, Feb 3, 2017 at 11:45 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2017-01-31 at 17:12 -0800, Xo Wang wrote:
>> Currently, UART1 on Zaius BMC is unusable until brought out of reset by
>> powering the host on. In that default reset state, ttyS0 can still be
>> opened and UART1 silently drops bytes, which is not obviously expected
>> behavior.
>>
>> Clear the LPC block control bit that enables LPCRST# as a reset source
>> for UART1, making UART1 immediately useful in that it won't discard
>> bytes.
>>
>> > Signed-off-by: Xo Wang <xow@google.com>
>> ---
>>  arch/arm/mach-aspeed/aspeed.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
>> index 4bd3680d742d..b7022eaa7b5d 100644
>> --- a/arch/arm/mach-aspeed/aspeed.c
>> +++ b/arch/arm/mach-aspeed/aspeed.c
>> @@ -185,6 +185,14 @@ static void __init do_zaius_setup(void)
>>
>> >     /* Set SPI1 CE0 decoding window to 0x30000000 */
>> >     writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>> +
>> > +   /* Disable default behavior of UART1 being held in reset by LPCRST#.
>> > +    * By releasing UART1 from being controlled by LPC reset, it becomes
>> > +    * immediately available regardless of the host being up.
>> +      * */
>
> Joel: Want to clean up the formatting here when you apply it? If so:
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks. I fixed the formatting of the comment when I applied. This is
in dev-4.7 now.

Cheers,

Joel
