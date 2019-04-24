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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44q7ps5XPzzDq77
 for <openbmc@lists.ozlabs.org>; Thu, 25 Apr 2019 04:18:11 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Date: Wed, 24 Apr 2019 14:18:51 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Ed Tanous <ed.tanous@intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Redfish OEM commands in OpenBMC
Message-ID: <20190424181851.fzfkef4ycqy3yuws@thinkpad.dyn.fuzziesquirrel.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
 <5978896f-712d-a2b7-3f94-3a23e7a86003@intel.com>
 <20190423135100.aelbc4w2np4lepjc@thinkpad.dyn.fuzziesquirrel.com>
 <060e7ffe-6953-c66b-483a-4600b64c7556@intel.com>
 <20190423175218.fe6rmtxrqrq35pu2@thinkpad.dyn.fuzziesquirrel.com>
 <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
In-Reply-To: <488e0e73-76d0-977e-6f20-ff91e35f6cfa@intel.com>
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 24 Apr 2019 18:18:16 -0000

On Tue, Apr 23, 2019 at 03:12:55PM -0700, Ed Tanous wrote:
>On 4/23/19 10:52 AM, Brad Bishop wrote:
>> On Tue, Apr 23, 2019 at 09:27:36AM -0700, Ed Tanous wrote:
>>> On 4/23/19 6:51 AM, Brad Bishop wrote:
>>>> On Mon, Apr 22, 2019 at 09:19:37AM -0700, Ed Tanous wrote:

>>> 2. Use LogEntry and LogService to log your PEL entries like the other
>>> 3-4 examples of logging do today.=A0 Given that schema is very broad =
it
>>> allows you to log essentially whatever you want into the message fiel=
d.
>>> This would also give the easiest time for people to port, and give yo=
u a
>>> "standard Redfish" way to download your PEL logs.
>>
>> This might be feasible.=A0 I just don't know enough about the logging
>> schema.=A0 I'll have to do some reading.

I asked around here and this is actually what we intend to do.  Create
"Event" type instances of LogEntry, and put our PEL stuff in the OEM
property.  It sounds like this is ok with you.  Can you confirm?

>>> 3. (Really not preferred) Use one of the other open source Redfish
>>> servers that supports runtime pluggable endpoints.=A0
>>
>> I guess option 3 prime is we fork bmcweb, and implement pluggable OEM
>> callbacks there :wink:
>
>This was originally listed as option seven, but I realized if you wanted
>to do this, you would've already, and likely wouldn't be bringing it up
>on the mailing list.  I'm happy to be proven wrong here that pluggable
>callbacks could be done in a non-complicated easy to follow way, but
>every option I've seen makes some really unfortunate tradeoffs in
>readability, complexity, or performance.

I don't understand what is so hard here.  Vernon was able to pull this
off with IPMI...why does this have to be any different (and in the same
vein, why is the flexibility offered and required in our IPMI core but
not our Redfish core?)

>>> The point here is mostly that all the servers that defined endpoints
>>> that were "pluggable" the way it was described ended up becoming over=
ly
>>> complicated, and IMHO lost a lot of battles because of said complexit=
y.
>>> This is not to say bmcweb is "simple" by any means.
>>>
>>> 4. Implement it as an odata endpoint, not necessarily in the Redfish
>>> tree.=A0 If your goal isn't industry compliance and acceptance, you m=
ight
>>> consider moving a level up, and simply define your endpoints as odata
>>> endpoints under a different URL tree.=A0 This would depend on your en=
d
>>> goals, that I don't fully understand at this point.
>>
>> This is the closest thing to what I had in mind.=A0 But how is this no=
t a
>> a pluggable OEM handler?=A0 Are you saying pluggable OEM handlers in
>> bmcweb are OK as long as the route being handled is outside the /redfi=
sh
>> namespace?
>
>AH, I see the confusion.  When I hear "pluggable" I assume that means
>runtime-pluggable dynamic resolution of plugins and interfaces.  If I
>understand you correctly, that's not what the "plugin" discussion was.
>We can certainly enable/disable features using the existing configure
>mechanisms at compile time.  There are already a dozen or so examples of
>enabling/disabling features at compile time, including the existing
>logging implementations.
>https://github.com/openbmc/bmcweb/blob/424c4176bbbc55c0cfd08f273b7e4500c=
977a138/CMakeLists.txt#L11
>
>We could certainly add another custom URL handler for PEL logs if that's
>the route you want to go down, although I'd personally still prefer
>option 2, as we can at least keep it somewhat in the standard.

Agreed on option #2.  However I still think you should consider runtime
pluggable dynamic resolution.

It sounds like you want everyone to put their implementations of OEM
properties right next to each other in bmcweb and surround them with
ifdefs.  Do I have that right?  Shouldn't we allow the OEM to maintain
their own implementation?  Also, when you (the bmcweb maintainer) look
at the core bmcweb/redfish code, do you want to be distracted by the
twenty implementations of an OEM property?  Does it make sense for you
to be the maintainer of code you have zero investment in?

>>> Have you asked the same question on Redfish forum?=A0 There are
>>> significantly more experts there, and they might have even better ide=
as
>>> than I do to improve your standards compliance on what you're trying =
to
>>> implement.
>>
>> No.=A0 I hope it is clear now that I really am not motivated to try an=
d
>> standardize PEL, or on the flip side, to change all of our internal
>> business processes around to make use of something else.
>
>I'm sure there's a way to work through it as a community, and I will
>fully admit that I have similar things of my own that have the same need=
.
>
>Any feature is going to be hard going if the position starts with the
>premise: "we have this feature on non openbmc systems, with a closed
>spec, we don't want to change it, and we want it implemented in openbmc
>master because we need backward compatibility".  With that said, I'm
>sure there's a way to get it in if it's something you need.

This is just the reality of the world we live in...  It is precisely why
we need robust (yes, sometimes complicated, sometimes performance
impacting, sometimes harder to read) frameworks and abstractions that
allow us to share and collaborate where it makes sense and to move
quickly where it does not.
