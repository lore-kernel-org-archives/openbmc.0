Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sydV862q1zDsyP
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 12:56:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sydV83RrSz9sCZ;
 Tue, 18 Oct 2016 12:56:48 +1100 (AEDT)
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Christopher Bostic <christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
 <CAA0LjjWOqe7-z=QfUgTGY3zd796taS5H4wHARd6K7=_NEXjYhg@mail.gmail.com>
 <d1201620-e069-4fb9-6017-3df4a9844866@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <0c3c9834-aefd-30e6-bc22-577697fa7e95@ozlabs.org>
Date: Tue, 18 Oct 2016 09:56:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <d1201620-e069-4fb9-6017-3df4a9844866@ozlabs.org>
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
X-List-Received-Date: Tue, 18 Oct 2016 01:56:48 -0000

Hi Chris,

>> Sounds like a plan -Thanks
> 
> Excellent! I'll get that done today, and let you know when my branch is
> ready to re-pull.

OK, done. The branch at:

  https://github.com/jk-ozlabs/linux/tree/openbmc/fsi

Now has an updated base set of commits for you to rebase onto. To do
that:

   git rebase -i --onto 2b5b3ae2 <SHA>

Where <SHA> is the start of your local changes in your tree (ie,
corresponding to 16/20). In that rebase, you'll probably want to pick
111f387 (my skeleton GPIO driver), which should still be an object in
your tree, and squash 18/20 into that.

Something like this for the rebase plan:

  pick cfa927f fsi: Add empty fsi bus definitions
  pick fd18ef2 fsi: Add device & driver definitions
  pick 05d2f6d fsi: add driver to device matches
  pick 918007d fsi: Add fsi master definition
  pick 1493896 fsi: Add fake master driver
  pick cd8c30f fsi: enable debug
  pick 287b519 fsi: Add slave definition
  pick db6d868 fsi: Add empty master scan
  pick 60e3513 fsi: Add crc4 helpers
  pick 57314b2 fsi: Implement slave initialisation
  pick 47a25ff fsi: scan slaves & register devices
  pick 2b5b3ae fsi: Add device read/write/peek functions
  pick <16/20> drivers/fsi: Set up links for slave communication
  pick <17/20> drivers/fsi: Set slave SMODE to init communications
  pick 111f387 fsi: Add GPIO master driver
  squash <18/20> drivers/fsi: Add GPIO FSI master functionality
  pick <19/20> drivers/fsi: Add client driver register utilities
  pick <20/20> drivers/fsi: Add SCOM client driver

Where <xx/20> is the actual SHA of the commit, of course. These will
automatically be provided by the rebase.

Then, when squashing the GPIO patch, set the author to you, keep my
signed-off-by, and reword the commit message to the entire change.

Cheers,


Jeremy
