Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="tGIEDYvi"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FgYt1JXHzDqDT
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 06:24:49 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id g6so12183806pfh.13
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 11:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VEisYplD0OOToFp3TdDbKdAnsyLdmgHgwJXfEuJxcfw=;
 b=tGIEDYviGQ5Cr7c6KiWSOqwIHuEB5e4lkKrMz5MF4pJFBIy8T2UZGegiLeEthPHdUZ
 FFIILmY7JclTuFnyuqyH4GhtMOZ96bY7qHVw2W+EMil6Ok/pJ/6ymVS+ZD4PI4GBpa9k
 0BfxEIs79/7n0OGQ7OyqX/xUpQvbPFy5XQSDz6rEepcTVX1bgb1O7oFv4WsGueNNAxxy
 Lzj6lURcpzKq60gqhYubTDJnJmKXHatzJhwkbWV1PVmq0bZEIt5lGljbNek08FnBaiH6
 MU9rZMj0Ar0anKYiQ3BKO45xDIGAuPNmddaia2iKL3SX+HMDPnKr5nViXQe+K9OKuCF3
 NFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VEisYplD0OOToFp3TdDbKdAnsyLdmgHgwJXfEuJxcfw=;
 b=pPSOZEfwWXYarQAFuIWH8g7/6fQ9PDpBQUfuu/qKcN+F/wt+4C3tO4n4JXVQHDim+b
 OPYOBJ2+2K/mx5e9Nyn5UjDppPZrywGtBbw3h2zkOT41qZPUao7h6Xn41foLjkb4YT2q
 RPJw9gKXcME7HuV+peZION0d2nIaAR9Bj+xukauSoHuSZsNHEOHyPqnXv3c5ghNhHDW9
 Koe70kyMxfxUgB3cdO1btxmFzU0JZ/3Wn6QztxkTTicM/gqyoWtmqhWD2MJV7zs59ZTK
 UCAvKUGCzbeQ+w08wJkYo3NPo00Tq4Zk4thCznH6isVVpWvx/X9iXVFL07zjmoWtEufI
 IVeA==
X-Gm-Message-State: APjAAAV3X37mAAZ1gWLf5nJJWIUgmdhJleeeFuaeu6DLzVa6pMpVRYst
 +PuZP5lkAImc2GNDbIoN82qBtascGTJk7FSOiYjgpmTXXkk=
X-Google-Smtp-Source: APXvYqxgGq8conGVnCccuA/CGbS5vA7Z1jiyJiN944REOZ+4EWGPncXIbq+e7xmbBi1XtBELI/UV9rAIWwm0JugKj/k=
X-Received: by 2002:a63:3648:: with SMTP id d69mr12878971pga.314.1551986685717; 
 Thu, 07 Mar 2019 11:24:45 -0800 (PST)
MIME-Version: 1.0
References: <c07297eeb5a0a7415a250a1a9e77e5e2@linux.vnet.ibm.com>
In-Reply-To: <c07297eeb5a0a7415a250a1a9e77e5e2@linux.vnet.ibm.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 7 Mar 2019 11:24:34 -0800
Message-ID: <CAO=notyvofZyhDJ-uZ1euNL=tXNHckNjNPtfVQuq5GR6WgEfKA@mail.gmail.com>
Subject: Re: requirements for new repos
To: zshelle <zshelle@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 07 Mar 2019 19:24:51 -0000

On Thu, Mar 7, 2019 at 8:43 AM zshelle <zshelle@linux.vnet.ibm.com> wrote:
>
> Besides the license and maintainers files, are there any other general
> requirements for each repo?

You'll want a bootstrap.sh script for the CI to hit.  This'll run our
normal validation.  There's additionally a .clang-format file that'll
ensure conformance to the style guide.

>
