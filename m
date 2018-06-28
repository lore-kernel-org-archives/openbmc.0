Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rVsycF/2"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="e44RVlvn"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41GRCp5lWJzF1PN;
 Thu, 28 Jun 2018 14:11:02 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id d23-v6so3635194qtp.1;
 Wed, 27 Jun 2018 21:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=klbQPSsOLLpy/VtYVTKQlUbMDkY28WTiDKCNM79IKA4=;
 b=rVsycF/2tAuWFit2hAO5sY0LnnhKMWaZAtJ4gj01avYhzONo1Eji9qHUSLZPPJfcWo
 A16yLN+fOp21qhaLloT1p0ROeU/MnpqI2dnjrn4cLpb23TlriNLN1sXMNXhCSfzzJKNF
 +ews46OUNApgoATWbHY5PkdutG/yuQL1xP6OhLI/5f5WrlQbIbUAtbfEioxE09fVzM50
 sRAc6vAAdElOKMtuq7IrHqvuZ6BCJAJjfV+sm75xJSzykxNM9X40e/BdAimXPzGuP8im
 LCXkDSjXKlCFlfODzIMvOYeQNf+JyztYFumaLhA7hy6IsN5WNE57crMolkdG6+IwwJfk
 FCig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=klbQPSsOLLpy/VtYVTKQlUbMDkY28WTiDKCNM79IKA4=;
 b=e44RVlvnk16cvJ6XfHcP8GubU3XpylJBwAcKWo0pXL66KuEwTNGdoQUA2CAXqLzwkF
 pcxAch0hh6cWunFrULGNiPTJlmW4e9H6Yf0bzdvjjtxyrfQP3rH2x8ZQrvaMflfmN26j
 nLSOebIjalK4+C8m36Dl7tRm6ieBgo2qM++4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=klbQPSsOLLpy/VtYVTKQlUbMDkY28WTiDKCNM79IKA4=;
 b=uPhCCjcmr0rbWsaTSBXm/NckK/8PwcJwcy7jzuWPuzE1sM9ZkFnDg2eaMu71b5TCFz
 fucLApBIoXWN8HqkVz+pM/zuEmn/8tNWdeoxkM+euzDyBx4x7RCBU1v3NkazRdUuWyBM
 ti1hhoYG6y0E5vg7SFx3P6nBaZeR3nWfwxgWekhTYPfx5R4tSvSwwbMvFWqbIOwgE/79
 dsB1cyVB8FkTE33H0CZCePFc0S+sLJlv6FD0GoUuaI4DtSL6mMecZVw3yU7jTfw4xQWK
 /bA8H98vc8UQU1JQQg3EJjugr76YjDy9xYfp32pZ7vkaaJtQ/mZ1HyXmd5wiVJ3Ctojs
 p8dw==
X-Gm-Message-State: APt69E3tGyxhfpmov2P5k7dWFzB96R+OrI0DrShMS5uyljQD9whD03rs
 4DjPap4MQ+ISzrN0srL5QUXKGXm3gLXnNMQEQyg=
X-Google-Smtp-Source: AAOMgpd85NGIzZ9hTJacYA7KdV4eROWbJykTnfUy7oRG03vwpL4sM/+V5kHhPqbmCWWPFIGZvChVs20LH5oIrXQ14Qc=
X-Received: by 2002:ac8:260f:: with SMTP id
 u15-v6mr8182523qtu.368.1530159060222; 
 Wed, 27 Jun 2018 21:11:00 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Wed, 27 Jun 2018 21:10:39
 -0700 (PDT)
In-Reply-To: <20180626232321.12372-3-benh@kernel.crashing.org>
References: <20180626232321.12372-1-benh@kernel.crashing.org>
 <20180626232321.12372-3-benh@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 28 Jun 2018 13:40:39 +0930
X-Google-Sender-Auth: w3ifmJWNKrAbBwgBP1oOfx8864Q
Message-ID: <CACPK8Xey6O43avYBVsfvFujvanNaSsMdNBRLJa21DqXPnn5vuQ@mail.gmail.com>
Subject: Re: [PATCH 02/14] fsi: Move code around to avoid forward declaration
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 28 Jun 2018 04:11:03 -0000

On 27 June 2018 at 08:53, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> Move fsi_slave_set_smode() and its helpers to before it's
> first user and remove the corresponding forward declaration.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
