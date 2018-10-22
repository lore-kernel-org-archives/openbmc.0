Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="KnSimjdW"; 
 dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42f6f15QdFzF1Hp
 for <openbmc@lists.ozlabs.org>; Tue, 23 Oct 2018 06:53:45 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id c16-v6so5511648qtj.13
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 12:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rJUdNC7NGJMzieznNnjra2YriUW7uSAtzphuP+95GrI=;
 b=KnSimjdWMG/z+KGmqS120mpjM75S7zCIfr09woJqB62Nj9PvSs3T5i/hmxZ25+1Ynd
 d/bFSRlMsGEJt0dg8gcwm1YnAt/E6pB1RsIvF3eSn1xiAwLu81BrMXhhHIhVTFzyYht3
 xdWBcUeQZHMjVPZMIlQloy++CYit2BBteUj+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rJUdNC7NGJMzieznNnjra2YriUW7uSAtzphuP+95GrI=;
 b=bUbEzxbCfLNq64FmW351vYmR2EP2OA8lF1HuujN1dw7ohvw+t/i8C2+fclPVx1E1LF
 oNTvATXLKo5dYrBPYNEO4LKRXfVkMLBhNSJY4qS8idnFhlsXMM2Ja3uRHfShkFjtOyNM
 kh1ZdSlT01Ptsg4l02xP1lUbPrTxeWXPjvjfMjQc+tQYlkiQ60XlsdEG0yIh1/jxAiXH
 CghpiK9brEV8cwffT3O90q2y6UHh2oQUjNzzJmmExuxb22ecN75JA7PMXHphT+Vwfkie
 5ue/1rtMTLpEF+rt0QjZETSBTZWBkQm/KXRMAjzA5DpQjeuzFRvQf63fKc8vxrSXEEl4
 532Q==
X-Gm-Message-State: ABuFfoj2rTi/BBFWcktDWNl9mIjhINbwNLhWak5fOjccGAuW0JkhTbgo
 oLieabW+Pe32lPK/Tu8iljD8dnBIasj2snmxm1M=
X-Google-Smtp-Source: ACcGV638ZTELGWkIVauKIj3EYRj1jf2zJQyjXDt9qvRdpnm24uRGFqJz/q1bu/PyPT25Hw9jRUBiA/ru9t9GvF4sr1o=
X-Received: by 2002:a0c:b484:: with SMTP id c4mr26542383qve.245.1540238022923; 
 Mon, 22 Oct 2018 12:53:42 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Oct 2018 06:23:31 +1030
Message-ID: <CACPK8XcQVomeBogf95fjBWXwgiR5vUVWKJBQ7B+XMCt+f4r9FQ@mail.gmail.com>
Subject: Qemu tree for ASPEED testing
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 22 Oct 2018 19:53:47 -0000

Hello Cedric,

OpenBMC CI runs the flash image on a Qemu Romulus machine type. Recent
changes cause this to fail to boot to a prompt, as it is booting
really slowly causing services to timeout and crash, which causes
further timeouts, etc.

I think we suggested at the OpenBMC meetup in Amsterdam that we
recommend using upstream Qemu for general testing and CI, as it
supports most features that developers working on the BMC require.
Booting the kernel works great, but the userspace doesn't fare so
well.

This week's dev-4.18 changes make it much worse (I suspect the timer
bugfix). I did some testing:

 - v3.0.0 tag: fail
 - upstream master (b312532fd034): fail
 - openbmc/qemu (c69dbf6af2c1): fail
 - legoater/qemu aspeed-3.1 (0652f2642195): pass

What would you recommend?

What do we need to get upstream from your tree to have 3.1 work well?

Cheers,

Joel
