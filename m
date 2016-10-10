Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3st2WX0gRZzDrbk
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 01:27:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=T6mk/Njr; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id e12so1406460oib.3
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4CY0xkr8iPUOMzDxA3oAJnM00UseHDY+FrT0VpX3DJs=;
 b=T6mk/NjrgZh8+Xdz1LWkgzVFdIMCaCPE+/2jMiwvzQNHRpGrgEgcWhEMGw0qSd5gc8
 Ve3jtAsn8zwI9nhN0Fn9Y64Z/y2pHqjZU/d/M19tGiyVlwv/MYMRcXl7MSaVKNhmHFJM
 c+z57MJKLS6seB1hWbo6q95g+8iMsOfgS9Wp1sLa84S25k3hUBqGTrZhixLnUQBsIIlQ
 YCpzEqCSsMRaLQJOEJlU9lZbSqd0j3+XHXAGNSW27PRnVr7AeLF+I0YGOnzOxwUSGW2I
 uhgNQRXirPA+xfqXOSTlN8wPttB0OKyGS46gYh6U+zKnn6uy7pd3O7S5lTq/rEx+X6P6
 3cUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4CY0xkr8iPUOMzDxA3oAJnM00UseHDY+FrT0VpX3DJs=;
 b=cgJRunsc11V3tiroLuC5dMHwP1LSkCD7xwFC9F3eaw7dV+nFieEyELAUA4ZpGK9ksB
 7ubzAOBFlcdffKnIp/jDqcBADwztC7HkWP3pN1Lp5YuYJMyAfB7OIgVIoYPttS67wERm
 sskpWCBNnaSOPqh4WdmfyCnPnm+AQvNFkpy8fuyOpG0qyjpPnyYVxDk2zC5tqFwoM8b5
 ZKvranY/1ceBrPf7uYjKz+3r+Lqdp3eQHMVNuQ8U1FraGafWSsqaU2KIfpD7PFl/W7Wk
 CWj1/jWJaKVqe95dfPYfRlhqR6D7+Fmq94w7F8KcjwVWR7LvnbbXptu9uA6EPJTQ0DuM
 kfgg==
X-Gm-Message-State: AA6/9RnBt9izkvdxOjlcWs3HJnDdVYEYQhsGqpQ75gl68q/7Cxz3cgYvaRA5LBESxP7JsoYF27bQYWrfYcTuqA==
X-Received: by 10.157.46.93 with SMTP id c29mr19820897otd.35.1476109622222;
 Mon, 10 Oct 2016 07:27:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Mon, 10 Oct 2016 07:27:01 -0700 (PDT)
In-Reply-To: <59e43ef4-6319-c6eb-d467-95a17374322f@ozlabs.org>
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-15-git-send-email-christopher.lee.bostic@gmail.com>
 <59e43ef4-6319-c6eb-d467-95a17374322f@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 10 Oct 2016 09:27:01 -0500
Message-ID: <CAA0LjjX67AYab2HHJtXLrjecnGiZHA_AmiTyshN8DZEYZtO66Q@mail.gmail.com>
Subject: Re: [PATCH linux v2 14/17] drivers/fsi: Fix some text formatting
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
X-List-Received-Date: Mon, 10 Oct 2016 14:27:04 -0000

On Sun, Oct 9, 2016 at 9:51 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Cleaned up a few formatting warnings like blank lines at EOF
>> and block comment style.
>>
>> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
>
> This looks good to me. Do you want me to apply these as fixups to my
> patches now, or do you want to carry this separately?
>
> Note that we'll need to apply as fixup before sending upstream, so this
> is just a matter of when would suit you best.
>
Hi Jeremy,

I'd be fine with leaving it as it is here in this patch set.  Not
familiar with what fixups are in
this context.

-Chris

> Cheers,
>
>
> Jeremy
