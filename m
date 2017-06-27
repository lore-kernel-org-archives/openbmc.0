Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wy12C2x33zDr3T
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 08:34:43 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Swampd PID-driven Fan Controller
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
Date: Tue, 27 Jun 2017 18:34:38 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FB3659C0-EF79-40D3-8001-17D9116FA522@fuzziesquirrel.com>
References: <CAO=notxJgr=+fyCaNWH+i6EL2v06aW5LkMp19uFbpYArv7FS3Q@mail.gmail.com>
To: Patrick Venture <venture@google.com>
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
X-List-Received-Date: Tue, 27 Jun 2017 22:34:44 -0000

Hi Patrick

> On Jun 27, 2017, at 12:51 PM, Patrick Venture <venture@google.com> =
wrote:
>=20
> Per the requirements to have a fan controller for the quanta-q71l that
> runs within the OpenBMC framework+, I developed the swampd
> application.  It was designed to leverage sdbusplus and other OpenBMC
> libraries and coding standards.

Sweet!  First let me say thanks for your willingness to share your
application.

>=20
> It supports:
> * build-time yaml descriptions of the sensors and PID loops
> * run-time configuration of the above
> * run-time fan speed set-point control
> * IPMI controlled manual mode
> * passively and actively read sensors
> * sensors that are from the host
> * any variation on sysfs IO that is configured.

Sounds like a solid feature set.  Can you speak to what level of support
exists for things like hot plugging and/or degraded mode operation?

>=20
> The design document is too large to really paste in this email, so
> I'll summarize.
>=20
> Each sensor is created based on the configuration provided.  Each PID
> loop is created per zone.  Each zone lives on a separate thread (could
> be merged into one thread that iterates through zones).  The zone
> loops every 0.1s to steer the fans closer to their goal while every
> second it adjusts the goal.
>=20
> Some things I know OpenBMC won't like: it's multi-threaded.  It =
wasn=E2=80=99t

True, we are trying to avoid multi-threaded applications, but if the
problem being solved by threads can=E2=80=99t reasonably be solved some =
other
way that seems fine.

> built into the current fan-presence package.

I don=E2=80=99t have any issue with this.

>=20
> I'm at a crossroads with this project because I'd like to make it
> generally available.  Should I try to submit it for review on this
> list, if so, how?  Or should I push it to Google's github projects
> first?

I think this depends on a couple factors.

As you know, another team is also developing a fan control algorithm.
If the two algorithms are similar I don=E2=80=99t see any point in =
hosting two
applications that do the same thing.  It would just make it more =
confusing
for others coming to OpenBMC to pick one or the other for their =
platform.

Now, if each provides their own unique, fundamentally different fan =
control
strategy - each with a different set of pros/cons - that is exactly what =
we
had anticipated and bringing it in seems like a great idea.

For the second factor, I=E2=80=99m going to be a little frank and =
critical, because
my point is fundamental to the project goals and vision.  Please don=E2=80=
=99t take
this personally.

This is what is known in OSS circles as a code dump.  It isn=E2=80=99t =
OSS development.
OSS development happens...in the open.  The first three bullet points =
here touch
on this:

=
https://people.redhat.com/rjones/how-to-supply-code-to-open-source-project=
s/

In an OSS development model, the entire community is given the =
opportunity
to collaborate and shape the result of the end product, =
_as_it_is_developed_
through feedback and contributions.

I=E2=80=99m no zealot.  I completely understand that many times factors =
like product
delivery schedules, etc get in the way of this model, and thats fine.  =
Thats
why most products using OSS don=E2=80=99t ship with vanilla versions of =
the project
they are based on.

But the other fan control algorithm _is_ being developed in the open.  A =
lot of
folks have invested many many hours of peer review in it.

So the question becomes, are you prepared to submit your application to =
that
same level of peer review and reciprocate by investing the time required =
to
address the feedback and get it to a point where the community feels =
comfortable
assuming maintenance responsibility for it?

Thx - brad

>=20
> +As well as other requirements.
>=20
> Thanks,
> Patrick
