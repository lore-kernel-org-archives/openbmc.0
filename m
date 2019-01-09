Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::141; helo=mail-it1-x141.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mdw1esen"; 
 dkim-atps=neutral
Received: from mail-it1-x141.google.com (mail-it1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZDyB6RXrzDqc6
 for <openbmc@lists.ozlabs.org>; Wed,  9 Jan 2019 14:24:34 +1100 (AEDT)
Received: by mail-it1-x141.google.com with SMTP id w18so9664357ite.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Jan 2019 19:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=If0zdFrtT1OEj26jIaG/8BcGnK1Q82PRaapPz7X5DvU=;
 b=Mdw1esenkDdyrluT4Ka2eRk6VhsxwMLFEJgQfkBFfeiK2N2vC5S8312iCEo/hOjSOY
 7CQYGtWAruic6OPCL8fry5JNd5Kwu0en5EyO0Uv/v5AETDVgUoDJ4gHehq3Y8cVDGgdV
 GEa8aTvSKOJB2zcipgeNo2VT/5NT6utxnZEtnBPDx0WgE+rLFTVsrTy0OdOuxbXNX534
 QqUf5yIgviUfQxhOQ3WSHw+a0TI1sQkgRy2oIsSApHo3XMQIv00Dh5PgS73QY1dJkRxV
 3M6yB7cerMcctABSqiAiSlfTcMcCalJqFScCC2g/Q9kfmNBEXxudUZPGpTohX/Ga3lPK
 vcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=If0zdFrtT1OEj26jIaG/8BcGnK1Q82PRaapPz7X5DvU=;
 b=BXNhiW77RIMN/+UprAlpXyJTaV6TNVlZ2jfhfkBQvRCHWY+yLBWLGLAGnozc1YqXxS
 irxLl5ILv4B2bctZJk+sdbPg4lP2MhAI1FluslSt1YrPFRuDKsfLGkxvXWYLhRYpZIao
 ywsfXZ32bopZJX0cLuAJNGDaIFcW1LqUfuvoR2nYWSh0RYet+x2cxK50bT42xe8CGfxw
 l09V8y0PnKCOZFw2FZK/nO3GzT00HS1VFY0Tfx/JYs+UgjoF9ODvOXOmmHLOzGGrW7z9
 +icYfidX5eOlnL2TMGDX6g1hWM8TQRWEvf2D9vS2dG4Z5lyEe1JvyMjJvO13SMWq5dSb
 85sQ==
X-Gm-Message-State: AJcUukdxp0yLK4l5arzkp/sryC1nRFmUWw7vFHMPbhUYwidRobk2uLMS
 y/xae3PkiUwBDvnwlcmwnBzJproiTlg9znb00tyyjZ6L
X-Google-Smtp-Source: ALg8bN6GmBbr2tGz1o188TFNHkK7BF3fPdzk8B58NgQErx+bDMQHJrYlNGs6/N/d88g+L1Ek5b4nLdX81A4+C8CbWac=
X-Received: by 2002:a24:80cc:: with SMTP id g195mr2917197itd.178.1547004272446; 
 Tue, 08 Jan 2019 19:24:32 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtniNa3XejKfasL-YwhVtu9siXLQk0b6hN71XzUbX7xDBQ@mail.gmail.com>
 <dbfffa82-52f3-b09f-a6a9-ac909a98c749@linux.intel.com>
 <CAARXrtmDsBET8vRZ67bNO_si1NMCOn21Mz8ZcNi55EN-peFBRA@mail.gmail.com>
In-Reply-To: <CAARXrtmDsBET8vRZ67bNO_si1NMCOn21Mz8ZcNi55EN-peFBRA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 9 Jan 2019 11:24:17 +0800
Message-ID: <CAARXrtkDJq5Gik5ky9zpYANnWW8nvSwxdiD2=TWUmBONKha07A@mail.gmail.com>
Subject: Re: About the usage of ipmi user management
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 tomjose@linux.vnet.ibm.com
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
X-List-Received-Date: Wed, 09 Jan 2019 03:24:36 -0000

With Richard and Tom's help, we are clear about the root cause of the issue:

* In `phosphor-ipmi-host_git.bb`, it installs the root into `ipmi` group
* When BMC is running in a clean environment, it just works
* If BMC is updated from an old version, the `/etc/group` is preserved during
   code update as it is in `/run/initramfs/whitelist`, so the new ipmi group
   does not work at all, the root only has `ssh` group.
* To make it work, we could do a factory reset, which makes the BMC to run
   from a clean environment.
   After factory reset, I confirm that the net ipmi works well, and
the root has below groups:

       root web redfish ipmi priv-admin

   Which probably means redfish may meet similar issue as well.


On Tue, Jan 8, 2019 at 9:47 AM Lei YU <mine260309@gmail.com> wrote:
>
> On Tue, Jan 8, 2019 at 12:08 AM Thomaiyar, Richard Marian
> <richard.marian.thomaiyar@linux.intel.com> wrote:
> >
> > Hi Lei Yu
> >
> > There was an issue, when libuser commands was decoupled (which was
> > caused by another commit not merged). Same has been merged on Jan 5 US
> > time https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/16934/
> >
> > Can you please confirm, whether you have tested it after this. When i
> > tested the same is working fine. Please check.
> >
> > if your openbmc SHA is after 4b04e1fff12efc02ef234b37293958f7fc1c11f5
> > then it should include the fix
> > (https://github.com/openbmc/openbmc/commit/4b04e1fff12efc02ef234b37293958f7fc1c11f5)
>
> I was on yesterday's openbmc master (dc21ed5), so it should already
> have the patch.
