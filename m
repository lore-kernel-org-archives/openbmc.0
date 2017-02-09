Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x235.google.com (mail-vk0-x235.google.com
 [IPv6:2607:f8b0:400c:c05::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJjXT6j4WzDqN2
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 14:01:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f11+v33x"; 
 dkim-atps=neutral
Received: by mail-vk0-x235.google.com with SMTP id r136so115369033vke.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 19:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=aQtl0SAgOkHhz4lgoRCE254caqhDTjd61QCNnUUVf/I=;
 b=f11+v33xBLOVj4QJK0xxJz/3egYBmdsKxXXhxhL79RF5dwoSH6A8FaCq6K9GOGiR/8
 zJAR0VejIBLE1SNTP85bwNTuNDPMcV4lScaZIMuxwHFdbQQt0J/MqhnaNuYH/jvgGSH5
 xvLVloOo6mMJ0Ft31Q30t90DSb7vSBr78MIP+BBHzTaSeGvBfuMG49+yhE3yhokeXmUr
 oNzjosXEg7UfsypQ01ZrXxJPNmuqQhwFs9qzOSCdlir7vRGRzk/S7gEv5rev9oclK9eC
 ILzdbI7jHnmzroHY6f7Fn5KZBgXClNpSLZKrre9R8NW8apvnk7n0xjW/bklMHasL8d8h
 xZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=aQtl0SAgOkHhz4lgoRCE254caqhDTjd61QCNnUUVf/I=;
 b=D8dAkjGyftLcPeZ9SGqr5bx+3+9FxOBDH91YLHhRkdApwCMLSkGwdo0DQS/6TvhlX8
 GaGVNxXApm1gOycfEWwnZe1z4f3og0irPUWaH1afmdH/s70bDiyX3Bl3rXbrMjPY7fOu
 CfWWKFLaKrhA+knvTdvnrkRywVf5JbX3VgPfNiqN+d4AlxK00zsYJxZKlZSlY6vE4R5K
 6mLWCQHI3Mj8bDQAeJI09F5RNWdY/IOhvmj1DIQuxdHD51KnnDgxYtVJXI3ZGml117f4
 y+YLp7KaaLQ+HvTSXE7exq+kq0WQK3cKHNh5CmYk5jykXezvjFOZR4G2KjHznFms+hZg
 OOEw==
X-Gm-Message-State: AMke39lRBwcduSgeUUSVemarYDzrFnuLBz4XNFyTBHwcr05LMwIBsqgcADV4LEAvdNla03TJaZ0c+1ss3fOzVg==
X-Received: by 10.31.53.204 with SMTP id c195mr352371vka.145.1486609303444;
 Wed, 08 Feb 2017 19:01:43 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 19:01:23 -0800 (PST)
In-Reply-To: <CAPH-5w7reqNuPcbf48F+beqFyK=Te5c9rd+0hwvqt4nD0MQXqA@mail.gmail.com>
References: <CAPH-5w7reqNuPcbf48F+beqFyK=Te5c9rd+0hwvqt4nD0MQXqA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 13:31:23 +1030
X-Google-Sender-Auth: KDiA6tu-FnWxVFZdMCfpHm6e29U
Message-ID: <CACPK8XfmY3sGcvqQnjmdOOL59RNxQ_M0YGPAROdW5GMujA+BVw@mail.gmail.com>
Subject: Re: Patchwork lists submitters @google.com as "Rick Altherr via
 openbmc"
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 09 Feb 2017 03:01:46 -0000

On Wed, Feb 8, 2017 at 8:46 AM, Xo Wang via openbmc
<openbmc@lists.ozlabs.org> wrote:
> Hey folks,
>
> I think Patchwork has decided that the email openbmc@lists.ozlabs.org
> now maps to the author of the first patch originating from that email
> (Rick Altherr @ Google).
>
> So all of the patches from @google.com proxied by Mailman are now
> showing up as authored by Rick:
> https://patchwork.ozlabs.org/project/openbmc/list/?submitter=70875&archive=both&state=*
>
> Since Joel is presumably picking from Patchwork to GitHub, the git
> author info might be a bit unreliable. You'll have to peek at the
> Signed-off-by: for the Google blames. :)

Submitter 70875 is now known as "Unknown sender due to SPF". This
looks ugly, but does save me from applying misattributed patches.

I have made some tweaks to the mailing list settings that might let
DMARC'd mail get through. I have turned off the munging and will keep
an eye out for missed mail. If it's still broken I will have to turn
it back on.

Xo (or any other @google.com account holder), if you could reply to
this thread without ccing me that would be a good test.

Cheers,

Joel
