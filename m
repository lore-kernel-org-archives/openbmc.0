Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Fh8XWl2N"; 
 dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 445lFM5VkyzDqWh
 for <openbmc@lists.ozlabs.org>; Sat, 23 Feb 2019 08:43:03 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d15so1674947plr.1
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 13:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yprb/pz8nHcCgW53KrciaG1HfiJk86x3+Sf1fxje+OU=;
 b=Fh8XWl2N61C86MnchK9IRMPyPU8B72YRVzmzS2sF7SKf+gqdiv8lcXtaJ0dmFX5KCJ
 9EmlZgF3ODj6LIGkl+sk6PpnuZrntk84NbTI2k9TMHb0/3xwuUZoppeNFKkCKebsp1QJ
 bAZL2bs8HsFXfzYp3x1Go3lylBXCSCV5IL658Zx08cdyhSP0XKb9Tsq4D0MtZFIZo7JI
 Aiqzbzf+QP+MlVCPn8+srE3UdAEAQfCVzKWjwk5PtpZWtQCes57uHKSba2dJR5RKUU5R
 qpGl2PBMRpcRe9kfY5JVpyMfcBcJiFyzBBHb3za/77ZIDcMt5axTt9K+DMZnPKHmcbxA
 bJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yprb/pz8nHcCgW53KrciaG1HfiJk86x3+Sf1fxje+OU=;
 b=XrlLDtOLVvhhARl2rsNkUu9sDfOGR4SdqhlwRGu8vPjCsV8UtdUVqKGiUT23HdhS+5
 KoWJLFH5Eac7tlvntq4R8IrmLZYeLu0gt5NiMd1v9P6vChe+0N6qKMraD+5xAyz6ZkFn
 77tbkBY2wxhwocPkagfj/qT/0/oaYZfE3XZcKH1LlpP4XWZTlC1B5rJ6jlU5k80IYFPW
 4vXtww4/c0dBBXzjWOq7V9iJbqeGrTEbuODnWkVI3a98OQ4pE/AThqbsMHv/gwaOc0uG
 5qStRWHVqemxk5fBwkJiZNXkrplO/snoX7ow2Qfi/hBJ9n1sQ0GZrrRoil+Y/Ck9tH9Z
 E0LA==
X-Gm-Message-State: AHQUAuYnlHbIGEKf5/eeLQKL1BWAx3Ot8YsGaMgYDf2ecycwYtu/L25w
 Nj+RsB8W3gpYwr7D8DG5SJGD0qY8nS6Y3jScWgotHA==
X-Google-Smtp-Source: AHgI3IYFwfmhHzN62B3i5aeMVzy7Sr56EYvxWbyBdR76hJf+mzbbtsmsqIrqTt9s9P7mHmVpvPONQ3AYUOKIFM4z2Gc=
X-Received: by 2002:a17:902:8b83:: with SMTP id
 ay3mr5963929plb.1.1550871781408; 
 Fri, 22 Feb 2019 13:43:01 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwH0_2nGmWaxyr-56Tzb_SFJHmdUPeUZpjWBBVm5EArzg@mail.gmail.com>
 <20190222205129.GB44612@mauery.jf.intel.com>
In-Reply-To: <20190222205129.GB44612@mauery.jf.intel.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 22 Feb 2019 13:42:50 -0800
Message-ID: <CAO=notyqagt2BQ94mMt7oUWTQiRFZUj8vLOj3yeCnhpezyEB=w@mail.gmail.com>
Subject: Re: IPMI Channel Config Removed?
To: Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Fri, 22 Feb 2019 21:43:04 -0000

On Fri, Feb 22, 2019 at 12:51 PM Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
>
> On 22-Feb-2019 09:55 AM, Patrick Venture wrote:
> >It looks like the channel config for IPMI was removed from the
> >sources.  Instead the channel layer is doing something by checking
> >with the sysfs device instances -- and there's some mapping (I haven't
> >dug into it).
>
> IPMI channels are configured with a JSON file that lives in
> /usr/share/ipmi-providers/channel_config.json on the BMC. The default
> file in yocto-land lives at
> meta-phosphor/recipes-phosphor/ipmi/phosphor-ipmi-config/channel_config.json
> and can be overridden with bbappend.
>
> >I'd like to know if I need to do anything to configure the channels
> >such that eth1 is channel 1, and eth0 is channel 0?  Or Did that
> >change?  Can I make eth1 channel 5?
>
> Making your own config is as easy as overriding the default with
> bitbake.

Thanks, I'll take a look at setting that up for the platforms.

>
> >All our platforms were using channel configs, and quanta-q71l upstream
> >was too, so I'd like some explanation as I don't remember seeing an
> >email about it when it was dropped.
>
> I don't recall if there was an email, but several months back, there
> were user/channel config reviews out that slowly got merged in.

Reviews notwithstanding, in the future it would be appreciate if when
something like that is changed, a five line announcement email would
be appreciated.

>
> --Vernon
