Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ILzLqjJH"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wjyp3F7fzF3bs
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 01:13:54 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id a202-v6so8703160oib.1
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 06:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w8mII/NKavrFtejuODjyPx1ghebQt+L4YmvqRN9vmFc=;
 b=ILzLqjJHLwzeDIPYmZdBN6lgv3RJ1lV9a2ridAdWCVZp5BIUKJA15iehQj6FSF2P1k
 Fz3zGNvH18nGwoO0QgUZV7REN5qfirzQn4JOWTxPowMsxmoQhYLPzqIf8tP4M7ZH85N3
 qUicyvTicDr/PhoFKSLdtGUuW7orsqGnzpyX3EWDkPJAqPlIea3rNB+DijwflfM4nmCK
 /64hyqRlVLa6Ny/MZyBdNV0+tXgdstpYikFL9JwMQxmE0TW2NJSe6U89HgtLOpxc/luV
 DeMqD89DOAJ74NMjppes73ld+slEYQX/YIGisarSmXC3BqlwOlR7iqgYK6rn+2X5iwZ1
 xJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w8mII/NKavrFtejuODjyPx1ghebQt+L4YmvqRN9vmFc=;
 b=U+dZzvyoA1wJ57WEuCv9MsewEmwlfbVL+eJTwc/8qgs6NlQChYkrOZrE5WfXnGiol2
 qf6kH7s4Mba25i0ahLupQ+nMSBUHWVOPb4pLKyMZG/A12FLes/6qGjollL13gX/j+Y6c
 XAgxuIcrjAx7gNmRUR7cXP+eUOW166zgBj5/EXFKvKwr3mWFSoXrvwGR3yBn2jkiK8zp
 A//Folm2ZNTftbpwooW+zc+uaDzT7hIhy1y6rtRH0LbWFQWcURV2OYF/2wmDPpCHXUTT
 ir7IjHO0k9c9uZ2VwA8x1dz8Ae9cTLCr/G7h3AWuaDp1IlEODyQT9oRyPOlbGAT+zP3u
 xJJQ==
X-Gm-Message-State: AGRZ1gLhF0s7TCOoIMdWkAhLubbH9u0nivA9Vp3ToBwGRxfbBKhFUAYd
 IOzDZCRxpzv3Rxg5aP/flgx/jpBa2eIBZJqC7QRBcu5p+Js=
X-Google-Smtp-Source: AJdET5eV/EdPZjCxGASZP41UeHqRIGkP/TP7qOKvPvCLmeoha62BXIdoDo+doKPINl8muyk6Z1EFf7xOtPKHkB6FLFw=
X-Received: by 2002:aca:bed6:: with SMTP id
 o205-v6mr3513122oif.294.1542291232101; 
 Thu, 15 Nov 2018 06:13:52 -0800 (PST)
MIME-Version: 1.0
References: <000201d47cb4$495ee3e0$dc1caba0$@linux.intel.com>
In-Reply-To: <000201d47cb4$495ee3e0$dc1caba0$@linux.intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 15 Nov 2018 08:13:35 -0600
Message-ID: <CALLMt=ofV09ZW8bUvvySfefXzyqhVzeB+UyC7nqkBKEUCjQMSg@mail.gmail.com>
Subject: Re: qemu does not work for the latest image?
To: Yong Li <yong.b.li@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, yong.b.li@intel.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 14:13:55 -0000

On Thu, Nov 15, 2018 at 1:25 AM Yong Li <yong.b.li@linux.intel.com> wrote:
>
> Hi All,
>
>
>
> Previously I can use qemu to test these built images, but it does not work now and get the below error messages:
> Just want to know if there is any command/options changes? Or it does not support now?

Hey Yong, I pulled down the latest qemu binary and witherspoon image
and it booted up fine for me.

Here were my commands:
wget https://openpower.xyz/job/openbmc-qemu-build-merge-x86/lastSuccessfulBuild/artifact/qemu/arm-softmmu/qemu-system-arm
wget https://openpower.xyz/job/openbmc-build/distro=ubuntu,label=builder,target=witherspoon/lastSuccessfulBuild/artifact/deploy/images/witherspoon/obmc-phosphor-image-witherspoon.ubi.mtd
./qemu-system-arm -m 256 -M witherspoon-bmc -nographic -drive
file=./obmc-phosphor-image-witherspoon.ubi.mtd,format=raw,if=mtd -net
nic -net user,hostfwd=:127.0.0.1:2622-:22,hostfwd=:127.0.0.1:2643-:443,hostfwd=:127.0.0.1:8580-:80,hostname=qemu

> qemu-system-arm -m 256 -M witherspoon-bmc -nographic -drive file=tmp/deploy/images/witherspoon/obmc-phosphor-image-poon.ubi.mtd,format=raw,if=mtd
>
> qemu-system-arm: Aspeed iBT has no chardev backend
>
> U-Boot 2016.07 (Nov 15 2018 - 06:18:37 +0000)
>
>
>
>        Watchdog enabled
>
> DRAM:  240 MiB
>
> Flash: 32 MiB
>
> *** Warning - bad CRC, using default environment
>
>
>
> In:    serial
>
> Out:   serial
>
> Err:   serial
>
> Net:   aspeednic#0
>
> Error: aspeednic#0 address not set.
>
>
>
> Hit any key to stop autoboot:  0
>
> ubi0: attaching mtd1
>
> ubi0: scanning is finished
>
> UBI init error 12
>
> Error, no UBI device/partition selected!
>
> Wrong Image Format for bootm command
>
> ERROR: can't get kernel image!
>
>
>
>
>
> Thanks,
>
> Yong
