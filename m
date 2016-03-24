Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x242.google.com (mail-ob0-x242.google.com
 [IPv6:2607:f8b0:4003:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qVrc450xmzDq5s
 for <openbmc@lists.ozlabs.org>; Thu, 24 Mar 2016 13:53:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=j8tFAep5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=VAIoMknk; 
 dkim-atps=neutral
Received: by mail-ob0-x242.google.com with SMTP id e7so2498547obv.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 19:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WqRpUKkkjyjgXQP9zLZ2UUTdbhQVVWrVnCdvXkruAtQ=;
 b=j8tFAep5IiVjGdpwzN4pj/XMQgurum9264w8MzTKj+/PpnbAJYVR0WeCtzpHRQlNOK
 /Y0CSAHJ4fSVgKFrU6weblXhQjQxofHdKyE/lGg6oY4B/xNV8tmbUsHlnLCEZpkcgkFW
 gOGJoVIk/JrWzL093P7D7h4fD7CnDe4U2QJzSOKvORXWfYwqCtU7pNUXnHbnRoI5boBf
 64GjaifwDjLRUzQChgRBojNweGj3EeOqbxKgFsMdwPKmdTRCUvoIluzMRvSUs8B1hPr5
 HT2kolJspwcOFgwwx5hg8Fk1eY2+crxYC3d/7UQhmi4fYg/YX9vr/2f1poFTLk8wZbJc
 a/WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=WqRpUKkkjyjgXQP9zLZ2UUTdbhQVVWrVnCdvXkruAtQ=;
 b=VAIoMknkkRT0w3fsJ1VQU6YEPyr81qUJYmld7844pl57un34uRKQp2bQWH7+ZiD/N4
 5fhWLjqBC1lE4p7OxRPwAmtNptF66mih0CFAQ/d/zBMJy5vTRRP8Zuu6IWmYtRoXBh+b
 sK/KXPWRgWlaqUgYX66FQpFKmTzxkEVUhIAdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=WqRpUKkkjyjgXQP9zLZ2UUTdbhQVVWrVnCdvXkruAtQ=;
 b=IrIcodRWimCZaTSn54MDHGgvx6lS7mmcJRx0kzllrVMhsKkhPcRAKvI7JQfRH6v989
 jBfPy1i+b/VvQGb2F6BIl0J4U3XOSPpFG62tOh89BSg/yZWDvx/77CwiOqhoRqkCzymx
 njNhvNgpQBkL1NNMsO6Tf0H7a4JFUBjY/DK3ZWUHlupLZEBH8xE2MSWSlVx59PnNbabJ
 oCANM+vTDGcrY1C7S5cVD+cO4DgaX2DmG37Vxm8uugoGK/OyeclucLF5zkzwKAcy1qH5
 4OTdYJTxB6xrwz6BaBLyc1WeoMwq6nX5kOkhSizACR/1iQTDVTWjpzwjTxjij4ROjKPq
 Ur3w==
X-Gm-Message-State: AD7BkJJOjBh6hGRlR1pAcRLt0uh9983gQxwyMePFD5/gqLMornv3CEq3QunttXjfQyPdvit76BSnIve8wHswjA==
X-Received: by 10.60.79.102 with SMTP id i6mr3245653oex.4.1458788033810; Wed,
 23 Mar 2016 19:53:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 23 Mar 2016 19:53:34 -0700 (PDT)
In-Reply-To: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
References: <1458720215-25302-1-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 24 Mar 2016 13:23:34 +1030
X-Google-Sender-Auth: J0Dl-ixtoriE6kZo9YK-zTym-Cg
Message-ID: <CACPK8Xf5RLxoNWTXfF4Crbgm_yp2Npewsy3epnaqCPWt=kaEGg@mail.gmail.com>
Subject: Re: [RFC PATCH openbmc v3 0/8] Add palmetto target to runqemu,
 with networking
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2016 02:54:00 -0000

LGTM, lets merge it.


On Wed, Mar 23, 2016 at 6:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi all,
>
> The patches modelling a bare-bones AST2400 in QEMU have been merged into
> master for the upcoming 2.6 release. Attached is an attempt at integrating the
> necessary bits into openbmc so we can `bitbake obmc-phosphor-image` then
> `runqemu palmetto` to boot the BMC kernel and some representation of the
> userspace.
>
> This revision includes support for slirp and tun/tap networking: The machine
> will come up at either 10.0.2.15 or 192.168.7.2 respectively. Note that the
> network controller modelled is a Cadence GEM and not the ftgmac device, which
> is a little inaccurate but means we can have networking sooner rather than
> later.
>
> The patches are also available on Github:
>
>   https://github.com/amboar/openbmc/commits/runqemu-palmetto
>
> I'd appreciate some testing and comments. I'm not sure about the approach of
> baking in the Cadence driver for both environments (hardware, qemu) for
> instance. Maybe we should use a different bitbake target altogether?
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (8):
>   meta-openbmc-bsp: Add qemu git recipe
>   runqemu: Add palmetto target
>   qemu_git.bb: Update to palmetto-bmc model with Cadence GEM
>   linux-obmc: Allow processing of multiple device trees
>   linux-obmc: Add a devicetree for QEMU palmetto-bmc machine
>   palmetto: Configure macb driver into kernel
>   palmetto: Build devicetrees for hardware and QEMU
>   runqemu-internal: Configure tun/tap network for palmetto-bmc
>
>  meta-openbmc-bsp/conf/layer.conf                   |   8 ++
>  .../recipes-devtools/qemu/qemu-targets.inc         |  22 ++++
>  meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc    | 125 +++++++++++++++++++++
>  meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb |  21 ++++
>  .../meta-palmetto/conf/bblayers.conf.sample        |   1 +
>  .../meta-ibm/meta-palmetto/conf/conf-notes.txt     |   3 +
>  .../meta-palmetto/conf/machine/palmetto.conf       |   1 +
>  ...d-qemupalmetto-dts-with-Cadence-GEM-suppo.patch |  43 +++++++
>  .../recipes-kernel/linux/linux-obmc/palmetto.cfg   |   2 +
>  .../recipes-kernel/linux/linux-obmc_%.bbappend     |   1 +
>  .../meta-barreleye/conf/bblayers.conf.sample       |   1 +
>  .../common/recipes-kernel/linux/linux-obmc_4.3.bb  |   2 +-
>  yocto-poky/scripts/runqemu                         |   9 +-
>  yocto-poky/scripts/runqemu-internal                |  16 +++
>  14 files changed, 251 insertions(+), 4 deletions(-)
>  create mode 100644 meta-openbmc-bsp/conf/layer.conf
>  create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu-targets.inc
>  create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu.inc
>  create mode 100644 meta-openbmc-bsp/recipes-devtools/qemu/qemu_git.bb
>  create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-palmetto/recipes-kernel/linux/linux-obmc/0001-arch-arm-Add-qemupalmetto-dts-with-Cadence-GEM-suppo.patch
>
> --
> 2.5.0
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
