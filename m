Return-Path: <joel.stan@gmail.com>
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com
 [IPv6:2a00:1450:4010:c07::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xbWW93DnwzDqMM
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 21:22:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BpVcNjEy"; 
 dkim-atps=neutral
Received: by mail-lf0-x22a.google.com with SMTP id y15so65301201lfd.5
 for <openbmc@lists.ozlabs.org>; Mon, 21 Aug 2017 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=9ln/1OuizNXphA+sOvtVxHbEXf0KtzBuUN/HQaH84As=;
 b=BpVcNjEy291c9cVv6CoxoFDIRDBRnHQwH3rTcid+2jSuyJXGPZAQeQR+gJTsjuLssO
 CHomK50yxv8xVrCLnRnH+rTZ/U7ubAr4JFoJTh1bJFMkyaLHAlYGqx5dwFa3anfmX6xA
 MO+eNhEBVdB6p7ryIBExMI6avwLv+3WOz97fSNUuj0jbP48PX2UllABi2eNtMx8iTBFv
 ggLkxngpuNBmg9QHDqNTeh/w4RzkGJ1Gho4HG9E/e7EvANNdYvazgztd1oydKmgnIBmE
 jFncDR/JkreViZ8sRxfGLpmHanMUzS5Yb0UJvTCqYxuFEaZtZoo1PnxtcXmjUZw/TCf8
 2SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=9ln/1OuizNXphA+sOvtVxHbEXf0KtzBuUN/HQaH84As=;
 b=pdDWaOvbTuVij4+du6bZLyicMeqnuON0r+xT2AcXnCRVClNg3WtHdlCa0YYLBZx8/Z
 cmmVVoSSgptg6MM6G+Y6LBapKSyOUSTMvAtrKkJPbZmfrqELIX7DYbgMduJOFtkSUjgZ
 7RsqexPCLxHk8vd8/O4uxSCYOOiV8Sj6rc68jrI4dL5kdHEiBfhLIOAWTsr2Cb5Vxbmn
 dpSQ1T7nPIc0OWtSUJFGX2/pwuHCB1Ggsm1Ku58OmRKeol6/tAbsup6ABSDnVW0ywZlL
 GEcL3WXQchcLZ0rKGErUByDvGizu6hNm/LWMvpZQbUCjzEe88+DsuhlmMQ59gUYcMife
 fNQw==
X-Gm-Message-State: AHYfb5gQZyzZ/b4Nb0N3K6BTr300WlNwMDR5E1+q+4bQ4rYbxMIPvZOM
 sygSaC7Kpa5aP4z5Gw+bR8S1WoCE8OArKJY=
X-Received: by 10.25.202.9 with SMTP id a9mr597774lfg.85.1503314545524; Mon,
 21 Aug 2017 04:22:25 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.72.77 with HTTP; Mon, 21 Aug 2017 04:22:04 -0700 (PDT)
In-Reply-To: <DM5PR1201MB0171FC7B8400A4193427C5D5B8880@DM5PR1201MB0171.namprd12.prod.outlook.com>
References: <DM5PR1201MB0171FC7B8400A4193427C5D5B8880@DM5PR1201MB0171.namprd12.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Aug 2017 20:52:04 +0930
X-Google-Sender-Auth: ma_kIbhq4C00hS5Mo6wYLrgJVXw
Message-ID: <CACPK8XdWGzL1B5-yMB-V1Zr-v28UHKjwPR3fF24LzydCgCHS9Q@mail.gmail.com>
Subject: Re: New design for file system layout and code update
To: Milton Miller <mdmii@outlook.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 21 Aug 2017 11:22:30 -0000

Hi Milton,

Thanks for the write-up. We weren't yet looking for something as comprehensive,
but thanks for the attention to detail here. Before we get too far ahead though,
there are a few questions about the higher-level design (quotes are from your
doc):

Firstly, a clarification about the kernel: your doc mentions that
it'll be present (as the raw kernel binary) in a UBI volume, but
the discussion today you mentioned that it will be a raw flash area.
Can you clear that up?

> All distribution images (except Das U-boot and its environemnt)
> will be stored in seperate ubi volumes named by their image type.
> A hash of version identifiers will be generated during deployment
> to make unique image names.
>
> The kernel and its device tree will be stored in a fit image
> in a ubi volume.

Am I correct in assuming that this allows us to be flexible in the
partition sizing? ie, we can perform single-volume updates at runtime
that may be larger than the space originally allocated for that volume?

[ie, with the partitioned mtd scheme that we have now, increasing
a partition beyond its original size isn't possible without
having to shuffle the data around]

If so, this would be a fairly significant reason for adopting the
UBI-volume-based approach.

> To support a total flash chip failure, each flash chip will
> contain an independent ubi device.  The mtd_concat driver will not
> be used to form an ubi device that spans flash chip boundaries.
>
> Both the primary chip (mtd label bmc) and alternate chip (mtd
> label alt) will contain a complete copy of u-boot, and a redundant
> environment, and kernel images.  For space reasons root squashfs
> volumes may be on a different ubi device than the kernel.

Do we really need this though? It seems that the functionality that the
hardware provides here (flipping to a completely independent backup flash)
gives us a simple, fail-safe mechanism for disaster recovery.

Using some components from "primary" and some from "secondary" seems
like an invitation for incompatibility issues.

If we do continue with this approach, how will it interact with the
auto-fallback via chip-select?

> Since all binaries will exist in the root file system, systemd can
> be started directly from the squashfs without an intermediate
> initramfs.  Eliminating the initramfs will remove the requirement
> to build and store it, however, it also requires the bootloader
> to will need to specify how to locate the root filesystem.

So we'd also be moving from the current initramfs-based flashing
mechanism to something that requires the rootfs to be working, right?
That is a bit concerning, as it means that more infrastrcuture
needs to be working & correct to be able to boot *anything*,
including recovery. Or have I read the design incorrectly here?

How about something like:

 - completely independent primary & backup images, and use the
   BMC's watchdog to revert to the backup on severe boot problems

 - kernel and initramfs as (raw) UBI volumes, with u-boot having
   support to boot from those

 - rootfs (ro) + /var (rw) [plus whatever else is required] as
   UBI volumes, likely with squashfs for ro and jffs2 for rw.

That means:

 - we still have a fairly simple path to boot to initramfs, which
   allows for system recovery

 - kernel, initramfs and filesystem sizes are not fixed, and can be
   modified during firmware update

How does that sound?

Cheers,

Joel
