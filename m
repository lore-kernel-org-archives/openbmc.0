Return-Path: <maxims@google.com>
Received: from mail-yb0-x234.google.com (mail-yb0-x234.google.com
 [IPv6:2607:f8b0:4002:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tD0cr5BVNzDsrT
 for <openbmc@lists.ozlabs.org>; Wed,  9 Nov 2016 07:03:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jf/k/hPa"; 
 dkim-atps=neutral
Received: by mail-yb0-x234.google.com with SMTP id d128so71266896ybh.2
 for <openbmc@lists.ozlabs.org>; Tue, 08 Nov 2016 12:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=LuoqFRl5ns2O14i/FlWwTybookWWVkrtWQvj6CkCNlc=;
 b=jf/k/hPaTu5VhzFIjtsQrz30rsBRYubAm795I4/4EPRoVFWMmaU5iCzLCmqGKqmUxi
 Ixoux2u1Xwa+/42yjxgxj5eotwbojOQxoWc7EA9niw+f8931wcS4NyUiTSScjBgcXjkn
 o47B3lgeJRSySnNTm8+KGKgLuo8p6VmWRcECcCBU0DQ7gykxAjqRSlA6wKsNAW1O1l3g
 9tJPqAGBL6+pKM7WV1tK9S12LN6QhQLtAqKA64Si+9NsYaNYnOCr8Vbnt5QKaVcwpdlD
 rXBqKZg51E0+rUPNW6Nmkm+vEVzMFI6pnqVnxjf62WtVD3KacYceuQ+U3zpT//dfLLov
 csnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=LuoqFRl5ns2O14i/FlWwTybookWWVkrtWQvj6CkCNlc=;
 b=aezdAYFFXb878wOpWXb3iwKrdP+WqBD1BgO9ph8OlS8+vqpDlQoocm36vxZ8SgOcBm
 wh5IkQJReSVtFyNCp1SbTeqkhaNqNfEvNfvD5mMapT1kXnlzCAfvbOC5B/wvIhFi39E8
 odpui+Pez7nazMxEvYNd7scQj++BhQSmf81BE1Za00Cz+okBrra3W470FeXm7JTAZoOW
 h9aax5SJrSDZn7OznOvwhfjsO4WrGTCY+UItDoaF2tx3VBFTwYjSmrdoSk1sSgV8HTg8
 Ryd+qEyRJhCPghfwA0XwR0C7O6zFdF1x3sQH/QvSFkBe0CTJLTK4ddPmy2WYd/iz+kZo
 z/NQ==
X-Gm-Message-State: ABUngvcQd4hKCYAxdMMbKteO8YsJt6Wi67VRyloozt0WDe7hN0zi2N6V9NYkQG+3BY0h85kxi0IlkeytRl6zbrQj
X-Received: by 10.37.58.196 with SMTP id h187mr14195286yba.73.1478635434034;
 Tue, 08 Nov 2016 12:03:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.192.14 with HTTP; Tue, 8 Nov 2016 12:03:53 -0800 (PST)
In-Reply-To: <CACPK8Xe-eSzBXTkCYxsjoC9nR7DsAgcPHr3hvKiBF=fZHswaWA@mail.gmail.com>
References: <CAFR_W8qYKipAMj4h8xwMCJi4=AhiYePf=d3ndCGgYzCg=qxfNw@mail.gmail.com>
 <CACPK8Xe-eSzBXTkCYxsjoC9nR7DsAgcPHr3hvKiBF=fZHswaWA@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Tue, 8 Nov 2016 12:03:53 -0800
Message-ID: <CAFR_W8r6cyhrEzcUbUeW+hi+DxkLTNdhHyBAv3uucUJF6CMUqA@mail.gmail.com>
Subject: Re: U-Boot upstreaming
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 08 Nov 2016 20:03:57 -0000

On Thu, Nov 3, 2016 at 5:09 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Maxim,
>
> On Fri, Nov 4, 2016 at 7:14 AM, Maxim Sloyko <maxims@google.com> wrote:
>> Hi Cedric,
>>
>> My manager (Rick Alther) mentioned that you were working on some minimal
>> "upstreamable" commit for Aspeed in U-Boot. How far were you able to get?
>>
>> This is also what I was thinking of doing, so we should be able to join
>> forces on this.
>>
>> I talked to Simon Glass recently (he's an active contributor to mainline
>> U-Boot) and basically that's the path that he also recommended -- just
>> getting minimal amount of code in, that can just boot to a prompt. He also
>> said that DRAM driver would have to be part of it.
>
> I agree. The downside here is Cedric has done a lot of work in
> cleaning up the Aspeed SDK code already, so we don't want to throw
> away the good stuff he's done.
>
>>
>> So, the way I see it, there are two big chunks of work here:
>>  1. Setting up the whole structure. This would include actually adding a
>> board, minimum amount of supporting code, debug serial console init,
>
> I have a tree where I've started pulling the build scaffolding -
> kconfig, makefiles, etc - out of the patch we have.
>
> The second part of it is writing a clean serial driver. The hardware a
> pretty standard layout, so I imagine we don't need to do much here.
> Perhaps doing some calculations based on the clock speed to set a baud
> rate.

To set clock speed properly we would also need clock drivers, which
might also be needed by SDRAM driver. We also might need watchdog
driver to properly implement reset_cpu (via sysreset driver,
probably). And all of these need a device tree.

It's great that things are moving out of the assembly file, but we
also need to move everything in the "u-boot way" direction.

Creating a device tree and implementing some basic drivers (clocks,
WDT) would be a good place to start.

>
>>  2. DDR3/DDR4 driver. This is the biggest part of what we have in platform.S
>> now. A lot of work, but relatively straightforward, just rewrite ~1.5k lines
>> of assembly in C.
>
> Our concern with rewriting this is future maintainability. If we
> rewrite it, it becomes harder to incorporate fixes and new hardware
> support from Aspeed SDKs.
>
> On the other hand, there's no way we can upstream it as-is. So lets
> re-write it in C, and where we can document parts of the
> reimplementation with reference to the assembly so making updates is
> possible.
>
>>
>> Personally, I don't have preference on who does what, as long as we don't
>> step on each other's toes. It would probably be easier for me to take (1),
>> because I can easily talk to two people who are in our time zone and have a
>> lot of mainline U-Boot experience.
>
> I think we've got a good handle on (1), however I'll let Cedric
> comment as to what he would prefer to work on.
>
> Note that this work is continuing on from some work done by Teddy
> several months ago. He has a tree here:
>
>  https://github.com/theopolis/u-boot-openbmc/tree/v2016.03-openbmc-r3
>
> Cheers,
>
> Joel



-- 
Maxim Sloyko
