Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::231; helo=mail-ua0-x231.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HpDuA9Nz"; 
 dkim-atps=neutral
Received: from mail-ua0-x231.google.com (mail-ua0-x231.google.com
 [IPv6:2607:f8b0:400c:c08::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yXtww23b1zDrK1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2017 06:47:27 +1100 (AEDT)
Received: by mail-ua0-x231.google.com with SMTP id 65so5246313uaq.8
 for <openbmc@lists.ozlabs.org>; Thu, 09 Nov 2017 11:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZC3ShsfdUf/oV+lIS9iRPPZvWIkZvMRQDZbQE9cJmt8=;
 b=HpDuA9NzuVFQ5HfI2eVfzpqHDUJSv82QGoniJyx1cI28Tohb5SnlQtXPOCD75RFsp0
 ZPeFGISG1FTJ3neJ9vPz7zZWZaVmSD367WyrjJZ0lkT/On/jvkdIOo64zPVuPo486Gfs
 0BolmitwAlXcAzE4crZUOT3aDP2g8Mh8Q0/BRBRrsKT4acao4jqIoAFvNj+XON6DBmDB
 wg4UayFzXCBVkujGAaDxHh1lUAp9owsw1gfiWHwgeqBwh75RTy8c+8d/bkOsx2twYXWu
 A1JzuhVgNtoVKgTFYpmZrcB/uesGr8p/WKkFx0So4Xj9kAX4rZaBMEVQ5+3t+rZDBQc2
 GuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZC3ShsfdUf/oV+lIS9iRPPZvWIkZvMRQDZbQE9cJmt8=;
 b=NHGij5Ha4TpWEjKNocVCJZ0OoYD1VqU72Sf2DXS2qoxJB83yFPCt5JBeGzvDGJMxTL
 sA6Behvcam+kEiYh1qeWDwc06LPdwCKLy6VoBI1p8sU5kUt3eeQKTHYBMvAYnidQ3irb
 Bc3/idhO5OgKP2j1NyRwW/+48sBhrezwkBUIxHL5RTXE8P4s+KfbJld3ZHs/GwnH6riq
 xxfAfR5aW8//3s8I5EfRSrYlIjFkziRmAqGUUeE0ogdirzSgjmc/IJvc1TJoAxkwb6jN
 RNJVeXFl79Mtj2F4a00slt9jVXjjpQfqr+odPIVIJDo4IlfkmMvV5/qkcdgD0O9QGBpa
 YBCw==
X-Gm-Message-State: AJaThX7jJ2UVP1Ju+jIR8HI3JzgfBOMMxtun1ekEsX717t2KEGx0r3il
 ifcQM/wf5odsnTm4RJC5dLCgQbXlKkAYaJs3SiqiNw==
X-Google-Smtp-Source: AGs4zMaanakGSAdJhREyHc6cx0tYQyAYZ8PPgz/mdipqEYDGpGZnoeM5joXHzVUPwn56mGDwrESEDXPP1o+0XaI0B8o=
X-Received: by 10.176.94.142 with SMTP id y14mr1448644uag.38.1510256844628;
 Thu, 09 Nov 2017 11:47:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.163.73 with HTTP; Thu, 9 Nov 2017 11:47:04 -0800 (PST)
In-Reply-To: <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
References: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
 <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
 <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 9 Nov 2017 11:47:04 -0800
Message-ID: <CAO=notx1xgFuMqFbxgf2_6zyQrHrbq_HwCM565gUTS9V0-zEvg@mail.gmail.com>
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
X-List-Received-Date: Thu, 09 Nov 2017 19:47:29 -0000

I added these configurations and after ~10 reboots it wasn't
reproducing, but I'll keep an eye out and update over the coming days.

Thanks!

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
>>
>> Can you share some information with how you're booting?
>>
>> Are you netbooting?
>>
>> Which u-boot tree are you using? Does it enable networking before
>> jumping to the kenrel? Or trigger any other kinds of DMA?
>
> Can you reproduce with some debugging turned on? Build your kernel with:
>
>  DEBUG_LIST
>  PAGE_POISONING
>  DEBUG_PAGEALLOC
>  DEBUG_SLAB
>
> Or even more. Take a look through the Kernel hacking menu in
> menuconfig and enable things until the system slows down too much to
> reproduce the issue :)
>
> Does it reproduce if you disable the FTGMAC100 devices (set them to
> status = "disabled" in your device tree, or disable them in the kernel
> config)?
