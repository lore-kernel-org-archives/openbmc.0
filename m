Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::229; helo=mail-io0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SOJx/XrH"; 
 dkim-atps=neutral
Received: from mail-io0-x229.google.com (mail-io0-x229.google.com
 [IPv6:2607:f8b0:4001:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409ZCv4bqwzF25R
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 02:08:55 +1100 (AEDT)
Received: by mail-io0-x229.google.com with SMTP id v13so27975882iob.6
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UNkeEJXgPj7lqEVYJLqPgVIDTMw4H709e1goJIXMoUE=;
 b=SOJx/XrHCHxBeZhRObf+0dBOaJzuntn5LZlSQE3cMXoODW8NpLW7wgJ7LZvuuBZvNU
 nqQ66h6ol13lODj/9XBU2tVrWy59GTi7VB4cLPD31dY50XByHzEKO0Gb6Hmf9jtAoqAJ
 /1kWRh4/d56vb1Nh6B1OuOvXflcBITZ5I6SrpysPfOW8HvzcpwyiUVVJ9wnvkoVo8/Mu
 IhHQbiyGtxE2asS/BOq3tVn4ffGdPSJH2NzHAeK8N/Fwwn5q8K6X8zotdCgVA32wM7b6
 HXzfwXUxrM63vT8WH7/8ZVBx9de8bseLEcLFCQ2A+VFvmleabn9sGm6kXh+Zt8JgxSmn
 7WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UNkeEJXgPj7lqEVYJLqPgVIDTMw4H709e1goJIXMoUE=;
 b=mRY/rXJYvpnJC2WP1WLxr9ZldAjuWRhOrzFNGpAiSaXWZJhNih7V+qauMCdNRVP7MU
 tfGMsTjr1PDKTK8sz5rt0eHPutYe4fgX2goNkTm6mLb859sFf4sSRyDP6U4Bo684FDvU
 rmiFn99EzukhWEheb0n8YJJ+6TjWrQ8Rb2CdCENRLF4klE8nxcnubp4GaUQUQlgisAeF
 KSTijKjJH5rloGrmwmOHuRy5UTBTpm2d2hsbTVp2/i6UHyfk62KsdWS7UJjFhiz9YiAo
 A1o9kqHXMAlNiSuFXGy4dFlcExy/jz1KglaFEWMCEWYQeZhnPzNRclQVj6354o9se6vm
 +7Zw==
X-Gm-Message-State: AElRT7FyeaoWAXZ74s721hhxR9V+mRq4PbVbWEYttjv4rj1bGwRP4jUw
 BK6+ZPbpXbFYTa0XI/Gq7eOSfDc2wu2Im++mXpg=
X-Google-Smtp-Source: AG47ELvQ8W3nf3bttiZGBptz4yq1wqT8imQ5MyAxeb7oqfmPJwkleawpyaDTV+LMTXFhWdLlkpuBNFTbUTA3oZJuIvQ=
X-Received: by 10.107.6.163 with SMTP id f35mr39250164ioi.165.1522163332872;
 Tue, 27 Mar 2018 08:08:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.11.159 with HTTP; Tue, 27 Mar 2018 08:08:52 -0700 (PDT)
In-Reply-To: <CAO=notwCxfVJGwD=m-Dc=R6EvhKgBnk8hderrmkt=QHcuGcAug@mail.gmail.com>
References: <CAO=notwCxfVJGwD=m-Dc=R6EvhKgBnk8hderrmkt=QHcuGcAug@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 27 Mar 2018 10:08:52 -0500
Message-ID: <CALLMt=rRvo+Uen-TU-VnKbJHJqnzn2ev2YJ6s2sTMYVcOz8r0Q@mail.gmail.com>
Subject: Re: BMC Health Watchdog
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 15:09:01 -0000

On Fri, Mar 23, 2018 at 11:51 PM, Patrick Venture <venture@google.com> wrote:
> I've been on a BMC health kick lately.  Mostly because it's something
> I think we all want and have different requirements.
>
> Outside of exporting the BMC health information, which could be done
> from the same watchdog daemon, -- what requirements has everybody run
> into?

I've seen some pretty interesting things in the past.
- Take a time stamp, sleep for X seconds, take time stamp and compare,
if it's off by some margin, reboot BMC (identifying some general time
skew issue with BMC)
- Periodically attempt to open, write, close, delete a test file on
all non-flash based writeable fs's, if operation fails reboot BMC
- Depending on filesystem, look for bad blocks or write limits, log
event if past some threshold
- Verify filesystem space in writeable fs's, run cleanup if possible,
otherwise log event
- Look for "bad" services, restart (yes, "bad" is vague here, but
usually revolves around fd leaks or memory leaks or lack of response
on critical interfaces)
- Custom checks (specific devices like FSI in system) - look at
errors, recover if possible

The complexity is usually with being sure to prevent situations where
you just continuously reboot your BMC and prevent debugging of the
actual issue.  Also, to ensure you don't just keep logging the same
event over and over.

>
> IIRC, the facebook presentation at the summit indicated they were
> tracking BMC health -- thoughts?
>
> Patrick
