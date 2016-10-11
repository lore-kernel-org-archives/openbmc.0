Return-Path: <chris@distroguy.com>
Received: from mx-out02.mykolab.com (mx.kolabnow.com [95.128.36.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stKvs6SpqzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 13:00:41 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-10 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, URIBL_RED=0.001] autolearn=ham
Received: from mx03.mykolab.com (mx03.mykolab.com [10.20.7.101])
 by mx-out02.mykolab.com (Postfix) with ESMTPS id 5B7826182D;
 Tue, 11 Oct 2016 04:00:37 +0200 (CEST)
Date: Tue, 11 Oct 2016 13:00:30 +1100
From: Chris Smart <chris@distroguy.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: openpower.xyz updates
Message-ID: <20161011020029.GB19444@distroguy.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
 <1476143058.16733.10.camel@aj.id.au>
 <20161011013601.GA19444@distroguy.com>
 <CALLMt=rTC2rgPc-_rkdVwN=o688AsKg7WvefEBrSZE48GMzRqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CALLMt=rTC2rgPc-_rkdVwN=o688AsKg7WvefEBrSZE48GMzRqA@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Oct 2016 02:00:42 -0000

On Mon, Oct 10, 2016 at 08:43:43PM -0500, Andrew Geissler wrote:
>On Mon, Oct 10, 2016 at 8:36 PM, Chris Smart <chris@distroguy.com> wrote:
>> On Tue, Oct 11, 2016 at 10:14:18AM +1030, Andrew Jeffery wrote:
>>>
>>> On Mon, 2016-10-10 at 11:09 -0500, Andrew Geissler wrote:
>>>>
>>>> I noticed our gerrit trigger job to verify userid's was broken again
>>>> this morning.  Looks like the trouble plugin (Git Client Plugin) was
>>>> upgraded again to the latest version.  Anyone out there know why/who
>>>> did it?  I'm going to put us back to 1.19.7 per my earlier comments.
>>>
>>>
>>> Joel and Chris Smart were looking at this yesterday. A job broke:
>>>
>>> https://openpower.xyz/job/openpower-op-build/184/console
>>>
>>> According to Chris it broke because of:
>>>
>>> https://bugs.eclipse.org/bugs/show_bug.cgi?id=428039
>>>
>>>    15:58 < csmart> joel, basically release() was replaced with close()
>>>    and so any plugin that uses git needs to be updated
>>>
>>> Looks like we're stuck between a rock and a hard place.
>>>
>>
>> Yep, I updated the git client plugin because openpower build couldn't
>> perform any git operations.
>>
>> I didn't expect that to affect any comms with other Jenkins instances
>> though, that is strange. Why does the gerrit userid plugin rely on on
>> git client? Do you have a log or backtrace? Might help to try and track
>> it down.
>
>Here's the fail, it's a weird one:
>https://openpower.xyz/job/openbmc-userid-verify/795/console
>
>07:05:18  > git rev-parse FETCH_HEAD^{commit} # timeout=10
>07:05:18 FATAL: org.eclipse.jgit.revwalk.RevWalk.release()V
>07:05:18 java.lang.NoSuchMethodError:
>org.eclipse.jgit.revwalk.RevWalk.release()V
>07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:185)
>07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:166)
>07:05:18 at org.jenkinsci.plugins.gitclient.AbstractGitAPIImpl.withRepository(AbstractGitAPIImpl.java:27)
>07:05:18 at org.jenkinsci.plugins.gitclient.CliGitAPIImpl.withRepository(CliGitAPIImpl.java:64)
>07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser.getFirstParent(GerritTriggerBuildChooser.java:166)
>...
>
>No bug report on my part since I didn't think it was that big an
>issue....I have been proven wrong.  I thing we have an imminent call,
>lets touch base there and I'll get one open if needed.
>

Yeah, so I think that's the same issue; release() was replaced with
close() in jgit and so any plugin that uses that needs to be updated.

This is what was breaking the openpower build and was fixed by updating
the git client plugin.

The log snippet you provided suggests to me that the gerrit trigger
plugin needs to be updated, you can see it's trying to call that
release() here:

07:05:18 FATAL: org.eclipse.jgit.revwalk.RevWalk.release()V
07:05:18 java.lang.NoSuchMethodError: org.eclipse.jgit.revwalk.RevWalk.release()V
07:05:18 at com.sonyericsson.hudson.plugins.gerrit.trigger.hudsontrigger.GerritTriggerBuildChooser$1.invoke(GerritTriggerBuildChooser.java:185)

-c

>>
>> -c
>>
>>
>>> Cheers,
>>>
>>> Andrew
>>>
>>>>
>>>> There's no fix per-se for this, jenkins is always a bit hit or miss
>>>> with it's latest LTS version working with the latest plugins.  Best
>>>> thing we can do is when we schedule our next jenkins LTS upgrade, to
>>>> try all the latest plugins again.
>>>>
>>>> Andrew
>>>>
>>>> On Fri, Sep 30, 2016 at 8:12 AM, Patrick Williams <patrick@stwcx.xyz>
>>>> wrote:
>>>> >
>>>> > On Fri, Sep 30, 2016 at 11:16:08AM +0930, Joel Stanley wrote:
>>>> > >
>>>> > > Okay. Do we plan to test the individual projects as part of an
>>>> > > openbmc/openbmc build in the future?
>>>> > >
>>>> > Yes.  https://github.com/openbmc/openbmc/issues/382
>>>> >
>>>> > --
>>>> > Patrick Williams
>>>> _______________________________________________
>>>> openbmc mailing list
>>>> openbmc@lists.ozlabs.org
>>>> https://lists.ozlabs.org/listinfo/openbmc
>>
>>
>>
