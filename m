Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t92K327cmzDt1v
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 11:09:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jZV6qgfa"; 
 dkim-atps=neutral
Received: by mail-oi0-x22f.google.com with SMTP id 62so121731357oif.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=AA0R9TNyHN33kCwkm6AnhVkKgor1Qu6HSxVl0BbdiJM=;
 b=jZV6qgfackza+KDOUb302D8bfTvuFChSw72gU35M/Qq7bjSgCcBQpDa0BGBv3xAZbu
 qutiEHiCOihrmMLcsxdiUsNP+fb/TuI/YJYzmrxvKJcFpeANDaHTyVevvTKv9FWn/QoZ
 3/jLpsfHj72fZoNppZ6Z86aWdssVPQ7iyXdkbbiOoWYYFfztgwV1g5kU3Yyxr2tZFueV
 6ZCYN4Ux8WzBlfX7YxprAzYWwOys8bXHa0ezPXCbuzJJF3GuqULtMj357RWe1uUxSLmZ
 zHnpZjUR1YzBVtWJJ8PifI91AtMMtCt35zvoEXH0WYwO8dTs+SvPJAURwtmfcspXIBDD
 EbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=AA0R9TNyHN33kCwkm6AnhVkKgor1Qu6HSxVl0BbdiJM=;
 b=mw3GXhwbEkh8EsrrkiPGCDV+eSpQfZKA+7U5+LUaJX6TveYTKc55sacckjdH3hFpSj
 37o+qiYoZY1bXVCE98IH1x98b72dKZ4uyZGwCloVlhYBUqg+GEjsLMhPmk4USFhkDiUE
 yQ2Hh6QrtpSvGi/Ht93yJuCkTN9bluaUU+bRIX2PvskXTg2naJKmXDk9/EhaJ0iZUGdz
 l+R0KlrSDqI8qd0WMHMB8iSYfP4KdzZbhK0aDxg6IzFOQ+jBPS4t8JqiOo4j1L1HIXY6
 szI/5Zo2jtfS9ZqJ09dq4B2VxD5SQPTSHuePnHGCpDcae+Dmi9GcPNsgeKCzZcpIt7a2
 GgGA==
X-Gm-Message-State: ABUngvcxiU/Sn8C4CT0zd6ScPa0u57HEPSCeT7itd8weArlYalpgCeo7SavJSigdWUw3HqoLQ9+zAWQZbjZcLQ==
X-Received: by 10.202.216.136 with SMTP id p130mr10673679oig.109.1478218196555; 
 Thu, 03 Nov 2016 17:09:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 17:09:35 -0700 (PDT)
In-Reply-To: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 10:39:35 +1030
X-Google-Sender-Auth: GQTVVhFZ9Z9PsVeEr-0lvN0gFLg
Message-ID: <CACPK8Xe-eSzBXTkCYxsjoC9nR7DsAgcPHr3hvKiBF=fZHswaWA@mail.gmail.com>
Subject: Re: U-Boot upstreaming
To: Maxim Sloyko <maxims@google.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Teddy Reed <teddy.reed@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 04 Nov 2016 00:10:00 -0000

Hi Maxim,

On Fri, Nov 4, 2016 at 7:14 AM, Maxim Sloyko <maxims@google.com> wrote:
> Hi Cedric,
>
> My manager (Rick Alther) mentioned that you were working on some minimal
> "upstreamable" commit for Aspeed in U-Boot. How far were you able to get?
>
> This is also what I was thinking of doing, so we should be able to join
> forces on this.
>
> I talked to Simon Glass recently (he's an active contributor to mainline
> U-Boot) and basically that's the path that he also recommended -- just
> getting minimal amount of code in, that can just boot to a prompt. He also
> said that DRAM driver would have to be part of it.

I agree. The downside here is Cedric has done a lot of work in
cleaning up the Aspeed SDK code already, so we don't want to throw
away the good stuff he's done.

>
> So, the way I see it, there are two big chunks of work here:
>  1. Setting up the whole structure. This would include actually adding a
> board, minimum amount of supporting code, debug serial console init,

I have a tree where I've started pulling the build scaffolding -
kconfig, makefiles, etc - out of the patch we have.

The second part of it is writing a clean serial driver. The hardware a
pretty standard layout, so I imagine we don't need to do much here.
Perhaps doing some calculations based on the clock speed to set a baud
rate.

>  2. DDR3/DDR4 driver. This is the biggest part of what we have in platform.S
> now. A lot of work, but relatively straightforward, just rewrite ~1.5k lines
> of assembly in C.

Our concern with rewriting this is future maintainability. If we
rewrite it, it becomes harder to incorporate fixes and new hardware
support from Aspeed SDKs.

On the other hand, there's no way we can upstream it as-is. So lets
re-write it in C, and where we can document parts of the
reimplementation with reference to the assembly so making updates is
possible.

>
> Personally, I don't have preference on who does what, as long as we don't
> step on each other's toes. It would probably be easier for me to take (1),
> because I can easily talk to two people who are in our time zone and have a
> lot of mainline U-Boot experience.

I think we've got a good handle on (1), however I'll let Cedric
comment as to what he would prefer to work on.

Note that this work is continuing on from some work done by Teddy
several months ago. He has a tree here:

 https://github.com/theopolis/u-boot-openbmc/tree/v2016.03-openbmc-r3

Cheers,

Joel
