Return-Path: <chris@distroguy.com>
Received: from mx-out01.mykolab.com (unknown [95.128.36.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbV710kHMzDq5W
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2016 17:18:36 +1000 (AEST)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-10 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, URIBL_RED=0.001] autolearn=ham
Received: from mx03.mykolab.com (mx03.mykolab.com [10.20.7.101])
 by mx-out01.mykolab.com (Postfix) with ESMTPS id 6AA5D60D7F;
 Fri, 24 Jun 2016 09:18:28 +0200 (CEST)
Date: Fri, 24 Jun 2016 17:18:21 +1000
From: Chris Smart <chris@distroguy.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: Keeping tagged builds
Message-ID: <20160624071820.GA19037@distroguy.com>
References: <CACPK8XfhsgwsrbY+VKWk+SF0Cogr3j1f+X5r4P5uoWsgMJ0TqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACPK8XfhsgwsrbY+VKWk+SF0Cogr3j1f+X5r4P5uoWsgMJ0TqA@mail.gmail.com>
X-Mailman-Approved-At: Sat, 25 Jun 2016 03:56:10 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jun 2016 07:18:37 -0000

On Fri, Jun 24, 2016 at 04:26:38PM +0930, Joel Stanley wrote:
>Hi Chris,
>
>On Thu, Jun 23, 2016 at 5:24 PM, Cédric Le Goater <clg@kaod.org> wrote:
>> On 06/23/2016 09:24 AM, Joel Stanley wrote:
>>> On Tue, Jun 21, 2016 at 12:46 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>>> I have just tagged v1.0 and uploaded it to Github.  This is meant as the
>>>> release to support Barreleye in production capacity.  Thank you to
>>>> everyone that contributed over the last year to get us to this point and
>>>> congrats on this major milestone!
>>>
>>> Thanks Patrick. It's rewarding to know our work has made it into a product.
>>
>> It would be great to keep images of this version available. Would that be
>> possible on https://openpower.xyz/ ?
>
>Do you have any suggestions for how to do this programmaticly? Can we
>get jenkins to realise that it's tagged and retain it?

Given that Jenkins knows the git commit that it is building, we could
check to see if that commit matches a tag, and if so, we could tell
Jenkins to always keep that build.

There is a Git Tag Message plugin[1] which will do that the tag
detection for us and export some new GIT_TAG environment variables.

Then it's a matter of telling Jenkins to "Keep this build forever"
if that environment variable is not empty. I expect that we can do this
via the Build Keeper Plugin [2].

We could also update the build number to include the tag name so that it
is easily visible in the job history.

>
>Or should we set up a separate build job that triggers off tags?
>

We can do that too, but if the above works then it's probably better to
do it there so that everything is in the same spot.

-c

[1] <https://wiki.jenkins-ci.org/display/JENKINS/Git+Tag+Message+Plugin>
[2] <https://wiki.jenkins-ci.org/display/JENKINS/Build+Keeper+Plugin>
