Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::743; helo=mail-qk1-x743.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="a+2uz0+U"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42r47l5D84zF3Ky
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 11:35:31 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id e4so23794032qkh.6
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 16:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsS/vSCtKG0CUYVcELuvpcFBQ5u8d/giLfpm0tmCR0c=;
 b=a+2uz0+Uw1nKPTCsmxwyPm3Ke93tz7G3CYgDQ0pVE2Q3c5yIQgvCseHxSXwIvh7gsg
 Nx4fdkcJMVlej9YFIXYO2t5+PDLIbG+AlvZiOJiIOpOh1qtveLmKcenemmFbOtfBfhVU
 NzGk+LOdtwK887nl3wbtDqRrIETP8dOSanofw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsS/vSCtKG0CUYVcELuvpcFBQ5u8d/giLfpm0tmCR0c=;
 b=NS1a/TaTIH2TehqeEcA9w8Al2ivLrcYWDxXJJv5wIn9qZWVOYs2WCA9cxSGTmeXLX5
 ruDmnYBVduxaMDFfvsbAGuzdDl53ZrZNvuIs81tp5yylJeynF0lbAZteSmoDkGO75erf
 sKupJMIPSlywGS5sZanM7rfvaporAV7eansOq0FAZ5juJHXmc+l46FYtbiud8Y/bGnLg
 Q8PDw+SnVgGmTYNu/YVSJeXDihBQnmaVrbf/iWR+aZzYX8et729xD1ppp/fhzgin4kBU
 Qi5Vz+jsTGnvUSzqt9bdfXklLRgmgMJfdfYhh06gDJxyuyUWUaIeKIUzr1gFGZP1izS2
 IVVQ==
X-Gm-Message-State: AGRZ1gId1lkwJOE/du3hx0EJipxmh08Q4bJNB1/AGMcCyBMdDKdVbDpv
 /drzQjcvVfMORYbAsPzl+uTSDTqJfHBNKP83YiU=
X-Google-Smtp-Source: AJdET5fpXdTGM8sEeYhX4HrG+W0HYI6lwWe/a++rkX6nXZUHhPxUhdAxIHl5aWA0fWLwhxWx7DSqHTisUJ6/aiUGsVU=
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr2288948qkg.127.1541637329323; 
 Wed, 07 Nov 2018 16:35:29 -0800 (PST)
MIME-Version: 1.0
References: <3ff8d429943e44139b73cb16199a560e@yadro.com>
 <3D1C8267-BC6F-44F1-B12F-020E147B225B@fb.com>
 <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
In-Reply-To: <a6ba63dc-eecc-9a24-e479-8036d53804bd@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Nov 2018 11:05:17 +1030
Message-ID: <CACPK8Xf6hD9ne530ZLWgE-Tuc9MCXiHrFpx-zJ_SdsDV81Lohw@mail.gmail.com>
Subject: Re: [Potential Spoof] Re: pull request to the u-boot-aspeed
To: Tao Ren <taoren@fb.com>
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
X-List-Received-Date: Thu, 08 Nov 2018 00:35:32 -0000

On Thu, 8 Nov 2018 at 07:19, Tao Ren <taoren@fb.com> wrote:
>
> On 11/7/18 11:32 AM, Sai Dasari wrote:
> > Hi Alexander,
> >
> > The process for u-boot changes is similar to kernel changes which is documented@ https://github.com/openbmc/docs/blob/master/kernel-development.md. I believe it does not involve gerrit which is for core OpenBMC userland feature development.
>
> Thank you Sai for sharing the link. I'm actually looking at below page for kernel patches: which one is up to date?
>
> https://github.com/openbmc/linux/wiki/DevelopmentProcess

I've kept the wiki one more up to date as I find it has a lower
barrier to entry when making edits and updates.

However, I think they are complimentary. If not, let me know where
they contradict and we can unify the documentation.

Cheers,

Joel
