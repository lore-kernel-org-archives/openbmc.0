Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Fmd7KAoB"; 
 dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43z84x0V03zDqHV
 for <openbmc@lists.ozlabs.org>; Tue, 12 Feb 2019 14:57:52 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id a48so1464813qtb.4
 for <openbmc@lists.ozlabs.org>; Mon, 11 Feb 2019 19:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g+ngruGZBwf/6/e3/hyuzmX8DkXivROFQbbEcl9xO3w=;
 b=Fmd7KAoBrzb+mWOa7MPbvlJahZmCkHXBfuHetZGegAvdeF+lwMT1IgGwE98jSyG6s8
 kKvBg32Jrzrfra1+oDHU4nHe40tgih5D1POLPcXtd2Ye4mw1aqK5OBXQ/2nCK4M6h5y4
 FTRMuYO4Ag/BXSFRqQ2tMVl0r5RN+G0PozZg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+ngruGZBwf/6/e3/hyuzmX8DkXivROFQbbEcl9xO3w=;
 b=Bpj4H+iJfhw5ncfTq5J+mnD2kXfjrrGBb/zVTAu7iFgwd3WgT+F8f+6X6PfKMLe5l6
 RFvwsMRws9f6GMQdZ6mvk2Apnnh4XWGCcRpTrR7gJfCxBrAjBDH+VzjN5T/qEIZdRH8Y
 VMuDAzhZj4psO1GYK61OBMXB6ADbmn2Oww1qYOH/30nA/1ZJ/nD1tIbHh8QgX34V2t2o
 tsXiE5gp3rkF7a+DcOYQBaQyKjz4Gp5u/Mm2nkYlv5XuDYrVLUo5F14JXRoK7BtULo2x
 CZ6W8HW7oK/AynLvbbIuzC0EeETIB9fjYXxI8l7yEAb46jIPPm70KEm9wOP2VmlwraoU
 qQ/Q==
X-Gm-Message-State: AHQUAuatCEfH/9nflKWj422OIB6WsTzS2aw4op6MrrC4ARXYflw5aWro
 yDnGZv+HxOo/I48k5xMgREeW4COsB/fAxfRxMwE=
X-Google-Smtp-Source: AHgI3IaJRhuL3bvHee3DWD0rFwnDueQhY1GyrFjanxVyeQ4SIB3aN/MEoyFVzwbfk/wWHN2Fmg0dGYOfzbvGx32/4cM=
X-Received: by 2002:ac8:4547:: with SMTP id z7mr1249816qtn.37.1549943870752;
 Mon, 11 Feb 2019 19:57:50 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
In-Reply-To: <CAARXrtmBsbJt7n_wmpg3nadtoJuz0bqbT9d9ijKL8bDTu+k+WA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Feb 2019 14:27:38 +1030
Message-ID: <CACPK8Xd-OX_zQtn5rtfRw+rXB+783hQSwc_PTmzMYr=SHaP5Tg@mail.gmail.com>
Subject: Re: Romulus to use Virtual PNOR
To: Lei YU <mine260309@gmail.com>
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
X-List-Received-Date: Tue, 12 Feb 2019 03:57:54 -0000

On Fri, 25 Jan 2019 at 18:11, Lei YU <mine260309@gmail.com> wrote:
>
> This email is to notify that Romulus is going to use VirtualPNOR feature, if
> no objections are received.
>
> It **impacts** to existing Romulus systems, that they must do PNOR code update
> when the feature is enabled.
>
> A little background on this topic could be found at:
> https://lists.ozlabs.org/pipermail/openbmc/2018-May/011822.html
> https://lists.ozlabs.org/pipermail/openbmc/2018-November/014112.html
>
> I did not receive any feedback, so I choose to use VritualPNOR feature,
> which has below benefits:
> 1. It requires minor code changes for a system to switch to VirtualPNOR;
> 2. It gets full features, including PNOR version, code verification, and code
>    update via new interface;
> 3. When OpenBMC switches to Redfish, it will get Redfish code update for free,
>    because IBM will implement Redfish code update based on VirtualPNOR.
>
> The related changes are:
> * OpenBMC: https://gerrit.openbmc-project.xyz/#/q/topic:ubifs-pnor-for-romulus
> * op-build: https://github.com/open-power/op-build/pull/2578
>
> Any objections?

I would prefer this not to happen.

The "virtual pnor" feature is tightly coupled to UBI. The preferred
filesystem to use on small NOR chips is JFFS2, which suits the
technology and the size that BMCs ship on.

Moving to vpnor breaks features such as full pnor flashing from the host.

Cheers,

Joel
