Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t8rXJ71GRzDvRR
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 03:49:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=MSUk4h3P; 
 dkim-atps=neutral
Received: by mail-wm0-x243.google.com with SMTP id c17so8892859wmc.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aW6zdVsb18Wha0vndKJ25+Vu8qzaYGFBO0PbF7NAKYg=;
 b=MSUk4h3Ph5cmx4cPMq57NYwU4r0+9/8IiQlsYhGAsN0oiE6kJqkwWB2kmj1xBofcMK
 lWk814xnbfP48NtRnkS8ks/W4HttkfK1U61UNY17uxayQFymYs9nnNqLJQYKBK5kJ32w
 +CP8MZjUWiDavDChfnoMFjkOzSb2UyK03rbHcM7gVzoCiGGC+34ImrHpp0cFLgcD91uI
 b5u1AdZ6FJhDmBMpygsoc02+ogIF3W57zZfkuNyiffRCF3FTgcWBLqf2KEZd5Le4qG0T
 Ac1xX2+Nld4klqatSCCJ7VgbNWBDgqq+RV+HYLav/Y5OsanLDXVj1r7e66T9V9zGeKDw
 HLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aW6zdVsb18Wha0vndKJ25+Vu8qzaYGFBO0PbF7NAKYg=;
 b=lnMeE2gVu92T4BlZj5g02eeayrt3tvz/zmim2YvPzzrZwbUwL/N89p+Kjy76nX/DwZ
 pFSTBvFF5u/T/vaNxyqVy+zrDUegPmRrzceqpx092KmjFCFrCeEjz+F2+E3jRzXoJhgT
 CQuHDoeBhUO8FWFwtOcYkaSqzKsAIOijdkaLzrgDY7+gcatXn7QT1ddQgFnNF7knO5Yz
 qKMT0+FNFpWXHgsxgEhVw7aFtKkBLmdpvZb8Bh+0ej9IJ0Y3FfGHZfG8aIwz13PFwut/
 cq7p5fv56OhHCh9yorupWmcyM8+umqUieLu7dCPKOM3l5U8gP07QGDBUw/kHOurxIhmD
 eRHg==
X-Gm-Message-State: ABUngvcqYBqfA0cNLIXT/A/3yhB1gvFJmH7tKhsAEVErizB59QjBoF9u7kHoA+0mvDMEsRlHNOQexg4RPc5bSQ==
X-Received: by 10.28.223.196 with SMTP id w187mr3196099wmg.10.1478191742344;
 Thu, 03 Nov 2016 09:49:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.161.71 with HTTP; Thu, 3 Nov 2016 09:49:01 -0700 (PDT)
In-Reply-To: <45b11c70-968f-0f31-3973-7175f06d5cdf@ozlabs.org>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1477865379-11566-14-git-send-email-christopher.lee.bostic@gmail.com>
 <45b11c70-968f-0f31-3973-7175f06d5cdf@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 3 Nov 2016 11:49:01 -0500
Message-ID: <CAA0LjjWc_svtfQUtiGU9q-tHDPEZ2iRZxvTjq6FFxsLJD_gVWw@mail.gmail.com>
Subject: Re: [PATCH linux v6 13/18] drivers/fsi: Minor updates to FSI core
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
X-List-Received-Date: Thu, 03 Nov 2016 16:49:05 -0000

On Sun, Oct 30, 2016 at 8:24 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Added some export symbols for fsi_device_read/write for FSI
>> client drivers.  Removed the byte swapping done on CFAM config
>> word reads - already in proper order.  Removed fsi_crc4 checks,
>> they were incorectly reporting bad crc's.  Need to evaluate
>> what is wrong with the method of calculation.
>>
>> Add missing assignment of slave to fsi_device during scan.
>
> I assume that this patch will change as you work out the issues from
> some of the updates there. However, once you get this sorted, you should
> squash the updates into their original patches.

Hi Jeremy,

Understood, will do that for next round.

Thanks,
Chris

>
> Cheers,
>
>
> Jeremy
