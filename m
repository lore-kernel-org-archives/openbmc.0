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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41lLmD4rwvzDqnw
 for <openbmc@lists.ozlabs.org>; Wed,  8 Aug 2018 03:16:59 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2018 10:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,456,1526367600"; d="scan'208";a="60603620"
Received: from parzival.jf.intel.com (HELO [10.54.51.103]) ([10.54.51.103])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2018 10:16:56 -0700
Subject: Re: Managing openbmc with subtree
To: openbmc@lists.ozlabs.org
References: <00e6e0a4-027d-7a9c-ad49-363290e62c68@linux.intel.com>
 <A174348B-515D-48F9-8D41-DD8AD8260006@fuzziesquirrel.com>
 <54643fe1-d382-3df7-8630-bb5e01ea2edb@linux.intel.com>
 <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <9b967642-9c97-c7e5-7114-c024ada10a4f@linux.intel.com>
Date: Tue, 7 Aug 2018 10:16:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8E5317F7-E0B1-4A2F-B047-52B77E1AD13F@fuzziesquirrel.com>
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
X-List-Received-Date: Tue, 07 Aug 2018 17:17:01 -0000

I do agree that we can find a scriptable solution to this, however, I 
feel using the OWNERS plugin provides a much easier workflow for all 
developers, i.e. nothing changes from their perspective.

Additionally, we can still subtree on the back end after code is 
successfully merged into master.

Thanks,
-Dave

On 08/06/2018 11:47 AM, Brad Bishop wrote:
>> On Aug 1, 2018, at 5:53 PM, Dave Cobbley <david.j.cobbley@linux.intel.com> wrote:
>>
>> I posted an initial draft of what permissions could look like in the top level meta-data.
>>
>> https://gerrit.openbmc-project.xyz/#/c/openbmc/openbmc/+/11730/
> At first I was OK with this idea but instead of rushing to something
> I’d like to slow down for a sec and be sure we don’t like the other
> options.
>
> My issue with 11730 is that we wind up with different workflows for
> updating the different subtrees - for example updating meta-virtualization
> is different than updating meta-phosphor.
>
> If we go back to your original workflow where the developer pushes directly
> to the subtree repository instead of openbmc/openbmc, recall we were stuck
> on how to do it:
>
>>>> However at this point, I end up with two commits in the parent repo, one with the squashed changes, and a merge commit.
>>>> I don't know how to do this operation without ending up with a merge commit, do you have any advice here?
>>> To avoid the merge you can skip the subtree pull (which does a merge) and
>>> instead generate a patch:
>>>
>>> git cherry-pick —strategy=subtree -Xsubtree=path/to/subtree <squash-commit>
>
> Elaborating on my suggestion from before - here is a possible workflow.
>
> Consider a repository with two remotes:
>
> $ cat ~/.ssh/config
> Host openbmc.gerrit
>          Hostname gerrit.openbmc-project.xyz
>          Port 29418
>          User user
>          IdentityFile ~/.ssh/my-gerrit-key
>
> $ git remote -v
> meta-phosphor-gerrit    ssh://openbmc.gerrit/openbmc/meta-phosphor (fetch)
> meta-phosphor-gerrit    ssh://openbmc.gerrit/openbmc/meta-phosphor (push)
> openbmc-gerrit  ssh://openbmc.gerrit/openbmc/openbmc (fetch)
> openbmc-gerrit  ssh://openbmc.gerrit/openbmc/openbmc (push)
>
> You can make and commit changes as usual.  When it comes time to push for
> review:
>
> $ git checkout -b phosphor-master meta-phosphor-gerrit/master
> $ git cherry-pick —-strategy=subtree -Xsubtree=meta-phosphor <openbmc/openbmc-sha>
> $ git push meta-phosphor-gerrit HEAD:refs/for/master
>
> This gives us the same process for all subtrees, whether or not they are
> openbmc hosted subtrees.  It also does not require people hacking on a
> subtree to clone OpenBMC when it doesn’t make sense for them to do that,
> such as someone just using the Aspeed BSP layer.
>
> Granted it is a couple extra commands, but it seems like something that could
> be scripted pretty easily.  Thoughts?
>
> -brad
>
>> This will require additional people receive +2 permissions, but the OWNERS plugin will ensure that a patch cannot get merged unless it has +2 from the appropriate people.
>>
>> Thanks,
>> -Dave
