Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::232; helo=mail-ua0-x232.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hkXW/Aga"; 
 dkim-atps=neutral
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zwCrc26zXzDrbM
 for <openbmc@lists.ozlabs.org>; Tue,  6 Mar 2018 08:36:00 +1100 (AEDT)
Received: by mail-ua0-x232.google.com with SMTP id n24so4321831ual.12
 for <openbmc@lists.ozlabs.org>; Mon, 05 Mar 2018 13:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kujMRm9yDCXfNjELVoiMcwYtxFMtxW26BA5CuyurnRk=;
 b=hkXW/AgaouQL8o6pgic68z0aUIRduFSD+4Qs+gfPNFLeU746sKUUVhTKvlb/ncIgok
 cE4zJp1LvcC9Vw1CZHJEnpGUNr2e8pN8gp/dfN/ucxHCe2z3lu6eHwRT0JDRNBMEs+9E
 0xAMCknazGBvZAu/wkaZ7VFpvylDco19X2DYxAsPxXGWG2EUhKuARSBlIe3fQN8WR6UR
 ohtwNepqvwB0o4eLSo7dXDTCbdZ3cFbKhUOx7urFWcLRUSVPTk2ZZc9L65awd/okPPHf
 TeCKh8fbI/BeB8QGYn+I5zLorW1KBZ511a5ogj5Qj4PWV/wyoiF0BHVhxB8Om5p4VzXv
 Hf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kujMRm9yDCXfNjELVoiMcwYtxFMtxW26BA5CuyurnRk=;
 b=cXKuUo3Yi3zSxbLpxvIyfwDandBH+Ri2npBRzJZsLcTj37LGCZ7ek8eL/F7o49/Uaf
 A2XSMUu+2pa2UrygBCMdEAGtMZamyrwCriOHsx6PjeZpYEex/4KulkW4lwpp4Zv/Xn6F
 jwe1mAJVh0OgpzCNwCamlctyDkRRAQUItGvAu9nBPxjr5n656wu1R98qX5CzJbT9xlpP
 McRQMdxJP6fYw5+afMA2l4wcwKA5vRcNQoKyRao/lJAoOUDCq+P/oja6r80xE01KFXt/
 y5KTuuc6q1ILMVoQOyKOEii538cZuZhnKLGKdm310XMGfHTFaGTQwUdkLkcn3UqK9/tK
 CubQ==
X-Gm-Message-State: APf1xPA14T0SD6Qeo4icRqaOt/dunepBAX3ZWTF+kt3uAxxdGnIJX1gD
 lcJLd/XbukyZ1TKxvvIQKHrmoKRRx4LCa0FVttQJWw==
X-Google-Smtp-Source: AG47ELtZXOicbLmnhfRXi47a2gOxNmUOxWqdjhYONpGGdfuWweku2hD3O0afItG7Da1+PX9g1KP9cUy/w+vGFelRpMU=
X-Received: by 10.176.79.229 with SMTP id t37mr11573296uah.70.1520285756822;
 Mon, 05 Mar 2018 13:35:56 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 05 Mar 2018 21:35:46 +0000
Message-ID: <CAO=notwO81MS0o6hF-i1sDXWt5pbutmrouF5ozdKp1yDvL5duA@mail.gmail.com>
Subject: Re: Exposing POST codes
To: "Tanous, Ed" <ed.tanous@intel.com>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, guptam@qti.qualcomm.com, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Mon, 05 Mar 2018 21:36:01 -0000

On Mon, Mar 5, 2018 at 1:34 PM Tanous, Ed <ed.tanous@intel.com> wrote:

> I'm not Patrick, but the input on my use cases for this is below.


> > So we already have this xyz.openbmc_project.State.Boot.Progress DBus
> > interface (and others).  This is what we implemented on POWER.  Can we
talk
> > about how that API falls short for your use case(s)?  Can I fix it to
enable your
> > use case(s)?
> >
> The enum definition is very limiting, and seems to assume that POST code
definitions are the same across all platforms.  New POST codes are added
all the time, to the point where even internal teams struggle to keep up
with their definitions.  Having an API that would need to be changed for
every POST code type seems error prone and very likely to be out of date.
> If we adjusted the boot progress interface to be a string rather than an
enum, that _could_ meet the use case, but that doesn't seem to be the
purpose of that API.

> > My concern is I have to at some point implement this API on POWER so
that
> > POWER can take advantage of applications targeting your new API.
> > If doing that would be non-sensical then this probably shouldn=E2=80=99=
t be an
API, or
> > at least not in the common xyz namespace.
> Isn't this the reason for it being in an API all its own, so it can be
optionally included?  I suspect any applications consuming it would likely
be logging type applications, and any application using it to take action
would be platform specific, even if it were a string.
> Does POWER have any way of reporting detailed boot progress?  If, for
example, the USB link training starts processor init flows, is that logged
in a POWER system?  On x86, it would be logged as a POST code.

> >
> > On POWER, this kind of information comes down through the IPMI boot
> > progress indicator.  Could someone briefly educate me on what the
> > difference between the IPMI boot progress indicator and POST codes are
on
> > x86?  Is there overlap or are they used for different things?
> The POST code indicator is used for very fine grained feedback of boot
progress, and is generally not looked at by a user unless there is a
problem with boot.  At that point, it is generally (on my systems) used for
debug of the system, as it gives some information about what steps the host
system took before it failed.

> >
> > It just seems like the first thing anyone is going to do with these
numbers is
> > look them up and map them to something.  Wouldn=E2=80=99t it make sense=
 to have
> > done that mapping already at the API level so that every user and piece
of
> > code using this API doesn=E2=80=99t have to do it themselves?
> That seems like a reasonable assumption, but practically isn't always an
option;  In general the POST code mappings are difficult to come by,
especially in initial system bringup, and that is when they are most
valuable.  If attempted, the ability to provide a mapping should be made
optional, which means the proposed interface still needs to exist.

> > I think what I=E2=80=99m hinting at here is that you could add a per-pl=
atform
config file
> > to your app that maps the codes to some enumerations in the DBus
> > interface, and apply that mapping before you emit the signal. If you
wanted
> > to go back to numbers later you could just reverse the mapping using th=
e
> > same config file.  Please poke holes.

> I would argue that this functionality is outside the scope of Patricks
patch.  We could very clearly do as you're suggesting, but it would be
error prone, and make per-platform configuration more difficult to port,
and would likely take a number of months to get correct for all platforms.
As is, Patricks patch adds value outside of his direct platform, as other
teams would have an immediate use of it, and is very clear and clean to
implement.  Building the platform configurable API you suggest would take a
lot more time and effort, for only a little incremental value.  This seems
like a case of "Perfect is the enemy of good".  As is, both the API and the
daemon are things that I would use today on my platforms.

Thanks Ed for your thorough response.
