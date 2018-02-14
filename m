Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::235; helo=mail-ua0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Bo2Xn/bh"; 
 dkim-atps=neutral
Received: from mail-ua0-x235.google.com (mail-ua0-x235.google.com
 [IPv6:2607:f8b0:400c:c08::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhWLH2ZDHzF1HS
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 07:32:38 +1100 (AEDT)
Received: by mail-ua0-x235.google.com with SMTP id i5so14496664uai.10
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 12:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lKxx7o8k7uAzLkH5XDJPvxwsVTUCONhAvkiJsiL6wGo=;
 b=Bo2Xn/bhLe0v3Bn+AOIGkGiQjdxBVqNn7YigOiMTEeLzHFZm7JF2ZnJQTHD2WynXNj
 Elbwhyjku5+eG6v3fqJPvmuqsZ5P8Lw5+ccHd/+pOGt26vr8Q3XKUNXNBEORAr8XCTdt
 /mUMl2ypFlsgUyu9wkkEyb9f64wk+AWZGNRIMmCKLNylEk0uiYbVqaCuIXSoWd+NJTzX
 6Syh5vMYZkKY4r3Vjd322qO/SjqXRU6vcE7WiLiGD5Q4zxC9ky03iNiUAZZ1buffSMV+
 VLdFdKzjCO5JgbqRLpEoz3G7B+rFaFN4bTwD2iZOYxCDJzC2Ky5ulWRPdNmGbjWoE+VP
 qPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lKxx7o8k7uAzLkH5XDJPvxwsVTUCONhAvkiJsiL6wGo=;
 b=ofYLG6uXMYNAKtQyK2+ftmamWuOcSjeKwR1Xdypr7uzwV/deUpbQtB7hNtetIO4knj
 FOrWM2L1dMK3F6OtJX593fsHeqriBTdHgAuiS69wqlDVUJZEMN7bxR6mpCez8vchlSzC
 GbIuzLWATDkX6c/jeiH3Xh2gOJbKeBRA6Oesm4DER1HgLW4wXr1uyj+8Szz251zngAy7
 1uvdcMtzIjHC0V5vxbpw7pUn5FULTMSn59RgObs8AENiWBYYhSOpAntJHvPnE0kFo8RG
 0B6ml2jyPIWu+1kNP9EyFSbp3FlESEyBB/R4OKbrUQizMoo5zT+3R+bshnXtitN9ilwD
 XjCw==
X-Gm-Message-State: APf1xPBcEdda29kGkeGOQPly+wdrEFnIxYBcwbDHR/qAiTypgd9kNlQP
 yv1QVKalS8LE2uR1DC8buA0SfujPx4ABbTCxzqENId/L
X-Google-Smtp-Source: AH8x225RDCPPXv3Wxb7i9vpqJYddsWn3LQLQAB1kTGjiLCqh/x1gcQoJPFEiPEKdiQ7CEhVdmHRRcvzXz5wJTWemQ7Q=
X-Received: by 10.176.73.209 with SMTP id f17mr470248uad.110.1518640355992;
 Wed, 14 Feb 2018 12:32:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.167.207 with HTTP; Wed, 14 Feb 2018 12:32:15 -0800 (PST)
In-Reply-To: <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
References: <6de6bf00-ea77-a061-cd92-df255b2c0a7f@linux.intel.com>
 <CAO=notyuHzYmwxDre9-kTgPeYNSSrut32wJeRo46VWzrW6Q=xQ@mail.gmail.com>
 <7d9366d2-7816-227c-ac36-409faaa13d8b@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 14 Feb 2018 12:32:15 -0800
Message-ID: <CAO=notzcgZxFthUY90V+2BgW=YnykrVsiVG4OdV0zR7kSTFoUA@mail.gmail.com>
Subject: Re: IPMI Set LAN Configuration Parameters
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Feb 2018 20:32:40 -0000

I thought you had to explicitly set in_progress with the ipmitool?  My
own ipmitool utility is implemented as you described where it doesn't
assume anything about your intent, just follows the actions.

There's definitely the possibility of thrashing.

On Wed, Feb 14, 2018 at 11:16 AM, Dave Cobbley
<david.j.cobbley@linux.intel.com> wrote:
> Do you have any concerns about ipmitool constantly flushing the network as
> it sets & unsets the complete bit inbetween parameters,
> i.e. if you are setting 4 different parameters from a script?
>
> I'm not sure if this brings a lot of thrashing to the to the ipmi network
> stack or network manager.
>
> Seems like it would be prudent to fix ipmitool upstream to allow you to set
> multiple parameters, in addition to the ipmi stack.
>
>
>> I personally have found this non-standard implementation a bit
>> unpleasant, as it requires using a different command to basically
>> flush it.  I am planning to implement it such that setting in progress
>> before and complete after is how it all gets flushed instead of a
>> timeout, since that approach reads more correct given the
>> specification.  And really it's just about literally calling a
>> subroutine to flush everything when the in_progress bit is set to
>> completed, and removing the code from "access on"
>>
>> If you're interested to do what I've just described, I don't think
>> you'll get any push-back.
>>
>> Patrick
>>
>> On Wed, Feb 14, 2018 at 9:14 AM, Dave Cobbley
>> <david.j.cobbley@linux.intel.com> wrote:
>>>
>>> I noticed that when using ipmitool lan set <channel> <parameter>, the
>>> openbmc stack does not apply the settings. This seems like a non-standard
>>> implementation. While using ipmitool as the standard is not quite
>>> correct,
>>> customers do expect it to work.
>>>
>>> After sending any sort of lan set command with ipmitool, the changes
>>> don't
>>> appear to stick and this message shows up in the journal:
>>>      "Use Set Channel Access command to apply"
>>>
>>> I know IPMI 2.0 is a little ambiguous about implementation specifics, but
>>> I
>>> believe the intention was to utilize the "Set In Progress" bit (Parameter
>>> 0)
>>> while doing work, and use "Set Complete" when you are finished to flush
>>> the
>>> changes.
>>>
>>> To work around ipmitool constantly setting and unsetting the "Set In
>>> Progress" bit in between every parameter applied, some BMC stacks
>>> accumulate
>>> network changes over a period of time and apply after a timeout - this is
>>> also compatible with ipmitool's non-standard use of the "Set In Progress"
>>> bit.
>>>
>>>
>>> Is there a plan to circle back and change this functionality to work with
>>> ipmitool in the future?
>>>
>>> Thanks,
>>> -Dave Cobbley
>>>
>
