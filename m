Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xMtch0zWdzDqqQ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2017 23:01:55 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1501678909880736.0984314808015;
 Wed, 2 Aug 2017 06:01:49 -0700 (PDT)
Date: Wed, 2 Aug 2017 08:01:48 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: REST API docs
Message-ID: <20170802130148.GF14987@asimov>
References: <87y3r3ooyv.fsf@linux.vnet.ibm.com> <20170801212832.GC14987@asimov>
 <87bmnymoz2.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oFbHfjnMgUMsrGjO"
Content-Disposition: inline
In-Reply-To: <87bmnymoz2.fsf@linux.vnet.ibm.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Wed, 02 Aug 2017 13:01:56 -0000


--oFbHfjnMgUMsrGjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 02, 2017 at 05:02:41PM +1000, Stewart Smith wrote:
> Patrick Williams <patrick@stwcx.xyz> writes:
>=20
> > I don't know why this is a surprise.  We have been communicating in
> > various avenues that the /org/openbmc APIs defined for Barreleye
> > were all deprecated the day we split the 2.0 development branch.
> > I alluded to this even in the email announcing the v1.0 tag:
> >     https://lists.ozlabs.org/pipermail/openbmc/2016-June/003707.html
>=20
> API changes are reading a bit too much between the lines there to
> reasonably be actionable on.

How about specifically when I pointed the exact APIs in question in this
Feb 28th email?

* Phosphor Inventory Manager
    * Inband IPMI and IPMI EEPROM parser moved to new interfaces
    * OpenPower VPD EEPROM parser
* Phosphor Sensors from HWmon devices
* Phosphor State Management interfaces and corresponding systemd targets

https://lists.ozlabs.org/pipermail/openbmc/2017-February/006785.html

As I said, this has been brought up in various avenues throughout the
project.

> > One of the first pieces of work we defined and began working on was a
> > dbus interface YAML specification, from which we generate compile-time
> > enforced dbus bindings to ensure compatibility between applications.
> > All of the xyz.openbmc_project interfaces have formal documentation in
> > the phosphor-dbus-interfaces repository, which had its first commits in
> > October of last year.
>=20
> So something like this
> https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openb=
mc_project/Inventory
> supercedes
> https://github.com/openbmc/docs/blob/master/host-management.md#inventory
> ?
>=20
> The former certainly isn't too clear, while the original docs are. In
> fact, we explicitly call out to /usr/bin/curl and print the command line
> we're running so that we have an easy way to see what our test suite was
> doing in case somebody wants to manually recreate it for debugging purpos=
es.
>=20
> > The dbus interfaces you are _moving to_ were defined and implemented
> > in December of last year and we moved over to them as a whole within
> > the code base by Feb.  Your first commit "Initial OpenBMC support" in
> > your repository wasn't until late Feb, so you were already using the
> > wrong interfaces.
>=20
> The inital commit (738db7943eb0f090fa3db07c5200df536d0e3a4a) just used
> the SSH host console and that's it, it wasn't until June
> (64312b69acff30de8d75d80ab208c759a522a8ee) that we started to use the
> REST API at all as when we started to poke at the IPMI support in March
> (b19d231096ac27fa137eaf07b22c6deb61032e24), we quickly discovered that
> it wasn't going to be sufficient in a near enough timeframe to be
> suitable for OPAL testing.
>=20
> I personally spent a bunch of time getting our test suite to be BMC
> agnostic just to accomodate the backwards incompatibility of OpenBMC
> (notably P9 FSP systems and P9 SMC systems are backwards compatibile,
> and I don't think we had to add *any* code to accomodate them over the
> P8 systems, with one patch for SMC versus AMI BMCs).

I don't know what you are referring to here with respect to 'backwards
incompatibility'.  You did not support any 1.0 machines.  All of the
interfaces you are moving to existed before any code you wrote.  There
was nothing to be 'backwards compatible' with.

> As of the time I pulled in the code to speak the OpenBMC REST API, that
> was what was in the docs, and indeed, it's what is still there. The docs
> repository is exclusively /org/openbmc/.
>=20
> [stewart@birb openbmc-docs]$ ack -l 'org/openbmc'
> cheatsheet.md
> code-update.md
> dbus-interfaces.md
> host-management.md
> rest-api.md
> rfc-obmc-service-iface.md
> [stewart@birb openbmc-docs]$ ack -l 'xyz/openbmc_project'
> LED-architecture.md
> openbmc-systemd.md
> sensor-architecture.md

Generally speaking, docs are for stable releases, aren't they?  We
didn't make an obvious fork of the documentation between 1.0 and 2.0
partially because we were planning on documenting much of the APIs
through the YAML (which can generate .md themselves).  Based on your
experience we probably should be explicit and say these are all
deprecated for the 2.0 release.

> > We have been working very closely with the automated test group that
> > works on the openbmc-test-automation repository.  I was pretty certain
> > that within IBM there is some affinity between the team working on this
> > repository and the team working on your repository, isn't there?  In
> > fact, I clearly recall discussions within IBM questioning why the
> > op-test-framework would not be building on top of the existing Robot
> > support provided by openbmc-test-automation rather than implement
> > a different custom framework.
>=20
> There hasn't been. Recently we re-synced a bit, but just on a discussion
> level.
>=20
> There are two very different goals of the test suites too. One is to
> test OpenBMC itself, while the other is to test host firmware, and
> largely incidentally test the BMC implementation.
>=20
> A while ago (January) there was a pull request r.e. Robot tests for
> op-test-framework
> (https://github.com/open-power/op-test-framework/pull/74 ) but for a
> couple of reasons this didn't go anywhere. My biggest issues were that it
> just added Robot files to the repository and didn't integrate at all
> with the existing tests, nor re-implement any of them, and certainly
> didn't support running the same tests against systems based on FSP,
> OpenBMC, AMI and SMC. We have to be able to run against any of them, and
> preferably also against any/all of the simulators we use.
>=20
> I'm certainly not fundamentally opposed to Robot, it's possibly useful
> for writing some small tests. But we do get a lot of power from just
> having python
> available... e.g. https://github.com/open-power/op-test-framework/blob/v0=
=2E8/testcases/IpmiTorture.py
> which was instrumental in finding and fixing a critical customer
> issue. We can write quite sophisticated tests that do a lot of things
> concurrently (in and out of band).

Robot is python.

>=20
> While the Robot syntax may be nicer for a bunch of basic tests, it's not
> *too* bad with what we have
> (e.g. https://github.com/open-power/op-test-framework/blob/v0.8/testcases=
/OpalMsglog.py
> greps the OPAL log for warnings/errors on the host both at the petitboot
> shell and in a booted OS).

This would be a Robot action which you would continue to codify in
python.  "Ensure No Warnings or Errors" might be the Robot directive
which would point to a python function similar to this.

> > I was not aware that you had written your own test automation suite that
> > was using REST APIs and you were not relying on the existing and
> > supported openbmc-test-automation repository.  I also did not hear any
> > inquiry from you, either publicly or privately, on which APIs you should
> > be targeting for work you were doing.
>=20
> We just read the docs, and code seemed to work written to the docs (if
> it didn't, we likely would have filed a bug).
>=20
> > The deprecation plan is, and has for the entire 2.0 development branch,
> > that 1.0 and 2.0 have a complete API break and there is no attempt at
> > backwards compatibility.  A clear requirement of a 2.0 tag is that all
> > /org/openbmc interfaces have been removed and replaced by something
> > documented in phosphor-dbus-interfaces and implemented within the code
> > base.  We have been doing that at a fairly regular pace the entire
> > year.
>=20
> It'd be great if the docs repo could be updated so it was clear with the
> examples and the transition. Additionally, it'd be good if there'd be
> posts to the list saying, say "the new xyz/openbmc_project sensors API
> is now in master, we'll keep the org/openbmc/ one for the next 60 days
> before dropping it" or along those lines.

I agree the documentation should be updated.  As I said, I've been
pointing out new interfaces being available (with an implementation) in
tag messages.  There are on the order of 500 commits going in every
month.  It really isn't possible for me to know which ones someone on
the mailing list might be interested in.

As we've said since the beginning of the 2.0 stream, all work is being
tracked on github.  You can see every feature being worked on and see
exactly when it closes due to the code being merged.  I get that Linux
has amazing announcements and wikis for each release, like
kernelnewbies, but those aren't done by Linus himself and I certainly
don't have the bandwidth do it.

> Reality is that different P9 platforms are on (slightly) different
> OpenBMC builds, and not every machine we get pointed at is up to date
> with OpenBMC, so we do need to support a range of OpenBMC
> builds. Especially considering we're pretty agile in being able to swap
> between host and BMC development whenever we spot a problem in the other
> system to help someone debug (even if the solution is 'yeah, I've
> upgraded it for you').

Again, I'm not really sure how this is relevant.  All of the APIs you
were using have been available for months.

Internal to IBM, there is a firmware release group that puts together
firmware images based on our code (along side the host code) and they
support all the machines we have hardware of inside IBM.  If you
aren't running a recent one of those, it's pretty straight-forward to
recommend an update.  If you're running master yourself you're on your
own.

There have been very very few tight couplings between host firmware and
BMC firmware.  The only one that comes to my mind is the mailbox
protocol support.

--=20
Patrick Williams

--oFbHfjnMgUMsrGjO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlmBzTkACgkQqwNHzC0A
wRk3ug/9HKYvIpVzIbpQ5z1Ejf2a0pJ5duEp6obnJrs3YKBTIFbCTJzwBqlgC43z
l6+y37bmOhnFESQrgCX2Xa8HsBOldqHfQ2nzH2PHzlC8veHhBasGVSc0yX2aI2hM
C+plzjhcvAEciVHGC38oz8bVjh7Dknyba0yc3y6t2up9qssWugS0+dyleRHRM6KA
jNrJnAJL6yho/2z61ofczP/FU2ipBglxBJLa+XbU14CEoMCyG0T+n14PKyf9893t
gTjWZZh+SQQdp7utnfcecL6B6UaYz6Ee5FIsT6lYzWqde9AJRuqNbqo5Z9iGxhNl
qUuHFpcm0oFqg/QwcuYwJ3oB4wdQN3LqXKCJuEmiLCbJc/sMQjVSLLyujwf8eu3M
bjrkn+DpKQ3fU61dW61YlqKMnIFzxDDqSig2gZ7FSy/hGNC1NWDqSHkDqOak9cvT
xhb0ffOhfPyHk/b6e4KVnLySAnB1gIrH62OEXErpTGp6TV7HJ8w43BbNC0K9Cg/p
sPu+cuGglRII62Zvp4VjvrqFSRavv/8FVTkfpSkA03GmSusS8gyce/udW0azaOqc
usvVBOK/GMF9nFyz35Wr5v6RiPunmw7aMxVSpV6KhIJGbxUbbkRBActjF7Rbw14z
OTeOf+/s9Yj1Q6+7Fmv9M9IQWY5fogr/4/YIrhCQdKXMU8vSt08=
=oKDg
-----END PGP SIGNATURE-----

--oFbHfjnMgUMsrGjO--
