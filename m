Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VvIYvi+U"; 
 dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42VClB5zRQzF2Dm
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 10:15:50 +1100 (AEDT)
Received: by mail-qt1-x835.google.com with SMTP id u34-v6so3697328qth.3
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 16:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IX45zTYpm1A0K6GkUyLbpvUUhYOMfZsqhQ/ejA9acVg=;
 b=VvIYvi+Uo3PccRYyHVnaJnyfoz7rcYDwS7BiHJKI0Idk1mMxQINsMq5kAX46iIwH/u
 6dRYgeAh6jbLvaDkbBWjbCAz1A4gUZEblURhrRI8haVpDQt0nxxhTmSncJbH28XHl+QK
 2rxn51BSjoUhCLSAWA4kNhRYnu0ZPE7GIaRYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IX45zTYpm1A0K6GkUyLbpvUUhYOMfZsqhQ/ejA9acVg=;
 b=YlLAVUK0R5IdeLMFVUl+BpnrFiPUb/iinF/wxGewpsF2rLHZqHOKDx4dEcgfcwPkEs
 eEBoHRF0Iwzf0SX0dRKvjQZGOfGhyHveHUJylLKg3zS3OuUVMOpkYBIyT6dUAFGtNBWm
 EAKVplxIRjEFcL+gy9N32Je6Dr1iNMvANFVNDHYzH/GALswhStzG+OTS3QkbV+Uo3uRX
 oxPRW2Qtnpy4GN4m2/90ki9JebpL7UF3uVwfN5xxOTrqb9lH0nwf95nl9L0q6bqupYvz
 UqxqY5v6OPZJC3iH6wPkrWu4hH43h5Ap/fKjzWGQ2kiwI4IWEobHDUFzUPLmZ+KNnahE
 St5A==
X-Gm-Message-State: ABuFfojoF5nTfiw4VRchtTvlcZYLoEMhJnQu9ioMC+ng8W5ye8jY63ol
 X7ogIqPBv2iNv+S3MBT5mGN6xZ+b47tausvQ2a8=
X-Google-Smtp-Source: ACcGV62b3besTgJseej6ZvNaxZX0/LyutDJp4AeYcPq/p/gOI4Wu1OsDTtQjhUBGIPHBOHibrkpwL83PUOvzK+KHEJ0=
X-Received: by 2002:ac8:7609:: with SMTP id
 t9-v6mr20768718qtq.37.1539126945706; 
 Tue, 09 Oct 2018 16:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <C599FC839619124CAC44E062ABB7DFE2D700D9D3@ORSMSX101.amr.corp.intel.com>
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2D700D9D3@ORSMSX101.amr.corp.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Oct 2018 09:45:34 +1030
Message-ID: <CACPK8XevxBTX+8Co5Xg+=1AXr2+5nB19BKm-6PbB1pHb=qQWaQ@mail.gmail.com>
Subject: Re: OpenBMC Hackathon Remote Access
To: "Mihm, James" <james.mihm@intel.com>
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
X-List-Received-Date: Tue, 09 Oct 2018 23:15:51 -0000

On Tue, 9 Oct 2018 at 06:06, Mihm, James <james.mihm@intel.com> wrote:
>
> Day 1  Tuesday, Oct 9th, 2018
> https://meet.intel.com/james.mihm/V544MVHT?sl=1
> Conference ID: 184797518

Do you have any tips for using this on Linux? The plugin link did
nothing, and showed this in the javascript console:

Lync.Client.Common.Consolidated.js?lcs_se_w16_ship6.0.9319.281:20098
9:31:38:572, TL_WARN, , Framework, Plugin install skipped as plugin is
not supported,

I am using Chrome.

Cheers,

Joel
