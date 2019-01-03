Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mZnZ2Pem"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W2l43HCNzDqBL
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 09:33:52 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id d72so16572127pga.9
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MAEOnpQQd8O1W9SSDU6N/gIHmNjNlo+SWgV6wUVKr28=;
 b=mZnZ2PemzRcFzLlH1nIMMvHK2H01+7LsiBXqqu3V6uE28jnQZ4aCiiIVwu6EQCpuBJ
 y9tIL/g5GFO/dOjEbFWYJelhEH8fHMOS2vJPBxFGY0jEhaVpukpouYHvurMUaAtHqJL1
 0VN1Z21HEoYDVum68cXLsql1sKWbzbt2RgwmAU9No01201PRyNZiSOrpVbe7243ozdM5
 LArAmkIPmWZMkW/GtDUHiHrgERJpX9c8iPgGgj1pYHXJkr3uMRy2XXJqpz1ykOKknShO
 wn+hFOR3pJzGEWGo6RFFzSfJNcYjllrN4I198XdF6f1fs/5d/BygZI2X68X5GbRwCbLp
 VzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MAEOnpQQd8O1W9SSDU6N/gIHmNjNlo+SWgV6wUVKr28=;
 b=RNY8buKCTjMoVf8PqRa8F8tViCBHiDWGuAFxjKYGUfzgz43qVe80xq1839/SSw8mni
 8k8QdP4FSGIWFbsTpFkVdZ+8R4dkmuazpFrJZloZXvRiMFqrEPs1E3DcJMLvSZIM+VSi
 3xbH4SqOFDq7hLSnlG7dAI+z5b5NXQ0DxOVjr0yMhQB9f/yaLvOLhOVu9RSaI4aCg19A
 GcA1fAZAHePBpN8W7g/oFXMb1AVNAWN3TI8TUVTmccS8K7P5VN5p388wzYy3Oj5O6Icz
 srqTAoKveywBEX2SDouJx6JmozbtvgvGtHotvA3E8H5KLRd2OkOWGOXKKDEU6eoNsdxV
 7IZA==
X-Gm-Message-State: AJcUukdkCb8PHD4febEbACNGKLnRrnMEmNpc8W68ymdw/2MMMFUTcA/5
 xYk5dqAHem/rKsdyvN27IAYruwLifJwmpcAZY00lIg==
X-Google-Smtp-Source: ALg8bN6WJHtdW77nWbY5ySEKqFTaXm8dHPdklvdbtjBmDEHhQLMt/veRFZkR+rKXs3RUZbUfUpMZ8QZ0z+YjHDlf30Y=
X-Received: by 2002:a63:955a:: with SMTP id t26mr18735142pgn.449.1546554829995; 
 Thu, 03 Jan 2019 14:33:49 -0800 (PST)
MIME-Version: 1.0
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
 <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
 <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
 <CAO=notw81jtXKHJOK2MaqG73Pu86=ZZY1UjYzg-NbHQnaqZUjA@mail.gmail.com>
 <CAO=notzkJgHAxB8xoG_2qBtnRv3-D7pUji1ykqaTSSbn-T0j6g@mail.gmail.com>
In-Reply-To: <CAO=notzkJgHAxB8xoG_2qBtnRv3-D7pUji1ykqaTSSbn-T0j6g@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 3 Jan 2019 14:33:38 -0800
Message-ID: <CAO=notwS_RHpZ-j99zwcSgFa7Prp0qDVGpEy1r3O-nPWUG5CMw@mail.gmail.com>
Subject: Re: journal log messages are missing with latest version
To: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 William Kennington <wak@google.com>
Cc: Yong Li <yong.b.li@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 03 Jan 2019 22:33:53 -0000

On Thu, Jan 3, 2019 at 2:28 PM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Jan 3, 2019 at 11:19 AM Patrick Venture <venture@google.com> wrot=
e:
> >
> > On Thu, Jan 3, 2019 at 10:07 AM Matt Spinler
> > <mspinler@linux.vnet.ibm.com> wrote:
> > >
> > > On 2019-01-02 13:09, Patrick Venture wrote:
> > > > On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com>
> > > > wrote:
> > > >>
> > > >>
> > > >>
> > > >> Hi Patrick,
> > > >>
> > > >>
> > > >>
> > > >> I encountered a problem after upgrade to the latest opnebmc versio=
n:
> > > >>
> > > >>
> > > >>
> > > >> These log messages in ipmid are missing with the =E2=80=9Cjournalc=
tl -f=E2=80=9D.
> > > >
> > > > Which log messages?
> > >
> > >
> > > This showed up on all of our systems too, anything logged using
> > > phosphor-logging
> > > is missing from the journal.  I even ended up using a git bisect to a=
lso
> > > narrow
> > > it down to:
> > >
> > > phosphor-logging: srcrev bump 30047bf964..31552c05e2
> > >
> > >      Patrick Venture (5):
> > >            add sdjournal interface to inject tests
> > >            test: use only one main library
> > >            bugfix: add fixes to mock class
> > >            bugfix: rename method to match implementation
> > >            test: add test to force building of sdjournal mock
> > >
> >
> > William, you've been digging into sdbus a lot recently, can you take a
> > deep look at the patchset above and see what I may have messed up?
> > The phosphor-logging unit-tests were broken until I got it "working."
> > Which lead me to believe that it's not correct -- and the daemons that
> > have unit-tests that hit the log message are seeing the calls.
>
> From reading more into the var_args pass-through, that may be the
> issue.  One cannot pass the var args down directly like this.  I
> propose to initially snip out this extra call and then revisit so that
> it'll resume working.

https://gerrit.openbmc-project.xyz/17054
>
> The problem is that sd_journal_send doesn't expect a va_list argument,
> but rather strictly var args, which aren't the same.
>
> >
> > >
> > > >
> > > >>
> > > >>
> > > >>
> > > >> My tests shows that the blow change is related, after I revert it,=
 I
> > > >> can get these log messages.
> > > >>
> > > >>
> > > >>
> > > >> Did you meet such issue, or any suggestions/comments to narrow dow=
n
> > > >> this issue?
> > > >>
> > > >> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066=
baa6f3711c88d6a3b9a5c4d49
> > > >>
> > > >> add sdjournal interface to inject tests
> > > >
> > > > There were some follow-on patches for phosphor-logging that you
> > > > shouldn't need -- it's
> > > >
> > > > What SHA is for your https://github.com/openbmc/phosphor-host-ipmid=
 ?
> > > > (so I know what version of that is in use by you).
> > > >
> > > > Checking the HEAD version of
> > > > https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile=
.am,
> > > > I see it's including the proper libs to get the full phosphor-loggi=
ng
> > > > objects.
> > > >
> > > >>
> > > >>
> > > >>
> > > >> Thanks,
> > > >>
> > > >> Yong
> > >
