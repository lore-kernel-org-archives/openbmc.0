Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x9dvC5gX1zDrCb
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jul 2017 06:53:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cHe3GGQp"; 
 dkim-atps=neutral
Received: by mail-io0-x229.google.com with SMTP id h134so34680742iof.2
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jul 2017 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nvYAjEofNmraBX/bBCutbza6H3/TprEYGbwK90Payoo=;
 b=cHe3GGQpAxDo7/UO2+zzuLQ3cqbLCIxOypxpniJHj1I3WibPjaMXZ8jgjLU3j5FDAs
 gCkQBxRj6SZfGP4wt7KOhLpf0au2zhUXOKCoCgBb+kti/aKaOgg70SNYsuoDeybYSgWt
 0LjluZdb4de57exQAH9lvuJryAJg/0jn/urJ8N2DbXnD66WZQv5ad5L9y5IUsFeKmPq4
 0AybdXo45ntXRMfKd6oyeZo8zaUs/cgT/tgeiRG0XdrDLcUyz48sho55RwkqkDR5K14T
 Wb/cYyF1bN4zuJ5Q5+oumP8iCt9vSzUgrOHz7HZK1hMFYIAmLSif+3DIIduYgi/v6oAB
 tCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nvYAjEofNmraBX/bBCutbza6H3/TprEYGbwK90Payoo=;
 b=DBa+8a953iw+phC8TzQxU7tn/NudnD0ixLSWOkPek3MwFgLiJU1KCGHMGi+eeTuIfX
 uNMO4dk5LirZmltEEmgMkoUS6dZCumB24idH1sKeKd6OkG1UjK62FmAsSpMjk0Pexf8E
 XzrJKVF5LdZyrZklc5A9kjlHniFXpmWUSVmzrM7uVf8Dd6wzA0z4GEo55dhtYkTn88a0
 5hO10rhRYwwZNVnXdAAKNAScwnGzOLWqpHRUy0RJWEQ/KehCK9ItYkRpKqwuDWM5t9wi
 g8NfZ6jIkD7zPLxMnBdD8ZYPFKAWXqdF6+bJu94sKl+YTJYdnw58K44gZ1QsSAkS99QX
 2kvw==
X-Gm-Message-State: AIVw110Ot9S0ozCrp083jAdj4x0smKOhW/Y/SIIQYS/vmb9z6lypjS7+
 tp7/rlzbMHZF1gg8pOo69f7KKm3a/A==
X-Received: by 10.107.18.132 with SMTP id 4mr16129787ios.240.1500238437076;
 Sun, 16 Jul 2017 13:53:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.170.160 with HTTP; Sun, 16 Jul 2017 13:53:56 -0700 (PDT)
In-Reply-To: <CALFfRJOOB=AJaEKzhW9yiCqbn1ymozyaTnyG9+bTn9YdPFsU_Q@mail.gmail.com>
References: <CALFfRJOOB=AJaEKzhW9yiCqbn1ymozyaTnyG9+bTn9YdPFsU_Q@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Sun, 16 Jul 2017 15:53:56 -0500
Message-ID: <CALLMt=q9qMFHoZ93Ph3X0CuXBUUFU356YFeTdStuFuUYsbzF6w@mail.gmail.com>
Subject: Re: Adding new platform
To: sachin naik <sacnaik@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 16 Jul 2017 20:54:00 -0000

On Sat, Jul 15, 2017 at 8:18 PM, sachin naik <sacnaik@gmail.com> wrote:
> Hi All
>
> I need to add new platform to openBMC. My platform is based on AST2500 SOC.
> I have created BSP layers on BSP and added all required linux standard
> drivers for my platform. I brought up the openBMC on my platform. Now I need
> a help to add all environmental device info
>
> For example I need to add all temperature sensors of my platform to BMC
> application stack so that the IPMI host/net  and REST services will work
> seamlessly.
>
> How shall I integrate my platform temperature sensors(All are hwmon class
> device) to openBMC application stack ?

Hey Sachin,

Adding in hwmon devices, is pretty easy, here's a recent example of
adding in OCC one's for Zaius:
https://gerrit.openbmc-project.xyz/#/c/5258/

Here's some other examples to look at for witherspoon.  You'll want
similar files in your machine config directory.
https://gerrit.openbmc-project.xyz/#/c/4338/
https://gerrit.openbmc-project.xyz/#/c/4401/

Andrew

>
> Any help or pointer will help me a lot.
>
> Thanks and regards
> Sachin
