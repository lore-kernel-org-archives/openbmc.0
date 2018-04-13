Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Myh15R9qzF1gV
 for <openbmc@lists.ozlabs.org>; Fri, 13 Apr 2018 23:05:51 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9E70BEA094;
 Fri, 13 Apr 2018 09:05:47 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: reference platforms?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <4723874F-4115-4E9E-90D5-4DC2C52EF326@fb.com>
Date: Fri, 13 Apr 2018 09:05:47 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <650906BF-A79F-467F-B9C7-4CD3C9730E19@fuzziesquirrel.com>
References: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
 <4723874F-4115-4E9E-90D5-4DC2C52EF326@fb.com>
To: Sai Dasari <sdasari@fb.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2018 13:05:54 -0000


> On Apr 12, 2018, at 5:31 PM, Sai Dasari <sdasari@fb.com> wrote:
>> =EF=BB=BFOn 4/12/18, 10:41 AM, "Brad Bishop" =
<bradleyb@fuzziesquirrel.com> wrote:
>>    I think in the not-too-distant-future we are going to need a =
concept of reference
>>    platforms.
> To understand more, is the proposal to remove the bsp/machines
> layers i.e. meta-openbmc-bsp and meta-openbmc-machines?

Yes and no.  I=E2=80=99m focused on what you get when you clone =
openbmc/openbmc
and what is automatically regression tested by the project CI when it is
changed.  What is specifically added/removed depends on the =
implementation.
Here is one possibility:

github.com/openbmc/openbmc:
    meta
    bitbake
    meta-oe
    meta-virtualization
    meta-phosphor
    meta-openbmc-machines/meta-<reference-machine>
    meta-openbmc-bsp/meta-<ref-bsp>

github.com/openbmc/meta-phosphor
github.com/meta-openbmc-machines/meta-<reference-machine>
github.com/openbmc/meta-<nonreference-machine1>
github.com/openbmc/meta-<nonreference-machine2>
github.com/openbmc/meta-<nonreference-bsp>

I=E2=80=99m trying to show that when you clone openbmc/openbmc you get a =
collection
of other upstreams.  Where those upstreams are hosted doesn=E2=80=99t =
matter (to me
anyway).  I=E2=80=99m also trying to show that we can host things on the =
openbmc Github
organization that aren=E2=80=99t included when you clone =
openbmc/openbmc.

>  I wonder how to find the real BSP/machines that are supported by =
OpenBMC.

IMHO for the project to scale we can=E2=80=99t think of it in this way.  =
I would flip
the question around as:

How to find the machines/BSPs that work with OpenBMC?

In my mind OpenBMC doesn=E2=80=99t elevate or depend on some machines.  =
Its the other
way around=E2=80=A6 machines are elevated by their dependency on =
OpenBMC.  I hope that
makes sense=E2=80=A6having trouble articulating what is in my head here.

What does that mean exactly?  Something like you can do this and it =
works:
  git clone github.com/openbmc/openbmc
  cd openbmc
  git clone github.com/<awesome-company>/my-obmc-machine-layer
  bitbake obmc-phosphor-image

And if you ask the question in this way, I=E2=80=99m not sure what the =
answer is.
How do you find all the layers that work with Poky?  Can you elaborate =
on
why the answer might be important to someone?  It is a fair question but =
I
can tell you that it isn't one that IBM for example needs answered in =
order
for the project meet its product development needs.

Put another way, we _could_ build the answer to the question into the
core of the project, but why (and at what cost to the project=E2=80=99s =
ability
to scale)?  Someone could also just host a list somewhere, or maybe a
layer-index like OE has?

> Does each openbmc adopter encouraged to maintains independent github =
repo with recipes needed to bring in the openbmc code and build for =
their supported machines?=20

I think so.  The specifics of what the adopter does/maintains are up to
the adopter.  What are some pros/cons of a model like that?  This is =
what
most everyone is doing already.  They fork some part of the project (or
all of it), build on it (mostly in a machine layer?  hopefully?)  and =
then
maybe/maybe not contribute something of what they did back to the =
upstream
project.  It is my guess that this is the usual way in which product
development teams use FLOSS.

>>    Go ahead and throw crazy ideas out there.  Pay money to the =
project?  Most
>>    days without a compile failure?  There are about a million things =
we could
>>    do here - but what does everyone find fair?
> With the nature of OpenBMC supporting features needed for =
divergent/heterogeneous hardware, it might be hard to define the =
reference platform(s).


Agreed it will be tough.  Although for the heterogeneous aspect of it
could it be as simple as we just have some references per class of
thing-being-managed-by-a-bmc?

> One (crazy) idea would be to come up with a minimum acceptance test =
suite (which can be automated) that validates all the core features and =
use this for accepting new platforms as reference platforms from =
community.

This is the opposite of crazy Sai :-)

I like it, with a tweak/clarification.  Remember that one of the points =
of
a reference platform is to enable regression testing for the project.  =
So
when someone changes the common code in phosphor-hwmon for instance, we =
need
a way to test that it isn=E2=80=99t going to break as many OpenBMC users =
as we can,
without needing to test all their platforms for them.

So my clarification is that the acceptance test would not measure how =
well
a machine meets end-user requirements, but rather how well a machine =
makes
use of the project=E2=80=99s common code.  Maybe a metric measured by =
the test could
be something like least number of deviations from the defaults?
