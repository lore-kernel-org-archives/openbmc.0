Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sl0385jNfzDrYD
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 13:11:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=bzesmIRU; 
 dkim-atps=neutral
Received: by mail-ua0-x235.google.com with SMTP id n13so54711752uaa.3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 20:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=7LHFLkWt2bdj19uERHSypBc6EOSY/FdKpdjROU2AlhE=;
 b=bzesmIRU6loOvEjQ3R3WtSWjWppFKZGWTzh5GRIouFFMdw4iOVYOtq4wZsKStYao3E
 oWzmceziD29+IP735wa3NuaJzcRVZDIo7hZMvymiHFSG0+0tlgdHUWmn7vDIPaC8dJEg
 pLpUDs+MLpfykz4rtJs13S1S9IXhW/dLKS8Iey/cZi373cCYFNvZDYO/IIVJ6iW2vyVn
 yvDaMljjvjHCRNNQm3nU38FZX3qJQh8KJRI1fv8fKm5MFZFCckmpWJHEa1stQhk8hS32
 Bv71u76rPe+SNHLe0oxWTlMzXmSlzAfk/325StUq8k2T5yhxlWrhjQucFk50tWeUfoVy
 5ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=7LHFLkWt2bdj19uERHSypBc6EOSY/FdKpdjROU2AlhE=;
 b=IrllRA/w0vyyd78MA77cDRwFvonYX2eBk6FlaM32UFcqfkIc43OV2BklBYto53ere0
 Jdbu+m+24IjrNF6iZ+TUKfxKV9mGmSNxlnnmRR1DfM9BrQISVGZZJcyX1wyEGDsuibxd
 FmTCq8K/c809D5wuJLCsg6uoTO1Wt5zDdECZDuESjCTYBnLp6Lt4oQnl7fl5qOppGv0K
 Fy2mg0bRLBb52nWNscjvAHBnIhpRpkupweskhZtKsRuwsm8vPsCk6ZhsqASF5T2FIlDU
 Kv2bEu+Al3wEX8zvU+dgUbMu8EjVaHrUEj1lAta7+EeHn/snVHPlkj9bPTsd6tSIXh8V
 tDZQ==
X-Gm-Message-State: AA6/9RmYO+3ogrIZuaiGN6ANB5HZcTxRsJXkR3fyA/bLOOR/jEzjfaXM+RNoFMK1RqgYZVL1e+I+gx8wMFkN3Q==
X-Received: by 10.176.83.146 with SMTP id k18mr9011594uaa.38.1475118688714;
 Wed, 28 Sep 2016 20:11:28 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 20:11:08 -0700 (PDT)
In-Reply-To: <20160929024227.GA9366@gwshan>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-6-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475041832.9493.11.camel@jms.id.au> <20160928071803.GA10147@gwshan>
 <CACPK8XeWEiLAtUSuf2C8nTopQ9kRti5Oi3L0DDw-B+pLJ4XALg@mail.gmail.com>
 <20160929024227.GA9366@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 12:41:08 +0930
X-Google-Sender-Auth: FS70FIhuIxYaoiDCvEpy-2mh1Zw
Message-ID: <CACPK8XfqA6JCw6NBfH8Cw-W0j5KtU2NdxGD9yWpSRu71MDq4YA@mail.gmail.com>
Subject: Re: [PATCH v4.7 6/7] net/ncsi: Rework the channel monitoring
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 03:11:33 -0000

On Thu, Sep 29, 2016 at 12:12 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
>>>>>
>>>>> -    if (timeout + 1 >= 3) {
>>>>> +            break;
>>>>> +    case NCSI_CHANNEL_MONITOR_WAIT ...
>>>>> NCSI_CHANNEL_MONITOR_WAIT_MAX:
>>>>
>>>>It's not clear why you have the MAX_WAIT state if it's doing the same
>>>>thing as WAIT.
>>>>
>>>
>>> @nc->monitor.state tracks two types of information: (A) the current state
>>> of the channel monitor; (B) the time since last GLS reponse was received
>>> successfully. The general idea behind is: we have two GLS commands sent
>>> and at least one response should be received in 5 seconds, which is
>>> represented by NCSI_CHANNEL_MONITOR_WAIT_MAX.
>>
>>I follow that. But the code path for MAX_WAIT appears to be there same
>>as WAIT. There's nowhere that we do if (nc->monitor.state ==
>>NCSI_CHANNEL_MONITOR_WAIT_MAX) explode();
>>
>>Is that intentional? If so, why do we need the two separate states?
>>
>
> Yes, there are 4 waiting states (2/3/4/5) as below.
>
> #define NCSI_CHANNEL_MONITOR_WAIT      2
> #define NCSI_CHANNEL_MONITOR_WAIT_MAX  5
>
> I want to use "switch...case" in the code as it's a state machine.
> Also, I would like to have two macros to specify the range of
> waiting state, which makes the code clearer. Yes, it's intentional.

Okay. I guess my confusion was around never explicitly doing anything
in WAIT state. We say in retry state until we transition to MAX.

>
> Instead, we can use "if...else if...else". It's not good enough
> to have this in the state machine driven code, but it's a personal
> preference. In this case, we need less defined states:
>
>    #define NCSI_CHANNEL_MONITOR_RETRY   1
>    #define NCSI_CHANNEL_MONITOR_TIMEOUT 6
>
>    if (monitor.state <= NCSI_CHANNEL_MONITOR_RETRY)
>        /* send GLS packet */
>    else if (monitor.state < NCSI_CHANNEL_MONITOR_TIMEOUT)
>        /* break */
>    else
>         /* failover */

I think this is clearer. However, now that I understand what your
patch is doing, either approach is ok.

Cheers,

Joel

>
>    monitor.state++;
>    rescheule_timeout();
>
> Thanks,
> Gavin
>
>>Cheers,
>>
>>Joel
>>
>
