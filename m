Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::229; helo=mail-vk0-x229.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="S0czQT2P"; 
 dkim-atps=neutral
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409ZyX6ZdxzF2Ds
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 02:42:28 +1100 (AEDT)
Received: by mail-vk0-x229.google.com with SMTP id h134so4686460vke.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 08:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VKRXgGJBtnzS7GPv7lDV2x4VGt36zM9m87+hqrfxr6g=;
 b=S0czQT2P1lUu0B+QO1NJQBvXQ33D8LOhY1X6UJlVEIIk0oIzQnqqrRxJ7gCy5a+wzJ
 u99M+z26Qvka7qY+IoW+WghXZvG4sjv+ucQKdg1VnYD2Gycr6MsjD1/5uk8/L/qCb00D
 N5bHbnMkzsUPEucvmJtMljvobowPspuJHm9Too6GrKWYD3qlB4Bm/GmiNQ/BWqtdxt91
 hQGOJwbw6PpCsHOHApUl0+lY6/VYwBQoRLy48+8iQ+AWADnwpaGkyjpj/29xY54lH6S9
 aIZN0bc6FWH9uXp+5+VDnBotdYU8qKTs3ZR11nFs+feYJgfJKnHcgqTTqKIg3jV1LsLl
 rKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VKRXgGJBtnzS7GPv7lDV2x4VGt36zM9m87+hqrfxr6g=;
 b=HsgGTME2Il59QMqaofA+8b1llI6s0fMJ9PwC6Ck7Qk24K2SnDHtrR7arNb7doc68dc
 07SsXhI6JgFBBp3mzxt4EwHnU+oY0K7fxgp7mguWTsC4F8GvBT8JWK2P4YIXWQ/pfrBT
 3EzK2+exFzh8Hd9rKZz6reLv1eL7kEMU+EykyfoN7qtuPfNaM/GQBGkrpewrQFKM2ktf
 uZop/RsW2Oo3IQdtfz7/mM2hYagz2KLcUCNcmOReDNWQynrEIIMKcGHV2g/bN7COmlLW
 de+kzoupxK1Yz4CTDZp4x+tua0fNUgY42V+qFmFs4vLOA/HDp0JuiUxR4ToXKLj7GHRN
 ZJbw==
X-Gm-Message-State: AElRT7GscGAxwF6uoM3V8qOUP0ph/6p0DZbsrdHsKqH6B8e9Wsq3gxBh
 DFlM0h+KqPvFRHoy/nUM44vkyvX3VfjJ+yFMMKeI+A==
X-Google-Smtp-Source: AG47ELs9RS8jXn8JVZiiRUS1KYexodHyx7PC9bFqwf9V/N6oPDuoh5a9l7YX+qZxCuQtKLbFKsSe3jt8krnfRR3gX1I=
X-Received: by 10.31.56.205 with SMTP id f196mr23152443vka.45.1522165345817;
 Tue, 27 Mar 2018 08:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.124.193 with HTTP; Tue, 27 Mar 2018 08:42:05 -0700 (PDT)
In-Reply-To: <CALLMt=rRvo+Uen-TU-VnKbJHJqnzn2ev2YJ6s2sTMYVcOz8r0Q@mail.gmail.com>
References: <CAO=notwCxfVJGwD=m-Dc=R6EvhKgBnk8hderrmkt=QHcuGcAug@mail.gmail.com>
 <CALLMt=rRvo+Uen-TU-VnKbJHJqnzn2ev2YJ6s2sTMYVcOz8r0Q@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 27 Mar 2018 08:42:05 -0700
Message-ID: <CAO=notywmrX69Nn9CARH-PU5pqHcCoaDM-kV4Oh7L3xAr=sAnA@mail.gmail.com>
Subject: Re: BMC Health Watchdog
To: Andrew Geissler <geissonator@gmail.com>
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
X-List-Received-Date: Tue, 27 Mar 2018 15:42:29 -0000

On Tue, Mar 27, 2018 at 8:08 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> On Fri, Mar 23, 2018 at 11:51 PM, Patrick Venture <venture@google.com> wrote:
>> I've been on a BMC health kick lately.  Mostly because it's something
>> I think we all want and have different requirements.
>>
>> Outside of exporting the BMC health information, which could be done
>> from the same watchdog daemon, -- what requirements has everybody run
>> into?
>
> I've seen some pretty interesting things in the past.
> - Take a time stamp, sleep for X seconds, take time stamp and compare,
> if it's off by some margin, reboot BMC (identifying some general time
> skew issue with BMC)
> - Periodically attempt to open, write, close, delete a test file on
> all non-flash based writeable fs's, if operation fails reboot BMC
> - Depending on filesystem, look for bad blocks or write limits, log
> event if past some threshold
> - Verify filesystem space in writeable fs's, run cleanup if possible,
> otherwise log event
> - Look for "bad" services, restart (yes, "bad" is vague here, but
> usually revolves around fd leaks or memory leaks or lack of response
> on critical interfaces)
> - Custom checks (specific devices like FSI in system) - look at
> errors, recover if possible
>

So there's a linux software watchdog that handles most of that, if not
all, via configuration,
https://linux.die.net/man/8/watchdog

https://layers.openembedded.org/layerindex/recipe/122/

> The complexity is usually with being sure to prevent situations where
> you just continuously reboot your BMC and prevent debugging of the
> actual issue.  Also, to ensure you don't just keep logging the same
> event over and over.

That's true. There can be a situation where there's a bug s.t. the
BMCs in the fleet are in a local DoS attack on themselves.

>
>>
>> IIRC, the facebook presentation at the summit indicated they were
>> tracking BMC health -- thoughts?
>>
>> Patrick
