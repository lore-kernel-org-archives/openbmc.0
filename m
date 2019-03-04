Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="NP0zkXZ9"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CNXc4fcnzDqHl
 for <openbmc@lists.ozlabs.org>; Mon,  4 Mar 2019 13:00:46 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id y4so3635149qtc.10
 for <openbmc@lists.ozlabs.org>; Sun, 03 Mar 2019 18:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KjkGlxM596qdQL02z11eyL0aNZpxfXwalWbQnQIP6ls=;
 b=NP0zkXZ9dPy7zjR4B++xgGul8ThIOC2/hzTNRbBP8T1n9po1oVFXOK2mCTaveSOAS/
 dhiheHwnFEL6N+4qWcZUlYpiZNqD08vN12dXjb9TcYVAODPJxulyUnUnTKbI3dlmpZqp
 cMxYLs6cZOrR/kYsO3kpivOErkJGzLuhdq+DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KjkGlxM596qdQL02z11eyL0aNZpxfXwalWbQnQIP6ls=;
 b=dfSzkqRAeWX+rNdC0DmkEam9d2rE1y+QaoU4d46ia+GQCuGn1moDI+AVnc5HmH6b4l
 fBUx2OyAjCJEphLiZmAWekfxnKfrQGBZ1IV0BU01QmICUhWPZW23pViq+Y7NaaqNKHu+
 u62XMvwvzS9OohCH5ir5L7JqpD7HmC4KSApT7BwKrssIiXOp/J+p71pR/xO7JoJUh/DY
 SPp0jntC/m4PpStafk6NusziUcjPSRMLrgUMhNOu3TWJuQkdq/RywiPsydhRtDQhyOFf
 tiw967DkE3XwWh+6DM3I9JO3LUi3geHcyD6DNneUvEXg79hvyjuZjDryK7emVFJCOUXy
 784g==
X-Gm-Message-State: APjAAAX9vMgqdN7IZfnnOvJTIVbiZVKII2Mi9Q52BojRNCsC5YyLUWc6
 HTNdPUHQXEfPHZXE+P0kkU/AzwE32CUtcFqIKtVI5IkZ
X-Google-Smtp-Source: APXvYqy7Sy4oHe3jhFHMFvHAiYWfLI+roHtrY5PWTiULh3pgMcQjDGgXLEM//icQCond3zq0NE/iG7/k6lV4xFsKBTE=
X-Received: by 2002:ac8:1c4a:: with SMTP id j10mr13132546qtk.37.1551664842580; 
 Sun, 03 Mar 2019 18:00:42 -0800 (PST)
MIME-Version: 1.0
References: <285cb288b03952703b6b879f6a1cac9a@linux.vnet.ibm.com>
 <CADc45smTAr8FBh17mr2oVsHdM_-tpiQ7B1hBFMNG39tP0aBEcA@mail.gmail.com>
In-Reply-To: <CADc45smTAr8FBh17mr2oVsHdM_-tpiQ7B1hBFMNG39tP0aBEcA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 Mar 2019 12:30:31 +1030
Message-ID: <CACPK8XeoE-SBYp6qrTxAjWym68Y7+KWNKS7+1PBraRBmV6zJeg@mail.gmail.com>
Subject: Re: [Design] Kernel-based BMC firewall
To: "jainmjo@gmail.com" <jainmjo@gmail.com>
Cc: Joseph Reynolds <jrey@linux.ibm.com>, Openbmc <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 04 Mar 2019 02:00:49 -0000

On Sat, 2 Mar 2019 at 13:50, jainmjo@gmail.com <jainmjo@gmail.com> wrote:
>
>
> On Sat, Mar 2, 2019 at 2:54 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>>
>>
>> ## Alternatives Considered
>>
>> A user interface to indicate the firewall's status was considered.
>> This would invoke iptables and return success only if it showed
>> firewall rules, something like `iptables -L -n -v`.  This is not
>> needed for basic function.
>>
>> The `ufw` firewall was considered.  It is implemented in Python which
>> is being removed from the OpenBMC image.
>
>
> iptables is being replaced with nftables (at least in the debian world). Have you considered nftables?
> I am very new to OpenBMC. So please correct me if this is not relevant.

Agreed. We should be targeting nftables with any new design:

 https://wiki.nftables.org/wiki-nftables/index.php/Main_Page

Cheers,

Joel

Cheers,

Joel
