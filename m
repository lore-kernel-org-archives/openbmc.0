Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4xty1k4bzDqBg
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 12:36:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=e5BPUePb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=CNjZ8OdJ; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id t140so7070861oie.0
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JU0FKDvY/9b71TUO4sC9QWu1UluqT9TYEeneZ5sEzS4=;
 b=e5BPUePbi4WHLAZlT7jPwz4gBs6DLNxrJTSEqI/1Y44E/uKIWWbbVcxDmeUfeQJLDW
 tb28WGOyOB0adndWD3/A6/N3G1DuwUos62aMF9WsXqi32hWgqxTp2bzu3jy9ptmYcQNa
 toNiUpvI0Jd0mdHrfUiZs6D+OlMDxnoCdCrT8GnZcAnTP36wN/mN1gR9az/w4ZQ8iko/
 rZrZstt2FE/hmX9e27bnFTW+FI7bZovBX8aMX/YHo9BB4tBa+qStNRVnmbiknlm/3oGy
 vYrvvSHTN2snr558ijBKYe46FMYLqLYEZNQ6ae6gQP/+K8N1VCCOH32LwbulIJoyMQL8
 ek2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=JU0FKDvY/9b71TUO4sC9QWu1UluqT9TYEeneZ5sEzS4=;
 b=CNjZ8OdJXO0ldmW3KhIkgaAWFMeAsh/zPP7TLa1gnmUjOeYqoROFGAg93/wHtbDfvc
 kFvqD0SEoMfeJ9vt0AK6tXXBnJUMIodnXuO9sLYrQ8OGgW+NuobInFhVrtHpNolBbgex
 sjw98odRzD7o3bh3Atsui/mz2ddI18e1XzToI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=JU0FKDvY/9b71TUO4sC9QWu1UluqT9TYEeneZ5sEzS4=;
 b=RVvfoxYFl2WNOt/ZkRAKPtoLsj62XhgxnH4GpNCSheqdBFzNrm46sEMSia5crWBDkj
 IdH58EsyecA3Tl/OOmtms4n31a/YgxFU2vGV8Fbl7HhdrD2e8bwkAR1gl+nXFC6smd7Y
 Z88ZgeYLfevWcUEflOIeFkNZfdd7MWfB3bztq7+YO5N7zn/VbLog1FOdwFAgq2Qk0Skb
 M6IO3SvqJhWHekcrm1C3TLUhcPlbgM+FP0+zfq+S7qBZo8ApLOcXIrp3Sfal05VncsXU
 k+UqmG1OiHEA8tjQumljXu4aefgUELJCTVyn+2GBIvH6ZMVTjeZRHpklmlB4gLrGhuMT
 CQxw==
X-Gm-Message-State: AOPr4FWlcV610CyEiRdcdQniP3PIznCUG3qtLJV2trPDbLuM2yvXIOQbevArj4sIHKW5oU/2Hykm2USvQsOMwQ==
X-Received: by 10.202.207.85 with SMTP id f82mr4202130oig.44.1463020568282;
 Wed, 11 May 2016 19:36:08 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.3.102 with HTTP; Wed, 11 May 2016 19:35:48 -0700 (PDT)
In-Reply-To: <OFE9697F6C.790CF213-ON48257FB1.000C0610-48257FB1.000C2AC4@notes.na.collabserv.com>
References: <1462943431-29445-1-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xd+k1spKehvyotFjgyDobmnSDe+wfYa353urGXFkuGTYQ@mail.gmail.com>
 <OFE9697F6C.790CF213-ON48257FB1.000C0610-48257FB1.000C2AC4@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 12 May 2016 12:05:48 +0930
X-Google-Sender-Auth: JET11jRDarIrKwnOzX0L-fUeaM4
Message-ID: <CACPK8XeXMY3tNNjE6FKuOun+PyBbJxt4R=fe4M=wR16Hq7sycQ@mail.gmail.com>
Subject: Re: [PATCH openbmc] [openbmc]: Build adm1275 pmbus driver into
 Barreleye kernel
To: Yi TZ Li <shliyi@cn.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 12 May 2016 02:36:11 -0000

On Thu, May 12, 2016 at 11:42 AM, Yi TZ Li <shliyi@cn.ibm.com> wrote:
> Will adm1278 be specific to Barreleye? That is why I did not patch the
> defconfig.

It's okay to have it in the defconfig - it's only a few kb of binary,
and makes sure we are always testing this driver.

Cheers,

Joel
