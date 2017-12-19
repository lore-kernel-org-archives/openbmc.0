Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22c; helo=mail-vk0-x22c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AX4vJwHA"; 
 dkim-atps=neutral
Received: from mail-vk0-x22c.google.com (mail-vk0-x22c.google.com
 [IPv6:2607:f8b0:400c:c05::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z10Df0CLMzDsQM
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 12:09:37 +1100 (AEDT)
Received: by mail-vk0-x22c.google.com with SMTP id v70so2840037vkd.8
 for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2017 17:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MCd3VqRFLLbgFkFdXsaQzVfDFj2SEat+29sVDVGAhdY=;
 b=AX4vJwHA9ArdeEJF/iiN3c7Rl4cAbejSsk+f4hbALMj1esg7ma7SGJCeUka9DqDiRe
 /SCjB3wzP1+zgUhX2jPNyzhVYGCCYUbmAYZlFvT4b2tNcP3799Di12XzIBNgCe68m9UC
 0VON0VdSjyutd+c9Kuco+PbFJ5JkN81mhLz4vXaocNHQbM09/y2hTI7pciBka9fP2arO
 cgPmAlBlBLFmEoBNLQDFiHtOkHkucyow8YLYcZLGPUkbzJiyrswM2XNYb7hsPEEIC0o8
 5iNdc+HcpGthAN5tdSJICMVI9JFyUTxm4PJwHGOmJT/n7UIDN8+qTBSmiA5hwvWeu63l
 O7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MCd3VqRFLLbgFkFdXsaQzVfDFj2SEat+29sVDVGAhdY=;
 b=bXH6+wTY1kLMjylJWCB1bhOhoS6WTe5qffhSJjQxgYyYTryZ4yfqk99c2mRVWQHjq8
 sfb2FcSTnqJKq6LXuVPaoAoR9Ib8li2m//ATVBF2WAs7j/9xlsIFlLdrf6V6Q+2ByU+G
 3tNGOVb1iBb9iM85V6Oqlz8IpD9j53P3HPNpgDt2GXLJI/6orIN1DkvP/+BqG/FuXASW
 jXQCXIonRaBsKpa0WQdMMdFwugyYxBhhgyIBCNbA/1gywQOiqUNLMdSHWHvNsXRjP/Gz
 Fe8opNaMWyttm2PxpxfIN5qrh8KbKUU3qXIbmtSw83tS81kdNMoEgsWSIpTpEV6D+QhG
 T6AQ==
X-Gm-Message-State: AKGB3mKMGY+u52YEAUDQKuxpLc1ZhYxdSDHU3Q3tXjKfInyiniW2uMBi
 4PHn7XOftevVB1Qivrx6vznf0PzIwrR3GyoMovPfVQ==
X-Google-Smtp-Source: ACJfBovRoO96FaXnDJAtqI5wbS3PL5fI1b6/pz8yql1LkAX8s7O/9FpCX5K7ur6/WAhh7txVrPGyedm8iWLWvRkf1YQ=
X-Received: by 10.31.93.134 with SMTP id r128mr1594375vkb.143.1513645773774;
 Mon, 18 Dec 2017 17:09:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.164.82 with HTTP; Mon, 18 Dec 2017 17:09:13 -0800 (PST)
In-Reply-To: <b8471c2a4cde443c8df4ca85b47b1862@XCH-RCD-009.cisco.com>
References: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
 <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
 <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
 <CAO=notx1xgFuMqFbxgf2_6zyQrHrbq_HwCM565gUTS9V0-zEvg@mail.gmail.com>
 <CAO=notwowQs4pNvGeH0erQnuAKve0RPVF1KiAHGX_0hGEN_8sA@mail.gmail.com>
 <b8471c2a4cde443c8df4ca85b47b1862@XCH-RCD-009.cisco.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 18 Dec 2017 17:09:13 -0800
Message-ID: <CAO=notyuyhXHYS-Be0WBD03nmW8HY5GtLP8=_k+r8f1cYuFuGA@mail.gmail.com>
Subject: Re: linux 4.10 on ast2400
To: "David Duffey (dduffey)" <dduffey@cisco.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 19 Dec 2017 01:09:38 -0000

I'll check it out -- I don't imagine the kernel is deliberately
reserving this variation of memory -- I believe some driver is
corrupting memory.  With the 4.7 kernel running, there's a massive
memory leak but the system always starts with approximately the same
amount.

Patrick

On Mon, Dec 18, 2017 at 3:11 PM, David Duffey (dduffey)
<dduffey@cisco.com> wrote:
>
> /proc/zoneinfo may provide some useful hints (if it exists)
>
> Not exactly applicable but on x86 hosts I've seen hardware (via e820) res=
erve different amounts and addresses from boot-to-boot.  Additionally there=
 is some logic in the kernel to reserve those ranges as certain boundaries =
so a some addresses would cause more reserved memory than others.
>
> -----Original Message-----
> From: openbmc [mailto:openbmc-bounces+dduffey=3Dcisco.com@lists.ozlabs.or=
g] On Behalf Of Patrick Venture
> Sent: Monday, December 18, 2017 3:58 PM
> To: Joel Stanley <joel@jms.id.au>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
> Subject: Re: linux 4.10 on ast2400
>
> I loaded 4.10 with some debug memory stuff, but I noticed that each reboo=
t could have wildly different free memory.  So, here's the results from jus=
t dumping the file immediately after boot and then rebooting.
>
> root@quanta-q71l:~# cat /proc/meminfo
> MemTotal:         115076 kB
> MemFree:           42228 kB
>
> root@quanta-q71l:~# cat /proc/meminfo
> MemTotal:         115076 kB
> MemFree:            1668 kB
>
> root@quanta-q71l:~# cat /proc/meminfo
> MemTotal:         115076 kB
> MemFree:            1876 kB
>
> root@quanta-q71l:~# cat /proc/meminfo
> MemTotal:         115076 kB
> MemFree:           27464 kB
>
> root@quanta-q71l:~# cat /proc/meminfo
> MemTotal:         115076 kB
> MemFree:           12140 kB
>
> root@quanta-q71l:~# cat /proc/meminfo
> MemTotal:         115076 kB
> MemFree:            2084 kB
>
> On Thu, Nov 9, 2017 at 11:47 AM, Patrick Venture <venture@google.com> wro=
te:
>> I added these configurations and after ~10 reboots it wasn't
>> reproducing, but I'll keep an eye out and update over the coming days.
>>
>> Thanks!
>>
>> On Tue, Nov 7, 2017 at 1:56 AM, Joel Stanley <joel@jms.id.au> wrote:
>>> On Tue, Nov 7, 2017 at 8:09 PM, Joel Stanley <joel@jms.id.au> wrote:
>>>> On Tue, Nov 7, 2017 at 11:42 AM, Patrick Venture <venture@google.com> =
wrote:
>>>>> I've been doing testing with linux 4.10 on the ast2400 and on some
>>>>> percentage (20% of systems) when they boot they're not able to
>>>>> really launch applications.  The one we see failing is agetty, but
>>>>> ipmid also ends up not running.  Here is the log from what we're
>>>>> seeing on the
>>>>> quanta-q71l:
>>>>>
>>>>> [  OK  ] Started Clear one time boot overrides.
>>>>> [  OK  ] Found device /dev/ttyS4.
>>>>> [  OK  ] Found device /dev/ttyVUART0.
>>>>> [   42.360000] 8021q: adding VLAN 0 to HW filter on device eth1
>>>>> [  OK  ] Started Network Service.
>>>>> [   42.420000] 8021q: adding VLAN 0 to HW filter on device eth0
>>>>> [  OK  ] Started Phosphor Inventory Manager.
>>>>> [  OK  ] Started Phosphor Settings Daemon.
>>>>> [  OK  ] Reached target Network.
>>>>>          Starting Permit User Sessions...
>>>>> [  OK  ] Started Lightweight SLP Server.
>>>>> [  OK  ] Started Phosphor Console Muxer listening on device /dev/ttyV=
UART0.
>>>>> [  OK  ] Started Phosphor Inband IPMI.
>>>>> [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>>>>> [  OK  ] Started Permit User Sessions.
>>>>> [  OK  ] Started Serial Getty on ttyS4.
>>>>> [  OK  ] Reached target Login Prompts.
>>>>> [  OK  ] Reached target Multi-User System.
>>>>> [   44.530000] ftgmac100 1e680000.ethernet eth1: NCSI interface down
>>>>> [   45.800000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
>>>>> [   49.430000] Unable to handle kernel paging request at virtual
>>>>> address e1a00006
>>>>> [   49.430000] pgd =3D 85354000
>>>>> [   49.430000] [e1a00006] *pgd=3D00000000
>>>>> [   49.430000] Internal error: Oops: 1 [#1] ARM
>>>>> [   49.430000] CPU: 0 PID: 932 Comm: (agetty) Not tainted
>>>>> 4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
>>>>
>>>> This SHA isn't in the OpenBMC dev-4.10 tree. Where are you getting
>>>> your kernel sources from?
>>>>
>>>> Wherever you've grabbed it from it's out of date as the line numbers
>>>> don't quite make sense.
>>>>
>>>>> [   49.430000] Hardware name: ASpeed SoC
>>>>> [   49.430000] task: 86e1c000 task.stack: 858f6000
>>>>> [   49.430000] PC is at unlink_anon_vmas+0x98/0x1b0
>>>>
>>>> We have seen memory corruption when running under Qemu. This is the
>>>> first time I've had a report of it happening on hardware.
>>>>
>>>>  https://github.com/openbmc/qemu/issues/9
>>>>
>>>> Can you share some information with how you're booting?
>>>>
>>>> Are you netbooting?
>>>>
>>>> Which u-boot tree are you using? Does it enable networking before
>>>> jumping to the kenrel? Or trigger any other kinds of DMA?
>>>
>>> Can you reproduce with some debugging turned on? Build your kernel with=
:
>>>
>>>  DEBUG_LIST
>>>  PAGE_POISONING
>>>  DEBUG_PAGEALLOC
>>>  DEBUG_SLAB
>>>
>>> Or even more. Take a look through the Kernel hacking menu in
>>> menuconfig and enable things until the system slows down too much to
>>> reproduce the issue :)
>>>
>>> Does it reproduce if you disable the FTGMAC100 devices (set them to
>>> status =3D "disabled" in your device tree, or disable them in the
>>> kernel config)?
