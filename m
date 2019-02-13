Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q5m2Bu++"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4409w76ytnzDqRj
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 07:23:51 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id d72so1690380pga.9
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jGAVo9SECHlghQzvJgtk1fyywD+kVIAVM1NB40hz4a4=;
 b=Q5m2Bu++ssJplMKeUo+fN1xMJw7aRi4vgUs81I3u4rZkgBwlbEwKpYZ5yxOKrELAuu
 dNmXQKeOz3eZMCbGErrmsaABmr4DlY0tSEaFF1YxFnL/idpaKOZC3uE80qbFYZ5vMrtU
 cZ4sNureWd+VarZ5uhQp9rG8/CP7BZrLdheE8S6BOQQKgk3HGL+c9z5LyQ+VYBeCHHg5
 SWCkl8bkV092yoN4+nSr+zmV4r+mqFeOUnZ/y2rkA38waFhla0gNwYsEaIaYGYhYUmsz
 VEux7tZnqYO3PYjGL2zqZuORLjLv1fGuMzM+PrZYMkxwUH+V0z1UebMap22wijcINCEx
 CPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jGAVo9SECHlghQzvJgtk1fyywD+kVIAVM1NB40hz4a4=;
 b=BCKyceqCru+xCm/XSBTNKCHJYakIsZ4PtVKIwOQ0PRlSwQyBP3Ytn5v5dMKQubyOVW
 9RIhYJK5i9TvHKm7G9pzapU4cS7USy5x6boB2OJmQzVNw8LdcCO3aB6Zho7O3muPjnQ6
 EHejISxwkrrXDGnCZMM8LmTx6orfi0qJWhtE8DamJiKTIbPlLqPk6MX0qkW0tSmljRam
 BdtnncldApkqzxXj9CY6NTPy0MMDrkht004V/CNWz99SGMaDQSjmJHo7MnvcUtoH4MhC
 o9M1UmR+BWcsLXez1mmLFzMDBUkX17E8DgMXx32LdlDIw+aB0gled5QqOBZulXsrS9XB
 ZsPA==
X-Gm-Message-State: AHQUAuZDx2ajZIh4u9VbIu30AbBDZyJKVlETPYIZ5KgeNhdXBwpUfyoq
 r68PLbbfqzMTMhR5NWB0VEo3yZ0IdMMkaWYT5WVpOA==
X-Google-Smtp-Source: AHgI3IaubxwlQIS0GI7b4DzKPEn669wZtknwNTAnGZ9ssITvmngOdBBdtSPCck87euU7BUOykDC3GDMK2s7wIOo/1YU=
X-Received: by 2002:a63:f74c:: with SMTP id f12mr2098421pgk.195.1550089428933; 
 Wed, 13 Feb 2019 12:23:48 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwr7mZQ_ww_z7Vn94SrvmGZu6v+KK-LwujvSmK4v3ut0g@mail.gmail.com>
 <20190211185046.2lisomjnecvrd7eh@thinkpad.dyn.fuzziesquirrel.com>
 <CAPnigKm9Sce7DbBjKf7tGJrgVPyF=2u04GFPW4FTzeHKUHYhTg@mail.gmail.com>
 <CAO=notwCLir90VDFiNHWKwYHuKJ6k7TWrCECkWkAe3QKprc_hg@mail.gmail.com>
 <CAO=notyaqHWYHk3+wekPMLBK_==vwDT-+ccyNMxXPcRKwvPZDQ@mail.gmail.com>
 <EC08735B-9BC7-4781-9DD9-2CC9DA63DCE5@fb.com>
In-Reply-To: <EC08735B-9BC7-4781-9DD9-2CC9DA63DCE5@fb.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 13 Feb 2019 12:23:37 -0800
Message-ID: <CAO=noty_cHo1WW3mZhiY_SS779a6QnBwpXE0a5ddEdw6uu8wbg@mail.gmail.com>
Subject: Re: Host-side tools
To: Vijay Khemka <vijaykhemka@fb.com>
Cc: William Kennington <wak@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 13 Feb 2019 20:23:53 -0000

On Tue, Feb 12, 2019 at 1:33 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 2/11/19, 3:08 PM, "openbmc on behalf of Patrick Venture" <ope=
nbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of venture@goo=
gle.com> wrote:
>
>     On Mon, Feb 11, 2019 at 2:58 PM Patrick Venture <venture@google.com> =
wrote:
>     >
>     > On Mon, Feb 11, 2019 at 11:49 AM William Kennington <wak@google.com=
> wrote:
>     > >
>     > > As long as it's possible to build the host side tooling without
>     > > building any of the BMC side tooling and vice versa it sounds fin=
e to
>     > > me.
>     >
>     > I've been doing a lot of host-side development lately and I was
>     > interested to know what the end result would be.  If someone ran th=
e
>     > configuration just to use the tool, they might run into issues.  I'=
ve
>     > avoided using BMC-side libraries where possible to avoid host-side
>     > tool poisoning.
>     >
>     > >
>     > > On Mon, Feb 11, 2019 at 10:51 AM Brad Bishop
>     > > <bradleyb@fuzziesquirrel.com> wrote:
>     > > >
>     > > > On Mon, Feb 11, 2019 at 08:03:17AM -0800, Patrick Venture wrote=
:
>     > > > >Brad,
>     > > > >
>     > > > >It's my understanding that host-side tools that cooperate with=
 bmc-side
>     > > > >tools should be in the same repo,
>     > > >
>     > > > Is this something I said at some point?  Where is this coming f=
rom?
>     >
>     > I don't have the exact email, and it might have been very very stal=
e
>     > information.  But I'm glad to clear this up! :D
>     >
>     > > >
>     > > > >hence why the host-side blobs stuff is in phosphor-ipmi-flash.
>     > > > >However, if I add any dependencies to the configuration for th=
e
>     > > > >BMC-side, those get in the way of configuring for the host-sid=
e.  Would
>     > > > >it not make sense to sometimes have it split?  And if so, I wo=
uld like
>     > > > >to propose creating two repos, a blobs library host-side, and =
a flash
>     > > > >tool host-side repo, so those can be neatly split and not have=
 anything
>     > > > >in their configuration file that's really bmc-side specific, l=
ike
>     > > > >ipmid, or phosphor-dbus-interface, or something.
>     > > >
>     > > > I can make a repo if you would like.  Just let me know what you=
 would
>     > > > like it called.
>     >
>     > Thanks.  I'm working on an IPMI blob toolset, such that there is a
>     > library that provides host-side blob tooling, and then the flash ho=
st
>     > toolset can link against that library and be used on the host.
>     >
>     > So that's my goal.  To get there I was thinking,
>     > phosphor-ipmi-blobs-tool (or ipmi-blobs-lib) and
>     > phosphor-ipmi-flash-tool for that side.  The argument against
>     > ipmi-blobs-lib is that there may end up being some basic tool there
>     > tool and not just the library -- do you have any preference in this
>     > case?
>
>     Reviewing my goals further, the idea of having an ipmi-blobs-lib or
>     ipmi-blobslib repo would be helpful.  I could do all the host-side
>     blob tooling there, and have that be a dependency of
>     phosphor-ipmi-flash-tool.  Which leaves me with two repo requests:
>
>     ipmi-blobslib
>     phosphor-ipmi-flash-tool
>
> Can we name as "phosphor-host-tools instead of calling ipmi-blob.
> As we can have similar tools repo for bmc and we can call it as
> phosphor-bmc-tools. All host related tools can be in one single
> repo and bmc tools can be in another single repo.

There's already a repo, iirc for some BMC tools.  And, I don't know
that storing arbitrary host-tools in the same repo is a plan I can
support - unless they're all cpp built the same way, but really at
that point it feels like if someone wanted to build their one tool it
might be more steps?

>
>     You could add the phosphor prefix to the ipmi-blobslib if you wanted
>     for consistency since its' meant to work with and on the phosphor
>     environment.
>
>
>     >
>     > I'm definitely seeking suggestions on this.
>     >
>     > > >
>     > > > That said, I think you can also probably do this in the same re=
po, if
>     > > > you wanted, by having different build targets - it might not ma=
ke any
>     > > > sense to try and build both applications with a single invocati=
on of
>     > > > configure - as you point out, they are being "configured" for v=
astly
>     > > > different runtime environments.
>
>
