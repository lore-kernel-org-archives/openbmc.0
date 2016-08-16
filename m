Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x234.google.com (mail-ua0-x234.google.com
 [IPv6:2607:f8b0:400c:c08::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sCwsY3yQZzDr3R
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 12:14:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=d472RQaT; 
 dkim-atps=neutral
Received: by mail-ua0-x234.google.com with SMTP id 97so100431218uav.3
 for <openbmc@lists.ozlabs.org>; Mon, 15 Aug 2016 19:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=EIyIzwJO3UBH35yGbn8IPH8SHwj7/eTNpf5AlKZSvsY=;
 b=d472RQaTz4Lxt3MPy7aUDTnmewtmN/ibXHi/GvQkvewE2A4I78Zvf4sAReerzUHIbB
 Py/7tEVbqiQVnUcsVYATxENKRU8bR3+VkzSt4wfHsktvmOSWI4MjdG4u70khn/Be4+gl
 8tDvCK9hmESsPUqhDdfGLoVjVvzHfL5wSaAo4ya4PvCGlQJ8pp4SI8EGAzeasg40W2Qe
 Gr5HGRV13gJa8Dbs6959Ybo40LxsIBESzTvsK9KAVSjgjgqkUR8g22dC+/rCJmt0gkTJ
 qtDiir/FWPiDr41WsO1jVpvnphtII7d2McIv9qPXJxDEXtpJZWMCW3BkzIS1Io69zDx1
 fsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=EIyIzwJO3UBH35yGbn8IPH8SHwj7/eTNpf5AlKZSvsY=;
 b=igozMpUz7Qn+go7E3A5e5sbBs/QdD6ErYx56az3ZZRX75H8k6s2Le7DSMxqrpKTAXY
 k8SCOVT74uQhAZtrkcTzntoGI70VH9kGd1qMu0MePIm6Pmfd9u0EOa2RExs7ht3EQNdw
 LFce0oWfgCDY06NJfT+xyw4bZpnF8pLRvUQmLWZousqFGPNPZF4+HHL66y1rbtYEI9EI
 hxKR4rKg6E80QRSUsFv1LZkbabsD629N5m1cPYE0bkxWJCMnjgO/fA8ztGL9PiEtn4pG
 6LDRcjvsK6DktGOyIpUAU0TdMWSdwhdsaW6DW1A/eEQ565vX8DXQ7S6i52rSdFHhX8Fv
 vkAA==
X-Gm-Message-State: AEkoous4ZcekGQkvyG1CebNwEBP6ESJVx0UKwwl9CTnLwsb2Zo065cvGbSk5EUwwUJI/ty2xlj9+ruEDb7Mv1w==
X-Received: by 10.31.102.135 with SMTP id a129mr7546540vkc.112.1471313663331; 
 Mon, 15 Aug 2016 19:14:23 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Mon, 15 Aug 2016 19:14:02 -0700 (PDT)
In-Reply-To: <CALLMt=qweXqtGwNAA33EEzNVj=117wbuF_CDcr8JBeORFusU0Q@mail.gmail.com>
References: <CALLMt=qweXqtGwNAA33EEzNVj=117wbuF_CDcr8JBeORFusU0Q@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 16 Aug 2016 12:14:02 +1000
X-Google-Sender-Auth: sfRR3HdOsQckuxX938h-fzNVmvU
Message-ID: <CACPK8XfY=nOr3-TAZP2U3vQrrVA2bh8vcSeuj2oMcnunZdE+iw@mail.gmail.com>
Subject: Re: Robot Tests in CI
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 16 Aug 2016 02:14:26 -0000

Hey Andrew,

On Tue, Aug 16, 2016 at 1:00 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> I've enabled running our robot CI tests against all of the
> openbmc/openbmc gerrit commits.  This is against the basic ARM based
> QEMU model.

Thanks.

Do you intend to run it against the palmetto qemu? This would be
useful to ensure our kernel and userspace interactions are not
regressing.

>
> Reviews/Comments (or +1's) appreciated on the scripts to do this:
>
> https://gerrit.openbmc-project.xyz/#/c/166/  (main script)
> https://gerrit.openbmc-project.xyz/#/c/176/  (minor change to support
> QEMU in docker)

Andrew J has beat me to it. Look good in general.

>
> The jenkins job can be found here:
> https://openpower.xyz/job/openbmc-test-qemu-ci/
>
> The test team is working on optimizing the test suite to ensure as
> much coverage in as minimum amount of time.
>
> Also, I've tweaked the build-setup.sh script to support ppc64le,
> comments (or +1's) appreciated here as well:
> https://gerrit.openbmc-project.xyz/#/c/196/

Looks good, pending addressing Andrew J's feedback.

>
> Next on the list is a real-hardware based CI job.

Great!

Cheers,

Joel
