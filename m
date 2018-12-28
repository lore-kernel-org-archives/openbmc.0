Return-Path: <ullbeking@andrewnesbit.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=andrewnesbit.org
 (client-ip=205.237.194.127; helo=smtp-out-2.mxes.net;
 envelope-from=ullbeking@andrewnesbit.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=andrewnesbit.org
Received: from smtp-out-2.mxes.net (smtp-out-2.mxes.net [205.237.194.127])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43RJsq25yvzDqCh
 for <openbmc@lists.ozlabs.org>; Sat, 29 Dec 2018 07:56:45 +1100 (AEDT)
Received: from Customer-MUA (mua.mxes.net [10.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.mxes.net (Postfix) with ESMTPSA id CD6E927540
 for <openbmc@lists.ozlabs.org>; Fri, 28 Dec 2018 15:56:40 -0500 (EST)
Subject: Re: OpenBMC Raspberry Pi
To: openbmc@lists.ozlabs.org
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
 <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
 <CAEx7e2TWbytH1xCKwDSqx-VRQPqqLXiRieaRS-pFUo1OvD2VwA@mail.gmail.com>
From: Andrew Luke Nesbit <ullbeking@andrewnesbit.org>
Openpgp: preference=signencrypt
Message-ID: <ecf9b25b-d679-f0c9-4f13-ce1673b0f7c9@andrewnesbit.org>
Date: Fri, 28 Dec 2018 20:56:36 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CAEx7e2TWbytH1xCKwDSqx-VRQPqqLXiRieaRS-pFUo1OvD2VwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Sent-To: <b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn>
X-Sender: tuffmail.com
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
X-List-Received-Date: Fri, 28 Dec 2018 20:56:48 -0000

Dear My,

It is my pleasure.

Apologies for the delay in my reply.  Unfortunately I found your message
in my "Junk" folder :-(

I'm also very glad to be able to put my spare RPi to good use, and this
is the perfect project for it.

Kind regards,

Andrew

On 17/12/2018 23:39, M. D. Truong wrote:
> Hi Andrew,
> 
> Thanks for bringing this back to top-of-mind! I'll start shuffling the
> patches upstream for inclusion into the official codebase over the
> next few days.
> 
> Cheers,
> My
> On Thu, Dec 13, 2018 at 5:34 AM Andrew Geissler <geissonator@gmail.com> wrote:
>>
>> On Mon, Oct 29, 2018 at 4:52 PM M. D. Truong <truongmd@gmail.com> wrote:
>>>
>>> Hi all,
>>>
>>> OpenBMC on Raspberry Pi seems to have a bit of interest as a
>>> stand-alone reference platform. The source has teased the possibility
>>> of running OpenBMC on an RPI, so I bit and took a few cycles to make
>>> it work. On a GitHub fork of OpenBMC code, sitting on the
>>> "raspberrypi-cm3" branch are some patches that will build a working
>>> distribution.
>>>
>>> https://github.com/truongmd/openbmc/tree/raspberrypi-cm3
>>
>> Hey My, this is great. Especially for people looking to get started
>> with OpenBMC. Raspberry pi's are easy to get and very
>> affordable.
>>
>> Any chance you were going to upstream these changes to
>> the OpenBMC project so we could have them officially in
>> the code base?
>>
>>>
>>> The README.md file has most of useful notes on building the code and
>>> bringing it up on a device. I'm looking for feedback on changes before
>>> pushing the code upstream. Features is a completely separate area for
>>> discussion.
>>>
>>> This was a great learning experience and I hope it's useful for others.
>>>
>>>
>>> Cheers,
>>> My

-- 
OpenPGP key: EB28 0338 28B7 19DA DAB0  B193 D21D 996E 883B E5B9
