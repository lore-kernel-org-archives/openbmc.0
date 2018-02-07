Return-Path: <mine260309@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hVp0anao"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zbm551x1xzF13F
 for <openbmc@lists.ozlabs.org>; Wed,  7 Feb 2018 13:49:45 +1100 (AEDT)
Received: by mail-io0-x232.google.com with SMTP id f89so359637ioj.4
 for <openbmc@lists.ozlabs.org>; Tue, 06 Feb 2018 18:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=45TFOTVZFwVXqKnUgIihFl+HF0tQt+u0PRdmo76ZFYo=;
 b=hVp0anao0ou8tksI+o6ST0umqLNv15aqQGLx6r6BtUllN9NG2x+0Ii1w7gmDgSxCiX
 /SHYyj03WQW3hkASPnSNlf+fE71RlGkj4BPUMTjgUnDyHPbYUHTAd0p/SXFo6tCF3sEx
 teXQs3Z3yiXlQd/PmFRdokGITjPT8NosZUQnYEaPMT2O4emqNBT1EQEXSB/d8nl0qO7G
 6EXFRCv2gW1MyjUc1cBAa4PfOVTNZt5zHhWw1oz28DrTy4Unnh/uoDbkI2Galhhcc6WC
 NPjaYHOBXe4LDiVK/VL6Z+kHNhzIEbK2hnp8m7MDtL/J1V5pmyllhG+47Aw6gV05LFdg
 K5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=45TFOTVZFwVXqKnUgIihFl+HF0tQt+u0PRdmo76ZFYo=;
 b=ZxacM4cn09JAVcBbixzRw1fDegMDBllT6uI6zVQqa329XgZQw4/o7kMvZ9r+AOvdbV
 yAmabTx+V9DmCot1zn66hj+otvSEe+PoAOsYpusrFicCyQriXVqgwI1DhFWKUi2gEw4j
 ikjylIoI/KmtjafK9dOywrXnvSJjC1nDbNkVkgQYuqZh/UWanUNFl9n8DxVuoAHGptJ0
 XlAa5rUAvjcynNTO1QLmKiYXb493jkoI2O+xEa6beW9+E5HP5pEwtubfmyKTv9c9GKV7
 BmdleIFNQSIT52oAHlSnhJionE/hWyOaMSMirxGn7UWebjlDNGif2WxbI4lXMZCUsYgi
 iTJg==
X-Gm-Message-State: APf1xPAbtZ62i1stIqHgJCd+0UFmrBx8OMDJymbXIvGRjZSIh56xossL
 1tGyZI5vw/KGxv1tvzHecZBZIDmiRwpzsk7FxRjLRg==
X-Google-Smtp-Source: AH8x226Z2jEZ88B8LiPP5pwPf5/zhAniiREJzMlfEebGjsxQrAeI9uNNRyjlBs9ZPwjwGdllhiMn39rT75zBOnrtppU=
X-Received: by 10.107.150.199 with SMTP id y190mr5714725iod.121.1517971783150; 
 Tue, 06 Feb 2018 18:49:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.89.133 with HTTP; Tue, 6 Feb 2018 18:49:41 -0800 (PST)
In-Reply-To: <5A77FFA9.3060507@raptorengineering.com>
References: <5A77FFA9.3060507@raptorengineering.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 7 Feb 2018 10:49:41 +0800
Message-ID: <CAARXrtmiTKK0kZqiQ63n0Z7bGDQse3yV8pFAey82P3bAKFLsdA@mail.gmail.com>
Subject: Re: Host IPL observer service
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Feb 2018 02:49:45 -0000

On Mon, Feb 5, 2018 at 2:54 PM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> We've created a service to watch the status of the host IPL and to
> provide the status and host state information on demand and via events
> over DBUS.  This is important for several reasons, one of which is to
> make sure that we don't try to bind to OCC before OCC is up and running.
>
> We're shipping this service with our Talos II systems, and already use
> it to provide status feedback to the end user during the lengthy IPL
> process, as well as to bind OCC at the correct time.
>
> Source code is here:
>
> https://git.raptorcs.com/git/talos-skeleton/tree/pyiplobserver

It is interesting that it uses pdbg to get 0x2809 status to determine
the ISTEP status.

I know a bit of the background that you are going to use this service
to bind occ-hwmon
driver at certain status, right?

May I know some details, e.g. in which status to bind occ-hwmon and in
which status
to enable the "occ watchdog"?

>
> Let me know what you think!  We'd love to see this upstreamed.
>
> --
> Timothy Pearson
> Raptor Engineering
> +1 (415) 727-8645 (direct line)
> +1 (512) 690-0200 (switchboard)
> https://www.raptorengineering.com
