Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="SzSnW/tU"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437zjg54GPzDqPC
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 09:11:35 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id r14so15813816qtp.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 14:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gpfnm3VAuUA2u7A2DE715wq6ORF0hRfCCl+zwdDUfvA=;
 b=SzSnW/tUdyyINiW2xXNnJRWlnGy+rKlco0ITe+agnfv25HL303iFIXSNnoEWHCnvjz
 /fQtYvjo/f66umlx5YNw6OmNJH+nqXqIAfhidaNQZjXFQQBtewLer9Bqxvb5PIMX1qqt
 g2Z7Tgh/0Q33mH9r36/1ARTL0FyuvItS4m1Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gpfnm3VAuUA2u7A2DE715wq6ORF0hRfCCl+zwdDUfvA=;
 b=TDsUFqVdJ6n7u79y3LM+/zWytLGfbBG6URGn9VW/gPm/Shl1rKZS7IoNIRiUWZet3u
 2hjYSwYo2SWJ8XfxkaA/cY5GePcUnEFmDj8czQxx9/xtHBo9Pwic5wNY+kA6wRmOI/mb
 DP1Emm7115CYduOouMpZn4b8pH+kmy6sGa2z93Jqte38syNNI0zkBEGzP6buUqSD2XDW
 /GpKL4y5X0EPH2GZt+/CDsb87qPDeckHVfo8qk/OiJ9LhrtiYUaIv+/nsU5IEaq7jU1B
 9wiG4BrgrUWc+MTW1PthSiZemV525K4DbB+NhHtdwOiM9hJoEWrsABWsqcom7HzHe4W+
 kxcw==
X-Gm-Message-State: AA+aEWZGEsfosDmsouhRbnD8OuwT6b5pJPhbSRkwmP6pSMiGufhDQfz/
 CCTi+w53tyfno5gScOSyZypjkrZTrFOIZDkahLTtZA==
X-Google-Smtp-Source: AFSGD/Vwl7ipnYPHqwzxfpZLj5fMjImKh/q4/SFIo9jo8bTG6BRv4eKAjo1Kj+TKvOykpeQrYgCw9hfaPsMBAXr73O0=
X-Received: by 2002:ac8:7308:: with SMTP id x8mr17439954qto.284.1543875093316; 
 Mon, 03 Dec 2018 14:11:33 -0800 (PST)
MIME-Version: 1.0
References: <OF43E90413.B5F754D3-ON00258355.00221DAA-65258355.0022B453@notes.na.collabserv.com>
In-Reply-To: <OF43E90413.B5F754D3-ON00258355.00221DAA-65258355.0022B453@notes.na.collabserv.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Dec 2018 08:41:22 +1030
Message-ID: <CACPK8XeH715xqzPr0LCa=Uz0DYOs5euNGVwZ1fkYPd_zithARw@mail.gmail.com>
Subject: Re: Utility to Sync BMC's UUID to U-Boot environment
To: ngorugan@in.ibm.com
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
X-List-Received-Date: Mon, 03 Dec 2018 22:11:36 -0000

On Fri, 30 Nov 2018 at 16:49, Nagaraju Goruganti <ngorugan@in.ibm.com> wrote:
>
> Hi All,
>
> We are planning to port UUID synching related code from current python script: openbmc/skeleton/pyinventorymgr/sync_inventory_items.pyto new bash script.
>
> The current py(invoked by systemd on the way to BMC ready state) is doing below given actions to sync BMC's UUID to U-Boot environment.
> 1. Getting the UUID from inventory.
> 2. Getting the UUID from U-boot environment
> 3. If the both are differing, write the UUID form inventory to U-Boot environment.
> 4. It also it has TODO task to reboot the BMC to make sure UUID from U-Boot env to  sync with /etc/machine-id.
>
> But this script is in broken state now: It is not updating UUID in U-boot env by reading it from inventory.
>
> We have few things to understand here:
> 1. Is there a need to write UUID to U-Boot environment?

I think that using the u-boot environment as a datastore is a design
that should be avoided. As the name says, it's an environment for
u-boot to store configuration, and by using it as a store for
non-uboot related settings, we risk the system bricking due to
non-boot related changes.

Additionally, by baking in the u-boot environment as a required
element of the system we cannot support boards that don't use u-boot,
or that don't have a modifiable environment.

I think the most obvious place for this data is BMC's non-volatile
storage (the same way we store other settings, eg in /etc). If that is
not workable then I think that a UUID would make more sense in a VPD
EEPROM.

Cheers,

Joel

> 2. Can machine-id be the source for UUID? or UUID is the source for machine-id?
> 3. If UUID (from inventory) is the source for machine-id, from where should the inventory get UUID? (on openpower systems the UUID is fetched from BMC  VPD, if present)
> 4. If machine-id is the source to UUID, how machine-id is getting its value?
>
> We need an inputs from community members who are having better understand on these things.
>
> Best Regards,
> Nagaraju G
