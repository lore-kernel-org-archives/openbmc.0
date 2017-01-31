Return-Path: <joel.stan@gmail.com>
Received: from mail-ot0-x241.google.com (mail-ot0-x241.google.com
 [IPv6:2607:f8b0:4003:c0f::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vC6W26cJFzDq5f
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jan 2017 11:26:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MY4/dil/"; 
 dkim-atps=neutral
Received: by mail-ot0-x241.google.com with SMTP id 73so40201938otj.1
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jan 2017 16:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2hPSXXjAmfckI0vG68klG/jO5OZ4iXSb0GHkaAYo5oM=;
 b=MY4/dil/pdwaDtJKr2oPmKhTHfwpsbK0aevNdScqXE4niPFhHxAkHQ9IKrkwLkJgoy
 vwfiu867izEvt5ZkHFd7nl+fwoZUz32hcS9yYL8C4MAY37to3QVeZFs3iXqIv6eetDig
 2u9bu20trdxv9pK0XCc6XqlWFL+nOTUeEctiwxOcVG1mvDhN/rzi4qDx4EIYQh5qBlLo
 7WDTAhIamSkMFxVRHPmbqwK3PM8n1LFrnbDIKp+zwyGW9M8SQQlGfns5jG+Pi1ebzALZ
 u+1trI0u4g2noV09hK6QesCekx8mUUDCO/Z3NUUIf4nQD92U4FbQfKdVS4NUZm322vxn
 YEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2hPSXXjAmfckI0vG68klG/jO5OZ4iXSb0GHkaAYo5oM=;
 b=emgn7tCldwT1wXyeOxXSaAPE+D0WVBjDTtvgWVnmZ85q2GXy4QQ1tM5DwZ3P6mEh2w
 rUz0DXrUJXi4R8BgvZbSJpITGQ+nS6xFwrYQ8novoz2SBcnUiuXPJxf1F0I/IgT5mUMd
 Xb1kUYQiCUxViHuyS+eGNk87huO5XFWxMrdQ9ZTgI6fUks4ak8qfRza0a/dn6/kszBJd
 IlLFNvsc7ahWHPMp1gmpg1w4qFJqj3nLyVFvlJfYp10j5/MAjGNDD8BRetbHrhAeIBll
 +auAzCkK5Twu7/2lkECbN5adJ7nUOFvvcDMH6H7t6KcpH4JdMEVwiUFalj3Q7Z5loyzy
 Wjkg==
X-Gm-Message-State: AIkVDXJ8RKDtneBqiejs7kSP2yg7a2EcdBuxKaHh8YV5nWEcA/T6W72FMwFB4Ykn360C96vdJwua4sUi58BKiw==
X-Received: by 10.157.46.67 with SMTP id c3mr12856825otd.163.1485822364731;
 Mon, 30 Jan 2017 16:26:04 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.245.201 with HTTP; Mon, 30 Jan 2017 16:25:44 -0800 (PST)
In-Reply-To: <1485740080.4137.21.camel@aj.id.au>
References: <1485740080.4137.21.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 31 Jan 2017 10:55:44 +1030
X-Google-Sender-Auth: KJ-vm07WCB2HDRluz7G7KGpryhk
Message-ID: <CACPK8XeOQPONhwQ4Q6bPUp7=-AoFArXwCmzDC-tors00i_u=tg@mail.gmail.com>
Subject: Re: GPIO offsets used by userspace
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2017 00:26:07 -0000

On Mon, Jan 30, 2017 at 12:04 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi all,
>
> Just a heads up that when the linked patch is pulled into the OpenBMC
> kernel it will break our userspace. We will need to synchronise the
> kernel bump with the fixes for the machine configs to update the magic
> GPIO offset number.
>
> https://lkml.org/lkml/2017/1/26/786
>
> The magic offset is essentially 512-(ngpios) (I don't know why, but
> that's the behaviour), and this now varies between AST2400 and AST2500
> systems due to the AST2500 having an extra bank, and also because the
> AST2400 has a "hole" at the end of its GPIO number space.

Can you suggest a way to detect this from userspace?

Would using the chardev api make this easier?

Cheers,

Joel
