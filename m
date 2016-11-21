Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgD513qNzDvjH
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:27:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NlNKIqWL"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id m75so2042124oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Mh7Q3zm9UXGHNXQIlbIK0oboixli5QPM0oAT5FQE7yg=;
 b=NlNKIqWLGtrGDik1KRAdDwQWdj3cTFtVZY1HUt6E5sH7X7JrTqCBo4s5N1GLmiyMc7
 G0GFT52+AQbh/0yjieZGZJdpYfSzpG1fNILG4lwx66aUfeygu7d/ePKhON7Be1+7xiri
 91LLOd6npr6aBgd0Cvj7gk3RnkoarxCdB7qS/KdXP+Ma76bTwcEqKapQmiUXaIObpEaL
 VoIS1X3RUDRMGmEX9y2Idr3Qsp07iBP0chmtCxtcSlNLCqjBJsoE2T2gVRVwB9vF6fCr
 gk+YKJTN8kE6xwylB3PAmGdIVy/YreguwuTX38o85lcbkbbjCfnnAE7ZQmCzglykvPhw
 E6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Mh7Q3zm9UXGHNXQIlbIK0oboixli5QPM0oAT5FQE7yg=;
 b=mLxMvI2jXQknE0wmhUSqen7Zqj7hM8CwJWzW2viF1OKkj7g1n+cYU4h+0pU9eLaRTm
 iOiOQEgCottuQ+z/4UVj1/uzjOPY+8K5a1cHJZ9JQHra1yl0cOKxWHwCJnLSQp2YiExF
 SLsc3TTIXgI82+m8R1dRUGO7WN4UhnyIMWcS+9mBxDAUz4TooNwHBWaSvCnxkE1VFRdN
 XxnxFdYIGMXmDTA2gY2Vf/LJ0ucY++w2TsQFiHDHflwpC/7dWboJU4l42h3SZ0aOCrBZ
 KQYL4531lT9yzTRyD5L7Px7Y4mExvoZSnecbC+NGl0bdZh3UEEO4Vbd5F25hpP7QdqPj
 KcIw==
X-Gm-Message-State: AKaTC03+8V//mwQp64ERfcv6sqSa+Na0F0BUH1SpLirHgBK6cnwq0/ZCrneGnXVRCnXoiMV/S51uWVDLFvpMww==
X-Received: by 10.157.35.195 with SMTP id t61mr7232676otb.263.1479713251243;
 Sun, 20 Nov 2016 23:27:31 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:27:10 -0800 (PST)
In-Reply-To: <1479478938-13267-39-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-39-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:57:10 +1030
X-Google-Sender-Auth: McWvw1uWTGczk-Iwqe8tMdeOirs
Message-ID: <CACPK8XcCEUegJ9AZrUzCAhn2T9-MC_cTaBvYzysD23gfFR_uuA@mail.gmail.com>
Subject: Re: [PATCH qemu 38/38] target-arm: Add VBAR support to ARM1176 CPUs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Nov 2016 07:27:33 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> ARM1176 CPUs support the Vector Base Address Register but currently,
> qemu only supports VBAR on ARMv7 CPUs. Fix this by adding a new
> feature ARM_FEATURE_VBAR which is used for ARMv7 and ARM1176 CPUs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> From Peter Maydell :
>
>     Is it sufficient to set ARM_FEATURE_VBAR in the realizefn
>     if FEATURE_V7 or FEATURE_EL3? (watch out that realizefn
>     may change the value of the FEATURE_EL3 bit partway down
>     so you'd need to do the check there) ?
>
>     We implement VBAR in v7-without-EL3 even though architecturally
>     it should only exist in v7-with-EL3 because we have some
>     legacy board models which we implement as without-EL3 but
>     where the guest (Linux) assumes it's running on a with-EL3
>     CPU in NS mode. I'd rather we stick to the architectural
>     definition for 1176 if we can rather than expanding the
>     "things we do which aren't architectural" set if there's
>     no legacy config that requires it. (If it is necessary
>     to define it for 1176 always then that's OK, I'd just
>     prefer not to unless we know we have to.)
>
>     We should probably also have a brief comment noting that
>     we define VBAR always in v7, even though architecturally
>     it doesn't exist in non-EL3 configs, for the benefit of
>     legacy board models.
>
>     (In v8 VBAR is required whether EL3 is implemented or not.)
>
>     thanks
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Tested-by: Joel Stanley <joel@jms.id.au>


> ---
>  target-arm/cpu.c    |  2 ++
>  target-arm/cpu.h    |  1 +
>  target-arm/helper.c | 18 ++++++++++++------
>  3 files changed, 15 insertions(+), 6 deletions(-)
