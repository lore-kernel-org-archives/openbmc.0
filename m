Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YueeNzYj"; 
 dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dsWy2vcwzDqKN
 for <openbmc@lists.ozlabs.org>; Wed, 10 Apr 2019 02:03:07 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id e5so16022062otk.12
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tIVccPKj9Ex6vNkBIexM3N9ztC3SyA2/X3BgQ+2VmCY=;
 b=YueeNzYj/2/VHheAV+w3T8om5axKlumOy/QyLIfwMwl/fmbVmcCzeFSlYm4E4isPuy
 b8SO6J2XIuFq+muAdTgjOWBjDAutDfg+EtpZD5niYzUc2HGu5On5QoTXIG0wBKr1t7OA
 w4r2d6Quoqs1KMQv2q4COQIObMFWlWhIpqkHdb4MO5nH5D59UeLi40TSwNwk7yGWOUFv
 LEfShSo9fzgBPjipD4TFvc7sGLAabehv28G/Pu8FG0sNtvYJhXw3lME8+YGZ4emVtFdB
 Y7IKUc3BX+xfvYJxcI03DiKcWbwx90wwOqt0V4NByvfB8Kaum5OHpZaI4h+xTK6q39jJ
 FTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tIVccPKj9Ex6vNkBIexM3N9ztC3SyA2/X3BgQ+2VmCY=;
 b=Bp7LnC8nMapVGswqyBtup4A4FDflN41kIiqCKOZNMssmSnGBZwQsL7dDgXSZoDgSyk
 QUDxsef1IUSR+Hv2oTfqm3DpIZ2eY8XLe/GCjjDBlmc56WsdGirFG/h9Aux3SPZtppmC
 ycKHFbs89J/Mr5VWj+DOmS8D/RgB32s500W6umSkNq60/TQ0EOhjUwOlhMa56IT3WrPQ
 1zd9ZeFI7Wb7g4wYOhyn+3ujCTMRzMm8C5ghkf6Yw0qMUsi5AR7lWL6rqP0ciRy70ZKM
 5QU0FdcZoaUm7UhUSKX8yFNUDoxcI9eTOI9IhQnadHUKq/8JiBqFngDhaFDbHqsgP1sR
 +/Rg==
X-Gm-Message-State: APjAAAUQxzD3OMN1QGB9v+Tc69Xvb3fG/Ntz9VDG617xWPkW3f1NHmog
 UU1UcSDaX4/RfHHM3WpCdYRIvvdKc3XRNxTVdcw=
X-Google-Smtp-Source: APXvYqzddAz94CxeLvXFdJoz530vz9wRjHU4ESo5oS3vZR/S6ski6zorZrV3+YwvDpma8tu6eAAArWHgUscMyoCpc7Y=
X-Received: by 2002:a9d:6292:: with SMTP id x18mr23275997otk.224.1554825784247; 
 Tue, 09 Apr 2019 09:03:04 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 9 Apr 2019 11:02:48 -0500
Message-ID: <CALLMt=pNyYZTmkR=w1+jDDwQHxWRUjEWKxCx=Oe_bhPyoMaeHA@mail.gmail.com>
Subject: ipmitool recipe update needed?
To: Alexander Amelkin <a.amelkin@yadro.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: William Kennington <wak@google.com>
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
X-List-Received-Date: Tue, 09 Apr 2019 16:03:11 -0000

Hi Alexander,

A while back we had some intermittent CI failures when
trying to retrieve the ipmitool package from sourceforge.

The link for ipmitool on sourceforge shows it's been moved
to github. Are there plans to update the recipe upstream to
use github? William noted in the infrastructure workgroup that
you'll probably have to provide the package in the expected
format on github for it to work.

The recipe is:
meta-openembedded/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb

Andrew
