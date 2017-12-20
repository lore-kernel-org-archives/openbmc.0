Return-Path: <geissonator@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22f; helo=mail-it0-x22f.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pkrI1EsJ"; 
 dkim-atps=neutral
Received: from mail-it0-x22f.google.com (mail-it0-x22f.google.com
 [IPv6:2607:f8b0:4001:c0b::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z25z93VnRzDqgZ
 for <openbmc@lists.ozlabs.org>; Thu, 21 Dec 2017 07:31:49 +1100 (AEDT)
Received: by mail-it0-x22f.google.com with SMTP id x28so8202823ita.0
 for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2017 12:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=6zm2X5lso+wEG9wmVKw0DgwYsy1PSZIcFqQyIzl20Ow=;
 b=pkrI1EsJJtiWito3ivipByzbI678fdergeivKChPR6C3UK8QFRgf00tJZBq8Bk02qH
 F4/DLFbYvZLVLK6W3iA/kvtH1kd1CYSZchmkpcGMLpsiLL4hkpb3wMFSZdOJh4laDqpt
 xt+ALrfa7i6J+Q+sELxeAcWCwxNKcwLhLuYgUUpea4iyL7a3M7kRhf2Nz2WjCVkTOGkb
 fEBjQd/8EG7imy/djBunOfqFcofWNYpgqu7lThKH7EcmH1xLcmplCShD0OAp9hRv0zRW
 6oWQbUQSxt0K3CR/cbvT99R5ucqw6iLPqEbNv6QepVj3myeX7H37Ff+UznNo/gENY1GO
 gg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=6zm2X5lso+wEG9wmVKw0DgwYsy1PSZIcFqQyIzl20Ow=;
 b=J9ga1Z92xrama5Nn2yVMGYbFfTQycVokQ3OHBJWAbY1AcFqzoslh6crGNUzdxZXqj8
 b6TjJGIU4y6+/ZHfbu4t8OjQuNO89Oq42XXIPePiGk1GeCeDIfnaALb0LaDA4qA9GPwL
 xyTnWhJIeguyqQ2gnO1XkT7YT/+YNlS0xMqc93kldtw2xmw8uVU2PuVJZa487ZmMRjF+
 EOd/PeuEbMwTWlNRAujTdSRi280jglqvO3srHE0Ygp69Ad2VW6Z38ONrz2eFnfI1wLmC
 d8FW2vZfTHYJFxI1BpEZre5WuDlo9rK7FMPVLtIyZEwVSNeaWQEZjls/qUUvXQ79sx34
 8VDA==
X-Gm-Message-State: AKGB3mKYpuc6TOhTIBTl7L0G9NufxcdA/Wlw3IvOBV/OhxD2wfDHiMSD
 Nk4jYfWv9YHfIPUYaAM7DRwrT4/7x/P7xsfdfhyBbA==
X-Google-Smtp-Source: ACJfBosTdwdhF+rRmxun/RfbBDqbzgb6InS6QEc0GVov59vhOybWwCvLp6bJWeCRAjHY8839t9bcCvdZIXohEWlvyXs=
X-Received: by 10.36.147.193 with SMTP id y184mr9063320itd.64.1513801906819;
 Wed, 20 Dec 2017 12:31:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.159.76 with HTTP; Wed, 20 Dec 2017 12:31:46 -0800 (PST)
In-Reply-To: <20912a5f-e956-13c3-3fd4-1ba1fe9f1759@linux.intel.com>
References: <20912a5f-e956-13c3-3fd4-1ba1fe9f1759@linux.intel.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 20 Dec 2017 14:31:46 -0600
Message-ID: <CALLMt=oqzKzhHYGhC02t6z7p1f+d+2oeq52HhPB6Wr0KWXtFGQ@mail.gmail.com>
Subject: Re: Gerrit alternatives
To: Dave Cobbley <david.j.cobbley@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 20 Dec 2017 20:31:50 -0000

On Tue, Dec 19, 2017 at 7:26 PM, Dave Cobbley
<david.j.cobbley@linux.intel.com> wrote:
> Hey all,
>
> I am curious to see peoples input on using github as a code review mechanism
> over gerrit. I see github/openbmc is already used quite well for sprint
> planning and issue tracking, I feel like it would make a lot of sense to use
> it for doing code reviews. As far as I understand it has a mechanism to
> reproduce a similar paradigm to what we currently use today - as far as
> Code-Review, Ok-To-Test, and Verified.
>
> I can see github has made several improvements over the last few years that
> make it much more use-able to teams like us:
>
> - The ability to have approved maintainers for each specific repository with
> https://github.com/blog/2392-introducing-code-owners
>
> - It has the ability to do a rebase-merge, keeping the git tree nice and
> tidy.
>
> - A strong API to tie in additional tools that we may need.
>
>
> Additionally, it will reduce the point of failure from also hosting gerrit.
>
> What are peoples thoughts on using this?

As the guy who ended up having to maintain the current gerrit server,
I'm all for an alternative :)

But my problem is I really like gerrit.  github has def made some
improvements to the review process though.  I see it has per-line
comment ability now.

I have a pull request out here for a non-gerrit openbmc repo if
someone wants to look around -
https://github.com/openbmc/openbmc-tools/pull/5

One thing I really like is how gerrit allows you to iterate over a
commit.  Someone makes some comments, you respond, upload a new patch
set.  My understanding with github is you basically just keep adding
on new commits in a pull request to address comments.  A feature I use
all the time in gerrit is to look at the diff between a patch set I
last reviewed and the latest one.  Also, I don't see an obvious
mechanism in github to provide the different score levels
(-2,-1,+1,+2)?  The gerrit dashboard is also really nice, providing me
a nice easy way to see what's on my review list and what the current
size and scores of those reviews are (for all repos in openbmc).

We also base a lot of our current CI infrastructure off of gerrit
events.  I think most of it can be switched over to using github, but
it's not inconsequential.

Our current gerrit VM costs on the order of $60 a year....so you get
what you pay for.  I've been poking around IBM trying to see if we can
get something a bit more production worthy.

Andrew

>
> -Dave Cobbley
>
