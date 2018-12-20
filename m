Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZkwPWYy9"; 
 dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43Kv7X5Xr9zDqkZ
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 12:19:52 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id i7so70662qtj.10
 for <openbmc@lists.ozlabs.org>; Wed, 19 Dec 2018 17:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ymr5Lc9ZB+Emk5lU8mclfnEJTz27uHN3p+Q+Fy6ZOho=;
 b=ZkwPWYy9ZvIn+VDQI+MvlBdSBi/B1RkyiVPPUlz0biYNOji23D91+UrW1gaPGLK6tp
 563N0Jemp0hRXtf/2wLRXyLxUQ/gTDE0OY7d30Cst0GR2WVCgKsdATMegKkV5tV7nIUF
 Lv+rrBUwaoZf3qq0iozGkkvuWidYHYVg8p6GcyXkPE2vhx6XAnkblU1hmc7jO+fOjI1o
 0O/sc88zZRquN1APfdGyKq6AucO7AtWGeMR7KkOh5/6kQ1ELrx3tLoIc1I8q+nkTgwMT
 f0eLDBYNo5OZje4H7//aeUU8Q+PI/nJDeOVLTkKeN9/8gkCQ9e7KOCySOmKE7rmZvofb
 yJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ymr5Lc9ZB+Emk5lU8mclfnEJTz27uHN3p+Q+Fy6ZOho=;
 b=MgpCmxs3+/oTN0auI+TjJQRLJniIJ2Q7VmGPYYdtnrUhiAzgp1hzSZw3ixaCebnZ3W
 LhF37MMjbX88TTdqVRgf450gQJG+axied0sTO1aH5jotJKjqIBzJsNZKTstOpsVIg0vk
 ErPxO+PThk3wE6SqiKLMmqbxIrjdWxvYYE6oHm2Dvf0mk1ua3sQUs2Kc7TYduk4dKOIt
 gHC8kXUhWkbv0Lurd/RmgPG9hz2qE3P3RYYuoEF4wU71FeXnk48bhfFPdRvOFVLtVNjB
 XQauKz8iopGtqM7ZlFjSN6za/VB+gICKKwzTD1nUJM8KwBBgS0li14kbWWeEVVJZmeVd
 9R8Q==
X-Gm-Message-State: AA+aEWZB4fQ/GmdGL/dX3Rr93Jn0iLJCtYPIbgNoY2ZsD4uLwneZjJ6i
 iX7j1nlhBji+6wxSnnL03JuFGwss4vI1FhVcuzs=
X-Google-Smtp-Source: AFSGD/VMPPqL+yO1HrHdvs8ez7w9WBGgPQndduCQied9ji+I7DOqCb9tOHFJ+kw6yrEXcQ4vp3XW5yXEY3o7+PzkYQ8=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr23838747qvq.55.1545268790202; 
 Wed, 19 Dec 2018 17:19:50 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
In-Reply-To: <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Dec 2018 17:19:24 -0800
Message-ID: <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Bradley Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>, 
 OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Dec 2018 01:19:53 -0000

On Tue, Dec 18, 2018 at 5:07 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Wed, 19 Dec 2018 at 00:42, Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> > I wonder if this is something they would be interested in upstream.  I=
=E2=80=99ve copied
> > the oe-core mailing list for possible comment.
>
> Thanks for forwarding this to us.  The class is very simple and just does=
:
>
> PACKAGECONFIG_CONFARGS +=3D " AR=3D${TARGET_PREFIX}gcc-ar \
> RANLIB=3D${TARGET_PREFIX}gcc-ranlib"
>
> That's quite an abuse of PACKAGECONFIG_CONFARGS, I'd recommend just
> setting AR and RANLIB directly in the class, they'll override the
> defaults in bitbake.conf.
>
> That however leads to the question of should we just change the
> defaults? Does anything break if we use gcc-ar instead of ar?

Dont think that is a good idea in general since gcc-ar is a wrapper
around normal ar
passing --plugin=3D/path/to/lto/plugin/so and that may not be right
thing to do always.

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
