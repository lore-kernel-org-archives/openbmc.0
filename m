Return-Path: <raj.khem@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OliCi3c1"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43LJ5y2vxmzDqxk
 for <openbmc@lists.ozlabs.org>; Fri, 21 Dec 2018 04:04:54 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id l12so2571342qtf.8
 for <openbmc@lists.ozlabs.org>; Thu, 20 Dec 2018 09:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mn993nIKFxJBx55dGKo744l1m0HeJilGuzoTT10UWZI=;
 b=OliCi3c1DFY1glcnFZk8s9Ngbk7RRjAnz+nbGB39r4WfG5hR3MjfjmVbIrxrDaGZCe
 4vIEHru5URWkyw09L7VwV/3hfWSmaGBE+2a/C4ZD+MjGfPrzvZQjCo03+6VZ3To9m773
 AZj5Nje2wRggvMz9T9i0B3M+7fN7T7yiZ8tTdRdJJyA+MrS7Ev3IXm+YRfxkAmtimgJk
 Q1oFHXiKCBUhqJnpMXJwfZRYHi8DUiGTCn2a5W5naRNdVRyHJbxWcHZeR/n16PND1/RX
 ilvSLQY/mZjD+Z2regKsW+DSfi2nD2YThcLvpux1wi8lWP9k9ZEYv7YFWv3SYzqvatXS
 zhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mn993nIKFxJBx55dGKo744l1m0HeJilGuzoTT10UWZI=;
 b=gCXqiCrNPvsgpifzAGbUn08COOG5OQTS9KJzhW82nBjSDDBjhaIogioACpSvmenSxL
 9izPRlcZLCLSi7gtuzPJCjNPxsdAZ9W+dwIMYAe3K+z+e0hsUhSzuHif943456lXsQ9p
 lqdd3fRbVNaTtcxEcmqqvEBJthuXVXnshMdC5LVrFFAWe8zLN6s+Tzcl5KIwQam9kPwT
 MS6bQSkjzO1kWq1QKvtE1LXOLcJbJwU7LnHRNaKuh2t6digT7f9vEJle/56DaIyWv3O2
 aRyrv8V2eg+JAdQIizLPYH7EVGlp2WMgDyssPK09wzLkXDoby0vpfrwXz0HBisxhGQmY
 1wow==
X-Gm-Message-State: AA+aEWZNw1t9a3XYh+1qlKFEuBdCkImTgVKaww36we3GZhzFjKOZAXAl
 Rg6IUHeW2ztjndwm1fI4XYHXePojJFG6iXn2aGk=
X-Google-Smtp-Source: AFSGD/WgAblbVfUYAGcs5FWwBKmX+BfvPcLBkpnF/07QY+8tbayU3cquHBD0+LEZFYQi+gzb/5WdF9x51JV5i20Z1cI=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr27223966qva.50.1545325491126; 
 Thu, 20 Dec 2018 09:04:51 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
 <E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
 <CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
 <CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
 <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
 <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
 <CAJTo0LZi9oF4cW815RP7XkHR6vj_qOgOb5LUrCGSCBK1oa1cfw@mail.gmail.com>
In-Reply-To: <CAJTo0LZi9oF4cW815RP7XkHR6vj_qOgOb5LUrCGSCBK1oa1cfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Dec 2018 09:04:25 -0800
Message-ID: <CAMKF1sow0bZU_vkOVkT7zJYqcuKvqy2HxfDHdWyJGC+f3YRy1g@mail.gmail.com>
Subject: Re: [OE-core] flto automake
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Bradley Bishop <bradleyb@fuzziesquirrel.com>,
 OpenBMC <openbmc@lists.ozlabs.org>, 
 James Feist <james.feist@linux.intel.com>, 
 OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Dec 2018 17:04:56 -0000

On Thu, Dec 20, 2018 at 7:48 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 20 Dec 2018 at 15:37, Khem Raj <raj.khem@gmail.com> wrote:
> > > Well, I built core-image-sato core-image-weston with AR=gcc-ar
> > > RANLIB=gcc-ranlib globally and it worked fine.
> >
> > Please build a lot more. These images cover only handful of recipes
> > there are problems like
> >
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77576
> >
> > which we might have to contend.
>
> That bug from two years ago suggests that the gcc-ar wrapper isn't
> required if GCC has been configured properly.  I guess we need a test
> case.

cmake's approach of defined COMPILER_AR and COMPILER_RANLIB etc seems
better to me. where it can be uses selectively only when LTO is in
play.

>
> Ross
