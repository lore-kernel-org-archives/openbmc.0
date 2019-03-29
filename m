Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eRXU6JH8"; 
 dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W9jw4D6DzDqX8
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 05:48:34 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id b12so1641576pgk.0
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 11:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jEzLdPvWMoaErdWxLbfZxKsfUSJy6xX94KbrkBuZ53A=;
 b=eRXU6JH8BDKg5uB6Opo/j6mYCRGQy9aGWXj1HHVtgLSK1F8NKWERqNPccNQU31NQk5
 WDPoIVFrRyOTYm9Qa6G9kxy3HlAMS0O0EsAU9vIGEL4lyq1cXgIv+G5D8HHcNhgLHOis
 EL9WmOxsOgtu1xcJrw7P3dJMwDf6j207GFDyx5ITGBMg38t0+g6bDpMfiEXp4KqHrlmv
 RvKqLmG1bjeXkYEEPS8UQDV4xNzO1RY6wjtjULz1PFhNich0FL5U8u3amx/f4yHeiMzy
 pTbP9RaHFxSSPEQbRLsr25IuMQPlCqhwxNU7D+0WdXkwHhqeK4Pueo06z5xAyK5qXKVf
 0y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jEzLdPvWMoaErdWxLbfZxKsfUSJy6xX94KbrkBuZ53A=;
 b=nceGTj1uVlkGgt9f3U5e8at1LzReJeUxbCHPLsuZKMdZ/V1mr41ka5GCYwaDqftPOl
 tRWydiuXPO+EckH2Xr32AdB1eDUlqDHagJpU6DjoFfmd+2d+g6mEygoRgDqXGOeCfJYe
 FQ+MZB4E3X3IXqwPCTtK/t+9Y+OQoKsJoF17gY7aj+LzPFA/dso96FNFSdf/1Q5tXD9f
 fA+O/dFSw0MmhPBPbiisketRRTSgz26uAgtUK9ClnIHMCpG8HxV9oFbd2yk0Or1kmnys
 EzqqM/jgV3fZ3vZy/i3PoSyJPqSAOyIT7fkyvPFfYcc87kod85x1HvJsXe4cDrCBi9sJ
 OUaQ==
X-Gm-Message-State: APjAAAWBP3e4KSXHpNoIFcDzD2fKt6e7iE8Ktz+nwxT74rNgiXZqErUy
 Ixy72gaIMUh30vKq9w4knaGhpnwJzzCnzIICkrE=
X-Google-Smtp-Source: APXvYqxNQpJ9QH/f35aBdv0PFm59ppR4Jf7kYTVT6TCBhzqZjqzlYWXzLfX4Ta+jBXmnkfBqo81t0mnmPkpRvadTH24=
X-Received: by 2002:a63:e445:: with SMTP id i5mr16899219pgk.383.1553885311625; 
 Fri, 29 Mar 2019 11:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <CANT4NrJdiFyJBR9SA-jVA0JZ8C=cf7HvBXjxaiHHBEocxaWR6Q@mail.gmail.com>
 <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
In-Reply-To: <592E3848-A5D7-45DA-8E20-A3315BE359D9@intel.com>
From: susan jasinski <susantjasinski@gmail.com>
Date: Fri, 29 Mar 2019 13:48:19 -0500
Message-ID: <CANT4NrJeuKcN_Hs-=OZv=_2yzPfPrj=C0OS5_sss2yx+_bDkPA@mail.gmail.com>
Subject: Re: OpenBMC GUI navigation -- User vs Security
To: "Khetan, Sharad" <sharad.khetan@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Fri, 29 Mar 2019 18:48:37 -0000

Ok, Thank you, Sharad.


On Fri, Mar 29, 2019 at 12:06 AM Khetan, Sharad <sharad.khetan@intel.com> w=
rote:
>
> Hi Susan,
> Typically in server management the notion of security is different than u=
ser management. Perhaps =E2=80=9CAuthentication=E2=80=9D or =E2=80=9CAccess=
 Control=E2=80=9D or =E2=80=9CAccess Management=E2=80=9D can be a category =
for the items you list.
> Thanks,
> -Sharad
>
> > On Mar 28, 2019, at 7:32 PM, susan jasinski <susantjasinski@gmail.com> =
wrote:
> >
> > Currently, the OpenBMC GUI has a single sign-on and there is a menu
> > called Users from which that panel is accessed.
> >
> > Users
> > - Manage User Account
> >
> > Now that we are developing LDAP user management and local user
> > management, I was thinking we could put them together under a menu
> > called "Security" that would replace the "Users" menu.
> >
> > Security
> > - LDAP User Management
> > - Local User Management
> > - SSL Certificate Management (including certificate generation)
> > - others?
> >
> > Does anyone have an option about this?
> >
> > Thanks in advance, Susan Jasinski
