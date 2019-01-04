Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="FlnY9N6d"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43WSZt6jPMzDqLw
 for <openbmc@lists.ozlabs.org>; Sat,  5 Jan 2019 01:58:14 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id v28so17602566pgk.10
 for <openbmc@lists.ozlabs.org>; Fri, 04 Jan 2019 06:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vKhbnSKWENnQpHNBghJtpHZLIAsnblYy4KXVJZ4rtHY=;
 b=FlnY9N6dl0tHKUnsrMcY7ztMlcK/U/KNunVawvG8YAD2EVMldUNYgAUN70Vh8A37KN
 wIX2rt+MmGY1c4VyeuioAGYzOqJjpPEs8ox3HPL2oABfaA8RfBVasGujcTqS2zxvUIV6
 M1kuGyuzAWab8LAUV+xF6D5YcRV6eQLw+nr/uq5NEe7h7CZ87qF9L3o4RYf9WbVISxWk
 l2R5Ix9Rl1MAUoiuOV+xRx1k57gnHqpAZae3XKGFW4SrEzJi9A1+y+MIcpJfp1RBdH0P
 46SzhBLI4mkhK1azWijWIu0G8U3IKsh2VCgx1HNIvHVfgtiWOHm4C3IK5Gqy8iMU1BuU
 IWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vKhbnSKWENnQpHNBghJtpHZLIAsnblYy4KXVJZ4rtHY=;
 b=iTxAD9ouPGY9tF957beIZCbW+GVaGWUle3lnZRGOUhZL839Lg3VLpwpRkzKD2pHEhz
 hHZ9Tu4OW1hdaBUj8M2Gdaxh/pu6Jh6WM6Gv9CDu1cYeZtSkO8nkVgXiyJLNp0RdXCxZ
 uP6kwNZniQvQNW4YoMvFT+lG3nJhOJbphc9okr1On+w1wz2RJtl4JGToE5sVPOpYzViF
 X5FEX41gsMi9lHmjWFMxZd0DthKIoI7SiYzBvOA6YqVjnZdi50jV13L7rJ+IBzhzusv2
 0T7H/z+tND9Q89bBxSaLHHNk06v5NQPlrSjHa1lyAUIkN2UFYXW1omMsip8zytLvyLeJ
 L5Yw==
X-Gm-Message-State: AJcUukcGuE1kX+v+20MkhKdcOLjHeA71M99V4QBhhhctf4cYGVLYm4dl
 i2xCvBqW1tXjDhAt+BXFAsfAfxejIuvYKsjsL500PQ==
X-Google-Smtp-Source: ALg8bN4ELjHK+Z1kH5bTYcX1BE6VGs8pIHRdXUgW4r1E9dex6gd+SIlq8D6bl6Z/VZ5uLVSy85gbblYi4b5Oax47338=
X-Received: by 2002:a62:178f:: with SMTP id 137mr52089109pfx.226.1546613892058; 
 Fri, 04 Jan 2019 06:58:12 -0800 (PST)
MIME-Version: 1.0
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
 <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
 <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
 <CAO=notw81jtXKHJOK2MaqG73Pu86=ZZY1UjYzg-NbHQnaqZUjA@mail.gmail.com>
 <CAO=notzkJgHAxB8xoG_2qBtnRv3-D7pUji1ykqaTSSbn-T0j6g@mail.gmail.com>
 <CAO=notwS_RHpZ-j99zwcSgFa7Prp0qDVGpEy1r3O-nPWUG5CMw@mail.gmail.com>
 <3a1d3ae9-e067-c166-96cd-b91f984de3d5@linux.intel.com>
In-Reply-To: <3a1d3ae9-e067-c166-96cd-b91f984de3d5@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 4 Jan 2019 06:58:00 -0800
Message-ID: <CAO=notywRjKAUCxBwvCS7FgvnjXDPfT4qeXHu0bKgmbNpLkezQ@mail.gmail.com>
Subject: Re: journal log messages are missing with latest version
To: "Li, Yong B" <yong.b.li@linux.intel.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 William Kennington <wak@google.com>, 
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
X-List-Received-Date: Fri, 04 Jan 2019 14:58:16 -0000

On Thu, Jan 3, 2019 at 5:20 PM Li, Yong B <yong.b.li@linux.intel.com> wrote=
:
>
> Thanks Patrick for your mails.
>
> Will test https://gerrit.openbmc-project.xyz/17054, and update the result=
s.
>
> On 1/4/2019 6:33 AM, Patrick Venture wrote:
> > On Thu, Jan 3, 2019 at 2:28 PM Patrick Venture <venture@google.com> wro=
te:
> >> On Thu, Jan 3, 2019 at 11:19 AM Patrick Venture <venture@google.com> w=
rote:
> >>> On Thu, Jan 3, 2019 at 10:07 AM Matt Spinler
> >>> <mspinler@linux.vnet.ibm.com> wrote:
> >>>> On 2019-01-02 13:09, Patrick Venture wrote:
> >>>>> On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com>
> >>>>> wrote:
> >>>>>>
> >>>>>>
> >>>>>> Hi Patrick,
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> I encountered a problem after upgrade to the latest opnebmc versio=
n:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> These log messages in ipmid are missing with the =E2=80=9Cjournalc=
tl -f=E2=80=9D.
> >>>>> Which log messages?
> >>>>
> >>>> This showed up on all of our systems too, anything logged using
> >>>> phosphor-logging
> >>>> is missing from the journal.  I even ended up using a git bisect to =
also
> >>>> narrow
> >>>> it down to:
> >>>>
> >>>> phosphor-logging: srcrev bump 30047bf964..31552c05e2
> >>>>
> >>>>       Patrick Venture (5):
> >>>>             add sdjournal interface to inject tests
> >>>>             test: use only one main library
> >>>>             bugfix: add fixes to mock class
> >>>>             bugfix: rename method to match implementation
> >>>>             test: add test to force building of sdjournal mock
> >>>>
> >>> William, you've been digging into sdbus a lot recently, can you take =
a
> >>> deep look at the patchset above and see what I may have messed up?
> >>> The phosphor-logging unit-tests were broken until I got it "working."
> >>> Which lead me to believe that it's not correct -- and the daemons tha=
t
> >>> have unit-tests that hit the log message are seeing the calls.
> >>  From reading more into the var_args pass-through, that may be the
> >> issue.  One cannot pass the var args down directly like this.  I
> >> propose to initially snip out this extra call and then revisit so that
> >> it'll resume working.
> > https://gerrit.openbmc-project.xyz/17054
> >> The problem is that sd_journal_send doesn't expect a va_list argument,
> >> but rather strictly var args, which aren't the same.

I generally try to avoid copying implementations, but an approach to
this that would work and allow testing would be to use
sd_journal_sendv() and have the interface call walk the parameters and
build a list of iovec structures and then pass that.  This is
effectively what is done by sd_journal_send, which just processes the
input and sends to sd_journal_sendv.  We could also pass to
sd_journal_print which takes a va_list, however, the behavior isn't
identical for structured log entries.

So my question is, if we lift the code from systemd and make it work,
that'll presumably add another license piece to phosphor-logging ---
and I'm not really sure how that works.

> >>
> >>>>>>
> >>>>>>
> >>>>>> My tests shows that the blow change is related, after I revert it,=
 I
> >>>>>> can get these log messages.
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Did you meet such issue, or any suggestions/comments to narrow dow=
n
> >>>>>> this issue?
> >>>>>>
> >>>>>> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066=
baa6f3711c88d6a3b9a5c4d49
> >>>>>>
> >>>>>> add sdjournal interface to inject tests
> >>>>> There were some follow-on patches for phosphor-logging that you
> >>>>> shouldn't need -- it's
> >>>>>
> >>>>> What SHA is for your https://github.com/openbmc/phosphor-host-ipmid=
 ?
> >>>>> (so I know what version of that is in use by you).
> >>>>>
> >>>>> Checking the HEAD version of
> >>>>> https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile=
.am,
> >>>>> I see it's including the proper libs to get the full phosphor-loggi=
ng
> >>>>> objects.
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>> Yong
>
