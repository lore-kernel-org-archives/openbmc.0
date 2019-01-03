Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AXooALt9"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W2dK6FkLzDqHn
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 09:28:53 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id y126so17308935pfb.4
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 14:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XSmWh953+CLMa9Vnze4e75uJsqrW59O8Q2ygzw9xSaI=;
 b=AXooALt9yNuHTJ719I6d/RVRL2wsaBix1+o2YSrWTvjCND0CtM6zB/MHvLyQfFkhod
 byXIQZpO/EGCETqcsGOVzCy892YtjKAOwWVKDVQQAFHfVSXjr3TvpOKauesoxJIRNFsG
 Siq0nkpImw+wMgXdtZmvYHto0SHn6130A96K8nyEHQKYm4TdmhCIRV2hFakRTF4aSabM
 o7dSu9NKVwsElTRGww3gHhav35cjfk8NJ8+AxUUi1Ck44Sm9JsAjTg48ebtMJMRFHADW
 ZfaIZMK9pg8iXTb/FH+Jq2bqN+Jum11kzg2wOTLcw1k4rkFy8dSBk8V1h6t591ejaKjN
 sJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XSmWh953+CLMa9Vnze4e75uJsqrW59O8Q2ygzw9xSaI=;
 b=Vb4e1TknWzXBAgc5eM+6wOPFK6SikfM6eIl7Sh0Trf91RJAhfv6kISTYGOzfiMEazs
 vYENxv2UjepthFCV47HtIFGSwlOcwUJ0xZNrqkW3L3jv/+p3B4PVppbKU5AlTtiCh+fX
 YBQypwNHSSEqcUfxJOIwQMPHgWLm9EFaIOtS7P8F2kvtqxm48iwx8/YL3yskw33IUcMX
 VuGiMU/q9xTl6cvtYTWmIjjVUVRHcaVavm4W5wx0dhjNV7ZGgmpIWMyjLO301ZJoLYPR
 fxV8KVhX+65+c45HXlxH+oqjXJgqz1uLl5puKW74b83gUOfFwgJcky0gVRam3T9htkOP
 sTbA==
X-Gm-Message-State: AJcUukcqMFPLBvtC7kLdAMhuj/b1h0twCbrNOJORFoX4/298+femVXcx
 yalC3UwBD5o+C8YyRXp43mXf/cItYLR2hJj8wTrRbw==
X-Google-Smtp-Source: ALg8bN5nWpepTU2M6SRlFchHWl62zkhPIkiJGzvfzFrpH6wmLRGOcvjfh9qynf/l41Jq2sp5zc4A7nreXMmJNkiyNjE=
X-Received: by 2002:a63:fc49:: with SMTP id r9mr18175659pgk.209.1546554530765; 
 Thu, 03 Jan 2019 14:28:50 -0800 (PST)
MIME-Version: 1.0
References: <000601d498c5$7c4c2010$74e46030$@linux.intel.com>
 <CAO=notz4=R-v8yoyYRqRDBBvSaB6mBUNAaZbeQcf0a_wCHQ7qw@mail.gmail.com>
 <e7a140e4aaeb2bed76a9d36cbc422ea6@linux.vnet.ibm.com>
 <CAO=notw81jtXKHJOK2MaqG73Pu86=ZZY1UjYzg-NbHQnaqZUjA@mail.gmail.com>
In-Reply-To: <CAO=notw81jtXKHJOK2MaqG73Pu86=ZZY1UjYzg-NbHQnaqZUjA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 3 Jan 2019 14:28:39 -0800
Message-ID: <CAO=notzkJgHAxB8xoG_2qBtnRv3-D7pUji1ykqaTSSbn-T0j6g@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Jan 2019 22:28:54 -0000

On Thu, Jan 3, 2019 at 11:19 AM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Jan 3, 2019 at 10:07 AM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
> >
> > On 2019-01-02 13:09, Patrick Venture wrote:
> > > On Thu, Dec 20, 2018 at 4:38 PM Yong Li <yong.b.li@linux.intel.com>
> > > wrote:
> > >>
> > >>
> > >>
> > >> Hi Patrick,
> > >>
> > >>
> > >>
> > >> I encountered a problem after upgrade to the latest opnebmc version:
> > >>
> > >>
> > >>
> > >> These log messages in ipmid are missing with the =E2=80=9Cjournalctl=
 -f=E2=80=9D.
> > >
> > > Which log messages?
> >
> >
> > This showed up on all of our systems too, anything logged using
> > phosphor-logging
> > is missing from the journal.  I even ended up using a git bisect to als=
o
> > narrow
> > it down to:
> >
> > phosphor-logging: srcrev bump 30047bf964..31552c05e2
> >
> >      Patrick Venture (5):
> >            add sdjournal interface to inject tests
> >            test: use only one main library
> >            bugfix: add fixes to mock class
> >            bugfix: rename method to match implementation
> >            test: add test to force building of sdjournal mock
> >
>
> William, you've been digging into sdbus a lot recently, can you take a
> deep look at the patchset above and see what I may have messed up?
> The phosphor-logging unit-tests were broken until I got it "working."
> Which lead me to believe that it's not correct -- and the daemons that
> have unit-tests that hit the log message are seeing the calls.

From reading more into the var_args pass-through, that may be the
issue.  One cannot pass the var args down directly like this.  I
propose to initially snip out this extra call and then revisit so that
it'll resume working.

The problem is that sd_journal_send doesn't expect a va_list argument,
but rather strictly var args, which aren't the same.

>
> >
> > >
> > >>
> > >>
> > >>
> > >> My tests shows that the blow change is related, after I revert it, I
> > >> can get these log messages.
> > >>
> > >>
> > >>
> > >> Did you meet such issue, or any suggestions/comments to narrow down
> > >> this issue?
> > >>
> > >> https://github.com/openbmc/phosphor-logging/commit/59a6b1f27e83066ba=
a6f3711c88d6a3b9a5c4d49
> > >>
> > >> add sdjournal interface to inject tests
> > >
> > > There were some follow-on patches for phosphor-logging that you
> > > shouldn't need -- it's
> > >
> > > What SHA is for your https://github.com/openbmc/phosphor-host-ipmid ?
> > > (so I know what version of that is in use by you).
> > >
> > > Checking the HEAD version of
> > > https://github.com/openbmc/phosphor-host-ipmid/blob/master/Makefile.a=
m,
> > > I see it's including the proper libs to get the full phosphor-logging
> > > objects.
> > >
> > >>
> > >>
> > >>
> > >> Thanks,
> > >>
> > >> Yong
> >
