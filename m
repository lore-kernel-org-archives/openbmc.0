Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x241.google.com (mail-vk0-x241.google.com
 [IPv6:2607:f8b0:400c:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssqpS48sqzDrfR
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=vq0LaAVW; 
 dkim-atps=neutral
Received: by mail-vk0-x241.google.com with SMTP id 192so3737914vkl.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=MvwQAZ770bOmKxivOzFN3LBYHqbjyKZuj6vouc/3Szw=;
 b=vq0LaAVWQxknYX4hdhziIqPEP6PIkWfJ6GkbJMDnIbrT4nc57MF/WJS/2UE1D5vwpk
 zQKQc1AC2Y+wlwncCsLw617k1sIOxDJoF8MzkkAYDM0aadGRykCHSGhiQukoH/YZ3mqI
 onjRo58sp9Mu2h1KPGj7hVK4UozXaSJIcI58s2ImnqAdKs1wRZnYlTdfIewdssH0v+zk
 fFMDeqcCKOrQGdUYqLLVERvB8waBjN2KIScv+ux0d8v87lHyGbr82mSWFUihjHLla+2d
 +bk4NlaqnMKgOrMH8Wj91few0QQgccppH28vmwdqRB4mHJTKc9jBe+JBEOYHcaBTaUsS
 1p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=MvwQAZ770bOmKxivOzFN3LBYHqbjyKZuj6vouc/3Szw=;
 b=GyB8Zkvysztn6aGUWg6YJXNHUWvQ2P08QmPbg4fAYlcgE8AV9auHaX4O0mtcgD0cIF
 Sl78g72Lu2TmdxVrYH9N9pvBZnx94ZoFhlKb/i6803T9Vuf10GLUTCE2eCCp5BpfN36B
 PaIbYvC+ZPuKJngQjIVd6KZeHVZk0W47ms122+gq+4lYSsFiCIEH8y7wFpWW5J1KHrr1
 XP284qSHkuVqCEG4b6/Zfi/25k+/6FK+haiYOE9BHvyVD6JBYiBbNBrpj9EnxvfaA3LB
 FuTAKquG1OKzRBu1KssJHDfpMnh597zZb8pDuUDAjDbDDkxEIFkCW0FEAlwghdWOm6sj
 9/yA==
X-Gm-Message-State: AA6/9Rli1kOvsFUFG6+9fZliaMoXZg5X3Kg9qZojcP7tQIAcOM2P+Ntp7DawbCop3C7MCoJ7weh3pBeYD3QibA==
X-Received: by 10.31.168.145 with SMTP id r139mr21449423vke.124.1476080654703; 
 Sun, 09 Oct 2016 23:24:14 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:23:54 -0700 (PDT)
In-Reply-To: <1475789205-19618-12-git-send-email-clg@kaod.org>
References: <1475789205-19618-1-git-send-email-clg@kaod.org>
 <1475789205-19618-12-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:23:54 +1100
X-Google-Sender-Auth: KAH3MwTo2fw7LySCUdSfzXZLCMQ
Message-ID: <CACPK8Xeg=MguGsn8tXp-_RG7AfesKBzpjK75JrGZy8+2kWSYDQ@mail.gmail.com>
Subject: Re: [PATCH u-boot 11/12] bootm: fix ramdisk relocation
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
X-List-Received-Date: Mon, 10 Oct 2016 06:24:17 -0000

On Fri, Oct 7, 2016 at 8:26 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> We are working on bringing to mainline a set of changes adding support
> for the Aspeed SoC and we have a couple of work around we are trying
> to elimitate first. This is one of them. The ramdisk is not relocated
> and Linux fails to boot. The current port does not use a device tree
> (yet) so that might be the most obvious culprit.
>
> Thanks
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

I see you're chatting with upstream about this one.

Do you want me to include this in our tree for now, or wait for the
outcome of those discussions?

Cheers,

Joel
