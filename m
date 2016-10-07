Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqsFJ6BRBzDrPL
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 12:22:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sqsFJ3X3Qz9s65;
 Fri,  7 Oct 2016 12:22:12 +1100 (AEDT)
Subject: Re: [PATCH linux 14/15] drivers/fsi: Rename slave to cfam
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
 <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
 <CAA0LjjV9EUp8L6tpzJbPcmycMVZWvfdBs6jWhuHW-fMfWAK97w@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <2ef17303-606f-f570-d0e7-f577f1aee5f9@ozlabs.org>
Date: Fri, 7 Oct 2016 09:22:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAA0LjjV9EUp8L6tpzJbPcmycMVZWvfdBs6jWhuHW-fMfWAK97w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 07 Oct 2016 01:22:12 -0000

Hi Chris,

>>> Suggested changes to the patch set so far as provided by Jeremy Kerr.
>>> Rename slave to cfam to distinguish between the slave engine and its
>>> containing cfam.
>>
>> I'm still not 100% on that. As is my understanding, a (hardware) CFAM
>> contains multiple slaves, and that not what `struct fsi_slave`
>> represents (it's a single slave).
> 
> In redundant configurations yes there are two slaves.  However, any
> controlling device driver would only ever use one of them.  A redundant
> system with its own fsi device driver would be controlling the other slave.
> 
> I still maintain that there is bound to be confusion with slave->read( )
> etc... which are meant for accessing more than just the slave engine.
> cfam->read makes it more clear I think that you are accessing some
> range within the cfam, not just the slave engine.
>
> A cfam acts as a slave
> in a general sense but it doesn't distinguish itself from the slave engine.

Right, and that's where our confusion is coming from there.

In my initial series, I've used `struct fsi_slave` to represent *just*
the slave on the FSI bus, which is logically separated from the *slave
engines*. In this case, a "slave" is a different logical unit from a
"slave engine"; the latter being one of the actual functional units made
available behind the slave.

This separation is important, as each of the engines is what will be
bound to a FSI device driver, whereas the slave itself will be managed
by the core.

So we have:

  struct fsi_slave -> core slave logic, knows little about engines

  struct fsi_device -> engine logic, to be bound to a driver

(whereas a CFAM is slave + engines, right?)

Nothing outside of the core will be doing slave->read; FSI engine
drivers will be using the fsi_device API.

> I'm not sure what split out means in this case.  Git am applies each patch
> in sequence so those warnings will be hit before any patches I add to reverse
> something are applied.
> 
> I know we had discussed last week about making it clear what changes
> you had made versus mine.  As per discussion I left your changes as
> is in the patch series, then made my recommended changes as the
> next in the series.   A bit confusing on how to deal with checkpatch,
> git am, ... in those circumstances.

Yep, and if there are fixups to those patches, keep them separate from
other changes, as I'll apply them directly to my tree.

From your follow-up email, it sounds like we want some identification of
the slave HW implementation, to allow the core and drivers to work
around any HW issues.

Cheers,


Jeremy
