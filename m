Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::22a; helo=mail-lf0-x22a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pU8diNCh"; 
 dkim-atps=neutral
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWPws02f9zDrJy
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 20:57:16 +1100 (AEDT)
Received: by mail-lf0-x22a.google.com with SMTP id b190so13742240lfg.9
 for <openbmc@lists.ozlabs.org>; Tue, 07 Nov 2017 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+wGDPgnFBQhJQtIkCmStQgKlyEJRk+pEnuHlNBCZDuw=;
 b=pU8diNChANoP5Vi8urA3OOKLA59OqtCqmLENoW1ZBaQ/HUChJZ/k+E5E1cfoJEBdMk
 Al5mGi/fwK3IqVxWUrhzrzqOIRbHDHNYAQT/gpmSBbjYi9/vlSO/EFN9RWQhHZCu2LhQ
 QDVygvlbPq5CupblAIsawZwbo3OciDQJWY1Zaa1e+gvo1cwt7NspBw5J/o/K8C+dBelN
 kBT9u87B46FS2tcLoaqe3RfufjKPfpzgllCaevhCdQmVA0l9+6//BX+eEf7IfSxEhUoT
 zCsLJBFctObfhksNAyuj2WjSPnNk9PlbW2ZAFh7GFuuUgDGLwucB402+UbFI3Rm7w+1/
 CUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+wGDPgnFBQhJQtIkCmStQgKlyEJRk+pEnuHlNBCZDuw=;
 b=b0q0FfvLOojmyESmU4GCpvr/f2TwvdCS6Un78EPPY2Tm8zBxG29unS/SSN3yuIrMsL
 WCzuQchKO9gmSTmNao+12w8bZWCAdq67pfCpKbKEwakXUEgCjC5efQLoJyu5d9B0qpsG
 fHy3tsFYayC5D/e2czeX5sA4o/nuOJyViduAEJUDlKoQtRWx5vmtUm5QImpPJV5zu56b
 QEuAo2Jqk3gCyrYUTOeotG1Vr97fGxnqTEcY8i/bxEJsS8HSVDq1Z3PZYbefdnkjVpCG
 E1YledAZ4N7c8kFo1EEu6TOL3rLiN9Xv+XgCtZVQZrS2vVKMWN9QvkxNA1K91eaAhSkn
 +/5A==
X-Gm-Message-State: AMCzsaXC6ebtUslJaPBBsPiu3Z7VHIrUMVBUIy7dKa/y5E9Fc6z3qqV/
 quEPOSwacuKBQ0AjArdrFv5lm9zRalzXHVkFPlE=
X-Google-Smtp-Source: ABhQp+Rp7ptMHi10dAZ5RJO1IJmsYBF7KpCBv6WfM4ofNrg9SixjD1jTsym10qTIBps23/Rb8ahbswih1TveWNBFTHc=
X-Received: by 10.46.56.14 with SMTP id f14mr8185569lja.46.1510048632714; Tue,
 07 Nov 2017 01:57:12 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.195.71 with HTTP; Tue, 7 Nov 2017 01:56:52 -0800 (PST)
In-Reply-To: <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
References: <CAO=notzLZR-jiYTf8NdebLL9kUyLuxCPoJS2OqG5MsvGZRUKhQ@mail.gmail.com>
 <CACPK8XdQT1ViGGK0dUuwBUe+RmcR6KC9Hjnq3ywY3vCK72XOBg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 7 Nov 2017 20:26:52 +1030
X-Google-Sender-Auth: Kuf6nKirVSXG7dVAVnZ_W96egAM
Message-ID: <CACPK8XdZt90BxUGZWioe8XQ7hpWO8yP9qXxKw-dFNMgKaF-twg@mail.gmail.com>
Subject: Re: linux 4.10 on ast2400
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Tue, 07 Nov 2017 09:57:18 -0000

On Tue, Nov 7, 2017 at 8:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Nov 7, 2017 at 11:42 AM, Patrick Venture <venture@google.com> wrote:
>> I've been doing testing with linux 4.10 on the ast2400 and on some
>> percentage (20% of systems) when they boot they're not able to really
>> launch applications.  The one we see failing is agetty, but ipmid also
>> ends up not running.  Here is the log from what we're seeing on the
>> quanta-q71l:
>>
>> [  OK  ] Started Clear one time boot overrides.
>> [  OK  ] Found device /dev/ttyS4.
>> [  OK  ] Found device /dev/ttyVUART0.
>> [   42.360000] 8021q: adding VLAN 0 to HW filter on device eth1
>> [  OK  ] Started Network Service.
>> [   42.420000] 8021q: adding VLAN 0 to HW filter on device eth0
>> [  OK  ] Started Phosphor Inventory Manager.
>> [  OK  ] Started Phosphor Settings Daemon.
>> [  OK  ] Reached target Network.
>>          Starting Permit User Sessions...
>> [  OK  ] Started Lightweight SLP Server.
>> [  OK  ] Started Phosphor Console Muxer listening on device /dev/ttyVUART0.
>> [  OK  ] Started Phosphor Inband IPMI.
>> [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>> [  OK  ] Started Permit User Sessions.
>> [  OK  ] Started Serial Getty on ttyS4.
>> [  OK  ] Reached target Login Prompts.
>> [  OK  ] Reached target Multi-User System.
>> [   44.530000] ftgmac100 1e680000.ethernet eth1: NCSI interface down
>> [   45.800000] ftgmac100 1e660000.ethernet eth0: NCSI interface down
>> [   49.430000] Unable to handle kernel paging request at virtual
>> address e1a00006
>> [   49.430000] pgd = 85354000
>> [   49.430000] [e1a00006] *pgd=00000000
>> [   49.430000] Internal error: Oops: 1 [#1] ARM
>> [   49.430000] CPU: 0 PID: 932 Comm: (agetty) Not tainted
>> 4.10.17-eced538e6233c50729cc107958596a1443947ba2 #1
>
> This SHA isn't in the OpenBMC dev-4.10 tree. Where are you getting
> your kernel sources from?
>
> Wherever you've grabbed it from it's out of date as the line numbers
> don't quite make sense.
>
>> [   49.430000] Hardware name: ASpeed SoC
>> [   49.430000] task: 86e1c000 task.stack: 858f6000
>> [   49.430000] PC is at unlink_anon_vmas+0x98/0x1b0
>
> We have seen memory corruption when running under Qemu. This is the
> first time I've had a report of it happening on hardware.
>
>  https://github.com/openbmc/qemu/issues/9
>
> Can you share some information with how you're booting?
>
> Are you netbooting?
>
> Which u-boot tree are you using? Does it enable networking before
> jumping to the kenrel? Or trigger any other kinds of DMA?

Can you reproduce with some debugging turned on? Build your kernel with:

 DEBUG_LIST
 PAGE_POISONING
 DEBUG_PAGEALLOC
 DEBUG_SLAB

Or even more. Take a look through the Kernel hacking menu in
menuconfig and enable things until the system slows down too much to
reproduce the issue :)

Does it reproduce if you disable the FTGMAC100 devices (set them to
status = "disabled" in your device tree, or disable them in the kernel
config)?
