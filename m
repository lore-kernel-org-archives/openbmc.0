Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x243.google.com (mail-ob0-x243.google.com
 [IPv6:2607:f8b0:4003:c01::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 52AC81A0035
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 12:24:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=fjjAobhD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=R17Lr4xX; 
 dkim-atps=neutral
Received: by mail-ob0-x243.google.com with SMTP id hc1so1577278obb.0
 for <openbmc@lists.ozlabs.org>; Sun, 28 Feb 2016 17:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xiKlUn7Px3IJWf3PR0F6ldvVHVJf+RP44JH5LwvS/oc=;
 b=fjjAobhDdWnTkkX4JOYvFfYO5Afih9oaSxiWZ6IVYs9hzqHiIyhTBER7KH5LAjdQKm
 qtnDv4Nko0xpTIUSszA5JBszYKAwpdJpjmoK4Ypg7tF2zI3llEw4xdOxx5cjU6kurxBf
 2rvO8ThIuKVXjLL9zEJaLtb6f6pqqEYSlJQIlot/+yJVOP1UeL/7fp9EGL81iYCWh0Fh
 6at7TuQdv3r2jE9C8uv2dMj8mY1bpBUSU4NPa0wLZ+DV1TqxNQn9UICfLZSxRTeqzvm9
 SJGyvrLFUL6BdkQ+YmG3m0+m4JgPQanEmKvZbgdV7Pt3J+UEW3mdKQ1zOt3AMubMvg7o
 qpCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=xiKlUn7Px3IJWf3PR0F6ldvVHVJf+RP44JH5LwvS/oc=;
 b=R17Lr4xXY4FgTLpRSB/pEoidUbs9A350cdieWNoyIiJ29c3mAz8tWWnddmAw3oX4x2
 JR8kbA5oDDgljWRlQmcJQaqBp61C9WqoggLq40YyBcM4CnX92rW5XxoEt1BObEcjEip/
 +6It7WnxPGyvI0s3UK0ruPkdzpVNj1kP7qsNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=xiKlUn7Px3IJWf3PR0F6ldvVHVJf+RP44JH5LwvS/oc=;
 b=D/9fgEtS2VpmLKbi42SmJgd9NSv8BsbQ7oHAI8bMHkRGOh6kuKAiaCXb64deDp+vKx
 LBSpzWRLy1ee6qKivu+UfmS4pIKfbDfTLyTBNFaDdMOW9gsR++kD9GOCOMLvHFWTVarQ
 ymUeHEZnJ4+KZlF0u+Gnxp6jJvaWArmKQw3ZJE0K6NAcYT/RiqP2vxSENqkam1MrIExf
 jkXe+lBTGpu1GggeGJEC4hDzwcev84z2GtLSMUzZwYjhG6lC+rDp2mEURchc3+BlZPA4
 azuGUM5lUHHD5f1tahyy0P4jtrZlrzDtRXKoaH6vBQFpimOA1D5qNDkTvuYfZbh+r3Yx
 G8Gw==
X-Gm-Message-State: AD7BkJLsyB+mJ+3J2pJomI/mb0t12q+NYXyFUX/m/RCJa5M/T1yLcqx7jiAbxSg1F8PHeQCZRqr2GU3jvka2Rg==
X-Received: by 10.60.134.15 with SMTP id pg15mr10294900oeb.23.1456709062930;
 Sun, 28 Feb 2016 17:24:22 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Sun, 28 Feb 2016 17:24:03 -0800 (PST)
In-Reply-To: <1456467027-547-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456467027-547-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456467027-547-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Feb 2016 11:54:03 +1030
X-Google-Sender-Auth: 7imCL-z0OjLghjadjgPTrjzFnFU
Message-ID: <CACPK8XfBP74bp628a_CHNX6GzDYe7MGwut_wFWSP7Rdv9jw_=w@mail.gmail.com>
Subject: Re: [PATCH linux v2] net/ncsi: Fix possible deadlock caught with
 lockdep
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Feb 2016 01:24:26 -0000

On Fri, Feb 26, 2016 at 4:40 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Cyril Bur <cyrilbur@gmail.com>
>
> Bringing the interfaces down with ifdown -a directly after boot causes a
> lockdep warning. It appears that a network interrupt would result in an
> attempt to acquire that lock again.
>
> The solution is to soft disable interrupts.

Thanks. So we can boot with and without lockdep enabled and the
interface always comes up now?

Cheers,

Joel
