Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0Bxz0Xv4zDt0N
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 02:07:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=iHurlucW; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 139so6406636itm.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 08:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QVeMEpSbwBsh7D5T4Wajr3uk/BVamwo0vE1BlZlTJZc=;
 b=iHurlucWaAXRQw9nVNgFLutFAT1UwMc9awp49g1KDmn6op8unJMk8IYH0OMhcqBsBN
 e+JiU1C3gI0zfPbPEn9NPzgMOgDAtUXBX9ANn7QVbhxlC/MyBgkZmZx4aUBON4RD92YR
 0ndaUJiRA+mf30R22pVlNhVRoOkesDklHvh6wyQYRqlegfL/JIqFLZf6q9ycMS2jvdJq
 1HEjn+SRNOSqmRlNNMNnV6rkG9bILeTR8gshox88HJj3eA60sHxCdW651larP8bryrpf
 1Psg7sXBfkkEk5qApdhKyYQPHvyz+o/6c2nSTzSCCYnegiJz0PDxUYzxoyMMIIxV99kM
 Lnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QVeMEpSbwBsh7D5T4Wajr3uk/BVamwo0vE1BlZlTJZc=;
 b=jF+6HKtThnYsIfzwHgHhUQA0j7dBwkIvF7i9OVsbz4XyVGYwOqj/FgWpjKWiaolsoV
 ysIvCDz8MmJei36Agh82AvBNDIIIGCcGI+wjVahuo5SJT0Xkbar5JGxcVht3we9stf5a
 /IPQBGZ1Sl94RZXQPN4CpmvySRrifP4qGNvrPoXFd8OnySwEyZvSVdog9qxgShdgF+jv
 jfRCQTGYm+pLWIMqOOZUrORrLoB7st/kCuvcfYtjsWPfcYt3g++VszwsIczYGLL3GK4I
 JMwfbpvQWWuv/K31Q7QFrncTwVtWdfXrZQ/qeUwM7FHX8KNA/6e97aFpwa+B/fTV1NqH
 6lkg==
X-Gm-Message-State: ABUngvfPQhAieurKmogEuMk42ZzDW1OqR8bGPYJkIuPNUBTRl8E24Abu5/83oan9aZ5u5zc7SJ72RpAucL9CUg==
X-Received: by 10.157.56.179 with SMTP id p48mr475617otc.22.1476976068460;
 Thu, 20 Oct 2016 08:07:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Thu, 20 Oct 2016 08:07:47 -0700 (PDT)
In-Reply-To: <fd800f60-7c0c-a63f-27d9-1094fd004a1e@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-17-git-send-email-christopher.lee.bostic@gmail.com>
 <fd800f60-7c0c-a63f-27d9-1094fd004a1e@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 20 Oct 2016 10:07:47 -0500
Message-ID: <CAA0LjjVzqgjHuXeuH8B+xW8XKuNzFq_u7MZT7Z5y5DE8FGo0fQ@mail.gmail.com>
Subject: Re: [PATCH linux v5 16/18] drivers/fsi: Add client driver register
 utilities
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 20 Oct 2016 15:07:51 -0000

On Wed, Oct 19, 2016 at 8:29 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> +int fsi_drv_register(struct fsi_driver *fsi_drv)
>
> Not fsi_driver_register()?
>

Hi Jeremy,

Will change.

Thanks,
Chris

> Cheers,
>
>
> Jeremy
