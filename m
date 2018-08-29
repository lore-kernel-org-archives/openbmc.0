Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420Tgf21cbzF0kx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 12:13:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="d7LazJL6"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 420Tgd13fvz9s1x;
 Wed, 29 Aug 2018 12:13:33 +1000 (AEST)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1535508814; bh=wnnFdblqwj72yTOdKKK2fi9wHN4cn9cx0d/blPzwHXU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=d7LazJL63mkHm2G+SknKIssa29I8gt/ohkyYznTL8fVUAbmhdTR0kGahUqjlPElMU
 E52BjM+gO0NDX7UAn9fk3Px5l8qZkms0JauuikHz9HV29im/CZhaUS3UZwmCdSIkPh
 GO7gMznWz0FPjSg2CzEI5B6DEXUgl84q8gXWeTk1aKMLyNVljphKmmbKJLZF9VQA1p
 aKKk42gVXJ+rHqs33D81T5nyoYbeFlZ/hGhKMwJBarqnFqOqYvyygHDLR4/1W92a/U
 JHBBCsqQyd1/qLJq59T2wu7FyxQSDq4jjCYB2Dp7YuJFVY2CqPy1WMKTj130HTdSXb
 J+nutqmB96amQ==
Subject: Re: SOL Logging
To: Rebecca Broekhuis <beccabroek@gmail.com>
Cc: ed.tanous@intel.com, openbmc@lists.ozlabs.org
References: <7E9441B1E5EFFD4681F54958E821699345835738@ORSMSX114.amr.corp.intel.com>
 <d94fd642-a114-1ed8-aa89-e2951848adbb@ozlabs.org>
 <CABzWfrk0XZy0SibsaUqqBDWzXa9uXSsioeF7z1HWXOts=M3y=g@mail.gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <e5ada65d-d977-4777-06d4-ec41add29b72@ozlabs.org>
Date: Wed, 29 Aug 2018 10:13:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CABzWfrk0XZy0SibsaUqqBDWzXa9uXSsioeF7z1HWXOts=M3y=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Wed, 29 Aug 2018 02:13:34 -0000

Hi Rebecca,

> You mentioned the possibility of pre-populating the scrollback buffer of 
> the console interface. I am wondering if you have any more information about
> how difficult this would be to implement.

It's easy to do, but difficult to do *correctly*.

A trivial implementation would just:
  1) serve the backlog at a specific static URL
  2) when the client established the live console connection, prepend
     the data from (1) into the session

However, getting the synchronisation between those two (as independent
channels of data) is difficult, and getting that wrong means either
missing or duplicated console data. We'd also need to handle the case
where the backlog has been rotated during the connection.

The logical fix for that would be to combine both channels into the one
stream (and further up the stack): when any client session connects to
the obmc-console server, the server replays the backlog before
outputting live data from the host. Because it's implemented
console-server-side, it would affect both web UI endpoint and the ssh
console endpoint.

The downside of that is the large amount of backlog to be transferred at
the start of the console session, which is typically when you need the
current data the most. In most cases, this could just be stale data from
a previous boot. Because of this, I think it'll be a net *loss* in
usability.

The alternative is just to make the backlog available as a separate
view, and not try to prepopulate the live console.

The console infrastructure really needs to be simple and correct; we use
it in low-level debugging, and complications in those situations can
cause major headaches. Because of this, I've tried to do no alteration
of the console data, keep the things simple, and treat the console
channel as opaque between host and client terminal.

Cheers,


Jeremy
