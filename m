Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::234; helo=mail-ua0-x234.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WH3kBjES"; 
 dkim-atps=neutral
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0vzk2XXbzDrkD
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 08:58:09 +1100 (AEDT)
Received: by mail-ua0-x234.google.com with SMTP id p33so11695171uag.9
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 13:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qaoqk2XrXAmwwxYtnCGOrUr/fLaR77YnN3sKSYpzA9g=;
 b=WH3kBjESFW5bBJBmTAe8B3VT63VEayEo+yU3eNwCNvWmUtOT2zNKbhb/dizhkSPkNY
 NGLwUxCONKVdqHlfqoE2ruQZiUkf1IHbAQyoKr01ZJtNmmgcVjRdhHxg8FnFh5DwDoH3
 l4Q5faf1Jb7VGxe3cV0GVMKjlgXO4UVnU25v/i533iENc+UyEg6Ox1rrdS+nWjtaDHZu
 9FGGxNJrlbHPpD0FYsi5duRxsZFuU+ako+BcHrafU/26olqPrkXWUPajPntLSPIQplxM
 vMbeTCs7WdKgy/4KLeBssZKsr6Rwv6+NUTnJ2maaodW3BAJvZKqBceYzuEjxvFUE1V1X
 goSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qaoqk2XrXAmwwxYtnCGOrUr/fLaR77YnN3sKSYpzA9g=;
 b=Xe3nSetwmyaF7l5W3r9dNPDYO+i9uI6Lap65W52LeHcJ8yRvmo01WDJ5sBRdZx9vVP
 +4VLyv13rE2i9uBPgexZhHM+5fBzK96OlD0E1GMK3W+ZkD8UxhNzF3WECUm1PyYVlFcr
 PapHA5ZbgysuhdRnhJPmhN0QTFdGOJiji1yepNOQVgyzZLY1SO6/+JtSlR2VLalto557
 gWZZUhC9nL2jaqBaqNv1m7PlYzR9r2DH33Z66Gm2SqpZtiOk2L0DMnRuEMmu81FMV3tx
 HmN5lrlb86aWuoQmxMoNMe7o2oRiqG0b7qPJ1dqJHKJjcSa4VshkK4Y7cW4hON1tx12k
 LCjQ==
X-Gm-Message-State: AKGB3mJ443QmV0rYbfPkXo2FSQYHGDMCzyjBWBu1n1prIFIqiRmSEnY8
 XzfFidHC9vodLQ74MjJ/xomAwnK50/rUC+Lq63HhhA==
X-Google-Smtp-Source: ACJfBoujj+mg2iRPDNcZWyJfKfRMlwwXnNcB//U+x5XHchh7kr97wokDwvHjctGjvAddX8I2JRjXL3ElpRvn1Xd4HTA=
X-Received: by 10.159.61.196 with SMTP id e4mr1397361uaj.156.1513634287271;
 Mon, 18 Dec 2017 13:58:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Mon, 18 Dec 2017 13:57:46 -0800 (PST)
In-Reply-To: <CAO=notx1xgFuMqFbxgf2_6zyQrHrbq_HwCM565gUTS9V0-zEvg@mail.gmail.com>
References: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
 <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
 <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
 <CAO=notx1xgFuMqFbxgf2_6zyQrHrbq_HwCM565gUTS9V0-zEvg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 18 Dec 2017 13:57:46 -0800
Message-ID: <CAO=notwowQs4pNvGeH0erQnuAKve0RPVF1KiAHGX_0hGEN_8sA@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Dec 2017 21:58:11 -0000

I loaded 4.10 with some debug memory stuff, but I noticed that each
reboot could have wildly different free memory.  So, here's the
results from just dumping the file immediately after boot and then
rebooting.

root@quanta-q71l:~# cat /proc/meminfo
MemTotal:         115076 kB
MemFree:           42228 kB

root@quanta-q71l:~# cat /proc/meminfo
MemTotal:         115076 kB
MemFree:            1668 kB

root@quanta-q71l:~# cat /proc/meminfo
MemTotal:         115076 kB
MemFree:            1876 kB

root@quanta-q71l:~# cat /proc/meminfo
MemTotal:         115076 kB
MemFree:           27464 kB

root@quanta-q71l:~# cat /proc/meminfo
MemTotal:         115076 kB
MemFree:           12140 kB

root@quanta-q71l:~# cat /proc/meminfo
MemTotal:         115076 kB
MemFree:            2084 kB

On Thu, Nov 9, 2017 at 11:47 AM, Patrick Venture <venture@google.com> wrote:
> I added these configurations and after ~10 reboots it wasn't
> reproducing, but I'll keep an eye out and update over the coming days.
>
> Thanks!
>
> On Tue, Nov 7, 2017 at 1:56 AM, Joel Stanley <joel@jms.id.au> wrote:
>> On Tue, Nov 7, 2017 at 8:09 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> On Tue, Nov 7, 2017 at 11:42 AM, Patrick Venture <venture@google.com> wrote:
>>>> I've been doing testing with linux 4.10 on the ast2400 and on some
>>>> percentage (20% of systems) when they boot they're not able to really
>>>> launch applications.  The one we see failing is agetty, but ipmid also
>>>> ends up not running.  Here is the log from what we're seeing on the
>>>> quanta-q71l:
>>>>
>>>> [  OK  ] Started Clear one time boot overrides.
>>>> [  OK  ] Found device /dev/ttyS4.
>>>> [  OK  ] Found device /dev/ttyVUART0.
>>>> [   42.360000] 8021q: adding VLAN 0 to HW filter on device eth1
>>>> [  OK  ] Started Network Service.
>>>> [   42.420000] 8021q: adding VLAN 0 to HW filter on device eth0
>>>> [  OK  ] Started Phosphor Inventory Manager.
>>>> [  OK  ] Started Phosphor Settings Daemon.
>>>> [  OK  ] Reached target Network.
>>>>          Starting Permit User Sessions...
>>>> [  OK  ] Started Lightweight SLP Server.
>>>> [  OK  ] Started Phosphor Console Muxer listening on device /dev/ttyVUART0.
>>>> [  OK  ] Started Phosphor Inband IPMI.
>>>> [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>>>> [  OK  ] Started Permit User Sessions.
>>>> [  OK  ] Started Serial Getty on ttyS4.
>>>> [  OK  ] Reached target Login Prompts.
>>>> [  OK  ] Reached target Multi-User System.
>>>> [   44.530000] ftgmac100 1e680000.ethernet eth1: NCSI interface down
>>>> [   45.800000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
>>>> [   49.430000] Unable to handle kernel paging request at virtual
>>>> address e1a00006
>>>> [   49.430000] pgd = 85354000
>>>> [   49.430000] [e1a00006] *pgd=00000000
>>>> [   49.430000] Internal error: Oops: 1 [#1] ARM
>>>> [   49.430000] CPU: 0 PID: 932 Comm: (agetty) Not tainted
>>>> 4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
>>>
>>> This SHA isn't in the OpenBMC dev-4.10 tree. Where are you getting
>>> your kernel sources from?
>>>
>>> Wherever you've grabbed it from it's out of date as the line numbers
>>> don't quite make sense.
>>>
>>>> [   49.430000] Hardware name: ASpeed SoC
>>>> [   49.430000] task: 86e1c000 task.stack: 858f6000
>>>> [   49.430000] PC is at unlink_anon_vmas+0x98/0x1b0
>>>
>>> We have seen memory corruption when running under Qemu. This is the
>>> first time I've had a report of it happening on hardware.
>>>
>>>  https://github.com/openbmc/qemu/issues/9
>>>
>>> Can you share some information with how you're booting?
>>>
>>> Are you netbooting?
>>>
>>> Which u-boot tree are you using? Does it enable networking before
>>> jumping to the kenrel? Or trigger any other kinds of DMA?
>>
>> Can you reproduce with some debugging turned on? Build your kernel with:
>>
>>  DEBUG_LIST
>>  PAGE_POISONING
>>  DEBUG_PAGEALLOC
>>  DEBUG_SLAB
>>
>> Or even more. Take a look through the Kernel hacking menu in
>> menuconfig and enable things until the system slows down too much to
>> reproduce the issue :)
>>
>> Does it reproduce if you disable the FTGMAC100 devices (set them to
>> status = "disabled" in your device tree, or disable them in the kernel
>> config)?
