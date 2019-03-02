Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44BfjX1rklzDqNS
 for <openbmc@lists.ozlabs.org>; Sun,  3 Mar 2019 08:35:59 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Sat, 2 Mar 2019 16:36:24 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC at the 2019 OCP Summit Hardware Management track
Message-ID: <20190302213624.uuddz4pzqemnrehh@thinkpad>
References: <20190118021802.752bcjgc7oxa33m4@thinkpad>
 <20190118210913.a4kynzggtesqln5g@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190118210913.a4kynzggtesqln5g@thinkpad>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Mar 2019 21:36:01 -0000

On Fri, Jan 18, 2019 at 04:09:13PM -0500, Brad Bishop wrote:
>On Thu, Jan 17, 2019 at 09:18:02PM -0500, Brad Bishop wrote:
>> Hi Everyone
>>
>> The TSC has asked me to present at the 2019 OCP Summit on behalf of the
>> OpenBMC community.  You can see the abstract here:
>>
>> https://2019ocpglobalsummit.sched.com/event/Jil3/openbmc-project-update?iframe=no&w=100%&sidebar=yes&bg=no
>>
>> I will be hashing the presentation out in the next day or two. If you
>> have anything you think might make sense to talk about there, I'd love
>> to hear about it.
>>
>> Also, I intend to publish a draft once I have composed it, if you'd
>> prefer to leave feedback that way as well (or instead).  Stay tuned.
>>
>> thx - brad
>
>I've put a draft here:
>
>https://github.com/openbmc/openbmc/wiki/files/OCPGLO19_OpenBMC_Project_Update-draft.pdf
>
>It is still very draft-y, but you can get a sense of the outline and
>high level flow.  I could use help calling out any function implemented
>in 2.6 and any function planned for 2.7.
>
>thx - brad

Hi Everyone

The final draft was due last Thursday...I was able to get an extension
until Monday due to some personal extenuating circumstances...

I've refreshed the link above with a new version, that incorporates the
feedback I've received.  If there is any additional/new feedback, please
let me know...I can try to get it incorporated, but no promises...I
don't know if OCP will allow any additional changes.  I would still
appreciate hearing your feedback because even if I can't update the
slides, I can still bring it up during the presentation itself.  

If I get updates/suggestions prior to Sunday evening I should be able to
incorporate them without issue.

Thanks!
-brad
