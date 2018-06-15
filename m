Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::235; helo=mail-it0-x235.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nsBeqt4D"; 
 dkim-atps=neutral
Received: from mail-it0-x235.google.com (mail-it0-x235.google.com
 [IPv6:2607:f8b0:4001:c0b::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 416PNx18L9zF0dl
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jun 2018 12:21:04 +1000 (AEST)
Received: by mail-it0-x235.google.com with SMTP id 16-v6so882182itl.5
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 19:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wE99flZg7wf31XXiHqL1Qm7HFsqX1GwsGAt9DgURAw8=;
 b=nsBeqt4DBSHqSi7te58VIc1b3PwvT5ZPHgGJtOl6t5FgnlK4FjlFKjIlPT5fUJNst3
 FTQjjJGDc9t76QH+aHhOh3wc/A3dgGSIjXuANL57x4LzS6W4QcHpoGozvSa1lLnd9LAa
 000kd4HFlF7sR8CfYvnaKeQQ9RtDSsZexLIc6kaNIB1SMLmQZOT6V4SAgVhK5HY9Pa+8
 iazMUydpesYX646fdsP0IlC9EjqFjrUYChFkie9unZPgDqzZrLxDpZNN24gCOvvBQPXa
 ++q22ok5IKVoukC0cTtGuVCeL5A4ms8OwR6Aip1SgsVOWNX6b5b2oVX8pEwkW4wH7PlD
 0hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wE99flZg7wf31XXiHqL1Qm7HFsqX1GwsGAt9DgURAw8=;
 b=W0BLIql3E1zRIhbeIhzzNora2WJOzPDcfSbMLWwShqcKxfyRgsMxuhTrQGRPAqZyGU
 DX9zglZJca/Gg+9NvWjFT1GzDX5QrqRKfyb9SWPVM2hUkRXJrXcVrj8/b/aTUcCBMNbR
 eFZxywQz5rDDHu0Id3q8Q7xnw4+AqiCr+Y8/FTDDMKGo57wYXJG6iEce3N7FoUN+rM9R
 fzLbgYYDpbS34D1fNBE+RwDKWnuxoxaoAFMmds/IvWpT+TGwRDElkUCA0gQSdieBnPyg
 036w61quAZEtQ3ZImy9xHByEv8L3VK1ZoJXHht8tcQ5aIfpF0Ipl39D4FCSONHe8gRZw
 MyAQ==
X-Gm-Message-State: APt69E2S+kjAmNfmhuOPEcQ9R6eluya/QWd1frRrktZMr71lC25wFt1l
 zuhntmCsiHAaVrz3RQHXxgnjVS3V0qwdey40JGE=
X-Google-Smtp-Source: ADUXVKKE40ZAiZ53jcrexhauain9nK+myTku1PiNgBJD3K3IpRJjlfX6LkiqD1cTuvo+RrOjiaXJz4ZBLn54sLNQaLE=
X-Received: by 2002:a24:ac4a:: with SMTP id m10-v6mr131518iti.14.1529029262155; 
 Thu, 14 Jun 2018 19:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAARXrt=XaO=t=UuSDjcgZ=Nkh9J7vTQJPEAMG5=_Ca7ukRVekA@mail.gmail.com>
 <CAO=notxjAAF0w70yrmFffNQchEmdcexWjAt9xftiwaRw6-aM7Q@mail.gmail.com>
In-Reply-To: <CAO=notxjAAF0w70yrmFffNQchEmdcexWjAt9xftiwaRw6-aM7Q@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 15 Jun 2018 10:20:43 +0800
Message-ID: <CAARXrt=fojNyiYiZn2qC+8O9nw9AvjT7ux4vtFP9cf4m7GM0Qw@mail.gmail.com>
Subject: Re: Feature request in phosphor-pid-control
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2018 02:21:05 -0000

> So, this change really is just, "don't fail if you can't find the
> sensor during start-up, and keep trying until it shows up"
>
> Does that follow?

Pretty much close.
More like "in any case, don't fail if you can't find the the sensor, and keep
trying".
Note this is applicable to sensors that are unavailable.

For sensors that are expected to be treated as fault, it should trigger
failsafe, and this is discussed in Ed's mail.

Putting it together, the feature request is splitted:
1. For sensors without operation status, we can config them as optional, so
   they do not trigger failsafe;
2. For sensors with operation status, do not trigger failsafe if it is
   unavailable; trigger failsafe if it is fault.
