Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ymDmz5w1xzDrZV
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 17:49:54 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1511851787.13581.73.camel@fuzziesquirrel.com>
Subject: Re: RFC: multiple system configurations in a single image
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Tanous, Ed" <ed.tanous@intel.com>, Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 28 Nov 2017 01:49:47 -0500
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F4A8FE6@ORSMSX114.amr.corp.intel.com>
References: <1511817272.13581.27.camel@fuzziesquirrel.com>
 <CAO=notxaO+m3oCGJxHZhhaUhqh-t9ahENgpVrSBy4JysFeiHEw@mail.gmail.com>
 <7E9441B1E5EFFD4681F54958E82169932F4A8FE6@ORSMSX114.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 28 Nov 2017 06:49:56 -0000

On Mon, 2017-11-27 at 23:39 +0000, Tanous, Ed wrote:
> Thanks for bringing this up Brad.  I was planning on sending this out
> after the technical call, but you beat me to it.  You did a great job
> summarizing our main points.
> 
> One key takeaway from this is the end goal that's driving our
> desires:  Platform ports should take a single developer less than a
> week to accomplish, and have a high (90%+) reliability of being
> functionally correct.  With all 

I want this too.  There are probably a lot of ways we can achieve this.

> 	
> > Extra pro: you can edit it at run-time and relaunch the application
> > :)
> 
> This is exactly our use case we wanted to outline with the
> patch.  Consumers of the platform may choose to change parameters at
> runtime (manufacturer ID or platform ID are good examples in the
> patch, fan control tuning is an example not in the patch).  Lots of
> customers require runtime configurability without recompiling, as
> uploading an unsupported image would void warranties for production
> commercially supported platforms from most manufacturers.  Also,
> making this runtime configurable is a huge win for the end user that
> doesn't necessarily have the expertise to execute a yocto build and
> sign it appropriately.

I probably did not frame things correctly because I don't think we are
having the right conversation.

To be clear, I support a model that allows us to realize all the wins
you and Patrick have outlined.  I understand that for many, the option
of dropping a new config file in the filesystem and restarting an
application is convenient or even paramount.

What gives me pause, is achieving this in a way that requires a
specific implementation from users that _dont_ care about these things,
or worse, conflicts with their use-case.  By users here I mean
businesses building products with OpenBMC.

I think we can enable both.  The only case I've heard for not doing
that is it would be too complicated.  Are there other reasons besides
the complexity?  I agree it would be _more_ complicated.  But is it
fair to dismiss something as _too_ complicated when we haven't even
discussed how it could be done?

So my ask here, to everyone, is that we attempt to come up with some
ways to enable both classes of users, and only then evaluate if the
extra complexity involved with enabling both classes of users is worth
it or not.

Another approach here might be, we can very carefully attempt to
anticipate every use-case of OpenBMC, and convince ourselves that the
proposed path forward won't have a negative impact on those potential
use-cases.  Yet another approach could be that we as a community simply
make assertions about what we are (or are not) willing to support.  I
don't like these options because they are either prone to faulty
assumptions or overly restrictive, but I bring them up because they are
understandable points of view.

To really drive this home, consider this hypothetical scenario:

1 - Assume we've refactored all the phosphor applications to read a
json config file out of the root filesystem.

2 - Someone comes along and refactors the phosphor applications (again)
in a way that preserves the runtime configuration ability and
additionally enables a user to skip the runtime pieces.

3 - What do we do?  Reject the enhancement?  What would the given
rationale be?

> 
> > > not-so-good:
> > >   - complexity shift from build to runtime (parsing, validation)
> 
> In our experience with other BMC codebases, this complexity shift
> leads to a very clear distinction on what is supported by the runtime
> and provides a clear distinction between the "core" (code running
> that's common) and the "platform" (the data that's driving it).
> The Facebook openbmc implementation has a very similar structure for
> JSON based runtime configurability separated from the core but does
> it in multiple files.  An example of fan control is here:
> https://github.com/facebook/openbmc/blob/helium/meta-facebook/meta-fb
> tp/recipes-fbtp/fscd/fscd/fsc-config.json 
> It does not take the "single file" approach, but in discussions with
> Sai, they were open to moving that direction.
> 
> > There is a downside to delayed validation, however, the parsing is
> > a "one-
> > time" start-up cost for the applications.  Also, it might be
> > cleaner in terms of
> > one system file describing everything that all the different
> > daemons can
> > parse... there are certainly a few different approaches to this.
> 
> I could not have said it better myself.  The "one file" approach is
> exactly the direction we would like to take, but wanted some
> precedence for runtime-configured platforms before we tilted at that
> windmill.
> 
> > >   - loss of implementation freedom of choice (adopting the
> > > proposed
> > > solution _requires_ json parsing on _all_ platforms using
> > > reference
> > > applications, even platforms using single configuration images)
> 
> I find this hit on complexity to be fairly minimal for most
> applications, as python has "batteries included" bindings for json
> parsing, and C++ has several mature libraries to select from.  The
> get device id example we pushed used nlohmann json, as that seemed to
> have the easiest to use abstraction, but we've also shipped platforms
> with cjson in the past.
> 
> > Previously for the most part, we all had to do yaml->cpp, which
> > certainly had
> > its own drawbacks.  I think json will provide a cleaner mechanism
> > for
> > backwards compatibility.  Every platform wont' need to regularly
> > update their
> > configuration files unless there's a breaking change.	
> 
> This is exactly our experience.  In other platforms, running off
> configuration files allowed us to completely rewrite internal
> implementations (sometimes changing languages) with negligible user
> impact.

-brad
