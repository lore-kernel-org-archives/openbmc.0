Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::235; helo=mail-lf0-x235.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H20sla3Y"; 
 dkim-atps=neutral
Received: from mail-lf0-x235.google.com (mail-lf0-x235.google.com
 [IPv6:2a00:1450:4010:c07::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ybTnt4bmQzDqF4
 for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2017 12:05:22 +1100 (AEDT)
Received: by mail-lf0-x235.google.com with SMTP id 73so6091187lfu.10
 for <openbmc@lists.ozlabs.org>; Mon, 13 Nov 2017 17:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=uNErmJSJ2wQC7g2Z8Dd9ScKRRXagxhaHqJLCEjFBjjQ=;
 b=H20sla3YDZm0YhCOkP4Tjay74K8+rG9WPRYA9Bh8EDHQD8Gp1XWnuh0er2Iq1tCab9
 o0Q7hKe0WMbGvVfaYPd5qDu0+Hxqoo4RsxT0YlIrMrmU1ioO7iLIdwjXl/YbGrYDO+Oe
 z5/gRukC4+T3wyH+ZtqkOzJqfGR0XLsxILmf3hBDIRPiC/zWg6DQCVLQy8SRfSxr0OGu
 ZUhqaIUvtBHSHoQ5eVlYJS+9Rb9bcnc4ekVJi5gRKb3zQO0mD01vUAhGVvbCHWqKOArg
 gQZWgP5+wXK/z4L1mps94LJ7b5/SsTyPqj6CMM0J+7lGDdCHXIWSlj7H+it9dbAZzFZh
 lDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=uNErmJSJ2wQC7g2Z8Dd9ScKRRXagxhaHqJLCEjFBjjQ=;
 b=gWb3u5ZeKjdXdHdVPmtVh7vCFTv3Qr7RNwGCr9im0flDVvBbDV3j1txWPSasi8zjXc
 qoT5V7Y3+naGaPj3RwQTjzHu6sJyy9sVRTIFC85uIzFfTK/G3FXQeA+lX5ZPuZzuYrsQ
 njLNib+tEw2Yj8kFSx1iMB6ZCeE9eJVPaAj3jUxfumZfs3aNhFQzw8qUrssYb8cB9y6f
 Ed3Zn5ZvspQqOZN1765b1UUWRj7AAA0CF+HS9pxjA2P3oR0iZkdllUeE/wX0oNiWkOkf
 LZnLeNkMB0kue+0JPi+ZpcKKM0WVQzrQTzdQCiuI89sZ3bChWeHbeOresBifqqgjIQQi
 cBXg==
X-Gm-Message-State: AJaThX66N9TOkSdXseU3nTbxOQNN8aPrMgllNOWooIiyiQAb26kS6upc
 vHwcdWkDcypPG6FKuGYsUC9ZjbbabNRSysXh1t8=
X-Google-Smtp-Source: AGs4zMbvuGlJD+JmG2zy/HcMfs2NkuaL06UM97SfAzZQHR+lTPUlM6UkUux0DQPpVzGYgADqZoArVlTbfc6n4O0wGSE=
X-Received: by 10.25.87.12 with SMTP id l12mr3606144lfb.111.1510621517306;
 Mon, 13 Nov 2017 17:05:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.4 with HTTP; Mon, 13 Nov 2017 17:04:56 -0800 (PST)
In-Reply-To: <CAPH-5w66kJosk_D8KFKxupHz1Nh_ajeopU7DU6f3B4BvBcq0Wg@mail.gmail.com>
References: <CACPK8Xf0mLw=fGDEGwdvQ6Bycgmf3jUU8WGJJ3+8VcTUJ_9CUA@mail.gmail.com>
 <1510551468.4287.76.camel@aj.id.au>
 <CAPH-5w66kJosk_D8KFKxupHz1Nh_ajeopU7DU6f3B4BvBcq0Wg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Nov 2017 11:34:56 +1030
X-Google-Sender-Auth: 1lltEzWvdv5U6ZSi1yEIUM2gOLw
Message-ID: <CACPK8Xerp-DQ+q4=K3Aw-S+opdFch2_RbuNoz+BXYs72BbbS2A@mail.gmail.com>
Subject: Re: Yocto, Kernel and OpenBMC security maintenance
To: Xo Wang <xow@google.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Ed Tanous <ed.tanous@intel.com>
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
X-List-Received-Date: Tue, 14 Nov 2017 01:05:23 -0000

On Tue, Nov 14, 2017 at 10:44 AM, Xo Wang <xow@google.com> wrote:
> On Sun, Nov 12, 2017 at 9:37 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>> On Tue, 2017-11-07 at 15:56 +1030, Joel Stanley wrote:
>> > On todays community call we chatted about security updates for the
>> > project. Nancy pointed out that there tools in the tree that are many
>> > versions out of date and have security fixes available, but not
>> > applied to our tree.
>> >
>> > To date there has been no focused effort on ensuring known
>> > vulnerabilities are patched, weather this be backporting patches or
>> > updating to newer releases. I suggested we focus on ensuring the
>> > OpenBMC tree, as the upstream for our products, is where security
>> > fixes are applied.
>>
>> For what it's worth there's some discussion of upgrading to Yocto 2.3
>> and what we might do to better track master on the issue tracker:
>>
>> https://github.com/openbmc/openbmc/issues/2461
>>
>> I agree we need to improve how we track things such as security patches
>> that go into upstream.
>>
>> Andrew
>
> Any opinions on whether to merge point releases (e.g. currently 2.2.x
> releases) or to continuously pull in from the stable branch (e.g.
> currently yocto's morty branch)?

I maintain the openpower host firmware build system, where we use
buildroot. There I merge in point releases as a rule, but if there's a
fix in the stable tree that we need I have merged it immediately.

I propose these become our rules, in order of preference:

1. Point releases are merged in as they appear
2. If you have a fix you want merged in that is not in a point
release, we can merge the stable branch
3. If you have a fix merged upstream but not in a stable tree, we can
cherry pick that commit

> Also does anyone have objections to pulling in 2.2.2 at this time? It
> could potentially be painless. The fixes we'd get are noted in release
> notes.
> https://www.yoctoproject.org/downloads/core/morty221
> https://www.yoctoproject.org/downloads/core/morty222

Looks fine to me. Can you coordinate with Brad on how we want this done?

We should also create a plan for moving to 2.3 or 2.4.

Cheers,

Joel
