Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="g/GiQc60"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42dYzK2BfNzF14t
 for <openbmc@lists.ozlabs.org>; Mon, 22 Oct 2018 09:21:48 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id g10-v6so3580241qtq.6
 for <openbmc@lists.ozlabs.org>; Sun, 21 Oct 2018 15:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z3URAxwoW+uMenmefsTd2Zv5JSKz8mMFmiU/LRoW7bA=;
 b=g/GiQc60K9lkohSaBq6RJth0TCj97J5ureY81HnGHSii0efrN8zP6pFABYVan3ulA5
 iw4lF07Aj5MGg0tYjZYDeKg7R/08yvhTRqt0BHkIKxTSyM/szRRUhif+z8hVnqaZxSyB
 2OlB1bBOtJCg2T9dckXc57WMY2Goom4TBsE38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3URAxwoW+uMenmefsTd2Zv5JSKz8mMFmiU/LRoW7bA=;
 b=alod30EcaDO7pw/LKBasVxZNdp0nu/k24bAp2ynMTOZQDLG8E7anlvPE2njWDHaaA8
 ROKIPAXXtJUhmaJDK7JBpzJ+vUHw1/egDRcmP0mNNFjJNeECe//HUsJQHx5BEU/hOrAS
 K5B6hwG21F8xEP8lJi+au/rDDMLTJeoWmuv5GbGH1tB65CUIBjlddKE5WTbt+oZfLXUV
 2B8dMU94esgNUjWpH/2kfVS7uFF9KT5QRdRVQnJ6geRCZs+dAdphX4fjQV1c+duebKTw
 7Pyvlr0hxrA3UYyZtLhCnRLSGb7no4NS03h4rjGMcFfSCIbtG5D3Ebyeozk7dVgBB7Oq
 mwDQ==
X-Gm-Message-State: ABuFfoiku20/Nfhg8s11TlOXNh6DfJCmJFlnUVwhTRiiDqxzPXWYMLGR
 rEwFLqVBsvYzSzi3e7Q+9sRmPDQWFjwwBYdlHEk=
X-Google-Smtp-Source: ACcGV60HCaxrcBzjkAZP99FgU/sKTeb3uKtomUePgElb1Wa/P9+gvMhVR8SCTh2e8uPhOEDClrQoNwIxvx3SrpESQQM=
X-Received: by 2002:a0c:a425:: with SMTP id w34mr26684515qvw.160.1540160506560; 
 Sun, 21 Oct 2018 15:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <1539358155-9027-1-git-send-email-mspinler@linux.vnet.ibm.com>
 <CAARXrtkW8XXuy6=o2h_i1NcxV+AncOVKhgqcwZHmUF14D-99aw@mail.gmail.com>
In-Reply-To: <CAARXrtkW8XXuy6=o2h_i1NcxV+AncOVKhgqcwZHmUF14D-99aw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 22 Oct 2018 08:51:35 +1030
Message-ID: <CACPK8XfBDZf+3-s2bqdHEPue9-8FW75CKr1ar6dhwO1pLiXONA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.18] ARM: dts: aspeed: wspoon: Enable iio-hwmon
 battery
To: Lei YU <mine260309@gmail.com>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, spinler@linux.vnet.ibm.com
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
X-List-Received-Date: Sun, 21 Oct 2018 22:21:51 -0000

On Mon, 15 Oct 2018 at 12:46, Lei YU <mine260309@gmail.com> wrote:
>
> On Fri, Oct 12, 2018 at 11:29 PM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
> >
> > The BMC can read the RTC battery voltage via ADC
> > channel 12.
> >
> > Signed-off-by: Matt Spinler <spinler@linux.vnet.ibm.com>
>
> Reviewed-by: Lei YU <mine260309@gmail.com>

Applied to dev-4.18.

Please submit upstream to linux-aspeed as well.

Cheers,

Joel
