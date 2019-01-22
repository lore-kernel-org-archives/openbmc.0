Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S3WC7QoC"; 
 dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43kVkW2YhZzDqMK;
 Wed, 23 Jan 2019 01:13:07 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id t204so17465496oie.7;
 Tue, 22 Jan 2019 06:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=25EFUuh5VThA3zYXHTef+zGdXGBFXF34AsrAUZq35Mw=;
 b=S3WC7QoCzaZJjUuB6jB+h125z3dWLUhubpKEGdX9ZkjOxt1pJ9j5dLSa46Is3yOmFi
 k7o8BYcKLP9bRH4+0WpjEDDC9GdcNhnZWtBN7lrtHHErUV/KFCFjOnv0ZJsswHkyzpLl
 TEwlcsw7vGGwejAWJwhLwq1y3s3wCDSJ29Hxb3k1fNe9Vh8oLfC9AtI7qnVA+kxy72A0
 w/Wtlh/gBuY88+p6mcs0we0gkHLN0mJphPq0Z2DB5SkvDoh6hSRw5UbrXhX2KoJVA0j9
 pMZpH6zkyshmkko0YGzVz0/EZ30Y+zJJd5S4KQSooVtIDUkxFUOmtKsRrA3Ni34liBfm
 M0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=25EFUuh5VThA3zYXHTef+zGdXGBFXF34AsrAUZq35Mw=;
 b=dKwDjd9IyBu5M2KLSn0ZRvBWtzBBcayilW6nNCotSderJ1CF9nFiYmazPTgHHu4IbB
 w1CU5ZgjkLudAS5Iorf16eQjg8KY6quwQrdZ+PqzmLPch35c44i9v0pGP7MnflSwGHWo
 AeY9cvywewwfTI/BUyOh38YMh42XOO1iS/cduJIzRUOqjo0I1ewdqS1ytNyBXEqaj/VO
 4PxMwXQShYngRXi3/b4+iZcnQCyYjmzsaqhsMWr2vO03LtiCF+uEWA872LTIak5Es/am
 KmXZY7NOh/YRHS3MLtedOucc3WNr14mXNOPIZU38PhL2NfM6KotvLJV8Hh+SDn1PCq4X
 b9ug==
X-Gm-Message-State: AJcUukfLToVAevvS26cWPi0tFbKpNFv7yEiic0kZBfYUDrI+2MsIWSk9
 NOTtjFZBFs7Z1Zqk02Atv49yYRUME80rcT+nuFA=
X-Google-Smtp-Source: ALg8bN55+/7yWn5o175Au3jMlgxSmIyPyv/pOdO5kCw3Mvo68rIE5jmX0BzETmGH4rK/yv+dIdj1biEAkWZ9qvf/D8E=
X-Received: by 2002:aca:5587:: with SMTP id j129mr8594953oib.93.1548166384503; 
 Tue, 22 Jan 2019 06:13:04 -0800 (PST)
MIME-Version: 1.0
References: <CALLMt=rmk2=ranWssd=TEOZy=sH=RWzKjkSbAEn=V9tY7Ozk+Q@mail.gmail.com>
 <e52fca8da7ba89a7a07407c1b28c60f9@linux.vnet.ibm.com>
In-Reply-To: <e52fca8da7ba89a7a07407c1b28c60f9@linux.vnet.ibm.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 22 Jan 2019 08:12:48 -0600
Message-ID: <CALLMt=o-mVUX-6MbZqd_qZdd+bWaQ1dxmtgi5W=ZY_b3r=Ub0A@mail.gmail.com>
Subject: Re: Thud branches required in certain repos?
To: Joseph Reynolds <jrey@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, ed.tanous@intel.com, 
 Matt Spinler <spinler@us.ibm.com>, William Kennington <wak@google.com>,
 dkodihal@linux.vnet.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>, 
 openbmc <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 22 Jan 2019 14:13:08 -0000

On Mon, Jan 21, 2019 at 4:45 PM Joseph Reynolds <jrey@linux.vnet.ibm.com> wrote:
>
> On 2019-01-21 11:23, Andrew Geissler wrote:
> > Recently we created a Thud branch (i.e. 2.6). Currently we've just
> > branched
> > the openbmc/meta-* and openbmc/openbmc layers.
> >
> > Pre repository CI (i.e.
> > https://openpower.xyz/job/openbmc-repository-ci/) had
> > its scripts updated to support the new branch. Basically if a change
> > comes in
> > from a branch, it will attempt to find and use that same branch from
> > all of
> > the dependent repositories. If it can't find the branch, then it will
> > just
> > use master from that build.
> >
> > Dependent repositories are repositories that most repositories depend
> > on and
> > are always built as a part of the per repository CI process:
> >
> >   phosphor-objmgr
> >   sdbusplus
> >   sdeventplus
> >   gpioplus
> >   phosphor-logging
> >   phosphor-dbus-interfaces
> >   openpower-dbus-interfaces
> >
> > In general, just using master from these dependent repositories will
> > work. We
> > only run into issues if some sort of API or data type change occurs in
> > master
> > that is not compatible with the branch.
> >
> > To avoid weird errors in the future though, I'd like for the
> > maintainers of the
> > above repos to create the corresponding branch in each of the above
> > repos
> > whenever a new branch is created for the openbmc project.
> >
> > Adding a branch is easy, just go to your project in gerrit and use the
> > "Create Branch" option. Be sure to put the "Initial Revision" commit at
> > whatever
> > we were at when the Thud branch occurred and call it "thud".
> >
> > Other ideas or thoughts?
>
> Let's walk through a scenario.  Suppose we need to fix a bad problem in
> the OpenBMC 2.6 release in the sdbusplus repo.
>
> The way I understand it, a pre-requisite step would be to fix the
> problem in the master branch of sdbusplus and then bump the master
> branch of openbmc to use the new version of sdbusplus.
>
> The next step (given the proposal above) is to commit the fix to the
> head of (repo=sdbusplus, branch=thud) and then create a new commit in
> (repo=openbmc, branch=thud) which bumps the new version of sdbusplus.
> When this is done, someone who checks out (repo=openbmc, branch=thud)
> will pick up the fixes in (repo=sdbusplus, branch=thud).  Correct?
>
> I can foresee a problem if the (repo=openbmc, branch=thud) update points
> to a sdbusplus version that is past the 2.6 version but not in
> branch=thud.  For example, if it pointed to the branch=master version of
> the fix.  That would pick up not only the sdbusplus fix, but also all
> development work that happened after the 2.6 release.  Is that the
> "weird" error you refer to?

My error is outside of the openbmc repo discussion, although what you
point out could def be an issue if we don't ensure the proper pointers
to the individual repositories and their branches.

Here's the problem I'm looking at, going along with your example:

The fix is put into (repo=sdbusplus, branch=thud)
Currently, the CI job would use (repo=sdeventplus,gpioplus,..., branch=master)
to build all of the dependencies for sdbusplus. Lets say there's an interface
change in phosphor-dbus-interfaces in master, that (repo=sdbusplus, branch=thud)
does not support. The compile will fail. The solution is that all
dependent library
repositories need to have a thud branch that CI can build against.

>
> To prevent this problem: when making bumps in (repo=openbmc,
> branch=thud), reviewers must ensure both (a) the fix was correctly
> copied (or cherry picked) from branch=master into branch=thud, but also
> that the version bump (in repo=openbmc, branch=thud) points to the
> branch=thud version (srcrev) and NOT to the branch=master version.
>
> Anything else?
>
> - Joseph
>
> > Andrew
>
