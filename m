Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPY3f6jzHzDq8X
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 10:57:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="S6sEZq0N"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id v73so2307483ywg.1
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 15:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mEK8plFglyuOI8j8Z+JRngKo6E8roe3Ni9llT0YY6Rw=;
 b=S6sEZq0NHc6+Yujqk+SJiI52YuP4FZlQ/CVTxizYPaXbiCuhEAzJ2h5/6q1upf3GLw
 C2vMayiEOYS+F6HZWh4gStMc9ACmtJdTQKhHZ+ofvZuKyYYTU/vgvYt8S9oM7zOg7txj
 rzsxM0cawgVeFxCt1N5Uro2OZx3G6ls9XzJIuK9Tng/C8HVpzVzGMe38juDtGpDL1c9B
 8EGsCvcC9GsRekrKwcm1wC6Rwb4Q0rSTO3Cd+7u06ZapD/LKzR1QTwP7/hZImqitB3jr
 gPCZJw+KGZFeWQJqlxSRzdlD3/rQ6IgdAoC6iTEYWJdLlyPeyvOSxsu96G3N7dBq9uT+
 0pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mEK8plFglyuOI8j8Z+JRngKo6E8roe3Ni9llT0YY6Rw=;
 b=ItzfF7/jykbEM8gE1tgvhsWzmQ6CAIiTPzEijYSDcnon7l6UHETqgjbN97wTdQ78zO
 +sHIsOzkiak+bhJVPBhfHTdG4y2IKBUre0nbtoyDNxDR23GmN45aEqqARCd9y3vRqzy8
 9ISvzZdwtbzQFt3VbWvsafuNihUb4WFjyzfl4kafACpdbjxvJqGADReVXuSqt7Eh4jpz
 kVgcGVas6S8ngazMkWcgn1stMr7CLX5cAwRCJYmKFp1tv/nCK/FQI0IiVPlscwTFPBW2
 0aZok9YT3K8nHFg7jr2v04/pCXGtKDr3RPbnzgJjr6c0OjHbdgA2eM57rkxw92elOWpd
 KO4g==
X-Gm-Message-State: AMke39lsCHLMMB2N94NSeFNvWXAX8xjuncaSWFUNmuuctaA/qIpQUDdsedA89aV9F+Gkdonpy86prhWFpCMu1g==
X-Received: by 10.13.247.134 with SMTP id h128mr4396213ywf.56.1487289420225;
 Thu, 16 Feb 2017 15:57:00 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Thu, 16 Feb 2017 15:56:39 -0800 (PST)
In-Reply-To: <1487272856-9776-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1487272856-9776-1-git-send-email-eajames@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 17 Feb 2017 10:26:39 +1030
X-Google-Sender-Auth: BauCuZY-GVUF0mL_7-g4WhQ2zRA
Message-ID: <CACPK8Xcw=RsB7SudikmT4E1zgAZacYEdbZuevGi=CaLXRKtwUQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] drivers: fsi: Fix incremeting dev nums
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Thu, 16 Feb 2017 23:57:04 -0000

On Fri, Feb 17, 2017 at 5:50 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> both for FSI master and scom client
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.7.

Cheers,

Joel

> ---
>  drivers/fsi/fsi-core.c | 4 +++-
>  drivers/fsi/fsi-scom.c | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
