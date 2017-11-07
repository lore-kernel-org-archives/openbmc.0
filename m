Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::235; helo=mail-vk0-x235.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gQnfeafw"; 
 dkim-atps=neutral
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWYJR3r3xzDqlM
 for <openbmc@lists.ozlabs.org>; Wed,  8 Nov 2017 02:29:42 +1100 (AEDT)
Received: by mail-vk0-x235.google.com with SMTP id v3so8203390vkb.8
 for <openbmc@lists.ozlabs.org>; Tue, 07 Nov 2017 07:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=mmnilcT79N+toXRq+UItVXCFlETduSuV6TZwCrONd1k=;
 b=gQnfeafwU6A+IkaxMSmU+h2XUaFk4d+4fYpu/PiiJebmkUOuprE/WsI2gcDoXN4Nxo
 V0PBWTtL6hdHSLwCZKn92Uvo29rQn9dsn68Iq6va6yXteSkXFPzU+4vE7wGCmA9cPwXH
 8XkkxrQ+QYM0JNRHfZh2xJqAZWIo5mvRMRF1bppGC6NUbRrestuJqimn20coxtLV/CLU
 1ZGccjOrbEb6yYdz5Fp8sSI0n4P2o26z4t+5c2gWDbPOJZsOYgTRMPwry0dfIvd52KVg
 ouMUNNGMBvmdMyGzFl4REpqJDrZN9ZZ5mvhSn2aJbpzX1mps8eNL0cKrcZVJfCxWDwm/
 reAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=mmnilcT79N+toXRq+UItVXCFlETduSuV6TZwCrONd1k=;
 b=LMIvrjdVJTPY4GoSlNYf6wbXnEB9+RTHnAotDj+tX8mKTMnKG67wDzOBs0DMKq4qVD
 HQ3L397FgDICQk5CkJT+GTDesYwB6d8NkyJlnSWh43rHD318UL5yNCA3o8sKhXqMv9CC
 j5AjNmZwQmKsEsumEzQdO5hsFFZthZk2Zf5BeszaSC1Q8fI6IlaQYaeaATT3wXUSHoIL
 1V51Su5YKbQLSR1ePyEBEdkAOU/SuWIjil4zMWBJ5WbeSzLxBW9YqfHuZphE/42CLyZ/
 kprEFqvXLcegNekcmMhUKlVLYPOATPly0Wu5YRs8kuOXFmBMPULnYwXjnU9RMxdu1yH+
 Luzg==
X-Gm-Message-State: AMCzsaU6CxTjUz7UdKueyWh8JNsBbnzALpmWfbKyNr/tXZr4JOdjDB61
 JFqIdSbrht0NmmXGV04YPmhUoueCsEppv+1dAtz3XA==
X-Google-Smtp-Source: ABhQp+Q9cuiJpLUWimLEEGshPW5dBklKnchAkCrG8e+W/YSTAZWq+c4eBlLfrHuOmJqMa5PnIOamRuVQewJEsaQwQK8=
X-Received: by 10.31.108.209 with SMTP id j78mr15084465vki.129.1510068580001; 
 Tue, 07 Nov 2017 07:29:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Tue, 7 Nov 2017 07:29:19 -0800 (PST)
In-Reply-To: <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
References: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
 <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
 <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 7 Nov 2017 07:29:19 -0800
Message-ID: <CAO=notz5c+aqxi7f6jSY7RoO4JLNNiDsWOwc9J05Ff9VvudotA@mail.gmail.com>
Subject: Re: linux 4.10 on ast2400
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 15:29:44 -0000

On Tue, Nov 7, 2017 at 1:56 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Nov 7, 2017 at 8:09 PM, Joel Stanley <joel@jms.id.au> wrote:
>> On Tue, Nov 7, 2017 at 11:42 AM, Patrick Venture <venture@google.com> wrote:
>>> I've been doing testing with linux 4.10 on the ast2400 and on some
>>> percentage (20% of systems) when they boot they're not able to really
>>> launch applications.  The one we see failing is agetty, but ipmid also
>>> ends up not running.  Here is the log from what we're seeing on the
>>> quanta-q71l:
>>>
>>> [  OK  ] Started Clear one time boot overrides.
>>> [  OK  ] Found device /dev/ttyS4.
>>> [  OK  ] Found device /dev/ttyVUART0.
>>> [   42.360000] 8021q: adding VLAN 0 to HW filter on device eth1
>>> [  OK  ] Started Network Service.
>>> [   42.420000] 8021q: adding VLAN 0 to HW filter on device eth0
>>> [  OK  ] Started Phosphor Inventory Manager.
>>> [  OK  ] Started Phosphor Settings Daemon.
>>> [  OK  ] Reached target Network.
>>>          Starting Permit User Sessions...
>>> [  OK  ] Started Lightweight SLP Server.
>>> [  OK  ] Started Phosphor Console Muxer listening on device /dev/ttyVUART0.
>>> [  OK  ] Started Phosphor Inband IPMI.
>>> [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>>> [  OK  ] Started Permit User Sessions.
>>> [  OK  ] Started Serial Getty on ttyS4.
>>> [  OK  ] Reached target Login Prompts.
>>> [  OK  ] Reached target Multi-User System.
>>> [   44.530000] ftgmac100 1e680000.ethernet eth1: NCSI interface down
>>> [   45.800000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
>>> [   49.430000] Unable to handle kernel paging request at virtual
>>> address e1a00006
>>> [   49.430000] pgd = 85354000
>>> [   49.430000] [e1a00006] *pgd=00000000
>>> [   49.430000] Internal error: Oops: 1 [#1] ARM
>>> [   49.430000] CPU: 0 PID: 932 Comm: (agetty) Not tainted
>>> 4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
>>
>> This SHA isn't in the OpenBMC dev-4.10 tree. Where are you getting
>> your kernel sources from?

We're on a branch based from the dev-4.10 tree.  It's just a branch
with a few extra drivers, etc -- for a different platform, actually.
So not compiled here, this should be nearly identical as dev-4.10 for
quanta-q71l's (ast2400 defconfig).

>>
>> Wherever you've grabbed it from it's out of date as the line numbers
>> don't quite make sense.
>>
>>> [   49.430000] Hardware name: ASpeed SoC
>>> [   49.430000] task: 86e1c000 task.stack: 858f6000
>>> [   49.430000] PC is at unlink_anon_vmas+0x98/0x1b0
>>
>> We have seen memory corruption when running under Qemu. This is the
>> first time I've had a report of it happening on hardware.
>>
>>  https://github.com/openbmc/qemu/issues/9

Looks like you were seeing this with 4.7 kernel in qemu as well.

We're seeing it on about 20 machines and not every boot.

>>
>> Can you share some information with how you're booting?

Booting from flash chip.

>>
>> Are you netbooting?
>>
>> Which u-boot tree are you using? Does it enable networking before
>> jumping to the kenrel? Or trigger any other kinds of DMA?

I'll have to check, we do have minor customization in u-boot, but I'll
check whether it does anything with DMA.

>
> Can you reproduce with some debugging turned on? Build your kernel with:
>
>  DEBUG_LIST
>  PAGE_POISONING
>  DEBUG_PAGEALLOC
>  DEBUG_SLAB

I'll give that a try.

>
> Or even more. Take a look through the Kernel hacking menu in
> menuconfig and enable things until the system slows down too much to
> reproduce the issue :)
>
> Does it reproduce if you disable the FTGMAC100 devices (set them to
> status = "disabled" in your device tree, or disable them in the kernel
> config)?

Are you suggesting this because of the ncsi crash?  Because that's
always happened for us on these systems, even with the 4.7 kernel --
which has been very stable.

Patrick
