Return-Path: <tcminyard@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::241; helo=mail-oi0-x241.google.com;
 envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nlM5PyAv"; 
 dkim-atps=neutral
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnYcQ4ppvzDrTh
 for <openbmc@lists.ozlabs.org>; Thu,  7 Sep 2017 05:31:50 +1000 (AEST)
Received: by mail-oi0-x241.google.com with SMTP id g15so5332193oib.3
 for <openbmc@lists.ozlabs.org>; Wed, 06 Sep 2017 12:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:reply-to:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XlL2O8BOZkZ82Ob6RLiNm7zn7PRhnOXofJumeqOt8Ys=;
 b=nlM5PyAvIAUcS1OOVr3wdFB6AJ5k+bViGyHKiPfUqnMelE6PYPpLrkFtEaMQWYkDVF
 9A3SRg2qbkShI6C2ZFYXCmXL7yUttnezjjX6yiWTxnRui95nmVoM6SELI0Gl59qTRTgf
 s7uaq4vYaOXesE+IWjlrNOMGrZtGyXx+YlHJdFDQxwqBVDAUoXC9WP3Z1TGB68+YoMXP
 Nh1k62OW4eQEVyzZ5jWWYO3KiPm+0sM9B0cEHldg+WsD7iFLow1L5SsNwuJjA6UsUTI9
 oVzIyd8hAsr3BMQJYvD41hRobvttrvQRDZmEm94mdpYTKOBw4xEi6qDdCCSkLpjQu55Q
 twQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XlL2O8BOZkZ82Ob6RLiNm7zn7PRhnOXofJumeqOt8Ys=;
 b=llMRW35HV5x2E9WF+3n+3Wz61WkYYgADEwjCUURsLoQ90eXEwJS7wP79RKaBDzrj8g
 PxTmOZg2q/lAEobgs2xrgVuTqlFJta6kohe3Adt6X3LeFWksFniIkjLn0qq9/uxWXZ1L
 q03/rQyuliQ9r0oANIYPZaTd7A3itkV608LTxlmoxNlRFGv2gLQd0a54Kz/KThSombh6
 bSAmQRvo70Mi0GgW7eUnNr4m9D9PoAbecCLUPlBlj2XouoYDF/J8WBt46g5/3uHcwrEq
 jeaX7MgEk/YMlffRT7nKzWNiI/bDqMzmRvT/AFxIGRFyRB+24TvIisle4ezz6Dcu0EhK
 j5cQ==
X-Gm-Message-State: AHPjjUhYDtFlYt8XvqlcWRQLSfS8fbbKSwa60hk++f3TxUD8MzCYB2b3
 KwycPIsE63CNAg==
X-Google-Smtp-Source: ADKCNb70t11zNQYnSvWtyhyibTUPDSUU73/8E1+Mn0BZ1Ye3uCQaUiqwlPVwhwxIXzL5dpy9S0tM0Q==
X-Received: by 10.202.166.18 with SMTP id p18mr281232oie.89.1504726308427;
 Wed, 06 Sep 2017 12:31:48 -0700 (PDT)
Received: from serve.minyard.net ([47.184.154.34])
 by smtp.gmail.com with ESMTPSA id v75sm683531oia.1.2017.09.06.12.31.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Sep 2017 12:31:47 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
 by serve.minyard.net (Postfix) with ESMTPSA id E5F33216;
 Wed,  6 Sep 2017 14:31:45 -0500 (CDT)
Reply-To: minyard@acm.org
Subject: Re: [RFC v1 1/4] ipmi_bmc: framework for BT IPMI on BMCs
To: Brendan Higgins <brendanhiggins@google.com>
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 openipmi-developer@lists.sourceforge.net,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20170808035301.1980-1-brendanhiggins@google.com>
 <20170808035301.1980-2-brendanhiggins@google.com>
 <88dceea3-a554-b3b9-9d9e-7ddacc9136a5@acm.org>
 <CAFd5g44QFPGV+P_RCMreM4GWarOYJ8+iLREALFwiJ3JtiLvYyQ@mail.gmail.com>
 <beae3088-ce1b-3d57-0d6e-3728397ee8a5@acm.org>
 <CAFd5g45sOLV21g+30-1AK0734gct8AP0vG=1SVC1PpbT2xSK4A@mail.gmail.com>
 <f44a84de-60de-9917-ec84-12b26215a834@acm.org>
 <CAFd5g45LQz41E4feZt0U9Og5QeG_9yQXmBQQxw0wdrBoa=A0zw@mail.gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <8c0f8772-816e-ca2e-ed91-736c3c9901ec@acm.org>
Date: Wed, 6 Sep 2017 14:31:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFd5g45LQz41E4feZt0U9Og5QeG_9yQXmBQQxw0wdrBoa=A0zw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
X-List-Received-Date: Wed, 06 Sep 2017 19:31:51 -0000

On 09/06/2017 04:56 AM, Brendan Higgins wrote:
> On Thu, Aug 24, 2017 at 6:01 AM, Corey Minyard <minyard@acm.org> wrote:
>>
>> If you just need the ability to catch a few commands in the kernel, what you
>> have is fairly complicated.  I think a simple notifier called from every
>> driver
>> would provide what you needed with just a few lines of code.
> What do you mean by a simple notifier called from every driver? I think what
> I have here is pretty simple. I think regardless of how we do routing, having
> a common framework for low level IPMI hardware interfaces to implement
> is pretty useful, even if it is only used to make a common dev file interface.
>

I'm talking about maybe 10 lines of code to do this.  The device 
interface would
call  xxx_notifier_call_chain() for each message, and depending on the
return value it would send the message up or drop it.  Every piece of 
code that
cared about IPMI host messages would call 
xxx_notifier_chain_register/unregister.
That would be it.

>> As far as moving all the message routing to the kernel, my (fairly
>> uneducated)
>> opinion would be that it's a bad idea.  It's a lot of complexity to put in
>> there.
>> I can see some advantages to putting it there: it's simpler to interact with
>> than
>> a userspace daemon and it gives consistent access to kernel and userspace
>> users.  But I don't know your whole design.
> How about we focus on getting a common framework for the hardware
> interfaces to implement? This way at least all of the hardware interfaces
> are exposed the same way (similar to what you did on the host side). We
> then at least have something to build on.

The device interface you have in patch 2 provides that, and I think 
that's a good
thing.  Most other drivers like this have something similar.

What you have for the message routing seems like massive overkill for 
catching
a few messages in the kernel.  It's really more at the level that you 
have lots of
users in and out of kernel and you need to handle routing of all these 
messages.

The IPMI client side message handler is there for two reasons:  You have 
to be able
to route messages down and back up to all the users, and those users may be
sending the same commands.  And you need some way to allow multiple users
to send on the IPMB and return the responses to those users.  And then 
there's
that LAN routing thing.  It's a lot more complexity than I like, and it 
occasionally
causes me problems.  I would have preferred to have something simpler.

-corey
