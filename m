Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TvyStGCD"; 
 dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43r7sr229kzDqWf
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 05:23:59 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id r11so1703022pgp.6
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=WGrC1rhwerTe/fb+Y70Nf72A2hiFbXvXVyEjsLl04mY=;
 b=TvyStGCDutopGSihDXWdJLhJq5wh+d/z//DFk9EEL2aj3R2lGTx5gV3M39FODiL7LY
 WBX2NOsQqR9d59Td/HgDbR9jT5Mg8fUjM9XZk/RMp7bm5WcKx7JK4BQOzcmGa0QZRURR
 7ZZkTpWIYztzxzecZ+kku0C0JVSEIVEnPQdrjhmsEUb6E7fdTLoReXcR/mRAeLBVM55m
 L+ZDzusrOHVvCYz56HYjaLRco4VcjHHQMPuJJIgOEACPK2R+F6VQJ33yW/kVjERQFXwP
 I4SyMcZm70fnNG0b6f7912/thy+PZlPI72pzwOec4Gx1Mq5k/OegIYa2S5vO7t+wNoEQ
 b5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=WGrC1rhwerTe/fb+Y70Nf72A2hiFbXvXVyEjsLl04mY=;
 b=SYdqlutOZp8WOsYtVGPdhsLsBfixy5FH16yX/SYifc2cavo1A0bsY5dOegExixdtbh
 rxPZJoVE4s5HAt/piT8cFgTu7JKMW8uXoUQlJHUWeCsVNPuSkj+/ljD/ePFpNTPT12AK
 Z9NSXFPZWpR3I9gd3+1OLFIWoowLPbbU8CeTQPdDNiyz8W+2tCZGr8To6s1x4wkcYeNI
 orUF/GMrR2y42Bml3AhedV710HjrtlLU1K8s54DM4hXKYlE6ANSZKdS9sGi8yo9/parU
 kybs9hHlT6evKmkstBu7WGjPiqxVAxXjNaGWTx3JzPCdzi7CctEWRbxOJx+0ivqcvALi
 skLg==
X-Gm-Message-State: AJcUukdxb3wp3kMXu6hV3LIAGhjHC1xWNhKKRHCgkWtcaKfGwLnQVfxy
 dpIUgu9hOUM+esFCL6nZfb2XcbAY7S9V8mZVuaLn1HaExG4=
X-Google-Smtp-Source: ALg8bN7JnsCHhEN4odjiSUGSLtJDTTZbr4L5RwcwHpQu02QsFcQl3gbP9biySe1uQwNLmkBIuHvhk/T0r6vwu4pMNEE=
X-Received: by 2002:a63:5107:: with SMTP id f7mr31322543pgb.218.1548959036509; 
 Thu, 31 Jan 2019 10:23:56 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 31 Jan 2019 10:23:45 -0800
Message-ID: <CAO=notxOOfpgjjvAe7BDQ3cNyN7EF8xJCoDPB0_JjSMKo96GgQ@mail.gmail.com>
Subject: ipmi transport size returns
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Emily Shaffer <emilyshaffer@google.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>, tomjoseph@in.ibm.com, 
 Natarajan Gurumoorthy <natg@google.com>
Cc: Jeff Andersen <jeffandersen@google.com>
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
X-List-Received-Date: Thu, 31 Jan 2019 18:24:01 -0000

In the future, the IPMI command handler will know the channel over
which the command is received, and therefore can ask what the maximum
reply size is --

Here's a caveat though.  The 64-byte buffer hard-coded in ipmid could
be fix, but at it currently stands, it's too large for BT.  Per the
IPMI spec, KCS requires 3 bytes on request, and 4 on replies of
header, and BT requires 4 bytes on request, and 5 on reply.  So the 64
byte built-in buffer, which was aimed at just aspeed (IPMI over BT)
really should have been 59 bytes at most so it could add the reply
header pieces.  But nevertheless, I'm looking at the max channel size
field.  And the transport used will need to account for this header
somehow.

When one asks, what's the maximum transport size for BT on aspeed,
it's 64 bytes. But the IPMI command needs to know it's really 59. And
if it's OEM it'll add additional information, but that's per command.

I'm curious what thought has gone into this.

Also, currently, there's no code for an IPMI client to ask the
question of transport size, so they can know how large a request they
can send.  The getChannelInfo doesn't return that field, and I don't
see an IPMI spec way to do it, other than using the OEM specific
bytes. -- which our plan for downstream.

Is there an overall cleaner or more general approach in mind for this?
 A linux kernel header will tell the client the host's maximum
transport size, but not the BMC's which could be smaller.

Patrick
