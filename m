Return-Path: <artemsen@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12b; helo=mail-it1-x12b.google.com;
 envelope-from=artemsen@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FtK2tZKM"; 
 dkim-atps=neutral
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42k5fS6qTRzDr6V
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 18:22:56 +1100 (AEDT)
Received: by mail-it1-x12b.google.com with SMTP id h14-v6so8255297itf.1
 for <openbmc@lists.ozlabs.org>; Mon, 29 Oct 2018 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRlzBMLPWdoaGgGV3Zl2x8OfF1VUxGFEEAR2XwOx6AA=;
 b=FtK2tZKMRCmy4we11yagO//PfbPv6iUr6l09gI/VBxc5b3JJF0FAW71+ubbjBNBoGr
 5o5IL8UkgTSBQpzaUMHLEzwylJ31Oj472eLp3/5srh7Tt9Y1trnv2rCBRchOasQbFd2D
 34s5KS5vhDGHzSClU3i+nU+ZQKDpTSCu6G3GZRJF7c1yFwp5Eqg4qug2PRjfk4QhaY+x
 1k3eXYmPDYmDdrwfEvr3MZx0Q4BB4vyU1ISr0BTgaRnAj4QsueQuIv51Qtfv/rlLHY4d
 XkgJfMFJERBEjWChtcd63mG55DP7Ybu2MmiGK0iLkk7v3FQwLQN/o4LPIO82uEO6racE
 qEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRlzBMLPWdoaGgGV3Zl2x8OfF1VUxGFEEAR2XwOx6AA=;
 b=J1qqffMXlrfgoESDU9jAlSj4D3LpCcglQ6LeHDTaPBZTcQyKfUQaOYRiCVu71wfPKO
 RdqUUlLtthe1xqpbaCXe0enlNsTMrRrwHOqgD+XFKBhyLZ+5bZH9eLhVFTw2D1eBhw4G
 xzCFBfC2CBGH82XLTFWEHWh6W2eAqEpq1FiwzoQsM2xG2vcPQBK16M3At17Nu0wC08Dw
 DnviDf/I3YVrJ0u1j8f/4ULXjSdv5MY6baYenVh5ZPJBcVTHl0e4ioAQx9yjC0lvppj/
 E8+djbPStQA8R7rHykD2NzMBWxoW3VsoQ1aD7e1NjkrO6POIzwPU+xegORSdgtSKPP4q
 rUVw==
X-Gm-Message-State: AGRZ1gKD8T2LHNj7AfagT+mp0k6F6Xvpv4nxCVxHRVP1n6eRdtv2J6Zn
 jdh3wlQVAOU2RHyt7li2cuISUbrCcauK23eGnqA+5ZEfZKo=
X-Google-Smtp-Source: AJdET5e6v2WgJdmVspSeAW/nLw7GE/5MHcmTb29otaIFH5eoxAqAjR4nTQrKzQd0kqP8sD4XcozhS9OJ05YX/d6RK1M=
X-Received: by 2002:a02:6605:: with SMTP id k5-v6mr9172997jac.96.1540797774912; 
 Mon, 29 Oct 2018 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHsrh9+PQ9GKX7DMMC8oAdvNEamsw5dbfRmiTSi3kWuA6j0R_g@mail.gmail.com>
 <601A1A07-A444-4602-AC42-7E686B1CE03A@fb.com>
 <CAHsrh9KDjs8jg-x4NYooVH1cvmzv=em1C7=6OUBaUx1cOCVG5g@mail.gmail.com>
 <7D625D67-C92C-40A0-B216-6A33EF805BD7@fb.com>
 <CAHsrh9JB13DDETbDhbvkVbLb5PoRB9EFJCVj-c9TKU_5oyZP1A@mail.gmail.com>
 <CAARXrtmFSJ=p0OjkHCBqJ3+9DVADdM-TAX0azySZKu-3QHsAtg@mail.gmail.com>
In-Reply-To: <CAARXrtmFSJ=p0OjkHCBqJ3+9DVADdM-TAX0azySZKu-3QHsAtg@mail.gmail.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Mon, 29 Oct 2018 10:22:42 +0300
Message-ID: <CAHsrh9+D-xH+w7sdg8H14rnC1qrWnfo927_AZ63rf=RUXBsqVw@mail.gmail.com>
Subject: Re: Host console logs service
To: bradleyb@fuzziesquirrel.com
Cc: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 29 Oct 2018 07:22:57 -0000

Hi Brad,

Could you create phosphor-hostlogger repository inside the OpenBMC project?
Or even clone existing from https://github.com/YADRO-KNS/phosphor-hostlogger.

Best regards,
Artem Senichev

On Mon, Oct 29, 2018 at 5:01 AM Lei YU <mine260309@gmail.com> wrote:
>
> On Sat, Oct 27, 2018 at 1:59 AM Artem Senichev <artemsen@gmail.com> wrote:
> >
> > How can I create a gerrit request if there is no git repository for
> > this project inside OpenBMC?
>
> This looks good and could be very useful for end users.
> You could ask Brad to create a repo in OpenBMC, or possible post this design
> doc into openbmc/docs for preview.
>
> Thanks!
