Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sStSV55JqzDrpp
 for <openbmc@lists.ozlabs.org>; Tue,  6 Sep 2016 14:11:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uQD7VUtu; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id 35so1311741uaq.1
 for <openbmc@lists.ozlabs.org>; Mon, 05 Sep 2016 21:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=byeOzYBdsc9BYkrDMY00FZuwqYPKVXL2g+0CJNl13Ig=;
 b=uQD7VUtuePpRkejcJ6lIueekJPkT2bsQd47WjNQAPI0JJvlVLLcnHpFvKg4xHCYZQw
 FiG4IvGXr9HTYdJ4Dy6MoalfCSU/F2BMo2V3XocyLhjtP4GIaNIzJkh95njzKZrLWALs
 xFC8bZwf7cEAmNXO+yUR5pb/Fd+JjiT4bhF+7JQLyxTamcjnK06SkStOepnLiFd+Mlf2
 Lx56dKPPyKW4Vz9JQQVrkmljahDzxac4zJql9dyDX/iAz/Pj1m5zL3sXK41pBRPxGDUz
 XAYjuiyfkiHARHe0fy9z6bXv1A0j8K1nSG0d1/TKAF6a1Qv1RzzIvIF5EZTmhkfBxWLi
 Qxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=byeOzYBdsc9BYkrDMY00FZuwqYPKVXL2g+0CJNl13Ig=;
 b=DKLOdEc/YgxBKXa2sP6y7NMyKA0fHmNVTaeotQdgWbCuPbBG2+FaAAaRxcH5fmNAmD
 vAFrlIb7+e2v6XU00oHexEn7TPnVJvy3orwg02GkPptCENSopKt4g7T2evIx8sCO9hjA
 gQ4UzhoIgY8FKuv4cbpvxRYEz1ogDtCfscoY2JJBm3/a/x/D/l398bUvAucaXoLULf81
 9JMdqIZynfcGTB69dEh6P08uaLMieCLVz9PdiN9BG8LOHJxawCSkHTsXUKCSoByHBmDF
 HW0jtNFSaKWWFLzhl4UwA4UeDvZEbD2tON8OnznEiX7FRmFLD+M0VvoYKyC6yXLF+88X
 riAw==
X-Gm-Message-State: AE9vXwMiYN19ZVKYYNTOX5BdDJhkT0cQK8ZqRdAzRCC5DOp1XH8yB0eJ8vQ0fVqpf0AhPfORiN858yTJeACnwQ==
X-Received: by 10.176.68.7 with SMTP id m7mr24551194uam.44.1473135064571; Mon,
 05 Sep 2016 21:11:04 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.82.239 with HTTP; Mon, 5 Sep 2016 21:10:44 -0700 (PDT)
In-Reply-To: <20160902073051.31492-3-andrew@aj.id.au>
References: <20160902073051.31492-1-andrew@aj.id.au>
 <20160902073051.31492-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Sep 2016 13:40:44 +0930
X-Google-Sender-Auth: EAR3LJDYNQ_FzTTf3dDWpWqrMzE
Message-ID: <CACPK8XeyZJ3TesvfZcWa6kDyQSxKth88QOrxwsds2Bucd20N6Q@mail.gmail.com>
Subject: Re: [PATCH linux 2/3] pinctrl-aspeed-g4: Add definitions for pins in
 GPIO banks A-H inclusive
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2016 04:11:07 -0000

2016-09-02 17:00 GMT+09:30 Andrew Jeffery <andrew@aj.id.au>:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, applied to dev-4.7.

Cheers,

Joel
