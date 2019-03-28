Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cRuiiMqQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Vddw6PGFzDqP1
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 08:43:16 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id c207so11966810pfc.7
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 14:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCPJpx6eo8izfXQwNFvJRYyZ1CxCjYpDxqtG6sMURic=;
 b=cRuiiMqQRJ+xaokAyPxIBqvfMRF6kVLrOwsBlA+Zyk5wW8BjeX+wgjDwZ+FX4kCi9O
 73x+7VcjEio1LRUJ6PxWqsh/0qDtvI31BZzn+PLgMjVbSeSrnfTcKhokMlbiNNLCw3gY
 DpOCu9vSyrIZkrl8VC+lCM++VJ1hFXWNuu9X9qdqTNPFFPNzPDcICA0V+grtZrUBPLmJ
 o8nVFLpZTeOKwVEZ/bCjarUSlfMsaSxGUe43+7YQH7tbU5RyS+rKhIr33ei3j17V5vAr
 xdNfesYV2SBUdV1cgeL9gkDKZYm8Vm5Ba4j+oXme5EFfb5Fxyr+GGczb953z+qDeOdIi
 cTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCPJpx6eo8izfXQwNFvJRYyZ1CxCjYpDxqtG6sMURic=;
 b=kPAMpSk/xB+/elxOZjP9hpguuVxspqbjlbSFIIt7KAIXTul+clWkXwyVItAKQhDd+a
 nfjoFWyp3HSUCpMxRN02TUABSN+lWluuzzvEmeBtmplpiW3wjxIpTuYRQfjTvMxGEb4u
 XtkW/h35mrydL3LB2v8GbuZ/kqkb2gSn1vLDDhvndgXXQZ+zc5BgGV6qW1gRM2KDV1db
 JZWkBZRzy7h3SykYgX0Ael2IgX/FDHIginrX6RQvt1Q9J4oYgj6M6oFWZNX2SyMXwCex
 wVAXMqTdN5YAO3sQOxEG3t5DJcAS4/Xp6yUmwMtyCxxaoAfBqh2+ovRy33I0gpXzbWbd
 hDLw==
X-Gm-Message-State: APjAAAWfLgz14YpFjA2D8Fs9p4d7kGyee+EnbUBQIJ5VdSgraZ5iPZ3Q
 s3ak7VcSAsg+diqRBq26kzf2UnrI5kISqu8y5UA1FA==
X-Google-Smtp-Source: APXvYqzgirClt3dLzzRFDNw1g6dDgHELhareK8U53eZbZ906nLTTeARO9NVWnfSf/6AdrQPoW7zkRJ/au2MLo3BbJrc=
X-Received: by 2002:a63:78ce:: with SMTP id
 t197mr29220365pgc.314.1553809394107; 
 Thu, 28 Mar 2019 14:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyUi=12Xi+cWMVf6uK5dgvq-d5zhHunBanxZ9QwwzhDzQ@mail.gmail.com>
 <20190328205110.g7f75url4pnixava@thinkpad>
 <CAO=notzRT3gMRbgT_cpdKr0swW0sgUUoYgE27fqkR_=Hr9ZaAg@mail.gmail.com>
In-Reply-To: <CAO=notzRT3gMRbgT_cpdKr0swW0sgUUoYgE27fqkR_=Hr9ZaAg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 28 Mar 2019 14:43:02 -0700
Message-ID: <CAO=notzJG+Ny9L+exGP1ZVf-kMSdEA=ER8_JcUG2XBNtx4iCJQ@mail.gmail.com>
Subject: Re: moving out of sbin
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 28 Mar 2019 21:43:17 -0000

On Thu, Mar 28, 2019 at 2:03 PM Patrick Venture <venture@google.com> wrote:
>
> On Thu, Mar 28, 2019 at 1:50 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wrote:
> >
> > On Thu, Mar 28, 2019 at 11:37:54AM -0700, Patrick Venture wrote:
> > >I've started staging patches that move the installation of daemons and
> > >scripts out of sbin.  For each of these patchset I have verified the
> > >service file is either already safe or I updated it.  Safe here means
> > >that it won't break.  Moving the service files to the repositories is
> > >a future step.  More fun to come.
>
> 99% are staged.  I also went back through and fixed up any service
> files I had path-chopped.
>
> >
> > Thanks for doing this Patrick!
>
> No problem.

FYI, I'm watching for autobumps for these packages to then fix any
references in meta-phosphor.

>
> >
> > -brad
