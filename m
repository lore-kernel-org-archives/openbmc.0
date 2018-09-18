Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="lDRBLNPY"; 
 dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42F6nZ48dszF3FG
 for <openbmc@lists.ozlabs.org>; Wed, 19 Sep 2018 01:47:30 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id s17-v6so1198034plp.7
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8wPTP129kciUfvC7aQumR52hkMgGXp0wNeSoaMbn/fU=;
 b=lDRBLNPYVy8n5vpn2RFo1yX8/dfwncAHtCHqWOfwbiK5EZGh4lIj2eNc6gpF/jxquN
 vFof4pw+dg+PY7jnyqJE0nOaO9sRhns25B+dwP7JXtxunrS54mAfs+KwlZn9V0eWMXho
 rlIpISv75hKjxMYnroRaOQ2+NZ2FqYuD2oN2uLc4arovxQLlZFzwx1u8su1vSa79rUjc
 A+eM4UlSS5e5fyxB1ratuk3dNlmcwwrRbgh8+jq+ZTWIeAYmG6dUsbrLwepGnzabcrCk
 qA4rBf1ZUaJ4oHwLgkb+EOwzhlxFnd9gUoqnlCn2trxCSN2N6mobf4sxAGE+h1w1ipGC
 dS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8wPTP129kciUfvC7aQumR52hkMgGXp0wNeSoaMbn/fU=;
 b=UCf4O9+YuodllpdTEaKYw8TT7BX7f6PVe+sR0sxvWEwJhOmfQ+yNSs8gaG0Cjk7742
 WVepiJouuLD2WNFSFhmT9Vhgvos7cMdPcyYJlDjz3xzz9jmTGdwcUCZha1MQXuCJgZkc
 086lysuYKP6KgjQ6mjDO+cYJViTAokMxDum9ITSOKN7D7/lm+MLF/E/5fVISjrEq7FJB
 RMSCzGaI6BKdhPFMhc5f2+S5/eyI6e0DlIFkFK3gEcS6lK/BA+tsEvaohAOmYvd7LBGk
 tdhc21IPmHBMTQXNSSEj/BBy/5z+ex/ptuWhZQqctahxqOmUW7HpaCieqRWQBRzew083
 V5GA==
X-Gm-Message-State: APzg51AfxeiDYjUMSwzssssBtos+++tPu32U25oLOu4U8E3lqovglRmX
 2xB+RDn03sch6c1vbm7pC2Ymg7cyi0kwynx8W9rHuA==
X-Google-Smtp-Source: ANB0Vda/kOiNK9ePTqUD4ShelkoeqdzPRfrJPVZLOMOTU+BrISIS116MbCxGrODKI0hbVORlPfLyWxt9xKzKXD8os50=
X-Received: by 2002:a17:902:46a4:: with SMTP id
 p33-v6mr30342082pld.205.1537285647874; 
 Tue, 18 Sep 2018 08:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=noty_TQ2jvQw-Yxb-RYe+0xOXa4F39ozF11r9PN1w2Qt_Dw@mail.gmail.com>
 <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
In-Reply-To: <C385EBD1-871A-4E5B-8FDE-80146795CC6D@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 18 Sep 2018 08:47:16 -0700
Message-ID: <CAO=notx9KnTNNC1UnL=DQkfpgqaUmKsbMeAG1H8CkodXGDVQ4Q@mail.gmail.com>
Subject: Re: New Repository Request
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, 
 Emily Shaffer <emilyshaffer@google.com>, tomjoseph@in.ibm.com
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
X-List-Received-Date: Tue, 18 Sep 2018 15:47:32 -0000

On Fri, Sep 14, 2018 at 6:00 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
> > On Sep 13, 2018, at 1:55 PM, Patrick Venture <venture@google.com> wrote=
:
> >
> > Brad,
> >
> > I'd like to set up a new repository in openbmc to store a google oem
> > ipmi library I'd like to share with everybody.  It allows grabbing
> > ethernet device statistics over IPMI.
> >
> > I have no problem registering it under the OpenBMC OEN (and the google
> > one) since OEM registration supports that -- then it could be
> > phosphor-ipmi-ethstats.
> >
> > I really would like to share the code -- but I would be ok with it
> > being in a google-specific repository, such as google-ipmi-ethstats --
> > If so, I'll put the recipe in meta-google.
> >
> > I know we've talked about this before, and it really feels like six in
> > one hand on this =E2=80=94
>
> As far as where the code is hosted I=E2=80=99m good one way or the other.
> Will wait a couple days for objections and create openbmc/phosphor-ipmi-e=
thstats.

Please go ahead and create openbmc/phosphor-ipmi-ethstats unless you'd
rather create openbmc/google-ipmi-ethstats.  I'm ok with doing the
extra bit of wiring it up to OpenBMC, which would really be the
difference.  But given your concern below -- I'm willing to own it
under google until the implications are worked out.

>
> It might be good to have a conversation around how we handle the OpenBMC =
OEN
> though.  Putting things there would seem to have lasting impact for every=
one
> using OpenBMC and we don=E2=80=99t have any process in place for that.

That's correct.  So, right now, the extra handlers aren't enabled to
be included in the image by default.  Someone would need to select
them, which I like.  As that's an opt-in behavior.  And if there's
interplay between the things, they can explicitly indicate that in
bitbake and in a README.

Consider, that each company may want to share their handlers - which I
think is great.  It enables vendors, if nothing else, and encourages
them to switch to OpenBMC to sell hardware to IBM, Google, etc.  I
also prefer the opt-in model for features, which this fits (repeated
point).

If we share them openly and register the numbers in
phosphor-host-ipmid, we can better enable a vendor or someone to say,
I want to support _all_ the environments, and just flip all the
switches.  To this end, I'm considering re-submitting the oemgoog
header to phosphor-host-ipmid, but by flagging its inclusion via a
build-time flag.  So, one could say, build a clean phosphor-host-ipmid
by building the default, but if they --enable-google or --enable-intel
maybe they get the extra headers included under something like
host-ipmid/oem/oemgoogle.hpp (need to send patch to maintainers for
review sometime today).

>
> >
> > Thanks,
> > Patrick
