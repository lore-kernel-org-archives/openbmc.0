Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s4Kjb0DBxzDqQ5
 for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2016 03:26:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=JSzhK3ED; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id a135so2843504oii.1
 for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2016 10:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YogdIs558lvw53RhWpdjP7GgmtBQabDkYg/qKhlICII=;
 b=JSzhK3EDDObShwchUXEiACeRIZeoVgTKlba5Axamnn05j/UyZHx8rQlxD/yC11/hme
 7CM6u6jPJTPCboJkZUWppQ+XQXl/ZRxWCtfAezI5W5UlegenZHpdYbR//UydKq76RwUn
 uCcL7U7fp+1bMLhGH1noqpJJC3A/oy7853AuPlbmSnzg5Z6BaBpunlEhhI/kTwyUnmDC
 LfHDc3v+jD3YAuTBoA5UFUyjyOyYODTDaU08iDewY9ljOLgo2UVkUod6M95z4MONIHyY
 GruszOjUZmPGrrzyPzL1jWkwsKQ3JHY9Y3K2BBj+oS5Da+wf9LaLIfsHcCmmL9qVTkl+
 UhXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YogdIs558lvw53RhWpdjP7GgmtBQabDkYg/qKhlICII=;
 b=jXEKyEvhWwiP3yKP2D3X7xoW0Qqsnd0G2nv0zyZX9tPvsKhAR2oeLoXAdA46pj1ZKE
 QPNxgt4S+5/SiQuDkcBRfbHLEDfot4MVBAs46x/9KAnIz+VzQPAKQHqOQ6Xw6xu9ev6N
 JiIrKoIaQznktKJ7vnCKdr69Li37zzsPCNpH3cH8h+rPwj/5jjYPjmgqKQ0bKChM+p50
 lMbVBZc8j0sWD9xwMe5HYcfNykgeHwzZEl6vnum7XOQcNVNASBCJ1Y4+WJb4LHWPMtJv
 lTIRr4UWeuaQ3ma9N/dPad+PLRH7TGCGiFS7I33VGkw7CJyM04NsUN1nysWTGESXAzfh
 vOpQ==
X-Gm-Message-State: AEkooutIxpRuSWsdIyjPJhBWIhgoMKiQo5kpMoNrqWBTikwEXGr/epz2I8Esq+S+RajqVoAVnUdUv2m0xnPQpQ==
X-Received: by 10.157.1.163 with SMTP id e32mr15284637ote.167.1470245168591;
 Wed, 03 Aug 2016 10:26:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.196.198 with HTTP; Wed, 3 Aug 2016 10:26:08 -0700 (PDT)
In-Reply-To: <CACPK8Xeztb_0QiE8dv45pKzmynGKukmZp7xY=Jn8TW_=hMrvWA@mail.gmail.com>
References: <1469729698-37246-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1469729698-37246-3-git-send-email-christopher.lee.bostic@gmail.com>
 <CACPK8Xeztb_0QiE8dv45pKzmynGKukmZp7xY=Jn8TW_=hMrvWA@mail.gmail.com>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Wed, 3 Aug 2016 12:26:08 -0500
Message-ID: <CAA0LjjU_b2QEzuqPhew-R9ZC3XeqoPkom1GxjMQL-zYAMjStdA@mail.gmail.com>
Subject: Re: [PATCH linux 3/4] drivers/fsi: Add link presence detect
 functionality
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Chris Bostic <cbostic@us.ibm.com>
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
X-List-Received-Date: Wed, 03 Aug 2016 17:26:11 -0000

>> +/*
>> + * Look for CFAMs plugged into any of the available link slots
>> + */
>> +int fsim_staticplug_nl(struct fsimaster *p, u32 *menp, u32 *mlevp)
>
> What's _nl mean?
>

nl stands for 'no lock'   There are lock wrappers around some
functions that add or remove devices.
All are associated with hot plug remove or adds.   Given that to start
off with there will be a single hard
wired link maybe this locking and hot plug precaution isn't necessary.


>> +};
>> +
>> +struct hotplug {                       /* Hot Plug work structure */
>> +       u32 mlevp_last[2];              /* Last known plug state */
>> +       unsigned long building[2];      /* Bit mask of links to build up */
>> +       unsigned long probing[2];       /* Bit mask of links to  probe */
>
> Is there a reason this is an array of longs, and not a u64?
>

This was written when the only host CPU was 32 bit.   Question going
forward is what platforms will we
support.   Is compiler smart enough to allow use of u64 in any case?
This also assumes we have a max
of 64 links, one bit per link,  on the primary master.   Seems
reasonable to keep that size for the
foreseeable future.
