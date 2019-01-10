Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TLFJ87vs"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43bN1Z6phdzDqw9
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jan 2019 10:46:26 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id w7so5473593pgp.13
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 15:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+GKbVhKB4DY3gT+LVwruvujS7rwMAtHicMqeQcfWyw=;
 b=TLFJ87vs6/1ElOsvl1kfKmr0a9Zo4KPV4gOqD1R5MiOzLEEKueHvE4kBlib7XB2qo3
 W+ZRSxmhl/hU7BxcnVTEKzGxCGTvhuexL9J6J8V2xU4sa4vm2Qzqf/YfmtjDDU/daP8t
 SWXJJB565d6vli5cF0MfTaDm8VyYNGLuToSnF1mQ6ptgTrMAEnz1u3VD7DG2LinlnOVc
 Qy9hHpsNtI+7HIr4L/WC+a1PQWhLPGAS3F7fbz9hp9eNrbAaDlUZgv+Fdjl0M23RPAvk
 6XaPddXwHeTUnzxKpWNJbTe1MSx2fnjY+YNH/ewmP8PlNU5++uR+UGqCiRrEMnVEU/Xn
 cqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+GKbVhKB4DY3gT+LVwruvujS7rwMAtHicMqeQcfWyw=;
 b=hYNZtNdANWlFNP9rvo0Yh1VtGm9R9oro0P1THgaVDKJmdvFlzfoC+e/QYFyDjdw8ed
 /XYTOZaJyWUM/xa8gjqwpaXMuwnqWW8YAvrndzFJVyzyQVro9ORdURfEVMB/67k6U9sG
 coFgKykd/IF09fcSID1j/ITLGlO+h+o8v4Ljqd0QXrh7cHwNBJJNfgo3+t1dNM+F8Uvq
 +xUTWe9rb30/cvG91WrmcCqJrE53NdjEZgKQSA0MnN4/QW26h4lrwMNR/v8Gu4N0Uod2
 7An3XZmY998heGUkSDYddFJfrayQt4A04rp7GJMQC08MQhhiJFdM3nHIUGfJjMRJpPlZ
 gEyw==
X-Gm-Message-State: AJcUukcMGfAbdHMbho2/g4FEGy0IOgSwemRJ2X6K/3FTv/FHGbGOY64G
 3wXo5ke4BsXS9cZadmCf423ugCt59nzA+dBLu2Z6MQ==
X-Google-Smtp-Source: ALg8bN5hkjxoYZFyYg/H+RB3yvqhUKOcFrdJpHLXvN+OcppwcDLvzXdT3981OMIwj+STbTCd8jzLCEhq9Zh7Dy9p5xg=
X-Received: by 2002:a63:9a09:: with SMTP id o9mr10801427pge.94.1547163984595; 
 Thu, 10 Jan 2019 15:46:24 -0800 (PST)
MIME-Version: 1.0
References: <CAO=noty60eC2hS9xGTPArs2OCZyuRWAjWWbsWBdv1A82o1QCwg@mail.gmail.com>
 <20190110220623.GA7259@mauery.jf.intel.com>
In-Reply-To: <20190110220623.GA7259@mauery.jf.intel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 10 Jan 2019 15:46:13 -0800
Message-ID: <CAO=noty9tVX_G-TK+XYbESQAwFwwB7or-zxH5ZkuC8wwBtXK4w@mail.gmail.com>
Subject: Re: Packet Size Mismatches
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>, 
 tomjoseph@in.ibm.com, Natarajan Gurumoorthy <natg@google.com>, 
 Benjamin Fair <benjaminfair@google.com>
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
X-List-Received-Date: Thu, 10 Jan 2019 23:46:28 -0000

On Thu, Jan 10, 2019 at 2:06 PM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> On 09-Jan-2019 09:10 AM, Patrick Venture wrote:
> >Per the maximum response size patch
> >(https://gerrit.openbmc-project.xyz/15743), the goal is to know how
> >many bytes can be returned by the channel.  This can vary by channel,
> >per the comments, and other related changes.  However, presently,
> >we're seeing a memory corruption over kcs which has a limit of 256.
> >So, we're copying way too much data onto the response.  The code
> >itself has no idea how many bytes it can send.
>
> This is a tricky problem.... Ideally, if an IPMI command wants to return
> a large number of bytes, it would consult its context and return an
> error if the response would not fit in the channel. This relies on each
> command to be written correctly. In a slightly less ideal world, the

Obviously the 64 byte response buffer in impid will be fixed at some
point shortly, probably in your currently staged patches.

Is the context something new being passed to handlers?  (I haven't had
a chance to really dig through your full stack of patches).

> ipmid daemon would just return the bytes that the handler returned and
> the bridge (kcs, bt, rmcp+, etc.) would then refuse to package up a
> response that is larger than the max payload size and return an error
> instead. The problem with this is that information is lost.
>
> >https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.cpp#L409
> >is a 64-byte buffer, but the ipmi message could ask for data beyond
> >that, and leads to a blind memcpy situation.
> >
> >If I'm reading that patchset (not yet merged) correctly
> >(https://gerrit.openbmc-project.xyz/16285) it lets the IPMI client
> >request channel information to know the maximum it can request.
> >However, what lets the code running ask that question?  How does my
> >library know it's responding to a legal request?  Or is the idea that
> >with the reworking that's underway it'll only be able to provide legal
> >responses automatically for the channel on which the request came?
>
> I have a patch in review (it actually has a +2, but it is waiting on a
> parent), that exposes the channel size to the IPMI stack as it is
> running. This allows an IPMI command to query the channel size.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/16285

Good.

>
> >(Also, unrelated, but at some point is the goal still to have one
> >daemon handle all ipmi traffic, including network ipmi traffic, via a
> >bridge similar to kcsbridge and btbridge?)
>
> Yes. That is exactly what the sum of all my patches against host-ipmi
> and net-ipmi do.

Great! :D
>
> --Vernon
