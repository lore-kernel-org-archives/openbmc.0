Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTzRS4s8BzDqGl
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 15:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bvf3k3Ka"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id d88so453620ybi.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 20:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=umXtvaGoCsB9HV4XawruoDgQBKwm62q2RkK9gfJkzVM=;
 b=bvf3k3KaF9hvLIIgg3BMLuYyf/9nrdeFhLnyC6QlZ8/6CXeBvilTYCr5/DzJ5TkEvT
 rloqw9NzCzQP/vIkGeyQWd1DPN8nE7KbW2ecrz3nibXOHG01552EsGXIa6nvH4RCVJ/O
 37O/d7sSe5j0hOKdZaY/ye8jVCl5+MT71z0/Z8AoZSIzqzjVJnxZJ+Z7Tkg9BiTSI1Bc
 6ISFwJls2rQZZrrrbH+uaDa7yPFMieKay21Pe5J19WCunfxixD3A1qh8drQQVsS8ZWYm
 Kt8LOLaK6XXbgGNM28JgTSwTSuCRnU5A9SATnU0rHTQKljpkGdl+PPbHkes9YLZwukaO
 4H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=umXtvaGoCsB9HV4XawruoDgQBKwm62q2RkK9gfJkzVM=;
 b=YIvkdmGbtMK2H3tIqukiZk7qaPTJnBEDV0OElARS/49bkCbxpp4rwPwDPKLmAV7Pn1
 QoMV8RF5bTuf/zHx0fvTwgu9Nk0pJHYb3BDXJmBVvqP66p32izlJAgvyz/FGXFLDzo7f
 VJAhW9+lm8Vt/qZQiZBwOXtGf7pVtoogObpJrcLdMXDdfTaToD6vrYBsFeJVFeop26Hn
 kyg2ySitkvYCvqpZQilFSjHCX9WPiy7FBeIahnFOm+ZcKuo4seQcwsZgGil3U1DA1G7k
 rjFUndsymZTKi0RwhZmjJ55J1eprEL8cvZcylVVYltOTqBgiUQz1DqNTC0WykNGVZPHI
 3NJw==
X-Gm-Message-State: AMke39l0hJ/sobb+dgPb6K3XYdUnxPyPxbMMSaIX2vEDvjApr+i7GPOYXvokOUKVcUVsbqoYtW2Y2yhqNLVzqQ==
X-Received: by 10.37.32.194 with SMTP id g185mr500667ybg.167.1487912370511;
 Thu, 23 Feb 2017 20:59:30 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Thu, 23 Feb 2017 20:59:10 -0800 (PST)
In-Reply-To: <75a2465d-10b0-7511-b916-c734d602cd90@ozlabs.org>
References: <20170224040626.99777-1-cbostic@linux.vnet.ibm.com>
 <75a2465d-10b0-7511-b916-c734d602cd90@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 24 Feb 2017 15:29:10 +1030
X-Google-Sender-Auth: lYPIPmd-X7Y94ZJMPCPlabUQ708
Message-ID: <CACPK8XeM2Prgvs05iSU_=ARgQ-Jn9BypH4zfvhe35UDJpp-wfw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v4] drivers/fsi: Add hub master support
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 24 Feb 2017 04:59:33 -0000

On Fri, Feb 24, 2017 at 2:46 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Scan for links off of the mFSI master on CFAM. Add any devices
>> detected to the existing list of FSI devices and notify any
>> clients.
>>
>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
> Assuming all the inits are correct in hub_master_init(), and the layout
> in sysfs is sensible, looks good to me!
>
> Acked-by: Jeremy Kerr <jk@ozlabs.org>

Thanks for the review Jeremy.

Applied to dev-4.7.

Cheers,

Joel
