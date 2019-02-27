Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P/iCLIQ0"; 
 dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448jGY4LFLzDqKb
 for <openbmc@lists.ozlabs.org>; Thu, 28 Feb 2019 04:24:21 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id v21so8302192pfm.12
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 09:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hkS7po2vTIm0xQsUQEjalHbA+3qVhXJXIs4hs2nL7RA=;
 b=P/iCLIQ0WHK0qv5utpDZBKkCAvu1tQkWAdLXIsxDgcqnRg8Jve9s7GLxXnlVI+6sbt
 /vfXcn7FTitWX1i0V8J38I6zfV4n3M02883TOCSpxEh5Ac6ZdfMm6tnpOxOkUomRgyDE
 dE2UFIPW3FfZKZeMBvgoYLJ0aOuGCmRG72/d6TqQ748X7Wrb2zNvWlk6RwEEwn5teB2i
 PkLSti89zmiP22jMLsmkyfyzfYJ7F86E5DulohS7c3yzckYlqeyFUAXYBwbmPxP9HG5i
 b7voj7DHYxajPLJub9D3WDkkIOUanHgGXYxwQMhwd3xItZFXAB0frTxTLqtVzXfyz69n
 tJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hkS7po2vTIm0xQsUQEjalHbA+3qVhXJXIs4hs2nL7RA=;
 b=jg4J+sexR2HkztNRJbAIiMF4Avk/Zpjc+meQVnT/3KsdtBAqWRVrErcqXRxyVIpRxe
 +s4XRwKiosZFogpDwsgfO0c3wsRja/yIBrXYuQbrPuOpcmYl7tjeCcWgLbY3CU5IMUsL
 cTZbtGjU+nPqXG4anHfBoKq1/2+3WIQcT3qDsuDcBJvMcFBvILWTHQVG+4sogEMJ+RM/
 BtEvDpnEcsYuvvB87ZrxZdMkkuZr9I7pm9P+dXN+ZNomIf6TQCIopzdokF8jMIu4zoSP
 Hn70cbC6drSHz1f+Qdt3l5RIrIQq++o9BTAUw5BeB5MpCg4a01IZrYV0PueqTraXfttG
 u1Nw==
X-Gm-Message-State: AHQUAuZ9JHDUklKkmOzJJzGMy0W13fcVpxTaO6tUcAwkGmHMEp9PDKqO
 +CVfNMtkimNGV7dCddtj7oMDdvkFC3CQ83TOqVIz8g==
X-Google-Smtp-Source: AHgI3IZXKtyQ5skaApVdkW8v6sRzaYXTzzyf7bOcPq4INPsMVTzhwRQTaLeAYKFOoL7Y+RPucO20uIr9NCJEeuIIHVM=
X-Received: by 2002:a65:62ce:: with SMTP id m14mr3983917pgv.101.1551288258197; 
 Wed, 27 Feb 2019 09:24:18 -0800 (PST)
MIME-Version: 1.0
References: <CAFweeiT62MGOER0WMGMhvR5EX4t=7+pwp1p2BO7rYEq6e+qDdg@mail.gmail.com>
 <72974e00-6057-6d77-c915-7587115545f8@intel.com>
In-Reply-To: <72974e00-6057-6d77-c915-7587115545f8@intel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 27 Feb 2019 09:24:07 -0800
Message-ID: <CAO=notxaqG8AYxiAUfDZ=9n+S2AFp9bW4KA-h7DVhF8zx1Pjew@mail.gmail.com>
Subject: Re: DRAM usage on AST2500 with OpenBMC and Redfish
To: Ed Tanous <ed.tanous@intel.com>
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
X-List-Received-Date: Wed, 27 Feb 2019 17:24:22 -0000

On Mon, Feb 25, 2019 at 2:53 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
>
> On 2/22/19 1:14 PM, Keith Williamson wrote:
> >
> > Is 512MB DRAM on the AST2500 more than enough for OpenBMC, Redfish, etc
> > or is anyone in the community recommending 1GB DRAM?
> >
> Relevant quote:
> "640 K ought to be enough for anybody"
>
> At this point in time, the systems I'm working on only support 512MB,
> and I've never even thought about wanting more, except in maybe a debug
> context for capturing logs to ram.  On the other end of the spectrum,
> I've heard that the platforms that support 128MB have a tough time;  I
> don't know of any in between data points.

With only 128 on an ast2400, I get to prune packages every time we
rebase.  Things really bloat out.  Hopefully we'll have no more python
soon, and that'll help a bit.
