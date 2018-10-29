Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RANptSCT"; 
 dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42jyWg4FZSzDqq7
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 13:01:35 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id p144-v6so1780102oic.12
 for <openbmc@lists.ozlabs.org>; Sun, 28 Oct 2018 19:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9YcG15dqO21lST/BRGczFumDdnUUxSuclxVt3wr5zow=;
 b=RANptSCTaZ3APjH/I8nznNyEluUYn0xzwUMCW8lD9NJPgq0mLUHilislbJwHb6mF0+
 9Y0WZwugz49GQVRa3xDfkGPVVPpfzG12lwNIEZ8K2WNPkvSUO74epYHlCJRnny5yID8K
 uEkfw7nPEG4uGV+4QZsJhbYZhAp5Ux6MoSgRb9gXU8SS489eFmnbta4iSAeV3i7koY5h
 6m9RqM3gYIY92daVtJZsoKpGfkrBvjtPHrTjvboqzy26WRlE1Q+vmmpraCeX+zq7DKWc
 zDviBiX7KcRx5WJFAvlQ0ntGqgR1djTVdOtNKVaQ6rEL4j0dAoPYzJ2tPftcnKlZ1mhb
 NVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YcG15dqO21lST/BRGczFumDdnUUxSuclxVt3wr5zow=;
 b=SHv7Ydcl2BZE3bnT/z5JRZkm5TOp26usVnEyHnl5gOnt9jzW6WOZByXaZ0vC1XBDLo
 gOcLnxh97q9veU9aUniXq8Z1IAZczhVvmf0XMm3NKRQOawvjecXVSs8CHGI96uxjtx47
 SkH+JM3Y8Du1SxaUCNgEsYtBM+DRMxnZpzNRN6GIj+B42pG86foVvzvZlRqzRgvM+aV/
 QhYrfN4EwDIYF5q+7NvzyWUjhsOYv00JOAZBZ+vi27zZ4r9F+lk2Dpl/cUkLDk0SXz2J
 ymaI/uwI4W08Qmv8geDnGiMT4nHI5kyQo3YjeJBUIAXTYJh7dCt32Xtfr8q2/fgC5g7y
 padw==
X-Gm-Message-State: AGRZ1gJeErCO41waBkuOOltfnefpyCRU0e+/n9Qyx0J/lDq7ZtCYNCa7
 V3fIVMzBbDrubU+MFqOUT/4sPNq3tEEafCxP5u8=
X-Google-Smtp-Source: AJdET5cuD9obp91isYUw/ZnCF69E/KWFDKKVpszaW1403+9n6QyC/aBwr+MEm9/gDA018+kKroFty0APL1LcwPLWCYs=
X-Received: by 2002:aca:b4c6:: with SMTP id
 d189-v6mr6947283oif.165.1540778493277; 
 Sun, 28 Oct 2018 19:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
 <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
 <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
 <CAHsrh9JB13DDETbDhbvkVbLb5PoRB9EFJCVj-c9TKU_5oyZP1A@mail.gmail.com>
In-Reply-To: <CAHsrh9JB13DDETbDhbvkVbLb5PoRB9EFJCVj-c9TKU_5oyZP1A@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 29 Oct 2018 10:01:21 +0800
Message-ID: <CAARXrtmFSJ=p0OjkHCBqJ3+9DVADdM-TAX0azySZKu-3QHsAtg@mail.gmail.com>
Subject: Re: Host console logs service
To: artemsen@gmail.com
Cc: sdasari@fb.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 29 Oct 2018 02:01:36 -0000

On Sat, Oct 27, 2018 at 1:59 AM Artem Senichev <artemsen@gmail.com> wrote:
>
> How can I create a gerrit request if there is no git repository for
> this project inside OpenBMC?

This looks good and could be very useful for end users.
You could ask Brad to create a repo in OpenBMC, or possible post this design
doc into openbmc/docs for preview.

Thanks!
