Return-Path: <david.j.cobbley@linux.intel.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=david.j.cobbley@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z28YB497fzF06p
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 09:27:57 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2017 14:27:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,433,1508828400"; d="scan'208";a="13454823"
Received: from parzival.jf.intel.com (HELO [10.54.51.76]) ([10.54.51.76])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2017 14:27:53 -0800
Subject: Re: Gerrit alternatives
To: Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20912a5f-e956-13c3-3fd4-1ba1fe9f1759@linux.intel.com>
 <CALLMt=oqzKzhHYGhC02t6z7p1f+d+2oeq52HhPB6Wr0KWXtFGQ@mail.gmail.com>
From: Dave Cobbley <david.j.cobbley@linux.intel.com>
Message-ID: <26588692-d769-00b8-faf5-104d3b13be00@linux.intel.com>
Date: Wed, 20 Dec 2017 14:27:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CALLMt=oqzKzhHYGhC02t6z7p1f+d+2oeq52HhPB6Wr0KWXtFGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
X-List-Received-Date: Wed, 20 Dec 2017 22:27:59 -0000

On 12/20/2017 12:31 PM, Andrew Geissler wrote:
> On Tue, Dec 19, 2017 at 7:26 PM, Dave Cobbley
> <david.j.cobbley@linux.intel.com> wrote:
>> Hey all,
>>
>> I am curious to see peoples input on using github as a code review mechanism
>> over gerrit. I see github/openbmc is already used quite well for sprint
>> planning and issue tracking, I feel like it would make a lot of sense to use
>> it for doing code reviews. As far as I understand it has a mechanism to
>> reproduce a similar paradigm to what we currently use today - as far as
>> Code-Review, Ok-To-Test, and Verified.
>>
>> I can see github has made several improvements over the last few years that
>> make it much more use-able to teams like us:
>>
>> - The ability to have approved maintainers for each specific repository with
>> https://github.com/blog/2392-introducing-code-owners
>>
>> - It has the ability to do a rebase-merge, keeping the git tree nice and
>> tidy.
>>
>> - A strong API to tie in additional tools that we may need.
>>
>>
>> Additionally, it will reduce the point of failure from also hosting gerrit.
>>
>> What are peoples thoughts on using this?
> As the guy who ended up having to maintain the current gerrit server,
> I'm all for an alternative :)
First off - thanks for maintaining the current Gerrit server, I'm sure 
it's as glamorous as it sounds :)
> But my problem is I really like gerrit.  github has def made some
> improvements to the review process though.  I see it has per-line
> comment ability now.
I have been using gerrit for quite a while and am quite accustomed to it 
as well.
> I have a pull request out here for a non-gerrit openbmc repo if
> someone wants to look around -
> https://github.com/openbmc/openbmc-tools/pull/5
>
> One thing I really like is how gerrit allows you to iterate over a
> commit.  Someone makes some comments, you respond, upload a new patch
> set.  My understanding with github is you basically just keep adding
> on new commits in a pull request to address comments.  A feature I use
> all the time in gerrit is to look at the diff between a patch set I
> last reviewed and the latest one.  Also, I don't see an obvious
> mechanism in github to provide the different score levels
> (-2,-1,+1,+2)?  The gerrit dashboard is also really nice, providing me
> a nice easy way to see what's on my review list and what the current
> size and scores of those reviews are (for all repos in openbmc).
It appears that iterating over commits with github is as easy. When 
someone checks in an additional commit to address some comments, you can 
open their pull request, see the newest commit, and click on the button 
which has the SHA on it, this will show you exactly what new code has 
been checked in for that commit. When the code is ready to be pulled 
into master, you can squash and merge to combine all commits into one.

You're right about the review level, the only granularity I can see is 
essentially a +0 (comment), and a +/-2 (Approve/request changes), I 
would love to find a work around to this, or see if we could work in a 
paradigm without +/- 1.

The gerrit dashboard is nice out of the box, but the github filter gives 
you the same flexibility (and a bit more). I can set: is:open is:pr 
review-requested:dcobbley to look at all reviews (awaiting reviews from 
me), or is:open is:pr review:none (reviews that has no review). I 
definitely think this issomething that people could easily adjust to.
> We also base a lot of our current CI infrastructure off of gerrit
> events.  I think most of it can be switched over to using github, but
> it's not inconsequential.
I can definitely understand an upfront cost has already been given, and 
switching to something else would require more work, but I don't really 
want that to be a blocking issue if something else does offer 
significant improvement (something I'm still trying to identify with 
github vs gerrit).
>
> Our current gerrit VM costs on the order of $60 a year....so you get
> what you pay for.  I've been poking around IBM trying to see if we can
> get something a bit more production worthy.
>
> Andrew
>
>> -Dave Cobbley
>>
Thanks for the feedback!
-Dave
