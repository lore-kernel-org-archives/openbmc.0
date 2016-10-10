Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x243.google.com (mail-vk0-x243.google.com
 [IPv6:2607:f8b0:400c:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqqH0RbDzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:24:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=xZH76wmw; 
 dkim-atps=neutral
Received: by mail-vk0-x243.google.com with SMTP id 192so3738181vkl.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=ooD1+CmByxDsss47KdTVCsjW/odUNaAD2+/ADETWLoI=;
 b=xZH76wmwUchozkvi2HnbvOq5vRMF9DzfKyqYUuoK7He/oVWudrKurfQ8F1HfDDuYQd
 RDBLqQsFSeJFzZpougJRyuogIn7+mHkvJVSiOpQb7k86EnlUeHvkAD0se7W1uDAo1Ub1
 qGSJZry0uEErqygFN4UhkZF1AoXXdUG4SFEXrr/X62yYtMN0nPKmmivOzFCJd1gvZzyU
 63SovKyvMqzeeXZVlVEurLdFd2WXdfliTCsZDxHlXIjJf6QlDwBMH2rKPixK9Zlon/n6
 qbBBXeFuVPx7cAENP906dtWbEjYb7FIg+XzAh+OAVrgHTmZxs5Jahj0CFGqMzOKR3tcv
 1JVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=ooD1+CmByxDsss47KdTVCsjW/odUNaAD2+/ADETWLoI=;
 b=cFACXxecPIFzjTNKPJzPp/w/uZScPpf0UHPHTh18mkTtUQ9zgdNbSTwZNjLiAiRKVr
 W65yBQKEO2JNyRniV9aIEmVLNKZVhh4hHPPik5/05HUvGICir5DPSOogpyXvpZVc3tnq
 SMC3mAQjz+LfUh9fLXgr3+SS497ui3kxk0H5ogXSDYWKL4qGenDRYirFfhMK69MLCeNI
 Q36IdqxxZuL+q3/xHvCEz71wJ98QjOPIF4zVY2iLmGAsyiGdM8YzDgm407NSAaIWj/Zj
 s2UnH0i8asuWuEMDeOODtHKogb/vyCNTEOVtfX/D/4uiFqtelQm0Di1zBbt4KY1oReyv
 zqGA==
X-Gm-Message-State: AA6/9Rn56xmvBjHI3LNHUUqz+z/nVdz6GGHrRC8Cb3G6Q3tumwrMOrmG3T9kJU81wigkZAaYB4Q6TtFKuKsUJA==
X-Received: by 10.31.166.208 with SMTP id p199mr1756242vke.145.1476080697179; 
 Sun, 09 Oct 2016 23:24:57 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:24:36 -0700 (PDT)
In-Reply-To: <6450afc7-7750-5282-aecc-408fd3a11df3@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <6450afc7-7750-5282-aecc-408fd3a11df3@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:24:36 +1100
X-Google-Sender-Auth: JVqXHWBU9MxJkZj7QNYLk5Ictww
Message-ID: <CACPK8XcoqDt_kGCVVt=B-8T28xJVbOfwYjVk1o=DEQ+DHO1ayQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 00/12] config cleanups and small fixes
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
X-List-Received-Date: Mon, 10 Oct 2016 06:24:59 -0000

On Fri, Oct 7, 2016 at 6:24 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/06/2016 11:26 PM, C=C3=A9dric Le Goater wrote:
>> Hello,
>>
>> Here is a set of cleanups on the configuration. It should ease the
>> port on v2016.11 which is a little more strict on CONFIG_ defines.

Nice one! I had a look at all of the patches and they look good. I
will hold off on the last two relating to ramdisk until we see what
upstream say.

>
> You will need this patch to start with :
>
>         https://github.com/legoater/u-boot/commit/d76a5e74286cd903c4eb96c=
3b5f762672121b02a
>
> forgot to send it :/

No worries, I will include it.

Cheers,

Joel
