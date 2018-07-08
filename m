Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gz/fSdrI"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Nf2Q1kn2zDqvV
 for <openbmc@lists.ozlabs.org>; Sun,  8 Jul 2018 16:39:25 +1000 (AEST)
Received: by mail-it0-x243.google.com with SMTP id 188-v6so22433969ita.5
 for <openbmc@lists.ozlabs.org>; Sat, 07 Jul 2018 23:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MZ6rtUxQ6IDMNWvBqWYYYZ9KIKaJxOj+mpgovKHhIpY=;
 b=gz/fSdrIfm62AThzkI5zkDA8aWaBix7VkySilJ1YAper4ByNx3uNg8ieOjJR41Qjzp
 Ooe77Xom9hYytmTurQYIqFpti6OdIQ11lGbGFEAAB2Yo3M7mA1woxXYWgf/TtSud0J02
 Q+vEqi1trxh+eWFlba79k9kk79U2hB1e53nLq2ZdW0k3hH7L4/6oC3jW42WLiaUEdItD
 jbd+QazYOnScvHa00nyZRV9FI1cuRb9c94HwQRrVpTqrw6MkI/DG13sJt/dF4Q380pRd
 L0MrXq7opOl4mApfR0vE4kd2dTz5focdfqd6f8ClMZORhzs30XA8T8Vd3fb9rqJTF66N
 PJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZ6rtUxQ6IDMNWvBqWYYYZ9KIKaJxOj+mpgovKHhIpY=;
 b=rxRIrCJlZok4aQ1Eg9SD7sJqZD1j37dei/Wl6Bu8rgzyg3ucgw9bykJLNT0F3WkxWT
 4k+sbqV84TUnNniTAB0QbS3cZ22WemMIAaozBewanK3Xh4mP7JxyVAmu+LpzFLAbb+hv
 uBIvrc5JPk4WaTGVucEDim6IwLUblWRgT1yvTAGJg1UqHrKDT0qATr9X1kZJoizxykda
 KbghUBfqPumpyo++jrJHe8DaUF0dvHiOsc3xCuwzA0lEweRrZorFnAyRQHH5AavXsV6A
 fsu5zPqq72vZmInsP19yLIgX0gaeWTun05FY7WVEfgJv2q1wsYsyB2M3or3CNopu6xqC
 +Ddw==
X-Gm-Message-State: APt69E18BFS0FFaAU6ChN0jBPdW319xPotc8IvTidyLNwnNmyQgMno7u
 6HmRFoxUnwHcLeEuh9t+z9zL7NCgzTSkW6zvMQ==
X-Google-Smtp-Source: AAOMgpdzriGoUT2SaL2OZh0g37f1avIvVDaE0ppZcwxw8b5voHjxWt9JT5VUzl4MQgAAaw8Qf9UmdqUu0Atxelnz/dU=
X-Received: by 2002:a24:5d4a:: with SMTP id
 w71-v6mr6615893ita.118.1531031963154; 
 Sat, 07 Jul 2018 23:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <ce8413d8-da27-99de-ad3b-8a353c4aa652@linux.vnet.ibm.com>
In-Reply-To: <ce8413d8-da27-99de-ad3b-8a353c4aa652@linux.vnet.ibm.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 8 Jul 2018 09:39:12 +0300
Message-ID: <CAKKbWA64T6BFEK3A6nC+NEyF8Bq+gVCUAkZLtFmZmg89pogfCA@mail.gmail.com>
Subject: Re: [RFC] IKVM prototype with only video
To: eajames@linux.vnet.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: andrew@aj.id.au, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Ed Tanous <ed.tanous@intel.com>, uri.trichter@nuvoton.com,
 eyal.cohen@nuvoton.com, 
 CTCCHIEN@nuvoton.com, KWLIU@nuvoton.com, LCCHEN@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jul 2018 06:39:28 -0000

Hi all,

Nuvoton NPCM7xx has a standard VNC server application that can be used
by any VNC client, it can support any SW based compression but has HW
compression engine for hextile encoding which achives a very high
performance.
Can it be used by OpenBMC?
Should we support V4L2 regardless of our own solution?

Thanks,
Avi
On Thu, Jun 21, 2018 at 12:13 AM Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
> Hi all,
>
> I've been working on IKVM for OpenBMC and thought I would share my
> progress for any feedback. I have a working driver for the AST2500 video
> engine, and a functional view-only vnc server that runs on the BMC. This
> can be used to view the host graphics output (though it's not very
> interesting, just a login screen since I don't have any input working
> yet). I have it running at 24 fps, using ~2.8 Mbps network (the jpegs
> are about 15KB, x24 -> 380KB/s).
>
> Here's the gerrit entry with everything:
> https://gerrit.openbmc-project.xyz/#/c/11206/
>
> Here's my linux tree with the driver, in a pretty messy state. I wasn't
> able to get the streaming interface working with video4linux2, due to
> complications with how AST2500 engine handles the buffers, but
> performance isn't bad with basic read calls. The engine stays running
> and read() just grabs the latest frame.
> https://github.com/eddiejames/linux/commit/94b4c9b76d9ec58c5cc08527ca203741f17929c9
>
> And here's the vnc server, which does require a small extension to
> libvncserver in order to transfer raw jpegs, and of course all the vnc
> code to only transfer changed blocks isn't used at all.
> https://github.com/eddiejames/obmc-ikvm
>
> Let me know if anyone has any thoughts! Will work on getting input
> working next.
>
> Thanks,
>
> Eddie
>
