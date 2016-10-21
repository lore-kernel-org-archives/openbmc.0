Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0XmK6wm4zDvZk
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 15:30:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ezOXkeBD; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id k64so9387581itb.0
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 21:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=itTmrqrWu5SK5XKeld52YUMtdbjNnE1rvxR6RkV1Qyg=;
 b=ezOXkeBDkT19Fc5zJagJSfsNL6euAPFOfmkWHe3bRNn0q8cEQ9YsmO8Lko2IkxVQ56
 H35GYp90F1jN7ksaEylho2qQLyky0BRmbL5/LtkkzF/jp964vaY8s5cULyKXQe5nORzE
 1JeEG9CttsWVye4z3yk2wQ2cGcB6So/+1/M7vZKBmoaHOhUYzXo+LBFoWkcdzXXqgfnm
 /NJY1eKniDjlWDp1w5PyC4ewDVy4dGrkhy+8DMqAXcVvwilflAfccLxuMcpPXxcoCno4
 9ir99r2M98536lvA7H57XyV0EcoQuuN2zzY3HYa7V/J91tLng9Wi1Nb2R3QrOqKP1D6s
 CeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=itTmrqrWu5SK5XKeld52YUMtdbjNnE1rvxR6RkV1Qyg=;
 b=jXF8ks6Sp7cRnmaGdGeEoifphloycDqg31ABNBmNU8XZA+z5+1a75qkXeY7MOXpPJI
 5LaKKNOpQ3jEZDLe/ueLuBzklPohDIyIzoI/lQIQfLg9rf/X0N0OvKTUFJwIty2xmUF6
 gZ5uSvkFoeWeYoLhZdIH6xMTl69yQpiQGkexSiCjxF+3TDxkJMuNsJS/P+6QNfqTbR3n
 76FCqLcS467OC3McOsQnAHpoHKKq9ab7lBYo5BRq82vQCHz7CwP9x858ZgyUHXBMww3A
 lcbe5zDlnlHSsM6Tj6IOBbRyo0YnPXza1lRVgIq5tWIzZowbDMdYLeRKptbAcpgebGJp
 ueAw==
X-Gm-Message-State: AA6/9RnNqIfYr64/awZrWwosIKg+5ODnngZQkxVvuJ8uOoFbMe/EcEsrjJiqxMPMNZ1ZsSSoFWPAIVh/Ydz/xA==
X-Received: by 10.202.106.198 with SMTP id f189mr9103994oic.109.1477024239337; 
 Thu, 20 Oct 2016 21:30:39 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.200.135 with HTTP; Thu, 20 Oct 2016 21:30:18 -0700 (PDT)
In-Reply-To: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1477005092-20632-1-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 15:00:18 +1030
X-Google-Sender-Auth: PtgX3CLpwmY4b4-vGX_azZ9zXBI
Message-ID: <CACPK8XfFGupREcDW=8DgJYE2RqAOtPRzEYVO-gBQ1GRMosw_Uw@mail.gmail.com>
Subject: Re: [PATCH 4.7 0/4] net/ncsi: Backport fixes from linux.net
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 21 Oct 2016 04:30:42 -0000

On Fri, Oct 21, 2016 at 9:41 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> Those patches have been put into Dave's git repo (branch "net") and should
> be merged to upstream shortly. This backports them to 4.7. Joel, please
> help merging them if possible, thanks!
>
> Gavin Shan (4):
>   net/ncsi: Avoid if statements in ncsi_suspend_channel()
>   net/ncsi: Fix stale link state of inactive channels on failover
>   net/ncsi: Choose hot channel as active one if necessary
>   net/ncsi: Improve HNCDSC AEN handler

Series applied to dev-4.7 as of a2f1136cc4ab9e36839712919310e59a93e079c4.

Cheers,

Joel

>
>  net/ncsi/internal.h    |   2 +
>  net/ncsi/ncsi-aen.c    |  18 +++++--
>  net/ncsi/ncsi-manage.c | 126 +++++++++++++++++++++++++++++++++++++------------
>  3 files changed, 112 insertions(+), 34 deletions(-)
>
> --
> 2.1.0
>
