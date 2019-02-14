Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12f; helo=mail-it1-x12f.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EqIGa5sa"; 
 dkim-atps=neutral
Received: from mail-it1-x12f.google.com (mail-it1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440Ln93q7dzDqLq
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 14:03:25 +1100 (AEDT)
Received: by mail-it1-x12f.google.com with SMTP id z7so11477232iti.0
 for <openbmc@lists.ozlabs.org>; Wed, 13 Feb 2019 19:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cdKSm6jESyAhdvztdooTiseSwYkyUWVGq1Uj5WwdwoA=;
 b=EqIGa5sashBGUWEI4HXauuNjhy/SuRkXbI+sf+92bYny3JJ60SiWtD77a2a0atjgFP
 4WhBoOOySD4+mw2S4ruvcEsAohVhQUwtMXo3FhQ2t28hM52Cr/IHHtSA6nPW37b4YJJp
 d5+mdEloA3i+AWMyr/OHo4s129hKgdgCbCx1WjloxCyggSDBsjpJp+MpslCnAXs3XJBX
 N2UpgWYJzRj1Sditdau6PnpL7ekKV50WsbDAOqOsZShAhSX0VNkAZGJf94J1MnaKdR6U
 v07PYCSUgHU13XnFUHGgDfYpDpAyqlsI9zaraagCSzFlTK7ym/3JgNzREhICkKUxEbni
 5nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cdKSm6jESyAhdvztdooTiseSwYkyUWVGq1Uj5WwdwoA=;
 b=XDdEpvGsghmLs1Zrm0L+/5pNb4K4FyVjSwyOLiXhhu2C3nimUkw3sDpT/f+OcuZmHN
 esQZK/Lqctrzfayo5gHO80gMd1hGUWtltm7KtRXtsgadwRKuctFHFclQqXSHPdRp4nb1
 kpDPOXj0UgToedjVorr60IWzGJPWjPbXtsC80cP7CotWl4C8XbyQKXsoKONkp/iEBDyB
 rflGiSTjPETFKSTCJhyeqOGTkTH6PhVjbvJfa+i8xHFbEa9RQvFI2TZZZmjrZl5/52hk
 uhLXYIgJQGBMGM/mmjTeXL/qSuo4R+QpK/4yUMjqyRfDdfB0SXfCCApTpcUeLwUEDy1f
 TpwQ==
X-Gm-Message-State: AHQUAuYUXGgJl5C0CDOWjpjy5JXlFEaeCr/mKSz0or3GZjk6OHKOBnuO
 iAUl4G2bw+ZnxOJN1J75K//OakCIcwMai/ZtZ1OkWMtT
X-Google-Smtp-Source: AHgI3IYFvvFXu5Dtihu/6+17/uYU2gZJEC5U4MYy/tqPtdU09y5POGS8Ih9fljRas7JzbaPpHRPz/jqWl0ESOdtZBd8=
X-Received: by 2002:a6b:d904:: with SMTP id r4mr855531ioc.98.1550113403004;
 Wed, 13 Feb 2019 19:03:23 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
 <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
In-Reply-To: <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Thu, 14 Feb 2019 11:03:11 +0800
Message-ID: <CAARXrtnjhLDez0vjXOxMGgNeNXPTZCBZZBa6Kk+U9=tkRJoKgg@mail.gmail.com>
Subject: Re: Romulus to use Virtual PNOR
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 14 Feb 2019 03:03:26 -0000

On Tue, Feb 12, 2019 at 11:57 AM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 25 Jan 2019 at 18:11, Lei YU <mine260309@gmail.com> wrote:
> >
> > This email is to notify that Romulus is going to use VirtualPNOR feature, if
> > no objections are received.
> >
> > It **impacts** to existing Romulus systems, that they must do PNOR code update
> > when the feature is enabled.
> >
> > A little background on this topic could be found at:
> > https://lists.ozlabs.org/pipermail/openbmc/2018-May/011822.html
> > https://lists.ozlabs.org/pipermail/openbmc/2018-November/014112.html
> >
> > I did not receive any feedback, so I choose to use VritualPNOR feature,
> > which has below benefits:
> > 1. It requires minor code changes for a system to switch to VirtualPNOR;
> > 2. It gets full features, including PNOR version, code verification, and code
> >    update via new interface;
> > 3. When OpenBMC switches to Redfish, it will get Redfish code update for free,
> >    because IBM will implement Redfish code update based on VirtualPNOR.
> >
> > The related changes are:
> > * OpenBMC: https://gerrit.openbmc-project.xyz/#/q/topic:ubifs-pnor-for-romulus
> > * op-build: https://github.com/open-power/op-build/pull/2578
> >
> > Any objections?
>
> I would prefer this not to happen.
>
> The "virtual pnor" feature is tightly coupled to UBI. The preferred
> filesystem to use on small NOR chips is JFFS2, which suits the
> technology and the size that BMCs ship on.
>
> Moving to vpnor breaks features such as full pnor flashing from the host.

Based on the discussion, let's keep using static flash layout for PNOR on
Romulus.

This brings the questions:
1. Shall we move the legacy code update service
   (org.openbmc.control.Flash.service) to the new one
   (xyz.openbmc_project.Software.xxx.service)?
2. How do we plan to support PNOR version, image verification for static flash
   layout?
