Return-Path: <benjaminfair@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::142; helo=mail-it1-x142.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="abgA4ldZ"; 
 dkim-atps=neutral
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W81j2bRJzDqD3
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 04:32:00 +1100 (AEDT)
Received: by mail-it1-x142.google.com with SMTP id z126so4967020itd.5
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 10:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CT1S4WF0PIybjWUgCPksx4RM1Wndcf68hwh+FEW6MXI=;
 b=abgA4ldZi3N3dPN71bFforMewAWVB1+KtCrRIXK33x0pZigw3We+wcKM2MeTKlbVov
 Oo4efh+1Q/9s+AjzpU+EUYx8JSNn1T/jk5JtayUN91+XFtt2spn+l0bIl6uJpk2rybbv
 IRCVUv9yzs5jHN5pzerQebb7tCA/oWWE0pI5wLFQEleCYl+ZgAlUii0FhCGPqUI4lgKP
 sNnwPD926dxTr780XbhWL6oyenFdSEYtKownpv3IEVRbsYkNyxsv+WoNo/o1lWex6Jg0
 O2OiQVLL2OK1ec7jp53TQajWh/n+4FSWlwKlnX3xLrNjmnH+/p8FnvGp9pAHMb3CF27w
 nL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CT1S4WF0PIybjWUgCPksx4RM1Wndcf68hwh+FEW6MXI=;
 b=qzxqVrcpB2iAcIHMiD+/pClGD4Gx/s0x7GgJaWGcVHSBbsQaPeBwKlDlwb3Nz/4+Cw
 HeKrsHKMdi232vtgnhMHrYABWyg7LgYh3HZgyU5r51f1Jf1oaiOKy27LFJHokICWT9xS
 zmy+X3rzISbVaiVxQqXvSFMd4o3ItSj/Uh4Anl6O8ltZhhlhfuqu23/liARPI4+VC7rL
 RM6q/YdmK2bK8iCODphVvHQ/Y/+LTKdQZJFYbDmRNPMT5t+vu97uaQDQeaOiNu6z5S8w
 85PHIZqzFlG93P28BxiYemwBqOOFRUKdeaZkEZxr99f/QtrD9RuwqKOx74YAqXbEQURy
 tH+A==
X-Gm-Message-State: APjAAAVTBrgRpNMhLrDAdxUAx+fH0kYKS05S6Do6eNCpwi6UDsGNzIQn
 bPA0DtO1w1gZoK7trFOmdkykZqyHr+UcMquDOIXmZA==
X-Google-Smtp-Source: APXvYqwZDaHtoEgwaQZKQCWm9v61QfGQhTZwtqSauDzO4SWQvc1ajeBDJO5nN3YH1UxEFW7O9l3FtuG1XWHJtI+GIbs=
X-Received: by 2002:a05:660c:346:: with SMTP id
 b6mr5126683itl.40.1553880717087; 
 Fri, 29 Mar 2019 10:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190328235752.334462-1-tmaimon77@gmail.com>
 <367707d3-9f3f-e15b-1db3-eedb2e23981d@codeaurora.org>
In-Reply-To: <367707d3-9f3f-e15b-1db3-eedb2e23981d@codeaurora.org>
From: Benjamin Fair <benjaminfair@google.com>
Date: Fri, 29 Mar 2019 10:31:20 -0700
Message-ID: <CADKL2t6yRietvA5QrAroLxNOKYaS17k=sEjZXtVGCJZ43x_0jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: fix bad pattern in ARM/NUVOTON NPCM
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, joe@perches.com, avifishman70@gmail.com,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, Tali Perry <tali.perry1@gmail.com>,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 29 Mar 2019 17:32:10 -0000

On Fri, Mar 29, 2019 at 7:07 AM Mukesh Ojha <mojha@codeaurora.org> wrote:
>
>
> On 3/29/2019 5:27 AM, Tomer Maimon wrote:
> > In the process of upstreaming architecture support for ARM/NUVOTON NPCM
> > include/dt-bindings/clock/nuvoton,npcm7xx-clks.h was renamed
> > include/dt-bindings/clock/nuvoton,npcm7xx-clock.h without updating
> > MAINTAINERS. This updates the MAINTAINERS pattern to match the new name
> > of this file.
> >
> > Fixes: 6a498e06ba22 ("MAINTAINERS: Add entry for the Nuvoton NPCM architecture")
> > Reported-by: Joe Perches <joe@perches.com>
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> Cheers,
> -Mukesh
>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3e5a5d263f29..8b305d2f2a8a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1900,7 +1900,7 @@ L:      openbmc@lists.ozlabs.org (moderated for non-subscribers)
> >   S:  Supported
> >   F:  arch/arm/mach-npcm/
> >   F:  arch/arm/boot/dts/nuvoton-npcm*
> > -F:   include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> > +F:   include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
> >   F:  drivers/*/*npcm*
> >   F:  Documentation/devicetree/bindings/*/*npcm*
> >   F:  Documentation/devicetree/bindings/*/*/*npcm*
