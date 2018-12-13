Return-Path: <ullbeking@andrewnesbit.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=andrewnesbit.org
 (client-ip=205.237.194.119; helo=smtp-out-1.mxes.net;
 envelope-from=ullbeking@andrewnesbit.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=andrewnesbit.org
Received: from smtp-out-1.mxes.net (smtp-out-1.mxes.net [205.237.194.119])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Fyw43z20zDqc1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Dec 2018 02:56:18 +1100 (AEDT)
Received: from Customer-MUA (mua.mxes.net [10.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp.mxes.net (Postfix) with ESMTPSA id C1FE827541;
 Thu, 13 Dec 2018 10:56:13 -0500 (EST)
Subject: Re: OpenBMC Raspberry Pi
To: Andrew Geissler <geissonator@gmail.com>, truongmd@gmail.com
References: <CAEx7e2SGZWe5ba9=0rSFc1-ArS9uPDhn8oLFSZMT4ygX968t9w@mail.gmail.com>
 <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Andrew Luke Nesbit <ullbeking@andrewnesbit.org>
Openpgp: preference=signencrypt
Message-ID: <40db2dd4-a10e-901d-d652-473ef75649b7@andrewnesbit.org>
Date: Thu, 13 Dec 2018 15:56:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <CALLMt=r4nUdFHTNeiemhdM1zrRVt5-zc41mG2APBC-N2YO4TOQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Dec 2018 15:56:21 -0000

On 13/12/2018 13:34, Andrew Geissler wrote:
> On Mon, Oct 29, 2018 at 4:52 PM M. D. Truong <truongmd@gmail.com> wrote:

[...]

>> On a GitHub fork of OpenBMC code, sitting on the
>> "raspberrypi-cm3" branch are some patches that will build a working
>> distribution.
>>
>> https://github.com/truongmd/openbmc/tree/raspberrypi-cm3
> 
> Hey My, this is great. Especially for people looking to get started
> with OpenBMC. Raspberry pi's are easy to get and very
> affordable.

Yes, indeed this is fantastic!!  I have a spare RPi 3B+ plus a lot of
accessories that I bought for a different project that never worked out.
 Now I can try using this for OpenBMC, which is much more exciting to me
anyway, than that other project was, and the people here are much nicer!

> Any chance you were going to upstream these changes to
> the OpenBMC project so we could have them officially in
> the code base?

Andrew, I've been gradually getting involved with OpenBMC at my own
pace, and finally have a little more time than I did six months ago.  (I
was ill over New Year, then I changed jobs, etc.  I've been very busy
with other things than computers recently ;-)

Please let me know if there's anything I can do to help.  I'd be happy
to test, write docs, perform reproducible builds, and engineer
infrastructure.

I'm a production engineer by profession (much like an SRE) and I am
considering getting involved with the OpenBMC Infrastructure Workgroup.

>> The README.md file has most of useful notes on building the code and
>> bringing it up on a device. I'm looking for feedback on changes before
>> pushing the code upstream. Features is a completely separate area for
>> discussion.

My RPi is the RPi 3B+.  Will this work out-of-the-box with your branch?

>> This was a great learning experience and I hope it's useful for others.

Congratulations on this great achievment!! :-)

Deep down I'm a fan of Orange Pi, so if all goes well I will look into
porting it to OPi :-)

Kind regards,

Andrew
-- 
OpenPGP key: EB28 0338 28B7 19DA DAB0  B193 D21D 996E 883B E5B9
