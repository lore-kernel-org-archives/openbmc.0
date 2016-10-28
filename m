Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t5GXs3hrfzDvNf
 for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2016 08:07:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=gs6qx/1O; 
 dkim-atps=neutral
Received: by mail-wm0-x243.google.com with SMTP id c17so9005269wmc.3
 for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2016 14:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CVL0F8L123qd0W63FRFufjRSqIw+JTE8YJS1jP868so=;
 b=gs6qx/1OCXZVvBD4bOSzHXFrnxtFGHR9nvBebk3n3jcQ0pz7Oksh241GZOpYFVgBxC
 hqFkzIACSN9vwqUzKHEOMv+mhrYnOsw/lHggr0KMbyt8khw+Kh0SGL2VhXeU2Uf37ed9
 jHt2YBGfQvqz9Fi/BAUG+k0Zm32yI5Nj1fUIS/pnogJ4OAJDM54IJnxi17P5Iyw0xIFN
 F/N4v6sOM1Q7UCWX+gmJiunLWkvY+7edZ6EEzRzXZLbQqvXnsDCMzb/rN9h4DNQeQBjz
 6EE88Q/+6sKFIrzxTR1XrU6cgl7baSaMGRc1nnXOeulrnZmpibYrW54RrigGM2cVMNlf
 xelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CVL0F8L123qd0W63FRFufjRSqIw+JTE8YJS1jP868so=;
 b=fyu/NPvVtFw8fQNnmk4k3G33/l+0pyWmz7woiYtDMyoz5gt2oJXoEeNYzODtG2Dzev
 KFg/OLrZVWOWZp9MNLSp5Fzld6VFbU3ISAyeHvsSiNMI2Wa14c1/bNlprEulVGTvmXmV
 uhrx0ADSSO9aXgBZ5g0pbYL/d63xLrYC5bAbvQXTjLvtlJFtO/PcJ9D1y1LrJC8YelyQ
 PTDXXgO0Qzm3tJCf+mrssMVz8YXYifg+gCUtnNUnN7UptOQijAxWCpzONAwiK5QIaCcq
 Z3fe5u5/bFl+gsqqARUapVxFE+LS58pmG2WKIqMxHfdTYxYYwQdM/f82N97u3L9yuFm8
 RITA==
X-Gm-Message-State: ABUngvdu/ewn+NhZbZ5PhrfloBHUDJTPH+fT4ReQyKippVGU5S5pz3fdr79MnazftswQv7ZJUSfJap5UG8OcNg==
X-Received: by 10.194.172.41 with SMTP id az9mr15829338wjc.105.1477688825064; 
 Fri, 28 Oct 2016 14:07:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.161.71 with HTTP; Fri, 28 Oct 2016 14:07:04 -0700 (PDT)
In-Reply-To: <fd5171bb-6325-66db-1ec5-7363c73db70e@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
 <fd5171bb-6325-66db-1ec5-7363c73db70e@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Fri, 28 Oct 2016 16:07:04 -0500
Message-ID: <CAA0LjjWnyTVtVfOLDeSPaJhFugBwbztWRfDBofuJEoWYVa-m6Q@mail.gmail.com>
Subject: Re: [PATCH linux v5 13/18] drivers/fsi: Set up links for slave
 communication
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
X-List-Received-Date: Fri, 28 Oct 2016 21:07:10 -0000

On Fri, Oct 21, 2016 at 12:28 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
>> index 565c7e3..81ed444 100644
>> --- a/drivers/fsi/fsi-core.c
>> +++ b/drivers/fsi/fsi-core.c
>> @@ -287,13 +287,51 @@ static int fsi_slave_init(struct fsi_master *master,
>>
>>  /* FSI master support */
>>
>> +static int fsi_master_link_enable(struct fsi_master *master, int link)
>> +{
>> +     if (master->link_enable)
>> +             return master->link_enable(master, link);
>> +
>> +     return -EINVAL;
>> +}
>
> We don't want to error on no ->link_enable callback; this breaks for any
> masters that don't require this (eg, the fake master)
>

Hi Jeremy,

OK will change that.

>> +/*
>> + * Issue a break command on this link
>> + */
>> +static int fsi_master_break(struct fsi_master *master, int link)
>> +{
>> +     int rc;
>> +
>> +     if (!master->send_break)
>> +             return -EINVAL;
>
> And do we want to error here? If so, we'll need to implement send_break
> for the fake master.

Will remove this as well.


Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
