Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 485 seconds by postgrey-1.36 at bilbo;
 Wed, 02 Nov 2016 00:38:58 AEDT
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7XPt0WbgzDvMp
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 00:38:58 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Opinions on CLI tools.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20161031150038.zcvop7gbpu44ojsf@asimov>
Date: Tue, 1 Nov 2016 09:30:43 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1AF77AD5-4ACB-4DCF-8429-A87096312A27@fuzziesquirrel.com>
References: <20161031150038.zcvop7gbpu44ojsf@asimov>
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Tue, 01 Nov 2016 13:38:58 -0000

If there is value add in these tools, lets get those enhancements in the
associated upstream projects.  I agree with the segmentation and =
mind-share
kool-aid.

That said, the beauty of Yocto is layers, and if someone felt strongly =
about it,
this could be added as-is to a meta-<machine> or meta-<company> layer.  =
Then
the segmentation and mindshare loss would at least be confined to that =
particular
layer.

-brad


> On Oct 31, 2016, at 11:00 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> I decided we should solicit broader feedback before I merge this =
commit:
>    https://gerrit.openbmc-project.xyz/#/c/900/2
>=20
> Xo proposed adding a CLI tool, that appears to have been written and
> maintained by someone at Google, and effectively is a wrapper around a
> number of device driver calls.  Some of the facilities provided by =
this
> tool would also be provided by "upstream" tools like i2c-tools or =
pdbg.
>=20
> Last week the IBM team had a small discussion on strategies for CLI
> tools.  In our legacy product, developers tended to make many many CLI
> tools with little oversight and standards and these tools ended up
> slipping into various "bring up", "debug" and "manufacturing" scripts,
> effectively becoming "requirements".  For OpenBMC, we had proposed
> landing on the other extreme of this, which is to say we should never
> have a CLI tool as a wrapper around an existing tool or to replace
> existing upstream functionality.  (We did have one small tool we
> discussed which was to facilitate easier interaction with the DBus
> interfaces, since otherwise would require a few invocations of =
'busctl')
>=20
> One of our (my) concerns about wrappers is that we end up segmenting =
our
> own community from the broader Linux ecosystem.  Having available and
> documenting broader tools like 'i2c-tools', 'systemctl', 'journalctl'
> gives us larger mind-share with individuals outside OpenBMC that are
> already familiar with those tools.
>=20
> A key example we discussed was:
>        obmcutil power-on
>    vs
>        systemctl start host0-power-on.target
>=20
> The first is certainly "easier" for those that are totally newcomers.
> The second is only slightly more difficult but gives insight into how
> our state-management works.  With the second if someone already has
> knowledge in systemd, from their own Linux experience, that allows =
them
> to more likely probe into "what else is exposed via systemd targets?"
> rather than just expecting everything to be documented with 'obmcutil
> --help'.
>=20
> With this proposed iotools package I think we have 3 options:
>=20
> 1.  Allow it in, as is, in the debugtools image.  Even though it does
> replicate / wrap some tools, it does provide new abstractions on =
others.
>=20
> 2.  Add it to a .bbappend in only the meta-zaius tree.
>=20
> 3.  Patch the makefile (and discuss with upstream) to disable
> functionality that is already implemented by other, more widely used,
> tools like i2c-tools.
>=20
> --=20
> Patrick Williams
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
