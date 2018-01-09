Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zFwrz0YcxzDqFW
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2018 13:22:25 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 348A1EA0C5;
 Mon,  8 Jan 2018 21:22:18 -0500 (EST)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: OpenBMC community telecon - 11/27 Agenda
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20180108162500.GB14421@wn7x64-4cggry1.aus.amer.dell.com>
Date: Mon, 8 Jan 2018 21:22:17 -0500
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>,
 richard.marian.thomaiyar@linux.intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9BD8564E-C2FD-4625-904C-3C5527783861@fuzziesquirrel.com>
References: <16113B02-7098-4523-A84A-E4CAFFB145A5@fuzziesquirrel.com>
 <886a66c536b44ed0928e4348022b67ca@ausx13mps334.AMER.DELL.COM>
 <D2105B22-1AB7-4943-A94E-2B5EDE275F7C@fuzziesquirrel.com>
 <ec70fdbb12b944c7a53fe03e9470f2ef@ausx13mps334.AMER.DELL.COM>
 <87k1xfvbhh.fsf@linux.vnet.ibm.com>
 <c49e89931ed74295958f09fe6ad3db80@ausx13mps334.AMER.DELL.COM>
 <20171228233714.GR113334@mauery>
 <20180104165803.GB22361@wn7x64-4cggry1.aus.amer.dell.com>
 <20180106165753.GA14421@wn7x64-4cggry1.aus.amer.dell.com>
 <39FB7457-01DC-4F28-AD9E-45CF6281F354@fuzziesquirrel.com>
 <20180108162500.GB14421@wn7x64-4cggry1.aus.amer.dell.com>
To: Michael E Brown <Michael.E.Brown@dell.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Tue, 09 Jan 2018 02:22:27 -0000


> On Jan 8, 2018, at 11:25 AM, Michael E Brown =
<Michael.E.Brown@dell.com> wrote:
>=20
> On Sat, Jan 06, 2018 at 12:33:26PM -0500, Brad Bishop wrote:
>>=20
>>> What am I missing here? You said above, "nothing should be running =
as root anymore", but I very clearly see literally everything running as =
root. I have a feeling that I am missing something important.
>>=20
>> You aren=E2=80=99t missing anything.  I think what Vernon meant was, =
in 2018, software
>> stacks should not be running everything as root.
>=20
> Oh, ok, looks like I read that in a totally different way! I was =
starting to
> get concerned, thanks for clarifying.
>=20
>> Everyone wants this, it just hasn=E2=80=99t been enough of a priority =
for anyone
>> such that it hasn=E2=80=99t been fixed yet.  It should have been done =
this way in
>> the first place.  But it wasn=E2=80=99t, so here we are.
>=20
> So, what is the best way forward? We have a time set aside at the =
hackathon to
> talk about this? What is the most productive way to use that time? I =
would be
> happy to put together some (barebones) slides to go over what we did =
in our
> product to get to where we are at. We could even do live hackathon to =
try to
> convert some daemons. What do you think?

Thanks for leading this discussion at the hackathon.  I=E2=80=99d vote =
for trying to
convert one, or at least enumerating the steps to do it to make it easy =
for
the next person that spends some time on it.  I=E2=80=99d suggest =
starting out with an
application that doesn't have any user interface component, to side-step =
the
current discussion around linux/non-linux users.  Hwmon seems like a =
good
candidate.

>=20
>> FWIW I did add some code to obmc-phosphor-systemd.bbclass quite some =
time ago
>> such that configuring a service to run as non-root is trivial, as far =
as systemd
>> unit and user/group database configuration goes.  It isn=E2=80=99t =
used anywhere because
>> the other side of it is writing the udev rules (or however you want =
to make sure
>> the devices have the correct permissions).  I also put code in
>> obmc-phosphor-dbus-service.bbclass for easy configuration of =
restrictive dbus
>> scope permissions that might help with that aspect as well.
>=20
> That sounds like a good start.
> --
> Michael
