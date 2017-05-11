Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x236.google.com (mail-yb0-x236.google.com
 [IPv6:2607:f8b0:4002:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wNsK863p6zDqLt
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 22:06:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q0KQGHgp"; 
 dkim-atps=neutral
Received: by mail-yb0-x236.google.com with SMTP id s22so5796865ybe.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 May 2017 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ivci2agbZlvxTc0xc6AcEkBfoHhBzSbslQd06VSIE4E=;
 b=Q0KQGHgpSzkEfUFhnwqAbLzXX88oeN8N3ciLvXeF0FtsP0IixCzm3iYc6SNsH9OInS
 cK3QYnIAUmclmXhe2f5haYMJyFm6ifDuDo9z7nCV1Ns5FzAtbDSi0u28Qv3pgEGxMm+Z
 uLaR7u2eZpWq2t/If5XMPY9ms+vp8LUzmTvqXlJq6tK4X4Hg1pLUqBaISjym9azuVtr8
 ZjqAL/25skhciJeG/ldfh8U8hjE557PAa8HNTSb+5SchUcdfeA8BlhnEO+iQ/HnXwod6
 B4vfJLy5XQmey4NjCJVRjgPxDRoWBVdNmJNNjeXdqD2sDkyFBGQeDW+kZYcRvk1q3Ten
 M2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ivci2agbZlvxTc0xc6AcEkBfoHhBzSbslQd06VSIE4E=;
 b=NRj2kiymCAAs3rDR4TQB/sPBK+6TEF8eeOUw1hZK60mifDb1PpnKCblSkk/UrZqmcg
 rx7SdD+yq4Zoj8bYiSDo4ynzNXdLbtng8Kd2uYRWwNucu3Hw2pqYlSNTVnSOF/v5TS60
 FcvPYTv45YGuusQVms93+VywloOXAt699q2eOkMkXMptvBRguqP0aDCAetkkjGjr/0wC
 ljZbjPzOdMG3QNS5lRqlsc5xawBcjfIgspF9nCylA4ziHuoYXpKp1FVlCrZi+Kcrdt3o
 DKpLknXinAWEwoH0fe3XgU78UaV/4UyBTzhYGNOxkD/TTxASIi8oCj5mCsQ5Up4bPZPp
 x8Fg==
X-Gm-Message-State: AODbwcBnK+eJ6fG7ejRnWtretWvtNAj6eFKcDw1mxe2zVsFoi8oxQwtm
 m6ZuAEV3zBSjmdQ8XVJ+XkynBKQukZSV
X-Received: by 10.37.33.193 with SMTP id h184mr9380955ybh.57.1494504394338;
 Thu, 11 May 2017 05:06:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 11 May 2017 05:06:13 -0700 (PDT)
In-Reply-To: <20170509213902.37939-8-cbostic@linux.vnet.ibm.com>
References: <20170509213902.37939-1-cbostic@linux.vnet.ibm.com>
 <20170509213902.37939-8-cbostic@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 May 2017 21:36:13 +0930
X-Google-Sender-Auth: 3gUdrCbhSgtKJzzY3Za0zvSyvvA
Message-ID: <CACPK8Xc2ymOZ_+aM5cYXSgQM9nfF2PqB2v4+dqzhB1RiLFZ1qw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 7/7] drivers/fsi: Fix one and two byte bus
 reads/writes
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Eddie James <eajames@us.ibm.com>,
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
X-List-Received-Date: Thu, 11 May 2017 12:06:37 -0000

On Wed, May 10, 2017 at 7:09 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> From: Eddie James <eajames@us.ibm.com>
>
> Address checker fixed to allow one and two byte reads/writes.
> Address alignments for each size verified.
>
> Signed-off-by: Edward James <eajames@us.ibm.com>
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

Applied to dev-4.10.

Cheers,

Joel
