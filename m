Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41XJBy1YDfzDq6t
 for <openbmc@lists.ozlabs.org>; Sat, 21 Jul 2018 03:43:21 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jul 2018 10:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,380,1526367600"; d="scan'208";a="58154822"
Received: from parzival.jf.intel.com (HELO [10.54.51.105]) ([10.54.51.105])
 by orsmga007.jf.intel.com with ESMTP; 20 Jul 2018 10:42:55 -0700
Subject: Re: Managing openbmc with subtree
To: openbmc@lists.ozlabs.org
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <2193192c-f90c-e724-923c-e29f51789170@linux.intel.com>
Date: Fri, 20 Jul 2018 10:42:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
X-List-Received-Date: Fri, 20 Jul 2018 17:43:23 -0000

The closest paradigm I can figure is this:

               +---------+                   | +-------------+
               |   Dev   |                   |               | Jenkins   |
               +---------+                   | +-------------+
+--------------------------------------------------------------------------------------------------------------+
    1. Modify subtree                        |
    2. git add/commit                        |
    3. git push gerrit HEAD:refs/for/master  |
                                             |   Once +2 is given
                                             |   4. git subtree pull 
--prefix=path/to/subtree <subtree> master
                                             |   5. git checkout <ref>
                                             |   6. git reset --soft ~1
                                             |   7. git commit <with 
message from original author>
                                             |   8. git add/commit
                                             |   9. git push
    10. git pull --rebase                    |
                                             |
                                             |
                                             |
                                             +

It seems wrong to do a reset --soft. Git must have a better way of doing 
this with subtrees.

Thanks,
-Dave


On 07/19/2018 01:08 PM, Dave Cobbley wrote:
> Brad,
> Trying to identify the appropriate work-flowfor using git subtree to 
> maintain all the meta-data under openbmc.
> I'm imagining something like:
>
> 17 subtrees
> ** indicates an actual folder, not subtree.
> meta-openembedded/
> meta-raspberrypi/
> meta-virtualization/
> poky/
> **meta-openbmc-machines/
> ** meta-arm
>    ├── common
>    └── meta-qualcomm
> **meta-evb
>    ├── meta-evb-aspeed
>    ├── meta-evb-nuvoton
>    ├── meta-evb-raspberrypi
> **meta-openpower
>    ├── meta-ibm
>    ├── meta-ingrasys
>    ├── meta-inventec
>    ├── meta-rackspace
> **meta-x86
>     ├── meta-intel
>     ├── meta-mellanox
>     ├── meta-portwell
>     └── meta-quanta
> **meta-openbmc-bsp/
>     ├── meta-aspeed
>     ├── meta-ibm
>     ├── meta-nuvoton
> meta-phosphor/
>
>
> I began working on the workflows that a typical dev would do to check 
> code in and have Jenkins automatically update the top level repo with 
> the new additions, but run into troublewith a merge commit.
>
> 1. git clone openbmc-openbmc
> 2. #make changes
> 3. git add
> 4. git commit...
> 5. git subtree push --prefix=path/to/local/subtree 
> ssh://openbmc.gerrit/openbmc/<subtree_name> HEAD:refs/for/master
>
> At this point, the build CI would run it's normal operations and code 
> review would take place.
> Following a +2 and submit, Jenkins would:
>
> 1. cd openbmc-openbmc
> 2. git pull
> 3. git subtree pull --prefix=path/to/subtree --squash <remote> master 
> #For all given subtrees
>
> However at this point, I end up with two commits in the parent repo, 
> one with the squashed changes, and a merge commit.
> I don't know how to do this operation without ending up with a merge 
> commit, do you have any advice here?
>
> I could be totally overthinking the whole strategy, so any advice and 
> direction is much appreciated!
> Along those same lines, is subtree still the correct tool? I hear repo 
> works for a lot of projects, Yocto uses 
> https://wiki.yoctoproject.org/wiki/Combo-layer.
>
> Thanks,
> -Dave
