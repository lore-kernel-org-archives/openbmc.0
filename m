Return-Path: <xow@google.com>
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7lnZ2zDGzDvNX
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 09:11:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=YG2ag3v3; 
 dkim-atps=neutral
Received: by mail-qt0-x236.google.com with SMTP id n6so67987814qtd.1
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 15:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eKmTR0RkmqPGD9aKqC0ThKXNT7q6bgMdDPiOek40Okg=;
 b=YG2ag3v3ETHYHa9GPhLtRImX6MfI4I8m86lQhO6+oVMWI6+ZAzY/zHO5vw+NOAaI93
 P2lHlFxASIticx+nSBaotY/B4r97ioI8hepF9mGQ9RlpBZVuO/j8zb3Jw7L0ahegELzX
 PDuGT6oPJyAi+XPUs8xuA1GGqbxthtjAuBIexT3wn5O/g03t318BztR5/gVwJRW9VVE1
 8bZJFrFFobYajFGhd3DqWGAfk/I+cHw58GhMMn3kCiyGOArIjR42l/6koSCHFMu8G4SW
 B2z5tmaXxfW7Gu/fFiR6Mum1FEzNrhAo3YtOj9FAx2yRUd34X+qkElUuXF4UFp13DZpr
 Fs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eKmTR0RkmqPGD9aKqC0ThKXNT7q6bgMdDPiOek40Okg=;
 b=GGlC23If0Th7mDQUvCClKVSUQZ7QSTly3RqX7wGeg8t5DbOaccWg8vb/LxFN/zR1KL
 QEaeAE/pFQQbyDC+ylEOIzF2ur/GWOBJBLB5jT4npHCc5c2pG7adt158wokuzgpdwmWa
 RtY1DcGCKpAYoq8horCbW0gyzkV/zvRaFeX5tYcWWj3GCsZ0A8GaLB3p2dHxXvLpgJDO
 ovroQs5kZzd8+yabqXVwrayIjNlt00+LDOEzKFOBCsXsbikxhHTH1OuIprbBhwD1PJAu
 1exwSuGuT0QU9a4AhKFSXnnEHXqXNY3vTPEkqOIQKUpNujCe8YrK/3PQGAeA1orv9NHG
 w+Wg==
X-Gm-Message-State: ABUngveL6Tr6ss0qcnuuSEH5RhMwf0JVsY+vekpzl/bDCqjTR96q6pQ9iXSq2TDWg8B30sozEmQvs9NfxUyiOP0V
X-Received: by 10.200.50.93 with SMTP id y29mr319203qta.124.1478038303079;
 Tue, 01 Nov 2016 15:11:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.57.199 with HTTP; Tue, 1 Nov 2016 15:11:42 -0700 (PDT)
In-Reply-To: <1AF77AD5-4ACB-4DCF-8429-A87096312A27@fuzziesquirrel.com>
References: <20161031150038.zcvop7gbpu44ojsf@asimov>
 <1AF77AD5-4ACB-4DCF-8429-A87096312A27@fuzziesquirrel.com>
From: Xo Wang <xow@google.com>
Date: Tue, 1 Nov 2016 15:11:42 -0700
Message-ID: <CAPH-5w5ZUracAQ+mbLtBHaAeo9F+FpyDi-2yQ9UPWExj2__Xiw@mail.gmail.com>
Subject: Re: Opinions on CLI tools.
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 01 Nov 2016 22:11:47 -0000

Hi Patrick, Brad:

Based on your criteria, I think iotools would fall into the category
of a narrow-mindshare tool when viewed from the broader project
perspective.

We'll keep the iotools image inclusion internal to our layer, since
the primary benefit is Google developer familiarity and ease of
porting our collection of traditionally host-side scripts that depend
on it.

cheers
xo


On Tue, Nov 1, 2016 at 6:30 AM, Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> If there is value add in these tools, lets get those enhancements in the
> associated upstream projects.  I agree with the segmentation and mind-share
> kool-aid.
>
> That said, the beauty of Yocto is layers, and if someone felt strongly about it,
> this could be added as-is to a meta-<machine> or meta-<company> layer.  Then
> the segmentation and mindshare loss would at least be confined to that particular
> layer.
>
> -brad
>
>
>> On Oct 31, 2016, at 11:00 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> I decided we should solicit broader feedback before I merge this commit:
>>    https://gerrit.openbmc-project.xyz/#/c/900/2
>>
>> Xo proposed adding a CLI tool, that appears to have been written and
>> maintained by someone at Google, and effectively is a wrapper around a
>> number of device driver calls.  Some of the facilities provided by this
>> tool would also be provided by "upstream" tools like i2c-tools or pdbg.
>>
>> Last week the IBM team had a small discussion on strategies for CLI
>> tools.  In our legacy product, developers tended to make many many CLI
>> tools with little oversight and standards and these tools ended up
>> slipping into various "bring up", "debug" and "manufacturing" scripts,
>> effectively becoming "requirements".  For OpenBMC, we had proposed
>> landing on the other extreme of this, which is to say we should never
>> have a CLI tool as a wrapper around an existing tool or to replace
>> existing upstream functionality.  (We did have one small tool we
>> discussed which was to facilitate easier interaction with the DBus
>> interfaces, since otherwise would require a few invocations of 'busctl')
>>
>> One of our (my) concerns about wrappers is that we end up segmenting our
>> own community from the broader Linux ecosystem.  Having available and
>> documenting broader tools like 'i2c-tools', 'systemctl', 'journalctl'
>> gives us larger mind-share with individuals outside OpenBMC that are
>> already familiar with those tools.
>>
>> A key example we discussed was:
>>        obmcutil power-on
>>    vs
>>        systemctl start host0-power-on.target
>>
>> The first is certainly "easier" for those that are totally newcomers.
>> The second is only slightly more difficult but gives insight into how
>> our state-management works.  With the second if someone already has
>> knowledge in systemd, from their own Linux experience, that allows them
>> to more likely probe into "what else is exposed via systemd targets?"
>> rather than just expecting everything to be documented with 'obmcutil
>> --help'.
>>
>> With this proposed iotools package I think we have 3 options:
>>
>> 1.  Allow it in, as is, in the debugtools image.  Even though it does
>> replicate / wrap some tools, it does provide new abstractions on others.
>>
>> 2.  Add it to a .bbappend in only the meta-zaius tree.
>>
>> 3.  Patch the makefile (and discuss with upstream) to disable
>> functionality that is already implemented by other, more widely used,
>> tools like i2c-tools.
>>
>> --
>> Patrick Williams
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
