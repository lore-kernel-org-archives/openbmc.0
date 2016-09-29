Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3skynK01cszDrZq
 for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2016 12:14:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=T2M/GOne; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id u196so2292449vkd.1
 for <openbmc@lists.ozlabs.org>; Wed, 28 Sep 2016 19:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=n/YFjpc0G1j9YcE7J5ZpJJr+SLGL+3QwQgCbB4SA2oM=;
 b=T2M/GOneh06YqDrH7a7Ys63aZXAw1vk/JI/i3/VbblWUB5aih+BnSJ83heHBeMWPGY
 qUf4T9jrBwApEDOrrmGnr/pfVv1JL6jGMM44r/UlYj+Gu50gZ1EBjq8eKAEh6+CqquCA
 2yTwe4modhgURjHyoPO+eWo+eW63qztXQKOL8ooXjRnDZ7iXRSC5BcAhDZa21bKqUeem
 bjLIWUzp7/fUmyo1GFjvdukcF2rhqw14Fq4L45D6K5TLTkdrH7a5fzjz48muJHF+YCfb
 +Yo2n6ibl4+CK9f8CEzomHgMNIdnTk3pxy34gDkNjgdQlZgVUdrWxbC5t4AT24tA1vK3
 bEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=n/YFjpc0G1j9YcE7J5ZpJJr+SLGL+3QwQgCbB4SA2oM=;
 b=nAwPp9uL4tY2uoSWYoVpm1DwXDfN4H98RzMHZamLXTK7D6vQ/SY2iwNiDwpr54lhoA
 xHcnEbwVPH/46lw04ju0iPP9XeS+2q5tnNsRRVUnvcCKC2kp1fuZaytof9RLjHGk6dYj
 0Ie2Z80mE0nYrVDHBHmkq5PQeev7NMqxn+7csg/EulyWlBnnwK0DLGUsaDsyYWIgVPND
 QRCg5eZ0EDLwxcNgU1O7NJ5rXc4JNj8gfWGw78LFSMPNVvv4/VT0Wjh4rfrS64DKGln3
 sgKlR7xWD7oVmyE71UF+8Gzcu8+932sIi7nVtJMzba9CAvLcao2Xo07wnztlVdhv6SWu
 b5yQ==
X-Gm-Message-State: AA6/9RnNh54LjNu+GztCumqbon/09QCfC138J+XTzrlCnPeGzqCPeyArAP31GizzXd0J0R3ZIV9WHOHo/AgA+g==
X-Received: by 10.31.129.144 with SMTP id c138mr5557903vkd.145.1475115265874; 
 Wed, 28 Sep 2016 19:14:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Wed, 28 Sep 2016 19:14:05 -0700 (PDT)
In-Reply-To: <20160928071803.GA10147@gwshan>
References: <1475030915-9525-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475030915-9525-6-git-send-email-gwshan@linux.vnet.ibm.com>
 <1475041832.9493.11.camel@jms.id.au> <20160928071803.GA10147@gwshan>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 29 Sep 2016 11:44:05 +0930
X-Google-Sender-Auth: zJtRRGR85fsLfXUjkLAP6t2zuNg
Message-ID: <CACPK8XeWEiLAtUSuf2C8nTopQ9kRti5Oi3L0DDw-B+pLJ4XALg@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 Sep 2016 02:14:29 -0000

On Wed, Sep 28, 2016 at 4:48 PM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> On Wed, Sep 28, 2016 at 03:20:32PM +0930, Joel Stanley wrote:
>>> +#define NCSI_CHANNEL_MONITOR_START  0
>>> +#define NCSI_CHANNEL_MONITOR_RETRY  1
>>> +#define NCSI_CHANNEL_MONITOR_WAIT   2
>>> +#define NCSI_CHANNEL_MONITOR_WAIT_MAX       5
>>> +    } monitor;
>>>      struct list_head            node;
>>>      struct list_head            link;
>>>  };
>>> diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
>>> index 3019432..5813ebe 100644
>>> --- a/net/ncsi/ncsi-manage.c
>>> +++ b/net/ncsi/ncsi-manage.c
>>> @@ -165,13 +165,13 @@ static void ncsi_channel_monitor(unsigned long
>>> data)
>>>      struct ncsi_dev_priv *ndp = np->ndp;
>>>      struct ncsi_cmd_arg nca;
>>>      bool enabled;
>>> -    unsigned int timeout;
>>> +    unsigned int monitor_state;
>>>      unsigned long flags;
>>>      int state, ret;
>>>
>>>      spin_lock_irqsave(&nc->lock, flags);
>>> -    timeout = nc->timeout;
>>> -    enabled = nc->enabled;
>>> +    monitor_state = nc->monitor.state;
>>> +    enabled = nc->monitor.enabled;
>>>      spin_unlock_irqrestore(&nc->lock, flags);
>>>
>>>      if (!enabled || !list_empty(&nc->link))
>>> @@ -181,7 +181,9 @@ static void ncsi_channel_monitor(unsigned long
>>> data)
>>>      if (state != NCSI_CHANNEL_INACTIVE && state !=
>>> NCSI_CHANNEL_ACTIVE)
>>>              return;
>>>
>>> -    if (!(timeout % 2)) {
>>> +    switch (monitor_state) {
>>> +    case NCSI_CHANNEL_MONITOR_START:
>>> +    case NCSI_CHANNEL_MONITOR_RETRY:
>>>              nca.ndp = ndp;
>>>              nca.package = np->id;
>>>              nca.channel = nc->id;
>>> @@ -193,15 +195,19 @@ static void ncsi_channel_monitor(unsigned long
>>> data)
>>>                                 ret);
>>>                      return;
>>>              }
>>> -    }
>>>
>>> -    if (timeout + 1 >= 3) {
>>> +            break;
>>> +    case NCSI_CHANNEL_MONITOR_WAIT ...
>>> NCSI_CHANNEL_MONITOR_WAIT_MAX:
>>
>>It's not clear why you have the MAX_WAIT state if it's doing the same
>>thing as WAIT.
>>
>
> @nc->monitor.state tracks two types of information: (A) the current state
> of the channel monitor; (B) the time since last GLS reponse was received
> successfully. The general idea behind is: we have two GLS commands sent
> and at least one response should be received in 5 seconds, which is
> represented by NCSI_CHANNEL_MONITOR_WAIT_MAX.

I follow that. But the code path for MAX_WAIT appears to be there same
as WAIT. There's nowhere that we do if (nc->monitor.state ==
NCSI_CHANNEL_MONITOR_WAIT_MAX) explode();

Is that intentional? If so, why do we need the two separate states?

Cheers,

Joel
