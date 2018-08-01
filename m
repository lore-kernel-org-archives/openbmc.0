Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gn9l2k7NzF21T
 for <openbmc@lists.ozlabs.org>; Thu,  2 Aug 2018 07:53:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2018 14:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,433,1526367600"; d="scan'208";a="76526997"
Received: from parzival.jf.intel.com (HELO [10.54.51.105]) ([10.54.51.105])
 by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2018 14:53:12 -0700
Subject: Re: Managing openbmc with subtree
To: openbmc@lists.ozlabs.org
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Andrew Geissler <geissonator@gmail.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
Date: Wed, 1 Aug 2018 14:53:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
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
X-List-Received-Date: Wed, 01 Aug 2018 21:53:16 -0000

I posted an initial draft of what permissions could look like in the top 
level meta-data.

https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11730/

This will require additional people receive +2 permissions, but the 
OWNERS plugin will ensure that a patch cannot get merged unless it has 
+2 from the appropriate people.

Thanks,
-Dave
>> On Jul 19, 2018, at 4:08 PM, Dave Cobbley <david.j.cobbley@linux.intel.com> wrote:
>>
>> Brad,
>> Trying to identify the appropriate work-flowfor using git subtree to maintain all the meta-data under openbmc.
>> I'm imagining something like:
>>
>> 17 subtrees
>> ** indicates an actual folder, not subtree.
>> meta-openembedded/
>> meta-raspberrypi/
>> meta-virtualization/
>> poky/
>> **meta-openbmc-machines/
>> ** meta-arm
>>     ├── common
>>     └── meta-qualcomm
>> **meta-evb
>>     ├── meta-evb-aspeed
>>     ├── meta-evb-nuvoton
>>     ├── meta-evb-raspberrypi
>> **meta-openpower
>>     ├── meta-ibm
>>     ├── meta-ingrasys
>>     ├── meta-inventec
>>     ├── meta-rackspace
>> **meta-x86
>>      ├── meta-intel
>>      ├── meta-mellanox
>>      ├── meta-portwell
>>      └── meta-quanta
>> **meta-openbmc-bsp/
>>      ├── meta-aspeed
>>      ├── meta-ibm
>>      ├── meta-nuvoton
>> meta-phosphor/
>>
> This is a great picture, thanks.  My longer-term vision is a bit more like this:
>
> meta-openembedded/
> meta-virtualization/
> poky/
> meta-arm/
> meta-openpower/
> meta-x86/
> meta-phosphor/
>
> Or even ditching Yocto and just using OE-Core/bitbake directly:
>
> meta-openembedded/
> meta-virtualization/
> meta/
> bitbake/
> meta-arm/
> meta-openpower/
> meta-x86/
> meta-phosphor/
>
> I could understand a case for including the BSPs in the base distro:
>
> meta-openembedded/
> meta-virtualization/
> meta/
> bitbake/
> meta-arm/
> meta-openpower/
> meta-x86/
> meta-phosphor/
> meta-aspeed/
> meta-ibm/ -> for our SOCs only, not servers
> meta-nuvoton/
> meta-raspberrypi/
>
> The main thing to notice with all of these is I’ve removed meta-foo from
> meta-openpower, meta-x86 and meta-arm.  This lets people have arm, power
> and x86 servers all in the same layer or repo if they want:
>
> meta-xyzcorp/
>     |— meta-arm-server/
>     |- meta-x86-server/
>     |- meta-power-server/
>
> Actually I’ve removed them from the repository completely.  I think we
> need some kind of reference platform(s) just like Yocto.  Otherwise we are
> going to wind up with too many server-layers in the distro.
>
> Another idea is to scrap meta-openpower, meta-arm and meta-x86
> and put all that content in meta-phosphor:
>
> meta-openembedded/
> meta-virtualization/
> meta/
> bitbake/
> meta-phosphor/
>
> What do you think of all this?  There is a lot of change here, so some
> staging would be required.  Obviously all ideas are debatable.
>
>> I began working on the workflows that a typical dev would do to check code in and have Jenkins automatically update the top level repo with the new additions, but run into troublewith a merge commit.
>>
>> 1. git clone openbmc-openbmc
>> 2. #make changes
>> 3. git add
>> 4. git commit...
>> 5. git subtree push --prefix=path/to/local/subtree ssh://openbmc.gerrit/openbmc/<subtree_name> HEAD:refs/for/master
> Looks good to me.  This should be pretty similar to the workflow
> for OE-Core -> Poky right?
>
>> At this point, the build CI would run it's normal operations and code review would take place.
>> Following a +2 and submit, Jenkins would:
>>
>> 1. cd openbmc-openbmc
>> 2. git pull
>> 3. git subtree pull --prefix=path/to/subtree --squash <remote> master #For all given subtrees
> I think I read somewhere that Poky has another verification and approval
> step here, before merging OE-Core/bitbake patches into Poky.  Do we want
> to be like Poky and require testing and/or maintainer approval here?
>
>> However at this point, I end up with two commits in the parent repo, one with the squashed changes, and a merge commit.
>> I don't know how to do this operation without ending up with a merge commit, do you have any advice here?
> To avoid the merge you can skip the subtree pull (which does a merge) and
> instead generate a patch:
>
> git cherry-pick —strategy=subtree -Xsubtree=path/to/subtree <squash-commit>
>
>> I could be totally overthinking the whole strategy,
> I don’t think so.  Its par for the course I think for an OE based distribution.
>
>> so any advice and direction is much appreciated!
>> Along those same lines, is subtree still the correct tool?
> I think so.  I had a look at Combo-layer awhile back…it seems to do the
> same thing as git cherry-pick, that is, generate patches and apply them
> to the parent repository.  It does layer some features on top of that
> but I haven’t missed those yet.  They are similar enough I feel we could
> switch back and forth if need be.  I’m guessing Combo-layer was written
> before subtrees had the support they do today in Git.
>
>> I hear repo works for a lot of projects, Yocto uses https://wiki.yoctoproject.org/wiki/Combo-layer.
>>
>> Thanks,
>> -Dave
> Thanks for kicking off this conversation!
>
> -brad
